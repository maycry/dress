class AttachedImage < ActiveRecord::Base
	belongs_to :product
	has_attached_file :image, 
		:styles => {:thumb7 => "129x172#", 
					:thumb6 => "153x204#", 
					:thumb5 => "188x251#", 
					:thumb4 => "238x318#", 
					:thumb3 => "322x431#", 
					:thumb_small => "60x80#"}, 
		:url  => "/products/:product_id/:style/:basename.:extension",
		:path => ":rails_root/public/products/:product_id/:style/:basename.:extension"
	attr_accessible :image, :image_file_name

	def self.width
	  open(self.first.image.url, "rb") do |fh|
	  	ImageSize.new(fh.read).w
	  end
	end
	
	def self.height
	  open(self.first.image.url, "rb") do |fh|
	    ImageSize.new(fh.read).h
	  end
	end
end
