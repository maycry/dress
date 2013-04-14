base_url = "http://#{request.host_with_port}"
xml.instruct! :xml, :version=> '1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url {
    xml.loc("http://#{request.host_with_port}/")
    xml.priority(1)
    xml.changefreq("daily")
  }
  @types.each do |type|
    xml.url {
      xml.loc("http://#{request.host_with_port}#{type_path(type)}")
      xml.priority(0.9)
      xml.changefreq("daily")
    }
  end
  @styles.each do |style|
    xml.url {
      xml.loc("http://#{request.host_with_port}#{type_style_path(@type, style)}")
      xml.priority(0.8)
      xml.changefreq("daily")
    }
  end
  @designers.each do |designer|
    xml.url {
      xml.loc("http://#{request.host_with_port}#{type_designer_path(@type, designer)}")
      xml.priority(0.8)
      xml.changefreq("daily")
    }
  end
  xml.url {
    xml.loc("http://#{request.host_with_port}/quality")
    xml.priority(0.7)
    xml.changefreq("daily")
  }
  xml.url {
    xml.loc("http://#{request.host_with_port}/shipping")
    xml.priority(0.7)
    xml.changefreq("daily")
  }
  xml.url {
    xml.loc("http://#{request.host_with_port}/faq")
    xml.priority(0.7)
    xml.changefreq("daily")
  }
  xml.url {
    xml.loc("http://#{request.host_with_port}/contacts")
    xml.priority(0.7)
    xml.changefreq("daily")
  }
  xml.url {
    xml.loc("http://#{request.host_with_port}/about")
    xml.priority(0.7)
    xml.changefreq("daily")
  }
end