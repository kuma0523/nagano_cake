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

    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render :edit
    end
  end

  def unsubscribe
  end


private


  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
  end

end