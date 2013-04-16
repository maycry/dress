class Admin::OrdersController < AdminController
  # GET /order
  # GET /orders.json

  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html { render html: admin_order_path(@order)}
      format.json { render json: @order }
    end
  end

  # GET /products/1/edit
  def edit
    @order = Order.find(params[:id])
  end


  # DELETE /type/1
  # DELETE /type/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to admin_orders_path }
      format.json { head :no_content }
    end
  end
end
