class OrdersController < ApplicationController

  def new
    @order = Order.new
    @types = Type.all
    @product = Product.find(params[:product_id])
  end

  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to '/complete'}
      else
        format.html { render action: "new" }
      end
    end
  end

end
