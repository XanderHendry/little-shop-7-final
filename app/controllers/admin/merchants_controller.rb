class Admin::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end


  def update
    #find our merchant
    @merchant = Merchant.find(params[:id])
    #use the request to update the merchant 
    @merchant.update(enabled: params[:enabled])
    #redirect to the admin merchants index
    redirect_to admin_merchants_path
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(name: params[:name])

    # require 'pry'; binding.pry
    if params[:enabled]
      merchant.update(enabled: params[:enabled])
      redirect_back(fallback_location: "/admin/merchants")
    elsif merchant.save
      redirect_to admin_merchant_path(merchant.id)
      flash[:success] = "Merchant info has been successfully updated."
    else 
      redirect_to edit_admin_merchant_path(merchant.id)
      flash[:error] = "Invalid data; name can't be blank." 
    end
  end
end

