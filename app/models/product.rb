class Product < ApplicationRecord
  belongs_to :shop
  has_many :products_categories
  has_many :categories, through: :products_categories

  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :shop_id, presence: true
  validates :name, presence: true, length: { maximum: 150 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :price, presence: true
  validates :total, presence: true
  validates :picture, presence: true
  validate :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'should be less than 5MB')
    end
  end
end
