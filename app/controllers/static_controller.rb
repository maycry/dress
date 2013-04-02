class StaticController < ApplicationController
	def home
		@products = Product.limit(5)
	end
end
