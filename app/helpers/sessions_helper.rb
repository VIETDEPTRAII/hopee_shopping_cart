module SessionsHelper

  # Logs in the given shop.
  def log_in(shop)
    session[:shop_id] = shop.id
  end

  # Returns true if the given shop is the current shop.
  def current_shop?(shop)
    shop == current_shop
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

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
