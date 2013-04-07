class PagesController < ApplicationController

  def quality
    @types = Type.all
  end
end
