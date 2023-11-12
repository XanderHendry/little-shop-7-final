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
    expect(page).to have_content("Percentage: #{@m1_discount1.percentage}, Threshold: #{@m1_discount1.threshold}")
    expect(page).to have_link("Discount 2")
    expect(page).to have_content("Percentage: #{@m1_discount2.percentage}, Threshold: #{@m1_discount2.threshold}")
   end
  end
end
