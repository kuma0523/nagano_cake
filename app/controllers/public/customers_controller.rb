class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @customer = Customer.new

  end

  def edit
  end

  def unsubscribe
  end
end
