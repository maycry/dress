class StylesController < ApplicationController
  def show
    @style = Style.find_by_alias!(params[:id])
    @types = Type.all
    @type = Type.find_by_alias!(params[:type_id])
    @designers = Designer.order("name")
    @styles = Style.all
    @products = Product.order("created_at desc").where("style_id = ? AND type_id = ?", @style, @type).page params[:page]
    @selections = Selection.all
  end
end
