class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_all_types
    @types = Type.all
  end

  def get_all_styles
    @styles = Style.all
  end

  def get_all_designers
    @designers = Designer.all
  end

  def get_all_selections
    @selections = Selection.all
  end

end
