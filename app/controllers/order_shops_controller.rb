class OrderShopsController < ApplicationController

  before_action :logged_in_shop, only: %i[index show]
  before_action :correct_order_of_current_shop, only: :show

  def index
    if logged_in_shop?
      @orders = Order.joins(:line_items)
                     .where(line_items: { shop_id: current_shop.id })
                     .distinct.paginate(page: params[:page], per_page: 50)
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  private

  # Before filters

  # Confirms the correct order of current shop.
  def correct_order_of_current_shop
    @order = Order.find_by(id: params[:id])
    unless @order.nil?
      @correct_order = Order.joins(:line_items)
                            .where(line_items: { shop_id: current_shop.id })
                            .distinct
                            .find_by(id: @order.id)
    end
    redirect_to root_path if @correct_order.nil?
  end
end
