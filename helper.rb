require 'rubygems'
require 'json'
require 'net/http'
require 'nokogiri'

class BlogHelper
  def getdata(query)
    result = []
    response = Net::HTTP.get_response("www.xuntayizhan.com","/?wpapi=search&dev=1&keyword="+query)
    posts = (JSON.parse response.body)['posts']
    posts.each do |post,index|
      post_id = post['id']
      image_response = Net::HTTP.get_response("www.xuntayizhan.com","/?wpapi=get_posts&dev=1&comment=1&content=1&id="+post_id)
      image_response_content = (JSON.parse image_response.body)['posts'][0]['content']
      if Nokogiri::HTML(image_response_content).at_css('img')
        p "fd"
      end
      if result.size < 8
        result << {
          :title => post['title'],
          :description => /&hellip;/.match(post['excerpt']).pre_match,
          :picture_url => "",
          :url => post['url']
        }
      end
    end
    p result
  end
end

blog = BlogHelper.new
blog.getdata("n")
