require 'rss'
require 'open-uri'
require 'nokogiri'

class Get_RSS
  def get_new
    result = []
    url = 'rss.xml'
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.each do |item|
        image_req = 'http://www.xuntayizhan.com/xt.jpg'
        if Nokogiri::HTML(item.description).at_css('img')
          image_req = Nokogiri::HTML(item.description).css('img').first['src']
        end
        result << {
        :title => item.title,
        :description => Nokogiri::HTML(item.description).at_css('p'),
        :picture_url => image_req,
        :url => item.link
        }
      end
    end
    return result.take(7)
  end
end
