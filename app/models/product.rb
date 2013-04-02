class Product < ActiveRecord::Base
	has_many :attached_images, :dependent => :destroy
	belongs_to :type
	accepts_nested_attributes_for :attached_images, :type, :allow_destroy => true
	accepts_nested_attributes_for :type, :reject_if => proc { |attributes| attributes['name'].blank? }
	attr_accessible :name, :attached_images_attributes, :price, :code, :type_id, :type_attributes
end
