class ProductsController < ApplicationController
  before_filter :get_all_types
  before_filter :get_all_styles, except: [:show]

  def home
    @products_wedding_dresses = Product.newest(1)
    @products_evening_dresses = Product.newest(2)
    @review = Review.order("RANDOM()").first
  end

  def index
    @designers = Designer.order("name")
  end

  def show
    @product = Product.find(params[:id])
    #refactor
    @images_original = @product.attached_images.find_all_by_replica(false)
    @images_replica = @product.attached_images.find_all_by_replica(true)
    @review = Review.order("RANDOM()").first
    @products = Product.where("type_id = ? AND style_id = ? AND id != ?", @product.type, @product.style, @product).limit(5)
  end
end
