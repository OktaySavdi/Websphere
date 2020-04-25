## Webshere Recover an Existing Managed Node

It should be seen that the node is corrupt.

![image](https://user-images.githubusercontent.com/3519706/80280011-e5ea1480-8709-11ea-8b46-787e72444cfc.png)

All `jvms` on the node are closed and `deleted manually` from the application `profile`

![image](https://user-images.githubusercontent.com/3519706/80280031-07e39700-870a-11ea-9c15-cb177735256c.png)

Check "`profileRegistry.xml`" to make sure that your profile is deleted from `/opt/IBM/WebSphere/AppServer/properties` If there is a profile, it is `deleted manually`.

![image](https://user-images.githubusercontent.com/3519706/80280054-35c8db80-870a-11ea-940b-e889ccb34ed0.png)

```
/opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh -create -profileName "AppSrv02(The name is written to the deleted profile)" -profilePath "/opt/IBM/WebSphere/AppServer/profiles/AppSrv02" -templatePath "/opt/IBM/WebSphere/AppServer/profileTemplates/default" -nodename "was01Node01(Corrupted Node name is written)" -hostname "was01(the name of the machine is written)"
```

Check that the transaction is successful

![image](https://user-images.githubusercontent.com/3519706/80280099-98ba7280-870a-11ea-9c25-58fd49a91eb4.png)

Go to the newly created profile and do the following.
```
/opt/IBM/WebSphere/AppServer/profiles/AppSrv02/bin/addNode.sh was01 8879 -asExistingNode
```

It should be seen that the transaction is successful.

![image](https://user-images.githubusercontent.com/3519706/80280176-25fdc700-870b-11ea-97be-e4d15fe8f9e5.png)

When viewed from the console, it is seen that the node and the server come.

![image](https://user-images.githubusercontent.com/3519706/80280209-61989100-870b-11ea-91f4-0d3c8228501a.png)

Then, the damaged node is deleted and the newly created server is included in the cluster structure.