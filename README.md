#Wordpress微信公众#

wordpress上没有一个好的微信工具，于是这里就用上了 [王超的博客][1] 写的 [微信公众平台后台框架][0]


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

[1]:http://chaowang.me

##Wordpress+Sinatra##

主要依赖于下面的两个扩展

-  Wordpress-API
-  weChat-backend

Inspire by [微信公众平台后台框架][0]
================
[0]:https://github.com/charleyw/weChat-backend

