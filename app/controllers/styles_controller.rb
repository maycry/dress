class StylesController < ApplicationController

  def index
    @styles = Style.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @styles }
    end
  end

  def show
    @style = Style.find(params[:id])
    @types = Type.all
    @products = Product.where("style_id = ?", params[:id])

  end
end
