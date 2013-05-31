class DesignersController < ApplicationController
  before_filter :get_all_types, :get_all_styles, :get_all_selections, :get_all_designers

  def show
    @designer = Designer.find_by_alias(params[:id])
    @type = Type.find_by_alias(params[:type_id])
    @products = Product.where("designer_id = ? AND type_id = ?", @designer, @type).page params[:page]
    @products_year = @products.group_by(&:year)
  end
end
