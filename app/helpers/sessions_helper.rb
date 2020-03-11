module SessionsHelper

  # Logs in the given shop.
  def log_in(shop)
    session[:shop_id] = shop.id
  end

  # Returns the current logged-in shop (if any).
  def current_shop
    @current_shop ||= Shop.find_by(id: session[:shop_id]) if session[:shop_id]
  end

  # Check logged-in shop, returns boolean
  def logged_in_shop?
    !current_shop.nil?
  end

  # Logs out the current shop
  def log_out
    session.delete(:shop_id)
    @current_shop = nil
  end
end
