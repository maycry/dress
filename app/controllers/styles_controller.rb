class StylesController < ApplicationController
  def show
    @style = Style.find_by_alias!(params[:id])
    @types = Type.all
    @type = Type.find_by_alias!(params[:type_id])
    @products = Product.order("created_at desc").where("style_id = ?", @style).page params[:page]
    @designers = Designer.all
    @styles = Style.all
  end
end
