class Order < ApplicationRecord

  before_save { self.email = email.downcase }
  has_many :line_items, dependent: :destroy
  belongs_to :customer

  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  validates :phone, presence: true, length: { maximum: 20, minimum: 10 }
  validates :address, presence: true, length: { maximum: 255 }
end
