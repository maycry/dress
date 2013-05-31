class SelectionsController < ApplicationController
	before_filter :get_all_types, :get_all_styles, :get_all_selections, :get_all_designers
  def show
    @selection = Selection.find_by_alias!(params[:id])
    @type = Type.find_by_alias!(params[:type_id])
    @products = Product.where("selection_id = ? AND type_id = ?", @selection, @type).page(params[:page])
  end
end
