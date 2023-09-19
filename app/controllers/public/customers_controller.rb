class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find_by(email: params[:customer][:email])

     return if !@customer

    if @customer.valid_password?(params[:customer][:password])

      if @customer.is_deleted
        redirect_to new_customer_registration_path
      end
    end
  end



def customer_state

end


private


  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email )
  end

end
