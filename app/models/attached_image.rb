class AttachedImage < ActiveRecord::Base
	belongs_to :product
	has_attached_file :image, 
		:styles => {:thumb5 => "188x251#", 
					:thumb4 => "238x318#", 
					:thumb3 => "322x431#"}, 
		:url  => "/products/:product_id/:style/:basename.:extension",
		:path => ":rails_root/public/products/:product_id/:style/:basename.:extension"
	attr_accessible :image, :image_file_name
end
