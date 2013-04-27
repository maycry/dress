class TypesController < ApplicationController
  def show
    @type = Type.find_by_alias!(params[:id])
    @types = Type.all
    @products = Product.order("created_at desc").where("type_id = ?", @type).page params[:page]
    @designers = Designer.order("name")
    @styles = Style.all
    @selections = Selection.all
  end
end
