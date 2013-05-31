class PostsController < ApplicationController
	before_filter :get_all_types
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
