require "rails_helper"

RSpec.describe "Merchants Invoice Show" do
  context "little-shop-7" do
    before(:each) do
      @merchant = create(:merchant)

      @item_1 = create(:item, merchant_id: @merchant.id)
      @item_2 = create(:item, merchant_id: @merchant.id)
      @item_3 = create(:item, merchant_id: @merchant.id)
      @item_4 = create(:item, merchant_id: @merchant.id)

      @customer_1 = create(:customer)
      @c1_invoice_1 = create(:invoice, status: 1, customer_id: @customer_1.id)
      @c1_invoice_2 = create(:invoice, status: 1, customer_id: @customer_1.id)
      @c1_invoice_3 = create(:invoice, status: 1, customer_id: @customer_1.id)
      c1_invoice_item_1 = create(:invoice_item, status: 2, quantity: 5, unit_price: 10, invoice_id: @c1_invoice_1.id, item_id: @item_1.id)
      c1_invoice_item_2 = create(:invoice_item, status: 2, invoice_id: @c1_invoice_2.id, item_id: @item_1.id)
      c1_invoice_item_3 = create(:invoice_item, status: 2, invoice_id: @c1_invoice_3.id, item_id: @item_1.id)

      @customer_2 = create(:customer)
      @c2_invoice_1 = create(:invoice, status: 1, customer_id: @customer_2.id)
      @c2_invoice_2 = create(:invoice, status: 1, customer_id: @customer_2.id)
      @c2_invoice_3 = create(:invoice, status: 1, customer_id: @customer_2.id)
      @c2_invoice_4 = create(:invoice, status: 1, customer_id: @customer_2.id)
      c2_invoice_item_1 = create(:invoice_item, status: 2, invoice_id: @c2_invoice_1.id, item_id: @item_1.id)
      c2_invoice_item_2 = create(:invoice_item, status: 2, invoice_id: @c2_invoice_2.id, item_id: @item_1.id)
      c2_invoice_item_3 = create(:invoice_item, status: 2, invoice_id: @c2_invoice_3.id, item_id: @item_1.id)
      c2_invoice_item_4 = create(:invoice_item, status: 2, invoice_id: @c2_invoice_4.id, item_id: @item_1.id)

      @customer_3 = create(:customer)
      @c3_invoice_1 = create(:invoice, status: 1, customer_id: @customer_3.id)
      @c3_invoice_2 = create(:invoice, status: 1, customer_id: @customer_3.id)
      @c3_invoice_3 = create(:invoice, status: 1, customer_id: @customer_3.id)
      c3_invoice_item_1 = create(:invoice_item, status: 2, invoice_id: @c3_invoice_1.id, item_id: @item_1.id)
      c3_invoice_item_2 = create(:invoice_item, status: 2, invoice_id: @c3_invoice_2.id, item_id: @item_1.id)
      c3_invoice_item_3 = create(:invoice_item, status: 2, invoice_id: @c3_invoice_3.id, item_id: @item_1.id)

      @customer_4 = create(:customer)
      @c4_invoice_1 = create(:invoice, status: 1, customer_id: @customer_4.id)
      @c4_invoice_2 = create(:invoice, status: 1, customer_id: @customer_4.id)
      c4_invoice_item_1 = create(:invoice_item, status: 2, invoice_id: @c4_invoice_1.id, item_id: @item_1.id)
      c4_invoice_item_2 = create(:invoice_item, status: 2, invoice_id: @c4_invoice_2.id, item_id: @item_1.id)

      @customer_5 = create(:customer)
      @c5_invoice_1 = create(:invoice, status: 1, customer_id: @customer_5.id)
      @c5_invoice_2 = create(:invoice, status: 1, customer_id: @customer_5.id)
      @c5_invoice_3 = create(:invoice, status: 1, customer_id: @customer_5.id)
      @c5_invoice_4 = create(:invoice, status: 1, customer_id: @customer_5.id)
      @c5_invoice_5 = create(:invoice, status: 1, customer_id: @customer_5.id)
      c5_invoice_item_1 = create(:invoice_item, status: 2, invoice_id: @c5_invoice_1.id, item_id: @item_1.id)
      c5_invoice_item_2 = create(:invoice_item, status: 2, invoice_id: @c5_invoice_2.id, item_id: @item_1.id)
      c5_invoice_item_3 = create(:invoice_item, status: 2, invoice_id: @c5_invoice_3.id, item_id: @item_1.id)
      c5_invoice_item_4 = create(:invoice_item, status: 2, invoice_id: @c5_invoice_4.id, item_id: @item_1.id)
      c5_invoice_item_5 = create(:invoice_item, status: 2, invoice_id: @c5_invoice_5.id, item_id: @item_1.id)

      @customer_6 = create(:customer)
      @c6_invoice_1 = create(:invoice, status: 1, customer_id: @customer_6.id)
      @c6_invoice_2 = create(:invoice, status: 0, customer_id: @customer_6.id, created_at: "2023-10-19 UTC")
      @c6_invoice_3 = create(:invoice, status: 0, customer_id: @customer_6.id, created_at: "2023-10-20 UTC")
      @c6_invoice_4 = create(:invoice, status: 0, customer_id: @customer_6.id, created_at: "2023-10-21 UTC")
      c6_invoice_item_1 = create(:invoice_item, status: 2, invoice_id: @c6_invoice_1.id, item_id: @item_1.id)
      c6_invoice_item_2 = create(:invoice_item, status: 0, invoice_id: @c6_invoice_2.id, item_id: @item_4.id)
      c6_invoice_item_3 = create(:invoice_item, status: 1, invoice_id: @c6_invoice_3.id, item_id: @item_3.id)
      c6_invoice_item_4 = create(:invoice_item, status: 0, invoice_id: @c6_invoice_4.id, item_id: @item_2.id)
      c6_invoice_item_5 = create(:invoice_item, status: 1, invoice_id: @c6_invoice_4.id, item_id: @item_1.id)
    end
    describe "Visiting the Merchant Invoice Show page" do
      it "I see the invoices ID, status, formated created_at date, and the Customers first and last name" do
        visit "/merchants/#{@merchant.id}/invoices/#{@c1_invoice_1.id}"

        expect(page).to have_content("Invoice ##{@c1_invoice_1.id}")
        expect(page).to have_content("Status: #{@c1_invoice_1.status}")
        expect(page).to have_content("Created On: #{@c1_invoice_1.created_at.strftime("%A, %B %d, %Y")}")
        expect(page).to have_content("Customer: #{@customer_1.first_name} #{@customer_1.last_name}")
      end

      it "shows all relevant info for each of my merchants items on the invoice" do
        visit "/merchants/#{@merchant.id}/invoices/#{@c1_invoice_1.id}"
        within "#item_info" do
          expect(page).to have_content("Item Name: #{@item_1.name}")
          expect(page).to have_content("Unit Price: #{@item_1.unit_price}")
          expect(page).to have_content("Quantity: 1")
          expect(page).to have_content("Status: #{@item_1.status}")
        end
      end

      it "displays the total revenue for my merchants items on an invoice." do
        visit "/merchants/#{@merchant.id}/invoices/#{@c1_invoice_1.id}"
        expect(page).to have_content("Total Revenue: $50.00")
      end

      it "has a button to 'Update Item Status' with a select field, that redirects us to the Merchant Invoice show page" do
        visit "/merchants/#{@merchant.id}/invoices/#{@c1_invoice_1.id}"
        expect(page).to have_field(:status)
        expect(page).to have_button("Update Item Status")
        select "disable", from: :status
        click_button "Update Item Status"

        expect(current_path).to eq("/merchants/#{@merchant.id}/invoices/#{@c1_invoice_1.id}")
        expect(page).to have_content("Status: disable")
      end
    end
  end

  context "Bulk-Discounts" do
    before(:each) do 
      load_test_data_bd
    end
    describe "Total revenue and discounted revenue" do 
      it "displays the total revenue for my merchants items on an invoice, and the total discounted revenue" do 
        visit "/merchants/#{@merchant1.id}/invoices/#{@c1_invoice1.id}"

        expect(page).to have_content("Total Revenue: $150.00")
        expect(page).to have_content("Total Discounted Revenue: $127.50")
      end
      it 'has a link to the applied discounts show page, if there was a discount applied.' do 
        visit "/merchants/#{@merchant1.id}/invoices/#{@c1_invoice1.id}"
        expect(page).to have_content("Discount Applied: ")
        expect(page).to have_link("#{@m1_discount1.percentage}% off #{@m1_discount1.threshold} or more.")
        click_link("#{@m1_discount1.percentage}% off #{@m1_discount1.threshold} or more.")
        expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts/#{@m1_discount1.id}")
      end
    end
  end
end
