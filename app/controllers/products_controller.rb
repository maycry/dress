class ProductsController < ApplicationController

  def home
    @products = Product.limit(5)
    @types = Type.all
  end

  def index
    if params[:designer_alias].nil? && params[:style_alias].nil?
      @products = Product.where("type_id = ?", Type.find_by_alias(params[:type_alias]).id)
    elsif params[:style_alias].nil?
      @products = Product.where("type_id = ? AND designer_id = ?", Type.find_by_alias(params[:type_alias]).id, Designer.find_by_alias(params[:designer_alias]).id)
    else
      @products = Product.where("type_id = ? AND style_id = ?", Type.find_by_alias(params[:type_alias]).id, Style.find_by_alias(params[:style_alias]).id)
    end

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

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end
end
