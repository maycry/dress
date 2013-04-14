class Admin::TypesController < AdminController
  # GET /type
  # GET /products.json

  def index
    @types = Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @type = Type.find_by_alias!(params[:id])

    respond_to do |format|
      format.html { render html: admin_type_path(@type)}
      format.json { render json: @type }
    end
  end

  # GET /type/new
  # GET /type/new.json
  def new
    @type = Type.new

    respond_to do |format|
      format.html { render }
      format.json { render json: @type }
    end
  end

  # GET /type/1/edit
  def edit
    @type = Type.find_by_alias!(params[:id])
  end

  # POST /type
  # POST /type.json
  def create
    @type = Type.new(params[:type])

    respond_to do |format|
      if @type.save
        format.html { redirect_to admin_types_path, notice: 'Type was successfully created.' }
        format.json { render json: @type, status: :created, location: @type }
      else
        format.html { render action: "new" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /type/1
  # PUT /type/1.json
  def update
    @type = Type.find_by_alias!(params[:id])

    respond_to do |format|
      if @type.update_attributes(params[:type])
        format.html { redirect_to admin_types_path, notice: 'Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type/1
  # DELETE /type/1.json
  def destroy
    @type = Type.find_by_alias!(params[:id])
    @type.destroy

    respond_to do |format|
      format.html { redirect_to admin_types_path }
      format.json { head :no_content }
    end
  end
end
