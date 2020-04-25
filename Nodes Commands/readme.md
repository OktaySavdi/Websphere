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
renameNode.sh oldNodeName 8879(soap) newNodeName
```

**Synch Node**

```
syncNode <DMG host> 8879(soap)
```

**Rename DmgrNode**
```
DMGR/bin/wsadmin.sh -lang jython
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
syncNode.sh (DMG) 8879 
```
