class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end


  def create
    @cart_item = CartItem.new(cart_item_params)

    if @cart_item.save
      redirect_to cart_items_path
    else
      @cart_items = CartItem.all
      render :index
    end
  end

  def update
    @cart_item = CartItem.new(cart_item_params)

    if @cart_item.update(cart_item_params)
      redirect_to cart_item_path
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


def cart_item_state

     @cart_iteme = Item.find_by(neme: params[:name])

     return if !@cart_item

    if @cart_item.is_deleted

        redirect_to

      else
    end
end

private

def cart_item_params
  params.require(:cart_item).permit(:customer_id, :item_id, :amount)
end
end