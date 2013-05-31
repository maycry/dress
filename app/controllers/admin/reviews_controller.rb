class Admin::ReviewsController < AdminController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(params[:review])
    if @review.save
      redirect_to admin_reviews_path, notice: "review was successfully created. <a href='#{new_admin_review_path}'>Create new review</a>.".html_safe
    else
      render action: "new"
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(params[:review])
      redirect_to admin_reviews_path, notice: 'review was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path
  end
end
