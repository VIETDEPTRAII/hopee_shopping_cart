# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/customer_mailer/order_information
  def order_information
    # order = Order.new(name: 'NGUYEN THANH VIET',
    #                   id: 100,
    #                   email: 'nguyenthanhviet31031998@gmail.com',
    #                   address: '491 HAU GIANG, P.11, Q.6, TP.HCM',
    #                   pay_method: 'Cash',
    #                   phone: '0904716299',
    #                   customer_id: 1,
    #                   total_price: 17_000_000,
    #                   created_at: '2020-03-20 11:14:00')
    #
    # CustomerMailer.with(order: order).order_information
  end

end
