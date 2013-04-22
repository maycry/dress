class TypesController < ApplicationController
  def show
    @type = Type.find_by_alias!(params[:id])
    @types = Type.all
    @products = Product.order("created_at desc").where("type_id = ?", @type).page params[:page]
    @designers = Designer.all
    @styles = Style.all
    @selections = Selection.all
    @image1 = Product.selection_image(@selections.first)
    @image2 = Product.selection_image(@selections.last)
  end
end
