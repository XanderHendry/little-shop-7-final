class Merchants::DiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
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
      redirect_back(fallback_location: "/merchants/#{params[:merchant_id]}/discounts")
      flash[:error] = "Discount Not Saved!"
    end
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.find(params[:id])
  end

  def update
    discount = Discount.find(params[:id])
    if discount.update(discount_params)
      redirect_to "/merchants/#{params[:merchant_id]}/discounts/#{discount.id}"
    else
      redirect_back(fallback_location: "/merchants/#{params[:merchant_id]}/discounts")
      flash[:error] = "Discount Not Saved!"
    end
  end

  def destroy
    discount = Discount.find(params[:id])
    discount.destroy
    redirect_back(fallback_location: "/merchants/#{params[:merchant_id]}/discounts")
  end

  private

  def discount_params
    params.permit(:percentage, :threshold)
  end
end
