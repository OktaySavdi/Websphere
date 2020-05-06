## IHS Best Practise


[Reference](https://www-01.ibm.com/support/docview.wss?uid=swg21318463)
```ruby
LoadModule cache_module modules/mod_cache.so and CacheRoot /opt/cacheroot --httpd.conf --> opens cache

FailoverToNext=true    --plugin-cfg.xml ->If the node is down, it redirects to the running node

ChunkedResponse=true   --plugin-cfg.xml-->allows the package to be broken down and separated

FIPSEnable="true"      --plugin-cfg.xml -->prevents ddos and sql injections

ConnectTimeout         --plugin-cfg.xm  -->5  was binding time

ServerIOTimeout        --plugin-cfg.xm  -->15 or -900 application timeout time depending on the situation

ServerIOTimeoutRetry   --plugin-cfg.xm  -->-1 makes. It also prevents requests from going.

RetryInterval          --plugin-cfg.xm  -->60 minutes will not send requests
```
