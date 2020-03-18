class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  # Return total_price of cart
  def sub_total
    total_price_of_cart = 0
    line_items.each do |line_item|
      total_price_of_cart += line_item.total_price
    end
    total_price_of_cart
  end

  # Return total quantity of cart
  def total_quantity
    total_quantity = 0
    line_items.each do |line_item|
      total_quantity += line_item.quantity
    end
    total_quantity
  end
end
