# Preview all emails at http://localhost:3000/rails/mailers/shop_mailer
class ShopMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/shop_mailer/new_order_of_customer
  def new_order_of_customer
    ShopMailer.new_order_of_customer
  end

end
