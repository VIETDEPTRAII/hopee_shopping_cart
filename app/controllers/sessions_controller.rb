class SessionsController < ApplicationController

  def new_shop; end

  def create_shop
    shop = Shop.find_by(email: params[:session][:email].downcase)
    if shop&.authenticate(params[:session][:password])
      log_in(shop)
      redirect_back_or shop
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new_shop'
    end
  end

  def destroy_shop
    log_out
    redirect_to root_url
  end

  def new_customer; end

  def create_customer
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer&.authenticate(params[:session][:password])
      log_in_customer(customer)
      redirect_back_or customer
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new_customer'
    end
  end

  def destroy_customer
    log_out_customer
    redirect_to root_url
  end
end
