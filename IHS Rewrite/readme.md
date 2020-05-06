## IBM Http Server Rewrite

```
/opt/IBM/HTTPServer/conf/httpd.conf
```
```
LoadModule rewrite_module modules/mod_rewrite.so 
```
We paste the following code into the blank area
```ruby
RewriteEngine On
 # handy for seeing what's going on when the web server tries to redirect
 RewriteLog "/opt/logs/rwlog.txt"
 RewriteLogLevel 1
 # if the port's not 443 (ssl)...
 RewriteCond %{SERVER_PORT} !^443$
 #...redirect it to the same page but make it SSL
 RewriteRule ^(.*) https://%{SERVER_NAME}:9443%{REQUEST_URI} [L,R]
```
Restart IHS Service
```ruby
systemctl restart IBMHTTPServerV8.5 
```
