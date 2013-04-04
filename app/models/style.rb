class Style < ActiveRecord::Base
  attr_accessible :alias, :name, :order, :image
  has_many :styles
  has_attached_file :image, 
  	:styles => {:thumb8 => "111x148#", 
		  					:thumb7 => "129x172#"}, 
  	:url  => "/styles/:style_id/:style/:basename.:extension",
  	:path  => "/styles/:style_id/:style/:basename.:extension",
  	:storage => :s3,
    :s3_credentials => S3_CREDENTIALS
end
