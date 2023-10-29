class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)

    @cart_items = CartItem.all

    if params[:order][:order_address] == "0"

      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:order_address] == "1"

      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end

    if @order.save
      redirect_to complete_orders_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def complete
  end

  def index
  end

  def show
  end
end

private

def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
end