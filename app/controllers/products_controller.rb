class ProductsController < ApplicationController

  def home
    @products_1 = Product.order("created_at desc").where("type_id = ?", 1).limit 10
    @products_2 = Product.order("created_at desc").where("type_id = ?", 2).limit 10
    @products = Product.order("created_at desc").limit 10
    @types = Type.all
    @type = Type.first
    @styles = Style.all
    @review = rand(1..2)
    @review_images = Dir.glob("app/assets/images/reviews/#{@review}/*")
    @review_images.each {|i| i.slice!("app/assets/images/")}
  end

  def index
    @designers = Designer.order("name")
    @styles = Style.all
    @types = Type.all

    respond_to do |format|
      format.html 
      format.json { render json: @products }
    end
  end

  def show
    @product = Product.find(params[:id])
    @images_original = @product.attached_images.find_all_by_replica(false)
    @images_replica = @product.attached_images.find_all_by_replica(true)
    @products = Product.where("type_id = ? AND style_id = ? AND id != ?", @product.type, @product.style, @product).limit(5)
    @types = Type.all
    @review = rand(1..2)
    @review_images = Dir.glob("app/assets/images/reviews/#{@review}/*")
    @review_images.each {|i| i.slice!("app/assets/images/")}
  end
end
