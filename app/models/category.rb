class Category < ApplicationRecord
  belongs_to :shop
  has_many :products_categories
  has_many :products, through: :products_categories

  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 150 }
  validates :description, presence: true, length: { maximum: 255 }
end
