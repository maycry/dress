class Admin::ProductsController < AdminController

  def index
    @products = Product.search(params[:search], params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.style = Style.first
    @product.designer = Designer.first
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to edit_admin_product_path(@product),notice: "Product was successfully created. <a href='#{new_admin_product_path}'>Create new product</a>.".html_safe
    else
      render action: "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to edit_admin_product_path(@product), notice: "Product was successfully updated. <a href='#{new_admin_product_path}'>Create new product</a>.".html_safe
    else
      render action: "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path 
  end
end
