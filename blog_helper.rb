require 'rubygems'
require 'json'
require 'net/http'
require 'nokogiri'

class BlogHelper
  def getdata(query)
    result = []
    response = Net::HTTP.get_response("localhost","/?wpapi=search&dev=1&keyword="+query)
    posts = (JSON.parse response.body)['posts']
    posts.each do |post|
      post_id = posts['id']
      image_response = Net::HTTP.get_response("localhost","/?wpapi=get_posts&dev=1&comment=1&content=1&id="+post_id)
      image_req = Nokogiri::HTML((JSON.parse image_response.body)['posts']['content'].css('img').first['src']
      result << {
        :title => post['title'],
        :description => /&hellip;/.match(post['excerpt']).pre_match,
        :picture_url => image_req,
        :url => post['url']
      }
    end
    result
  end
end