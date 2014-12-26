require 'sinatra'
require 'wei-backend'
require 'rubygems'
require './blog_helper'

token "xuntaphodal"

on_text do
    blog = BlogHelper.new
    blog.getdata(params[:Content])
end

on_subscribe do
    [{
    :title => "来了就好，坐下喝口茶吧",
    :description => "你可以通过\"查看历史消息\"，发现历史精彩。或者回复任意关键字(如\"读书\",\"中文\")，获取相关文章。",
    :picture_url => "http://www.xuntayizhan.com/tea.jpg",
    :url => "http://www.xuntayizhan.com/"
    }]
end

on_unsubscribe do
    "欢迎您再次订阅"
end
