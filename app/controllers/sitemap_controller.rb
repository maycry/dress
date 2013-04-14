class SitemapController < ApplicationController
  def index
  	@types = Type.all
  	@type = Type.first
  	@styles = Style.all
  	@designers = Designer.all
  	respond_to do |format|
      format.xml
    end
  end
end
