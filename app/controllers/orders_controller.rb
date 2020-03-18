class OrdersController < ApplicationController

  before_action :logged_in_customer, only: %i[index show new create show]
  before_action :current_cart_empty?, only: %i[new create]
  # before_action :correct_customer, only: %i[index show]

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
      flash[:success] = 'Your order created!'
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order)
          .permit(:name, :email, :phone, :address)
          .merge(pay_method: 'Cash', customer_id: current_customer.id,
                 total_price: @current_cart.sub_total)
  end

  def current_cart_empty?
    redirect_to root_path if @current_cart.total_quantity.zero?
  end

end
