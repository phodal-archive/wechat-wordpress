#Wordpress微信公众#

wordpress上没有一个好的微信工具，于是这里就用上了 [王超的博客][1] 写的 [微信公众平台后台框架][0]

这里是基于ruby上的sinatra框架，而wordpress方面则是依赖于wp api生成的json

##Wordpress api##
这就是一个简单的示例

    http://localhost/?wpapi=search&dev=1&keyword=title

会返回这样一个结果

    {"status":"ok","count":2,"count_total":2,"pages":1,"currPage":1,"posts":[{"id":"4","type":"post","slug":"other-title","url":"http:\/\/xunta.phodal.net\/?p=4","status":"publish","title":"other title","title_plain":"other title","date":"2014-03-26 20:38:58","modified":"2014-03-26 20:38:58","excerpt":"this \u00a0a test","parent":"0","category":[{"term_id":1,"name":"Uncategorized","slug":"uncategorized","term_group":0,"term_taxonomy_id":1,"taxonomy":"category","description":"","parent":0,"count":2,"object_id":4,"filter":"raw","cat_ID":1,"category_count":2,"category_description":"","cat_name":"Uncategorized","category_nicename":"uncategorized","category_parent":0}],"tag":[],"author":[{"id":"1","slug":"root","name":"root","first_name":"","last_name":"","nickname":"root","url":"","description":"","gravatar":"http:\/\/www.gravatar.com\/avatar\/56d54d4b6b4dc4e3efa458f745d61513?s=100&d=mm&r=g"}],"comment_count":"0","comment_status":"open"}]}

而我们在ruby上所要做的就是解析这个json数据，然后返回到

##Wordpress 微信##

最后的效果

##How to Start##

1. 需要在Wordpress上安装WP API插件
2. 需要有一个能跑ruby的机器(通过说的是类unix)，同时可以解析到你的机器
3. 还需要一个微信公众开发者账号

如果已经都有了

    bundle install
    rake prod:start

还有如果是代理的话，可能你的nginx.conf配置就是下面

    server {
       listen 80;
       server_name weixin.phodal.net;
       location / {
       	    proxy_pass http://127.0.0.1:3080;
	    }
     }    

[1]:王超的博客

##Wordpress+Sinatra##

主要依赖于下面的两个扩展

-  Wordpress-API
-  weChat-backend

Inspire by [微信公众平台后台框架][0]
================
[0]:https://github.com/charleyw/weChat-backend
