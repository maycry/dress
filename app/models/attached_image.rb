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
	attr_accessible :image, :image_file_name, :replica, :width, :height

	after_post_process :save_image_dimensions

	def save_image_dimensions
		geo = Paperclip::Geometry.from_file(image.queued_for_write[:original])
		self.width = geo.width
		self.height = geo.height
	end

	def width
		FastImage.size(self.image.url)[0]
	end

	def height
		FastImage.size(self.image.url)[1]
	end
end
