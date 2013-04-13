class PagesController < ApplicationController
  def quality
    @types = Type.all
  end

  def shipping
    @types = Type.all
  end

  def faq
    @types = Type.all
  end

  def contacts
    @types = Type.all
  end

  def about
    @types = Type.all
  end
end
