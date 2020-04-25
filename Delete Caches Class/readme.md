## Websphere Delete Caches

[Referance](https://www-01.ibm.com/support/docview.wss?uid=swg21607887)


## Linux

**Stop the JVM server and nodeagent**
```
/opt/IBM/Websphere/AppServer/bin/clearClassCache.sh
/opt/IBM/Websphere/AppServer/bin/bin/osgiCfgInit.sh
/opt/IBM/Websphere/AppServer/bin/bin/clearClassCache.sh
/opt/IBM/Websphere/AppServer/bin/bin/osgiCfgInit.sh
```

**Clear Files**
```
/opt/IBM/Websphere/AppServer/profiles/AppSrv01/temp
/opt/IBM/Websphere/AppServer/profiles/AppSrv01/workspace
/opt/IBM/Websphere/AppServer/profiles/AppSrv01/wstemp
```
## Windows

**Stop the JVM server and nodeagent**
```
D:\IBM\WebSphere\AppServer\bin>clearClassCache.bat
D:\IBM\WebSphere\AppServer\bin>osgiCfgInit.bat
D:\IBM\WebSphere\AppServer\profiles\AppSrv02\bin>clearClassCache.bat
D:\IBM\WebSphere\AppServer\profiles\AppSrv02\bin>osgiCfgInit.bat
```
**Clear Files**
```
C:\IBM\WebSphere\AppServer\profiles\AppSrv01\temp
C:\IBM\WebSphere\AppServer\profiles\AppSrv01\workspace
C:\IBM\WebSphere\AppServer\profiles\AppSrv01\wstemp
C:\Users\[WSAS_User]\AppData\Local\javasharedresources\
C:\Windows\System32\config\systemprofile\AppData\Local\javasharedresources
C:\Windows\SysWOW64\config\systemprofile\AppData\Local\javasharedresources
```
