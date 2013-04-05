class ProductsController < ApplicationController

  def index
    @products = Product.all
    @designers = Designer.all
    @styles = Style.all

    respond_to do |format|
      format.html 
      format.json { render json: @products }
    end
  end

  def show
    @products = Product.limit(5)
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end
end
