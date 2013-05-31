class OrdersController < ApplicationController
  before_filter :get_all_types
  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  end

  def create
    @order = Order.new(params[:order])
    @product = Product.find(params[:product_id])

    if @order.save
      redirect_to complete_path
      OrderMailer.order_complete(@order, @product, "byorickq@gmail.com").deliver
      OrderMailer.order_complete(@order, @product, "bykova.catia@gmail.com").deliver
    else
      render "new"
    end
  end

end
