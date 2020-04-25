## Websphere Dump Directory Change

Administrative Console >**WebSphere Application Server**> (**JVM Name**) > **Process Definiton** > **Java Virtual Machine** > **Generic JVM Argument**

**Linux** 
```
-Xdump:java:file=/tmp/javacore.%Y%m%d.%H%M%S.%pid.%seq.txt 
-Xdump:heap:file=/tmp/heapdump.%Y%m%d.%H%M%S.%pid.%seq.phd 
-Xdump:system:file=/tmp/core.%Y%m%d.%H%M%S.%pid.%seq.dmp 
-Xdump:snap:file=/tmp/Snap.%Y%m%d.%H%M%S.%pid.%seq.trc
```
**Windows**
```
-Xdump:heap:label=d:\\Dumps\\heapdump.%Y%m%d.%H%M%S.%pid.%seq.phd 
-Xdump:java:label=d:\\Dumps\\javacore.%Y%m%d.%H%M%S.%pid.%seq.txt 
-Xdump:system:label=d:\\Dumps\\core.%Y%m%d.%H%M%S.%pid.%seq.dmp 
-Xdump:snap:label=d:\\Dumps\\Snap.%Y%m%d.%H%M%S.%pid.%seq.trc
```
or

```
-Xdump:java:file=d:\\Dumps\\javacore.%Y%m%d.%H%M%S.%pid.%seq.txt 
-Xdump:heap:file=d:\\Dumps\\heapdump.%Y%m%d.%H%M%S.%pid.%seq.phd 
-Xdump:system:file=d:\\Dumps\\core.%Y%m%d.%H%M%S.%pid.%seq.dmp 
-Xdump:snap:file=d:\\Dumps\\Snap.%Y%m%d.%H%M%S.%pid.%seq.trc
```
Restart  `JVM`

**!important**

If the work done fails and the console does not open, the command is removed from the following address.
```
/opt/IBM/WebSphere/AppServer/profiles/Dmgr01/config/cells/was01Cell01/nodes/was01Node01/servers/member/server.xml
```

![image](https://user-images.githubusercontent.com/3519706/80279578-52afdf80-8707-11ea-9f8a-bba04cd09279.png)