class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  # Confirms a logged-in user.
  def logged_in_shop
    unless logged_in_shop?
      store_location
      flash[:danger] = 'Please login to your shop!'
      redirect_to login_shop_path
    end
  end
end
