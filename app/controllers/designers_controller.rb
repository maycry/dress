class DesignersController < ApplicationController
  def show
    @designer = Designer.find_by_alias(params[:id])
    @type = Type.find_by_alias(params[:type_id])
    @types = Type.all
    @styles = Style.all
    @designers = Designer.all
    @products = Product.order("created_at desc").where("designer_id = ?", @designer).page params[:page]
    @selections = Selection.all
    @image1 = Product.selection_image(@selections.first)
    @image2 = Product.selection_image(@selections.last)
  end
end
