module ProductsHelper
	def is_loggedin
		session[:log_in] ? session[:log_in] : nil
	end
end
