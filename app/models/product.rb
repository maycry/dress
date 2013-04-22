class Product < ActiveRecord::Base
	has_many :attached_images, :dependent => :destroy
	belongs_to :type
	belongs_to :style
	belongs_to :designer
	belongs_to :order
	accepts_nested_attributes_for :attached_images, :type, :allow_destroy => true
	accepts_nested_attributes_for :type, :reject_if => proc { |attributes| attributes['name'].blank? }
	attr_accessible :name, :attached_images_attributes, :price, :code, :type_id, :style_id, :designer_id, :description
	paginates_per 15

	def autoname
		"#{self.type.productname} #{self.style.name.mb_chars.downcase} #{self.designer.name}"
	end

	def self.search(search, page)
	  if search
	    s = joins(:style, :designer).where("styles.name like ? OR designers.name like ?", "%#{search.mb_chars.capitalize.to_s}%", "%#{search}%")
	    s = where("code like ?", "%#{search}%") if s.empty?
	    s.page(page).per(31)
	  else
	    page(page).per(31)
	  end
	end
end
