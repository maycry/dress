class Admin::SelectionsController < AdminController

  def index
    @selections = Selection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selections }
    end
  end

  def show
    @selection = Selection.find_by_alias!(params[:id])

    respond_to do |format|
      format.html { render html: admin_selection_path(@selection)}
      format.json { render json: @selection }
    end
  end

  def new
    @selection = Selection.new

    respond_to do |format|
      format.html { render }
      format.json { render json: @selection }
    end
  end

  def edit
    @selection = Selection.find_by_alias!(params[:id])
  end

  def create
    @selection = Selection.new(params[:selection])

    respond_to do |format|
      if @selection.save
        format.html { redirect_to admin_selections_path, notice: 'selection was successfully created.' }
        format.json { render json: @selection, status: :created, location: @selection }
      else
        format.html { render action: "new" }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @selection = Selection.find_by_alias!(params[:id])

    respond_to do |format|
      if @selection.update_attributes(params[:selection])
        format.html { redirect_to admin_selections_path, notice: 'selection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @selection = Selection.find_by_alias!(params[:id])
    @selection.destroy

    respond_to do |format|
      format.html { redirect_to admin_selections_path }
      format.json { head :no_content }
    end
  end
end
