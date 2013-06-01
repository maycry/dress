class TypesController < ApplicationController
	before_filter :get_all_types, :get_all_styles, :get_all_selections, :get_all_designers
  def show
    @type = Type.find_by_alias(params[:id])
    @products = Product.order("created_at desc").where("type_id = ?", @type).page params[:page]
  end
end
