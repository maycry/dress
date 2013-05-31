class SitemapController < ApplicationController
  before_filter :get_all_types, :get_all_styles, :get_all_selections, :get_all_designers
  def index
  	@products = Product.all
  	respond_to do |format|
      format.xml
    end
  end
end
