module OrderShopsHelper

  # return total_price_of_current_shop
  def total_price_of_current_shop(line_items)
    total_price_of_current_shop = 0
    line_items.each do |line_item|
      total_price_of_current_shop += line_item.total_price
    end
    total_price_of_current_shop
  end

end
