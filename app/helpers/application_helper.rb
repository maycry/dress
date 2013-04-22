module ApplicationHelper

	def nav_link(link_text, link_path)
		inc = is_active_link? link_path, :inclusive
		exc = is_active_link? link_path, :exclusive
		class_name = ''

		if inc && exc
			class_name = 'active'
		elsif inc
			class_name = 'current'
		else
			class_name 
		end

		content_tag(:div, class: class_name) do
  	  link_to link_text, link_path
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

	def title(page_title)
	  content_for :title, page_title.to_s
	end
	def description(page_description)
	  content_for :meta_description, page_description.to_s
	end

end
