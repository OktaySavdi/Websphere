## Websphere JDK Upgrade

The following commands are run.

**List Available SDK**
```
/opt/IBM/WebSphere/AppServer/bin/managesdk -listAvailable -verbose
```
**List Available Profile**
```
/opt/IBM/WebSphere/AppServer/bin/managesdk -listEnabledProfileAll -verbose
```
The following codes should be entered for each Profile

**DMGR** 
```
/opt/IBM/WebSphere/AppServer/bin/managesdk -enableProfile -ProfileName Dmgr01 -sdkname 1.7.1_64
```
**AppSrv01**
```
/opt/IBM/WebSphere/AppServer/bin/managesdk -enableProfile -ProfileName AppSrv01 -sdkname 1.7.1_64
```
Then the server, node, manager are stop-start.
