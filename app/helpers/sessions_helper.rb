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

  # Logs in the given customer.
  def log_in_customer(customer)
    session[:customer_id] = customer.id
  end

  # Returns the current logged-in customer (if any).
  def current_customer
    if session[:customer_id]
      @current_customer ||= Customer.find_by(id: session[:customer_id])
    end
  end

  # Returns true if the given customer is the current customer.
  def current_customer?(customer)
    customer == current_customer
  end

  def logged_in_customer?
    !current_customer.nil?
  end

  def log_out_customer
    session.delete(:customer_id)
    @current_customer = nil
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
