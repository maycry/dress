class Post < ActiveRecord::Base
  attr_accessible :body, :title, :image_attributes
  validates :title, :presence => true

  default_scope order("created_at desc")

  def image
  	
  end

  def image_attributes=(attributes)
  	
  end
end
