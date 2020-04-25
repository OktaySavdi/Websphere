## Websphere Password Change

```
/opt/IBM/WebSphere/AppServer/bin/wsadmin.sh -conntype NONE -lang jython
```
```
AdminTask.changeFileRegistryAccountPassword('[-userId admin -password admin]')
AdminConfig.save()
```