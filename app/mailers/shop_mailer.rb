class ShopMailer < ApplicationMailer

  # Mail new order of customer to shop
  def new_order_of_customer
    @order = params[:order]
    @line_items = get_line_items_of_shop(@order)
    ids_of_shop_in_line_items = @line_items.pluck(:shop_id).uniq
    shops = Shop.all.where(id: ids_of_shop_in_line_items)
    shop_emails = shops.pluck(:email)

    mail to: shop_emails, subject: 'You have new order of your customer'
  end

  private

  def get_line_items_of_shop(order)
    line_items = []
    order.line_items.each do |line_item|
      line_items << line_item
    end
    line_items
  end
end
