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
  @m1_item1 = create(:item, merchant: @merchant1)
  @m1_item2 = create(:item, merchant: @merchant1)
  @m1_item3 = create(:item, merchant: @merchant1)
  # merchant2 items
  @m2_item1 = create(:item, merchant: @merchant2)
  @m2_item2 = create(:item, merchant: @merchant2)
  @m2_item3 = create(:item, merchant: @merchant2)
  # merchant3 items
  @m3_item1 = create(:item, merchant: @merchant3)
  @m3_item2 = create(:item, merchant: @merchant3)
  @m3_item3 = create(:item, merchant: @merchant3)
  # merchant4 items
  @m4_item1 = create(:item, merchant: @merchant4)
  @m4_item2 = create(:item, merchant: @merchant4)
  @m4_item3 = create(:item, merchant: @merchant4)
  # merchant5 items
  @m5_item1 = create(:item, merchant: @merchant5)
  @m5_item2 = create(:item, merchant: @merchant5)
  @m5_item3 = create(:item, merchant: @merchant5)
  # merchant6 items
  @m6_item1 = create(:item, merchant: @merchant6)
  @m6_item2 = create(:item, merchant: @merchant6)
  @m6_item3 = create(:item, merchant: @merchant6)

  # merchant1 discounts
  @m1_discount1 = create(:discount, merchant: @merchant1)
  @m1_discount2 = create(:discount, merchant: @merchant1)
  # merchant2 discounts
  @m2_discount1 = create(:discount, merchant: @merchant2)
  @m2_discount2 = create(:discount, merchant: @merchant2)
  # merchant3 discounts
  @m3_discount1 = create(:discount, merchant: @merchant3)
  @m3_discount2 = create(:discount, merchant: @merchant3)
  # merchant4 discounts
  @m4_discount1 = create(:discount, merchant: @merchant4)
  @m4_discount2 = create(:discount, merchant: @merchant4)
  # merchant5 discounts
  @m5_discount1 = create(:discount, merchant: @merchant5)
  @m5_discount2 = create(:discount, merchant: @merchant5)
  # merchant6 discounts
  @m6_discount1 = create(:discount, merchant: @merchant6)
  @m6_discount2 = create(:discount, merchant: @merchant6)
end

