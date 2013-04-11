class ProductsController < ApplicationController

  def home
    @products = Product.order("created_at desc").page(1)
    @types = Type.all
  end

  def index
    @designers = Designer.all
    @styles = Style.all
    @types = Type.all

    respond_to do |format|
      format.html 
      format.json { render json: @products }
    end
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.where("type_id = ? AND style_id = ?", @product.type, @product.style).limit(5)
    @types = Type.all
  end
end
