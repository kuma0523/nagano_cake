class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @total = @cart_items.sum(&:subtotal)
  end


  def create
    @cart_item = CartItem.new(cart_item_params)

    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])

  if @cart_item

    @cart_item.amount += params[:cart_item][:amount].to_i
  else
    @cart_item = CartItem.new(cart_item_params)
  end

    if @cart_item.save
      redirect_to cart_items_path
    else
      @cart_items = CartItem.all
      render :index
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])

    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      @cart_items = CartItem.all
      render :index
    end
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end



private

def cart_item_params
  params.require(:cart_item).permit(:customer_id, :item_id, :amount)
end
end