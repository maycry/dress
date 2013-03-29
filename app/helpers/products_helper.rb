#!/bin/env ruby
# encoding: utf-8

module ProductsHelper
	
	# 4000 грн or 10 000 грн
	def return_price(product)
		price = number_to_currency product, :unit => "", :precision => 0, :delimiter => " "
		price.strip!
		price.length < 6 ? price.gsub!(/\s+/, "") : price
		price += " грн"
		content_tag :p, price, :class => "price"
	end
end
