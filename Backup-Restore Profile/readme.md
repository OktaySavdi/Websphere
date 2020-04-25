## Websphere Backup-Restore Profile

Stop JVM and Nodes

**Backup**
```
/opt/IBM/WebSphere/AppServer/bin/manageprofiles.bat -backupProfile -profileName AppSrv01 -backupFile /op/Backup/BackupFile.zip
```

**Restore**
it is checked if it is in register
```
more profileRegistry.xml
```
We remove the deleted profile via the register
```
manageprofiles.bat –validateAndUpdateRegistry
```
After this process, make sure that the profile is deleted in `profileRegistry.xml`

Restore Profile
```
/opt/IBM/WebSphere/AppServer/bin/manageprofiles.bat -restoreProfile -backupFile /op/Backup/BackupFile.zip
```
