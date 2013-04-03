module ApplicationHelper
	def nav_link(link_text, link_path)
	  if current_page?(link_path)
	  	content_tag(:div, :class => 'current') do
	  	  link_to link_text, link_path
	  	end
	  else
	  	content_tag(:div) do
	  	  link_to link_text, link_path
	  	end
	  end
	end
end
