class OrdersController < ApplicationController

  def new
    @order = Order.new
    @types = Type.all
    @product = Product.find(params[:product_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @order = Order.new(params[:order])
    @types = Type.all
    @product = Product.find(params[:product_id])

    if @order.save
      redirect_to complete_path
    else
      render "new"
    end
  end

end
