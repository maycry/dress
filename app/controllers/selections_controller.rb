class SelectionsController < ApplicationController
  def show
    @selection = Selection.find_by_alias!(params[:id])
    @types = Type.all
    @type = Type.find_by_alias!(params[:type_id])
    @products = Product.order("created_at desc").where("selection_id = ? AND type_id = ?", @selection, @type).page(params[:page])
    @designers = Designer.order("name")
    @styles = Style.all
  end
end
