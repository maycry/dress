class DesignersController < ApplicationController

  def index
    @designers = Style.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @styles }
    end
  end

  def show
    @designer = Designer.find_by_alias(params[:id])
    @types = Type.all
    @styles = Style.all
    @designers = Designer.all
    @products = Product.where("designer_id = ?", @designer)

  end
end
