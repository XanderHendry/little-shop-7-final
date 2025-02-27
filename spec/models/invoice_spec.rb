require "rails_helper"

RSpec.describe Invoice, type: :model do
  context "little-shop-7" do
    before(:each) do
      @customer1 = Customer.create!(first_name: "John", last_name: "Doe")
      @invoice1 = @customer1.invoices.create!(status: 1)
      @transaction1 = @invoice1.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1, invoice_id: "#{@invoice1.id}")
      @transaction2 = @invoice1.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1, invoice_id: "#{@invoice1.id}")
      @transaction3 = @invoice1.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1, invoice_id: "#{@invoice1.id}")
      @transaction4 = @invoice1.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1, invoice_id: "#{@invoice1.id}")

      @customer2 = Customer.create!(first_name: "Mary", last_name: "Jane")
      @invoice2 = @customer2.invoices.create!(status: 1)
      @invoice3 = @customer2.invoices.create!(status: 2)
      @transaction5 = @invoice2.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
      @transaction6 = @invoice2.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
      @transaction7 = @invoice2.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)

      @customer3 = Customer.create!(first_name: "Johnny", last_name: "Bowflex")
      @invoice4 = @customer3.invoices.create!(status: 1)
      @invoice5 = @customer3.invoices.create!(status: 0)
      @invoice6 = @customer3.invoices.create!(status: 0)
      @invoice7 = @customer3.invoices.create!(status: 2)
      @transaction8 = @invoice4.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
      @transaction9 = @invoice4.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
      @transaction10 = @invoice4.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
      @transaction11 = @invoice4.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
      @transaction12 = @invoice4.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)

      @customer4 = Customer.create!(first_name: "Alvin", last_name: "Setter")
      @invoice8 = @customer4.invoices.create!(status: 1)
      @invoice9 = @customer4.invoices.create!(status: 0)
      @invoice10 = @customer4.invoices.create!(status: 2)
      @transaction13 = @invoice8.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
      @transaction14 = @invoice8.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
      @transaction15 = @invoice8.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
      @transaction16 = @invoice8.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)

      @customer5 = Customer.create!(first_name: "Masison", last_name: "House")
      @invoice11 = @customer5.invoices.create!(status: 1)
      @invoice12 = @customer5.invoices.create!(status: 2)
      @invoice13 = @customer5.invoices.create!(status: 2)
      @invoice14 = @customer5.invoices.create!(status: 0)
      @transaction17 = @invoice11.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 0)
      @transaction18 = @invoice11.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 0)

      @merchant1 = create(:merchant)
      @merchant2 = create(:merchant)
      @merchant3 = create(:merchant)

      @item1 = create(:item, merchant_id: @merchant1.id)
      @item2 = create(:item, merchant_id: @merchant1.id)
      @item3 = create(:item, merchant_id: @merchant1.id)
      @item4 = create(:item, merchant_id: @merchant2.id)
      @item5 = create(:item, merchant_id: @merchant2.id)
      @item6 = create(:item, merchant_id: @merchant2.id)
      @item7 = create(:item, merchant_id: @merchant3.id)
      @item8 = create(:item, merchant_id: @merchant3.id)
      @item9 = create(:item, merchant_id: @merchant3.id)

      @invoice_item_1 = create(:invoice_item, status: 0, quantity: 5, unit_price: 10, invoice_id: @invoice1.id, item_id: @item1.id)
      @invoice_item_2 = create(:invoice_item, status: 0, invoice_id: @invoice2.id, item_id: @item2.id)
      @invoice_item_3 = create(:invoice_item, status: 0, invoice_id: @invoice2.id, item_id: @item3.id)
      @invoice_item_4 = create(:invoice_item, status: 0, invoice_id: @invoice4.id, item_id: @item4.id)
      @invoice_item_5 = create(:invoice_item, status: 0, invoice_id: @invoice4.id, item_id: @item5.id)
      @invoice_item_6 = create(:invoice_item, status: 0, invoice_id: @invoice4.id, item_id: @item6.id)
      @invoice_item_7 = create(:invoice_item, status: 0, invoice_id: @invoice8.id, item_id: @item7.id)
      @invoice_item_8 = create(:invoice_item, status: 0, invoice_id: @invoice11.id, item_id: @item8.id)

      @invoice_item_9 = create(:invoice_item, status: 1, unit_price: 10000, quantity: 3, invoice_id: @invoice3.id, item_id: @item9.id)
    end

    describe "relationships" do
      it { should have_many :transactions }
      it { should belong_to :customer }
    end

    describe "validations" do
      it { should validate_presence_of(:status) }
    end

    it "self.incomplete_invoices" do
      expect(Invoice.incomplete_invoices.first.id).to eq(@invoice14.id)
      expect(Invoice.incomplete_invoices[1].id).to eq(@invoice9.id)
      expect(Invoice.incomplete_invoices[2].id).to eq(@invoice6.id)
      expect(Invoice.incomplete_invoices[3].id).to eq(@invoice5.id)
    end

    it "#total_revenue" do
      # Returns 0 with no transactions
      expect(@invoice3.total_revenue).to eq(0)

      # Adding a failed transaction returns 0
      @transaction19 = @invoice3.transactions.create(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 0)
      expect(@invoice3.total_revenue).to eq(0)

      # adding at lest one successful transaction will generate the total rev
      @transaction20 = @invoice3.transactions.create(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
      expect(@invoice3.total_revenue).to eq(30000)
    end

    describe "#merchant_revenue" do
      it "finds the sum of item unit prices belonging to a given merchant on to an invoice" do
        merchant_revenue = @invoice1.merchant_revenue(@merchant1.id)
        expect(merchant_revenue).to eq(50)
      end
    end

    describe "#merchant_items" do
      it "finds all items on an invoice that belongs to a given merchant" do
        expect(@invoice1.merchant_items(@merchant1.id).first.name).to eq(@item1.name)
      end
    end

    describe "#count_items" do
      it "finds the quantity of an Item on an invoice" do
        expect(@invoice1.count_items(@item1.id)).to eq(1)
      end
    end
  end
  context "Bulk-Discounts" do
    before(:each) do 
      load_test_data_bd
    end
    describe "#merchant_discount_revenue" do 
      it "returns the total discounted revenue for a merchants items, if enough of that item have been bought to reach the discounts threshold" do 
        discounted_revenue1 = @c1_invoice1.merchant_discount_revenue(@merchant1.id)
        expect(discounted_revenue1).to eq(127.5)
        discounted_revenue2 = @c1_invoice3.merchant_discount_revenue(@merchant1.id)
        expect(discounted_revenue2).to eq(955.0)
        discounted_revenue3 = @c2_invoice3.merchant_discount_revenue(@merchant1.id)
        expect(discounted_revenue3).to eq(0)
      end
    end

    describe "#find_merchant_discount" do 
      it "finds the the given merchants discount that should be applied to an invoice, if any" do 
        discounts1 = @c1_invoice1.find_merchant_discount(@merchant1.id)
        expect(discounts1).to eq(@m1_discount1)
        discounts2 = @c1_invoice3.find_merchant_discount(@merchant1.id)
        expect(discounts2).to eq(@m1_discount2)
        discounts3 = @c2_invoice3.find_merchant_discount(@merchant1.id)
        expect(discounts3).to eq(nil)
      end
    end

    describe "#total_disounted_revenue" do 
      it "finds the total discounted revenue for an invoice, across all merchants and items purchased." do 
        total_discounted_revenue = @c2_invoice3.total_discounted_revenue
        expect(total_discounted_revenue).to eq(412.50)
      end
    end
  end
end
