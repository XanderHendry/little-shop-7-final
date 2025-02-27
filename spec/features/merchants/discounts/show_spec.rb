require 'rails_helper' 

RSpec.describe "Discount Show Page (/merchants/:merchant_id/discounts/:discount_id)" do 
  before(:each) do 
    load_test_data_bd  
  end

  context "visiting the Discount show page" do 
    it "displays my discounts quantity threshold and percentage discount" do 
      visit "/merchants/#{@merchant1.id}/discounts/#{@m1_discount1.id}"

      expect(page).to have_content("Quantity Threshold: #{@m1_discount1.threshold}")
      expect(page).to have_content("Percentage Discount: #{@m1_discount1.percentage}%")
    end

    it "has a link to edit this Discount, when I click that link, I'm redirected to a form" do 
      visit "/merchants/#{@merchant1.id}/discounts/#{@m1_discount1.id}"
      expect(page).to have_button("Edit Discount")
      click_button("Edit Discount")
      expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts/#{@m1_discount1.id}/edit")
    end
  end
end 