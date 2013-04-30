class DesignersController < ApplicationController
  def show
    @designer = Designer.find_by_alias(params[:id])
    @type = Type.find_by_alias(params[:type_id])
    @types = Type.all
    @styles = Style.all
    @designers = Designer.order("name")
    @products = Product.order("created_at desc").where("designer_id = ? AND type_id = ?", @designer, @type).page params[:page]
    @products_year = @products.group_by(&:year)
    @selections = Selection.all
  end
end
