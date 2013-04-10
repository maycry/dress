class StylesController < ApplicationController

  def index
    @styles = Style.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @styles }
    end
  end

  def show
    @style = Style.find_by_alias!(params[:id])
    @types = Type.all
    @type = Type.find_by_alias!(params[:type_id])
    @products = Product.where("style_id = ?", @style)
    @designers = Designer.all
    @styles = Style.all
  end
end
