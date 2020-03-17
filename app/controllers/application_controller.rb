class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  # Confirms a logged-in shop.
  def logged_in_shop
    unless logged_in_shop?
      store_location
      flash[:danger] = 'Please login to your shop!'
      redirect_to login_shop_path
    end
  end

  # Confirms a logged-in customer.
  def logged_in_customer
    unless logged_in_customer?
      store_location
      flash[:danger] = 'Please login account!'
      redirect_to login_path
    end
  end
end
