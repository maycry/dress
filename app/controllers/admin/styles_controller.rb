class Admin::StylesController < AdminController
  # GET /styles
  # GET /products.json

  def index
    @styles = Style.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @styles }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @style = Style.find_by_alias!(params[:id])

    respond_to do |format|
      format.html { render html: admin_style_path(@style)}
      format.json { render json: @style }
    end
  end

  # GET /styles/new
  # GET /styles/new.json
  def new
    @style = Style.new

    respond_to do |format|
      format.html { render }
      format.json { render json: @style }
    end
  end

  # GET /styles/1/edit
  def edit
    @style = Style.find_by_alias!(params[:id])
  end

  # POST /styles
  # POST /styles.json
  def create
    @style = Style.new(params[:style])

    respond_to do |format|
      if @style.save
        format.html { redirect_to admin_styles_path, notice: 'Style was successfully created.' }
        format.json { render json: @style, status: :created, location: @style }
      else
        format.html { render action: "new" }
        format.json { render json: @style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /styles/1
  # PUT /styles/1.json
  def update
    @style = Style.find_by_alias!(params[:id])

    respond_to do |format|
      if @style.update_attributes(params[:style])
        format.html { redirect_to admin_styles_path, notice: 'style was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /styles/1
  # DELETE /styles/1.json
  def destroy
    @style = Style.find_by_alias!(params[:id])
    @style.destroy

    respond_to do |format|
      format.html { redirect_to admin_styles_path }
      format.json { head :no_content }
    end
  end
end
