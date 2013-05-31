base_url = "http://#{request.host_with_port}"
xml.instruct! :xml, :version=> '1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url {
    xml.loc("http://#{request.host_with_port}/")
    xml.priority(1)
    xml.changefreq("monthly")
  }
  @types.each do |type|
    xml.url {
      xml.loc("http://#{request.host_with_port}#{type_path(type)}")
      xml.priority(0.9)
      xml.changefreq("monthly")
    }
  end
  @styles.each do |style|
    xml.url {
      xml.loc("http://#{request.host_with_port}#{type_style_path(@types.first, style)}")
      xml.priority(0.8)
      xml.changefreq("monthly")
    }
  end
  @designers.each do |designer|
    xml.url {
      xml.loc("http://#{request.host_with_port}#{type_designer_path(@types.first, designer)}")
      xml.priority(0.8)
      xml.changefreq("monthly")
    }
  end
  xml.url {
    xml.loc("http://#{request.host_with_port}/quality")
    xml.priority(0.7)
    xml.changefreq("monthly")
  }
  xml.url {
    xml.loc("http://#{request.host_with_port}/shipping")
    xml.priority(0.7)
    xml.changefreq("monthly")
  }
  xml.url {
    xml.loc("http://#{request.host_with_port}/faq")
    xml.priority(0.7)
    xml.changefreq("monthly")
  }
  xml.url {
    xml.loc("http://#{request.host_with_port}/contacts")
    xml.priority(0.7)
    xml.changefreq("monthly")
  }
  xml.url {
    xml.loc("http://#{request.host_with_port}/about")
    xml.priority(0.7)
    xml.changefreq("monthly")
  }
  @products.each do |product|
    xml.url {
      xml.loc("http://#{request.host_with_port}#{product_path(product)}")
      xml.priority(0.6)
      xml.changefreq("monthly")
    }
  end
end