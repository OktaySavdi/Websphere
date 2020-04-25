## Websphere dump Options

[Referance](https://www.ibm.com/support/knowledgecenter/en/SSYKE2_8.0.0/com.ibm.java.aix.80.doc/diag/tools/dumpagents_removing.html)

To turn off all Heapdumps (including default agents) but leave Javadump enabled, use the following option:

Generic JVM arguments

Removes all default dump agents and any preceding dump options.
```
-Xdump:none
```
To turn off all dump agents for corruptcache events:
```
-Xdump:none:events=corruptcache
```

To turn off just system dumps for corruptcache events:
```
-Xdump:system:none:events=corruptcache
```

To turn off all dumps when java/lang/OutOfMemory error is thrown:
```
-Xdump:none:events=systhrow,filter=java/lang/OutOfMemoryError
```
To turn off just system dumps when java/lang/OutOfMemory error is thrown:
```
-Xdump:system:none:events=systhrow,filter=java/lang/OutOfMemoryError
```

## Taking Thread Dump When Hung

If you are having hung thread issue, and currently you take the dump manually, then you can automate this.

By doing basic configuration, WebSphere will generate the dump whenever a thread is hung for configured timed.

 - Login to WAS Console and go inside respective JVM
 
 - Expand “Administration” under Server Infrastructure and click Custom    Properties
 
 - Add the following three properties
```
com.ibm.websphere.threadmonitor.threshold
```

– Generate dump when a thread is hung for configured time. Value is in seconds.
```
com.ibm.websphere.threadmonitor.interval
```
– How frequently thread monitor should check for the hung threads. The value in seconds.
```
com.ibm.websphere.threadmonitor.dump.java
```
– Generate dump when detected. Value is true.

![image](https://user-images.githubusercontent.com/3519706/80277520-1de85c00-86f8-11ea-8831-e46622ef849b.png)


Above configuration will generate dump whenever a thread is hung for **600 seconds**, and WebSphere will monitor the thread every **300 seconds**.
