class AdminController < ApplicationController
	before_filter :authenticate
	def authenticate
	  unless session[:log_in]
	    flash[:error] = "You must be logged in to access this section"
	    redirect_to log_in_path # halts request cycle
	  end
	end
end