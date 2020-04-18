class ProductRating < ApplicationRecord
  belongs_to :product, inverse_of: :product_rating
  validates_presence_of :product
end
