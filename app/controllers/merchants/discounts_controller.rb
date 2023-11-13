class Merchants::DiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @discount = Discount.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    discount = Discount.new(merchant_id: params[:merchant_id], percentage: params[:percentage], threshold: params[:threshold])
    if discount.save
      redirect_to "/merchants/#{params[:merchant_id]}/discounts"
    else
      redirect_to "/merchants/#{params[:merchant_id]}/discounts/new"
      flash[:error] = "Discount Not Saved!"
    end
  end

  def destroy
    discount = Discount.find(params[:id])
    discount.destroy
    redirect_back(fallback_location: "/merchants/#{params[:merchant_id]}/discounts")
  end
end
