class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.new
    @customers = current_customer


  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer

    @customer.update(customer_params)
      redirect_to customers_path

  end

  def unsubscribe
  end


private


  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email )
  end

end