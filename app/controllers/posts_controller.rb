class PostsController < ApplicationController

  def index
    @posts = Post.all
    @types = Type.all
  end

  def show
    @post = Post.find(params[:id])
    @types = Type.all
  end
end
