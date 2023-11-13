require 'rails_helper' 

RSpec.describe "Merchant Discounts Index (/merchants/:id/discounts)" do 
  before(:each) do 
    load_test_data_bd
  end 
  context "visiting the merchant discounts idex page" do
   it "displays all my merchants discounts, including percentage and thresholds, and a link to each discount show page" do 
    visit "/merchants/#{@merchant1.id}/discounts"

    expect(page).to have_content("#{@merchant1.name} Bulk Discounts")
    expect(page).to have_link("Discount 1")
    expect(page).to have_content("Percentage: #{@m1_discount1.percentage}%, Threshold: #{@m1_discount1.threshold}")
    expect(page).to have_link("Discount 2")
    expect(page).to have_content("Percentage: #{@m1_discount2.percentage}%, Threshold: #{@m1_discount2.threshold}")
   end

   it "displays a link to create a new discount, that takes me to a form" do
    visit "/merchants/#{@merchant1.id}/discounts"

    expect(page).to have_link("New Discount")
    click_link "New Discount"
    expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts/new")
   end

   it "displays a button next to each discount to 'Delete Discount', when I click this button, I am redirectect back to the index page, and I no longer see the discount" do 
    visit "/merchants/#{@merchant1.id}/discounts"
    
    expect(page).to have_link("Discount 1")
    expect(page).to have_content("Percentage: #{@m1_discount1.percentage}%, Threshold: #{@m1_discount1.threshold}")
    expect(page).to have_button("Delete Discount 1")
    click_button "Delete Discount 1"
    expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts")
    expect(page).to_not have_content("Percentage: #{@m1_discount1.percentage}%, Threshold: #{@m1_discount1.threshold}")
   end

   it "redirects me to a Discounts show page when I click one of the links" do
    visit "/merchants/#{@merchant1.id}/discounts"

    click_link("Discount 1")

    expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts/#{@m1_discount1.id}")
   end
  end

end
