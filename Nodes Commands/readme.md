Webpshere Nodes Commands

**Remove Node**
```
removeNode [-force] [-quiet] [-nowait] [-statusport <port>] [-logfile<filename>] [-replacelog] [-trace] [-username <username>] [-password <password>] [-profileName <profile>][-help]
```

**Rename Nodes**
```
renameNode dmgr_host dmgr_port node_name [-nodeshortname <name>] [-conntype <type>] [-logfile <filename>] [-trace]
[-username <username>] [-password <password>] [-help]
```
```
renameNode.bat oldNodeName 8879(soap) newNodeName
```

**Synch Node**

```
syncNode <DMG host> 8879(soap)
```

**Rename DmgrNode**
```
DMGR/bin/wsadmin.bat -lang jython
AdminTask.renameNode('[interactive]')
old node (nodeName)    : oldNodeName
new node (newnodeName) : newNodeName
short name             : < enter >

F (finis)
AdminConfig.save()
```
```
profiles\Dmgr01\bin\setupCmdLine.sh 
SET WAS_NODE=PWSCLSAP01CellManager01     #replaced with new NodeName  
```
```
syncNode.bat (DMG) 8879 
```## Websphere JDK Upgrade

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
