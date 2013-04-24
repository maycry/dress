class OrdersController < ApplicationController

  def new
    @order = Order.new
    @types = Type.all
    @product = Product.find(params[:product_id])

    @order.name  ||= session[:name]
    @order.phone ||= session[:phone]
    @order.email ||= session[:email]
  end

  def create
    @order = Order.new(params[:order])
    @types = Type.all
    @product = Product.find(params[:product_id])

    if @order.save
      redirect_to complete_path

      OrderMailer.order_complete(@order, @product, "byorickq@gmail.com").deliver
      OrderMailer.order_complete(@order, @product, "bykova.catia@gmail.com").deliver

      session[:name]  ||= @order.name 
      session[:phone] ||= @order.phone
      session[:email] ||= @order.email 
    else
      render "new"
    end
  end

end
