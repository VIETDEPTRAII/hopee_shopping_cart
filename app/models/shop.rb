class Shop < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :phone, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 255 }
  validates :tax_code, presence: true, length: { maximum: 20 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
