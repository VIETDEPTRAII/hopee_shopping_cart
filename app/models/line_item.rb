class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order, optional: true

  # Return total_price of each line_item
  def total_price
    quantity * product.price
  end
end
