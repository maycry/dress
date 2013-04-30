class Post < ActiveRecord::Base
  attr_accessible :body, :title, :image_attributes

  def image
  	
  end

  def image_attributes=(attributes)
  	
  end
end
