module ApplicationHelper

	def nav_link(link_text, link_path, c = "")
	  if current_page?(link_path)
	  	content_tag(:div, :class => 'current') do
	  	  link_to link_text, link_path, :class => "#{c}"
	  	end
	  else
	  	content_tag(:div) do
	  	  link_to link_text, link_path, :class => "#{c}"
	  	end
	  end
	end

	def logo_link
		active = current_page?(root_path) ? " active" : ""
		content_tag :div, class: "logo col-1-4#{active}" do
			link_to root_path do 
		  	content_tag :h1, "Makemydress", :class => 'hide-text'
		  end
		end
	end

end
