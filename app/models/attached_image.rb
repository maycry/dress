class AttachedImage < ActiveRecord::Base
	belongs_to :product
	has_attached_file :image, 
		:styles => {:thumb8 => "111x148#", 
					:thumb7 => "129x172#", 
					:thumb6 => "153x204#", 
					:thumb5 => "188x251#", 
					:thumb4 => "238x318#", 
					:thumb3 => "322x431#", 
					:thumb_small => "60x80#"}, 
		:url  => "/products/:product_id/:style/:basename.:extension",
		:path => "/products/:product_id/:style/:basename.:extension",
		:storage => :s3,
	    :s3_credentials => S3_CREDENTIALS
	attr_accessible :image, :image_file_name, :replica
end
