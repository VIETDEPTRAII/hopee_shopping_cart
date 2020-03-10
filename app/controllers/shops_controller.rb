class ShopsController < ApplicationController

  def new
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:success] = "Welcome to the your shop"
      redirect_to @shop
    else
      render 'new'
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :password,
                                 :password_confirmation, :phone, :address,
                                 :description, :tax_code)
  end
end
