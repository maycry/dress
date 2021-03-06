#!/bin/env ruby
# encoding: utf-8
class Product < ActiveRecord::Base
	has_many :attached_images, :dependent => :destroy
	belongs_to :type
	belongs_to :style
	belongs_to :designer
	belongs_to :selection
	belongs_to :order
	accepts_nested_attributes_for :attached_images, :type, :allow_destroy => true
	accepts_nested_attributes_for :type, :reject_if => proc { |attributes| attributes['name'].blank? }
	attr_accessible :name, :attached_images_attributes, :price, :code, :type_id, :style_id, :designer_id, :selection_id, :description, :year
	paginates_per 20

	default_scope order("created_at desc")
	scope :newest, lambda { |type_id| where("type_id = ?", type_id).limit 10}

	def autoname
		if self.designer.name == "Другие"
			"#{self.type.productname} #{self.style.name.mb_chars.downcase}"
		else
			"#{self.type.productname} #{self.style.name.mb_chars.downcase} #{self.designer.name}"
		end
	end

	def self.search(search, page)
	  if search
	    s = joins(:style, :designer).where("styles.name like ? OR designers.name like ?", "%#{search.mb_chars.capitalize.to_s}%", "%#{search}%")
	    s = where("code like ?", "%#{search}%") if s.empty?
	    s.order("created_at desc").page(page).per(31)
	  else
	    order("created_at desc").page(page).per(31)
	  end
	end

	def self.selection_image(selection)
		product = where("selection_id = ?", selection).first
		if product
			"style=background-image:url(#{product.attached_images.first.image.url(:thumb5)})"
		else
			"" 
		end
	end

	def to_param
    "#{self.id}-#{self.code.parameterize}"
  end

end
