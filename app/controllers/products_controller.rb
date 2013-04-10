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
    @products = Product.limit(5)
    @product = Product.find(params[:id])
    @types = Type.all

  end
end
