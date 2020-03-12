class Category < ApplicationRecord
  belongs_to :shop
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 150 }
  validates :description, presence: true, length: { maximum: 255 }
end
