class Admin::DesignersController < AdminController
  # GET /designer
  # GET /products.json

  def index
    @designers = Designer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @designers }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @designer = Designer.find_by_alias!(params[:id])

    respond_to do |format|
      format.html { render html: admin_designer_path(@designer)}
      format.json { render json: @designer }
    end
  end

  # GET /designer/new
  # GET /designer/new.json
  def new
    @designer = Designer.new

    respond_to do |format|
      format.html { render }
      format.json { render json: @designer }
    end
  end

  # GET /designer/1/edit
  def edit
    @designer = Designer.find_by_alias!(params[:id])
  end

  # POST /designer
  # POST /designer.json
  def create
    @designer = Designer.new(params[:designer])

    respond_to do |format|
      if @designer.save
        format.html { redirect_to admin_designers_path, notice: 'Designer was successfully created.' }
        format.json { render json: @designer, status: :created, location: @designer }
      else
        format.html { render action: "new" }
        format.json { render json: @designer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /designer/1
  # PUT /designer/1.json
  def update
    @designer = Designer.find_by_alias!(params[:id])

    respond_to do |format|
      if @designer.update_attributes(params[:designer])
        format.html { redirect_to admin_designers_path, notice: 'designer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @designer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designer/1
  # DELETE /designer/1.json
  def destroy
    @designer = Designer.find_by_alias!(params[:id])
    @designer.destroy

    respond_to do |format|
      format.html { redirect_to admin_designers_path }
      format.json { head :no_content }
    end
  end
end
