class CustomersController < ApplicationController
  before_action :logged_in_customer, only: %i[show edit update]
  before_action :correct_customer,   only: %i[show edit update]

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      log_in_customer @customer
      flash[:success] = 'Account created!'
      redirect_to @customer
    else
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      flash[:success] = 'Profile updated'
      redirect_to @customer
    else
      render 'edit'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :password,
                                     :password_confirmation, :phone, :address)
  end

  # Before filters

  # Confirms the correct shop.
  def correct_customer
    @customer = Customer.find(params[:id])
    redirect_to root_url unless current_customer?(@customer)
  end
end
