class TypesController < ApplicationController
  # GET /type
  # GET /products.json

  def index
    @types = Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @type = Type.find(params[:id])
    @types = Type.all
    @products = Product.where("type_id = ?", params[:id])
    @designers = Designer.all
    @styles = Style.all
  end

end
