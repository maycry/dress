class StylesController < ApplicationController
	before_filter :get_all_types, :get_all_selections, :get_all_designers
	
  def show
    @style = Style.find_by_alias(params[:id])
    @type = Type.find_by_alias(params[:type_id])
    @styles = Style.where(type_id: @type)
    @products = Product.where("style_id = ? AND type_id = ?", @style, @type).page params[:page]
  end
end
