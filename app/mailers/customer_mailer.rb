class CustomerMailer < ApplicationMailer

  # Mail order information to customer
  def order_information
    @order = params[:order]
    customer = Customer.find_by(id: @order.customer_id) if @order.customer_id
    mail to: customer.email, subject: 'Your order information'
  end
end
