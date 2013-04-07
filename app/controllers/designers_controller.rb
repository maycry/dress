class DesignersController < ApplicationController

  def index
    @designers = Style.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @styles }
    end
  end

  def show
    @designer = Designer.find(params[:id])
    @types = Type.all
    @styles = Style.all
    @designer = Designer.all
    @products = Product.where("designer_id = ?", params[:id])

  end
end
