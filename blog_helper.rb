require 'rubygems'
require 'json'
require 'net/http'

class BlogHelper
  def getdata(query)
    result = []
    response = Net::HTTP.get_response("localhost","/?wpapi=search&dev=1&keyword="+query)
    posts = (JSON.parse response.body)['posts']
    posts.each do |post|
      result << {
        :title => post['title'],
        :description => /&hellip;/.match(post['excerpt']).pre_match,
        :picture_url => post['author'][0]['gravatar'],
        :url => post['url']
      }
    end
    result
  end
end