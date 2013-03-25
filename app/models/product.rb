class Product < ActiveRecord::Base
	has_many :attached_images, :dependent => :destroy
	accepts_nested_attributes_for :attached_images, :allow_destroy => true
	attr_accessible :name, :attached_images_attributes, :price
end
