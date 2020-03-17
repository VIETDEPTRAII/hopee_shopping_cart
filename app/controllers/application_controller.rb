class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_cart
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

  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id].nil?
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end

end
