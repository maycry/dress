class DesignersController < ApplicationController
  def show
    @designer = Designer.find_by_alias(params[:id])
    @type = Type.find_by_alias(params[:type_id])
    @types = Type.all
    @styles = Style.all
    @designers = Designer.all
    @products = Product.order("created_at desc").where("designer_id = ?", @designer).page params[:page]
    @products_year = @products.group_by(&:year)
    @selections = Selection.all
  end
end
