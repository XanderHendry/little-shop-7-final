require 'rails_helper' 

RSpec.describe "Merchant Discounts New (/merchants/:id/discounts/new)" do
  before(:each) do 
    load_test_data_bd  
  end 
  context "visiting the merchant discounts new page" do 
    it "displays a form to create a new discount" do 
      visit "/merchants/#{@merchant1.id}/discounts/new"

      expect(page).to have_content("New Discount")
      expect(page).to have_field(:percentage)
      expect(page).to have_field(:threshold)
      expect(page).to have_button("Create")
    end
    it "creates a new discount, and redirects to the merchant discount index, where the new discount is visible" do 
      visit "/merchants/#{@merchant1.id}/discounts/new"

      fill_in :percentage, with: 25
      fill_in :threshold, with: 30
      click_button "Create"

      expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts")
      expect(page).to have_link("Discount 3")
      expect(page).to have_content("Percentage: 25, Threshold: 30")
    end
    it "validates input and flashes an error message" do 
      visit "/merchants/#{@merchant1.id}/discounts/new"
      
      fill_in :threshold, with: 30
      click_button "Create"
      expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts/new")
      expect(page).to have_content("Error: Percentage is required")
    end
  end
end 