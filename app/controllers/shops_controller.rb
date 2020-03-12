class ShopsController < ApplicationController
  before_action :logged_in_shop, only: %i[edit update]
  before_action :correct_shop,   only: %i[edit update]

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:success] = 'Welcome to the your shop'
      log_in @shop
      redirect_to @shop
    else
      render 'new'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(shop_params)
      flash[:success] = 'Shop profile updated'
      redirect_to @shop
    else
      render 'edit'
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :password,
                                 :password_confirmation, :phone, :address,
                                 :description, :tax_code)
  end

  # Before filters

  # Confirms the correct shop.
  def correct_shop
    @shop = Shop.find(params[:id])
    redirect_to(root_url) unless current_shop?(@shop)
  end
end
