class OrdersController < ApplicationController

  before_action :logged_in_customer, only: %i[index show new create show]
  before_action :correct_order_of_current_customer, only: :show
  before_action :current_cart_empty?, only: %i[new create]

  def index
    if logged_in_customer?
      @orders = current_customer.orders.paginate(page: params[:page],
                                                 per_page: 50)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    if @order.save
      CustomerMailer.with(order: @order).order_information.deliver_later
      ShopMailer.with(order: @order).new_order_of_customer.deliver_later

      flash[:success] = 'Your order created.
                        Check your email to confirm the order!'
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  # Strong params of order
  def order_params
    params.require(:order)
          .permit(:name, :email, :phone, :address)
          .merge(pay_method: 'Cash', customer_id: current_customer.id,
                 total_price: @current_cart.sub_total)
  end

  # Before filters

  # Return status of cart
  def current_cart_empty?
    redirect_to root_path if @current_cart.total_quantity.zero?
  end

  # Confirms the correct order of current customer.
  def correct_order_of_current_customer
    @order = Order.find_by(id: params[:id])
    unless @order.nil?
      @correct_order_of_current_customer = current_customer
                                           .orders
                                           .find_by(id: @order.id)
    end
    redirect_to root_path if @correct_order_of_current_customer.nil?
  end
end
