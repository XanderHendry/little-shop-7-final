def load_test_data
  @merchant = create(:merchant)

    @item_1 = create(:item, merchant_id: @merchant.id)
    @item_2 = create(:item, merchant_id: @merchant.id)
    @item_3 = create(:item, merchant_id: @merchant.id)
    @item_4 = create(:item, merchant_id: @merchant.id)
    @item_5 = create(:item, merchant_id: @merchant.id)
    @item_6 = create(:item, merchant_id: @merchant.id)

    @customer_1 = create(:customer)
    @c1_invoice_1 = create(:invoice, status: 1, customer_id: @customer_1.id)
    @c1_invoice_2 = create(:invoice, status: 1, customer_id: @customer_1.id)
    @c1_invoice_3 = create(:invoice, status: 1, customer_id: @customer_1.id)
    c1_invoice_item_1 = create(:invoice_item, status: 2, invoice_id: @c1_invoice_1.id, item_id: @item_1.id)
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

def load_test_data_bd
  @merchant1 = create(:merchant)
  @merchant2 = create(:merchant)
  @merchant3 = create(:merchant)
  @merchant4 = create(:merchant)
  @merchant5 = create(:merchant)
  @merchant6 = create(:merchant)

  # merchant1 items
  @m1_item1 = create(:item, merchant: @merchant1, unit_price: 30)
  @m1_item2 = create(:item, merchant: @merchant1, unit_price: 10)
  @m1_item3 = create(:item, merchant: @merchant1, unit_price: 50)
  # merchant2 items
  @m2_item1 = create(:item, merchant: @merchant2, unit_price: 25)
  @m2_item2 = create(:item, merchant: @merchant2, unit_price: 15)
  @m2_item3 = create(:item, merchant: @merchant2, unit_price: 5)
  # merchant3 items
  @m3_item1 = create(:item, merchant: @merchant3, unit_price: 100)
  @m3_item2 = create(:item, merchant: @merchant3, unit_price: 150)
  @m3_item3 = create(:item, merchant: @merchant3, unit_price: 300)
  # merchant4 items
  @m4_item1 = create(:item, merchant: @merchant4, unit_price: 5)
  @m4_item2 = create(:item, merchant: @merchant4, unit_price: 10)
  @m4_item3 = create(:item, merchant: @merchant4, unit_price: 15)
  # merchant5 items
  @m5_item1 = create(:item, merchant: @merchant5, unit_price: 50)
  @m5_item2 = create(:item, merchant: @merchant5, unit_price: 80)
  @m5_item3 = create(:item, merchant: @merchant5, unit_price: 100)
  # merchant6 items
  @m6_item1 = create(:item, merchant: @merchant6, unit_price: 3000)
  @m6_item2 = create(:item, merchant: @merchant6, unit_price: 30000)
  @m6_item3 = create(:item, merchant: @merchant6, unit_price: 300000)

  # merchant1 discounts
  @m1_discount1 = @merchant1.discounts.create!(threshold: 10, percentage: 15)
  @m1_discount2 = @merchant1.discounts.create!(threshold: 20, percentage: 30)
  # merchant2 discounts
  @m2_discount1 = @merchant2.discounts.create!(threshold: 15, percentage: 10)
  @m2_discount2 = @merchant2.discounts.create!(threshold: 20, percentage: 15)
  # merchant3 discounts
  @m3_discount1 = @merchant3.discounts.create!(threshold: 25, percentage: 30)
  @m3_discount2 = @merchant3.discounts.create!(threshold: 10, percentage: 10)
  # merchant4 discounts
  @m4_discount1 = @merchant4.discounts.create!(threshold: 10, percentage: 15)
  @m4_discount2 = @merchant4.discounts.create!(threshold: 20, percentage: 30)
  # merchant5 discounts
  @m5_discount1 = @merchant5.discounts.create!(threshold: 5, percentage: 15)
  @m5_discount2 = @merchant5.discounts.create!(threshold: 20, percentage: 30)
  # merchant6 discounts
  @m6_discount1 = @merchant6.discounts.create!(threshold: 50, percentage: 25)
  @m6_discount2 = @merchant6.discounts.create!(threshold: 100, percentage: 50)

  @customer1 = create(:customer)
  @customer2 = create(:customer)
  @customer3 = create(:customer)
  @customer4 = create(:customer)
  @customer5 = create(:customer)
  @customer6 = create(:customer)

  # customer1 invoices
  @c1_invoice1 = create(:invoice, status: 1, customer_id: @customer1.id)
  @c1_invoice2 = create(:invoice, status: 1, customer_id: @customer1.id)
  @c1_invoice3 = create(:invoice, status: 1, customer_id: @customer1.id)
  # customer2 invoices
  @c2_invoice1 = create(:invoice, status: 1, customer_id: @customer2.id)
  @c2_invoice2 = create(:invoice, status: 1, customer_id: @customer2.id)
  @c2_invoice3 = create(:invoice, status: 1, customer_id: @customer2.id)
  @c2_invoice4 = create(:invoice, status: 1, customer_id: @customer2.id)
  # customer3 invoices
  @c3_invoice1 = create(:invoice, status: 1, customer_id: @customer3.id)
  @c3_invoice2 = create(:invoice, status: 1, customer_id: @customer3.id)
  @c3_invoice3 = create(:invoice, status: 1, customer_id: @customer3.id)
  # customer4 invoices
  @c4_invoice1 = create(:invoice, status: 1, customer_id: @customer4.id)
  @c4_invoice2 = create(:invoice, status: 1, customer_id: @customer4.id)
  # customer5 invoices
  @c5_invoice1 = create(:invoice, status: 1, customer_id: @customer5.id)
  @c5_invoice2 = create(:invoice, status: 1, customer_id: @customer5.id)
  @c5_invoice3 = create(:invoice, status: 1, customer_id: @customer5.id)
  @c5_invoice4 = create(:invoice, status: 1, customer_id: @customer5.id)
  @c5_invoice5 = create(:invoice, status: 1, customer_id: @customer5.id)
  # customer6 invoices
  @c6_invoice1 = create(:invoice, status: 1, customer_id: @customer6.id)
  @c6_invoice2 = create(:invoice, status: 0, customer_id: @customer6.id, created_at: "2023-10-19 UTC")
  @c6_invoice3 = create(:invoice, status: 0, customer_id: @customer6.id, created_at: "2023-10-20 UTC")
  @c6_invoice4 = create(:invoice, status: 0, customer_id: @customer6.id, created_at: "2023-10-21 UTC")

  # c1_invoice1 invoice_items
  @invoice_item1 = create(:invoice_item, status: 2, quantity: 15, unit_price: 10, invoice_id: @c1_invoice1.id, item_id: @m1_item2.id )
  # c1_invoice2 invoice_items
  @invoice_item2 = create(:invoice_item, status: 2, quantity: 5, unit_price: 30, invoice_id: @c1_invoice2.id, item_id: @m1_item1.id )
  @invoice_item3 = create(:invoice_item, status: 2, quantity: 15, unit_price: 50, invoice_id: @c1_invoice2.id, item_id: @m1_item3.id )
  # c1_invoice3 invoice_items
  @invoice_item4 = create(:invoice_item, status: 2, quantity: 10, unit_price: 30, invoice_id: @c1_invoice3.id, item_id: @m1_item1.id )
  @invoice_item5 = create(:invoice_item, status: 2, quantity: 20, unit_price: 50, invoice_id: @c1_invoice3.id, item_id: @m1_item3.id )

  # c2_invoice1 invoice_items
  @invoice_item6 = create(:invoice_item, status: 2, quantity: 10, unit_price: 25, invoice_id: @c2_invoice1.id, item_id: @m2_item1.id )
  # c2_invoice2 invoice_items
  @invoice_item7 = create(:invoice_item, status: 0, quantity: 10, unit_price: 25, invoice_id: @c2_invoice2.id, item_id: @m2_item1.id )
  @invoice_item8 = create(:invoice_item, status: 0, quantity: 20, unit_price: 5, invoice_id: @c2_invoice2.id, item_id: @m2_item3.id )
  # c2_invoice3 invoice_items
  @invoice_item9 = create(:invoice_item, status: 2, quantity: 15, unit_price: 15, invoice_id: @c2_invoice3.id, item_id: @m2_item2.id )
  @invoice_item10 = create(:invoice_item, status: 2, quantity: 20, unit_price: 15, invoice_id: @c2_invoice3.id, item_id: @m4_item3.id )
  # c2_invoice4 invoice_items
  invoice_item11 = create(:invoice_item, status: 0, quantity: 10, unit_price: 25, invoice_id: @c2_invoice4.id, item_id: @m2_item1.id )

  # c3_invoice1 invoice_items
  invoice_item12 = create(:invoice_item, status: 1, quantity: 10, unit_price: 25, invoice_id: @c3_invoice1.id, item_id: @m2_item1.id )
  invoice_item12 = create(:invoice_item, status: 1, quantity: 10, unit_price: 30, invoice_id: @c3_invoice1.id, item_id: @m1_item1.id )
  # c3_invoice2 invoice_items
  invoice_item12 = create(:invoice_item, status: 2, quantity: 10, unit_price: 100, invoice_id: @c3_invoice2.id, item_id: @m3_item1.id )
  invoice_item12 = create(:invoice_item, status: 2, quantity: 10, unit_price: 5, invoice_id: @c3_invoice2.id, item_id: @m4_item1.id )
  # c3_invoice3 invoice_items
  invoice_item12 = create(:invoice_item, status: 0, quantity: 10, unit_price: 50, invoice_id: @c3_invoice3.id, item_id: @m5_item1.id )
  invoice_item12 = create(:invoice_item, status: 0, quantity: 10, unit_price: 3000, invoice_id: @c3_invoice3.id, item_id: @m6_item1.id )

  # c4_invoice1 invoice_items
  invoice_item12 = create(:invoice_item, status: 2, quantity: 5, unit_price: 50, invoice_id: @c4_invoice1.id, item_id: @m1_item3.id )
  invoice_item12 = create(:invoice_item, status: 1, quantity: 6, unit_price: 80, invoice_id: @c4_invoice1.id, item_id: @m5_item2.id )
  # c4_invoice2 invoice_items
  invoice_item12 = create(:invoice_item, status: 2, quantity: 1, unit_price: 300000, invoice_id: @c4_invoice2.id, item_id: @m6_item3.id )
  invoice_item12 = create(:invoice_item, status: 2, quantity: 7, unit_price: 10, invoice_id: @c4_invoice1.id, item_id: @m4_item2.id )
  invoice_item12 = create(:invoice_item, status: 1, quantity: 100, unit_price: 25, invoice_id: @c4_invoice2.id, item_id: @m2_item1.id )
  # c5_invoice1 invoice_items
  invoice_item12 = create(:invoice_item, status: 2, quantity: 100, unit_price: 25, invoice_id: @c5_invoice1.id, item_id: @m2_item1.id )
  invoice_item12 = create(:invoice_item, status: 1, quantity: 10, unit_price: 30, invoice_id: @c5_invoice1.id, item_id: @m1_item1.id )
  invoice_item12 = create(:invoice_item, status: 2, quantity: 100, unit_price: 100, invoice_id: @c5_invoice1.id, item_id: @m3_item1.id )
  # c5_invoice2 invoice_items
  invoice_item12 = create(:invoice_item, status: 1, quantity: 10, unit_price: 25, invoice_id: @c5_invoice2.id, item_id: @m2_item1.id )
  invoice_item12 = create(:invoice_item, status: 2, quantity: 100, unit_price: 100, invoice_id: @c5_invoice2.id, item_id: @m3_item1.id )
  invoice_item12 = create(:invoice_item, status: 1, quantity: 10, unit_price: 5, invoice_id: @c5_invoice2.id, item_id: @m4_item1.id )
  invoice_item12 = create(:invoice_item, status: 2, quantity: 100, unit_price: 50, invoice_id: @c5_invoice2.id, item_id: @m5_item1.id )
  # c5_invoice3 invoice_items
  invoice_item12 = create(:invoice_item, status: 0, quantity: 10, unit_price: 5, invoice_id: @c5_invoice3.id, item_id: @m4_item1.id )
  invoice_item12 = create(:invoice_item, status: 0, quantity: 100, unit_price: 5, invoice_id: @c5_invoice3.id, item_id: @m4_item1.id )
  # c5_invoice4 invoice_items
  invoice_item12 = create(:invoice_item, status: 2, quantity: 10, unit_price: 3000, invoice_id: @c5_invoice4.id, item_id: @m6_item1.id )
  invoice_item12 = create(:invoice_item, status: 2, quantity: 100, unit_price: 50, invoice_id: @c5_invoice4.id, item_id: @m5_item1.id )
  # c5_invoice5 invoice_items
  invoice_item12 = create(:invoice_item, status: 2, quantity: 10, unit_price: 5, invoice_id: @c5_invoice5.id, item_id: @m4_item1.id )
  invoice_item12 = create(:invoice_item, status: 2, quantity: 100, unit_price: 30000, invoice_id: @c5_invoice5.id, item_id: @m6_item2.id )

  # c6_invoice1 invoice_items
  invoice_item12 = create(:invoice_item, status: 2, quantity: 10, unit_price: 3000, invoice_id: @c6_invoice1.id, item_id: @m6_item1.id )
  invoice_item12 = create(:invoice_item, status: 1, quantity: 50, unit_price: 5, invoice_id: @c6_invoice1.id, item_id: @m4_item1.id )
  # c6_invoice2 invoice_items
  invoice_item12 = create(:invoice_item, status: 0, quantity: 10, unit_price: 25, invoice_id: @c6_invoice2.id, item_id: @m2_item1.id )
  # c6_invoice3 invoice_items
  invoice_item12 = create(:invoice_item, status: 2, quantity: 125, unit_price: 25, invoice_id: @c6_invoice3.id, item_id: @m2_item1.id )
  # c6_invoice4 invoice_items
  invoice_item12 = create(:invoice_item, status: 2, quantity: 30, invoice_id: @c6_invoice4.id, item_id: @m4_item1.id )
  invoice_item12 = create(:invoice_item, status: 2, quantity: 10, unit_price: 100, invoice_id: @c6_invoice4.id, item_id: @m3_item1.id )

  # customer1 transactions
  transaction1 = create(:transaction, result: 1, invoice_id: @c1_invoice1.id)
  transaction2 = create(:transaction, result: 1, invoice_id: @c1_invoice2.id)
  transaction3 = create(:transaction, result: 1, invoice_id: @c1_invoice3.id)
  # customer2 transactions
  transaction4 = create(:transaction, result: 1, invoice_id: @c2_invoice1.id)
  transaction5 = create(:transaction, result: 0, invoice_id: @c2_invoice2.id)
  transaction6 = create(:transaction, result: 1, invoice_id: @c2_invoice3.id)
  transaction7 = create(:transaction, result: 0, invoice_id: @c2_invoice4.id)
  # customer3 transactions
  transaction8 = create(:transaction, result: 1, invoice_id: @c3_invoice1.id)
  transaction9 = create(:transaction, result: 1, invoice_id: @c3_invoice2.id)
  transaction10 = create(:transaction, result: 0, invoice_id: @c3_invoice3.id)
  # customer4 transactions
  transaction11 = create(:transaction, result: 1, invoice_id: @c4_invoice1.id)
  transaction12 = create(:transaction, result: 1, invoice_id: @c4_invoice2.id)
  # customer5 transactions
  transaction13 = create(:transaction, result: 1, invoice_id: @c5_invoice1.id)
  transaction14 = create(:transaction, result: 1, invoice_id: @c5_invoice2.id)
  transaction15 = create(:transaction, result: 0, invoice_id: @c5_invoice3.id)
  transaction16 = create(:transaction, result: 1, invoice_id: @c5_invoice4.id)
  transaction17 = create(:transaction, result: 1, invoice_id: @c5_invoice5.id)
  # customer6 transactions
  transaction18 = create(:transaction, result: 1, invoice_id: @c6_invoice1.id)
  transaction19 = create(:transaction, result: 0, invoice_id: @c6_invoice2.id)
  transaction20 = create(:transaction, result: 1, invoice_id: @c6_invoice3.id)
  transaction21 = create(:transaction, result: 1, invoice_id: @c6_invoice4.id)
  
end

