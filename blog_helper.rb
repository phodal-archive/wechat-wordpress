require 'rubygems'
require 'json'
require 'net/http'

class BlogHelper

  def initialize()

  end

  def getdata(query)
    result = []
    response = Net::HTTP.get_response("localhost","/?wpapi=search&dev=1&keyword="+query)
    posts = (JSON.parse response.body)['posts']
    posts.each do |post|
      result << {
        :title => post['title'],
        :description => post['excerpt'],
        :picture_url => post['author'][0]['gravatar'],
        :url => post['url']
      }
    end
    result
  end
end

blog = BlogHelper.new
blog.getdata('title')