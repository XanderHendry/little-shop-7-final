require 'rails_helper' 

RSpec.describe "Merchant Discounts Update (/merchants/:merchant_id/discounts/:discount_id/update)" do
  before(:each) do 
    load_test_data_bd  
  end 
  context "visiting the merchant discounts edit page" do 
    it "displays a form to edit a discount" do 
      visit "/merchants/#{@merchant1.id}/discounts/#{@m1_discount1.id}/edit"

      expect(page).to have_content("Edit Discount")
      expect(page).to have_field(:percentage)
      expect(page).to have_field(:threshold)
      expect(page).to have_button("Update")
    end
    it "update a  discount, and redirects to the merchant discount show page, where the updated discount is visible" do 
      visit "/merchants/#{@merchant1.id}/discounts/#{@m1_discount1.id}/edit"

      fill_in :percentage, with: 25
      click_button "Update"

      expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts/#{@m1_discount1.id}")
      expect(page).to have_content("Percentage Discount: 25%")
      expect(page).to have_content("Quantity Threshold: #{@m1_discount1.threshold}")
    end
    it "validates input and flashes an error message" do 
      visit "/merchants/#{@merchant1.id}/discounts/#{@m1_discount1.id}/edit"
      
      fill_in :threshold, with: 0
      click_button "Update"
      expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts/#{@m1_discount1.id}/edit")
      expect(page).to have_content("Discount Not Saved!")
    end
  end
end 