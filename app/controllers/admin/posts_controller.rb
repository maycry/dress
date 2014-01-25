class Admin::PostsController < AdminController

  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html { render html: admin_post_path(@post)}
      format.json { render json: @post }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html { render }
      format.json { render json: @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if params[:post][:image_attributes]
        @post.save
        @name = params[:post][:image_attributes][:image][0].original_filename
        s3 = AWS::S3.new
        bucket = s3.buckets["makemydress.com.ua"]
        obj = bucket.objects["blog/#{@post.id}/#{@name}"]
        obj.write(params[:post][:image_attributes][:image][0].read, :acl => :public_read)
      else
        if @post.save
          format.html { redirect_to admin_posts_url }
          format.json { render action: 'show', status: :created, location: @post }
        else
          format.html { render action: 'new' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if params[:post][:image_attributes]
        @name = params[:post][:image_attributes][:image][0].original_filename
        s3 = AWS::S3.new
        bucket = s3.buckets["makemydress.com.ua"]
        obj = bucket.objects["blog/#{@post.id}/#{@name}"]
        obj.write(params[:post][:image_attributes][:image][0].read, :acl => :public_read)
        format.js
      else
        if @post.update_attributes(params[:post])
          format.html { redirect_to admin_post_path(@post)}
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_path }
      format.json { head :no_content }
    end
  end

  def upload
    debugger
    
  end
end
