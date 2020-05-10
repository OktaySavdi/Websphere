## Websphere Service Create



**################ Linux ################**

cd <.>/AppServer/bin

**CELL MANAGER**
```ruby
./wasservice.sh -add was01CellManager01 -serverName dmgr -profilePath "/opt/IBM/WebSphere/AppServer/profiles/Dmgr01" -wasHome "/opt/IBM/WebSphere/AppServer" -logRoot "/opt/IBM/WebSphere/AppServer/profiles/Dmgr01/logs/dmgr" -logFile "/opt/IBM/WebSphere/AppServer/profiles/Dmgr01/logs/dmgr/startdmgr.log" -restart true -startType automatic
```
or
```ruby
./wasservice.sh -add was01CellManager01 -serverName dmgr -profilePath "/opt/IBM/WebSphere/AppServer/profiles/Dmgr01" -wasHome "/opt/IBM/WebSphere/AppServer" -logRoot "/opt/IBM/WebSphere/AppServer/profiles/Dmgr01/logs/dmgr" -logFile "/opt/IBM/WebSphere/AppServer/profiles/Dmgr01/logs/dmgr/startdmgr.log" -restart true -encodeParams -stopArgs "-username admin -password ********" -startType automatic
```
**NODE**
```ruby
./wasservice.sh -add nodeagent -serverName nodeagent -profilePath "/opt/IBM/WebSphere/AppServer/profiles/AppSrv01" -wasHome "/opt/IBM/WebSphere/AppServer" -logRoot "/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/logs/nodeagent" -logFile "/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/logs/nodeagent/startnodeagent.log" -restart true -startType automatic
```
**Custom NODE**
```ruby
./wasservice.sh -add nodeagent -serverName nodeagent -profilePath "/opt/IBM/WebSphere/AppServer/profiles/Custom01" -wasHome "/opt/IBM/WebSphere/AppServer" -logRoot "/opt/IBM/WebSphere/AppServer/profiles/Custom01/logs/nodeagent" -logFile "/opt/IBM/WebSphere/AppServer/profiles/Custom01/logs/nodeagent/startnodeagent.log" -restart true -startType automatic
```
**APP SERVER AGENT**
```
./wasservice.sh -add member1 -serverName member1 -profilePath "/opt/IBM/WebSphere/AppServer/profiles/AppSrv01" -wasHome "/opt/IBM/WebSphere/AppServer" -logRoot "/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/logs/member1" -logFile "/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/logs/member1/startmember1.log" -restart true -startType automatic
```
**CONTROL**
```ruby
./wasservice.sh -status nodeagent
```
```ruby
./wasservice.sh -stop was01CellManager01 -user admin -password admin
```
**################ Windows ################**

cd <.>\AppServer\bin>

**CELL MANAGER**
```ruby
WASService.exe -add was01CellManager01 -serverName dmgr -profilePath "D:\\IBM\\WebSphere\\AppServer\\profiles\\Dmgr01" -wasHome "D:\\IBM\\WebSphere\\AppServer" -logRoot "D:\\IBM\\WebSphere\\AppServer\\profiles\\Dmgr01\\logs\\dmgr" -logFile "D:\\IBM\\WebSphere\\AppServer\\profiles\\Dmgr01\\logs\\dmgr\\startdmgr.log" -restart true -startType automatic
```
or
```ruby
wasservice.exe -add "was01CellManager01" -serverName "dmgr" –profilePath "D:\IBM\WebSphere\AppServer\profiles\Dmgr01" -encodeParams -stopArgs "-username admin -password ********" -startType automatic -restart false
```
**APP NODE AGENT**
```ruby
WASService.exe -add Appsrv01_nodeagent -serverName nodeagent -profilePath "D:\\IBM\\WebSphere\\AppServer\\profiles\\AppSrv01" -wasHome "D:\\IBM\\WebSphere\\AppServer" -logRoot "D:\\IBM\\WebSphere\\AppServer\\profiles\\AppSrv01\\logs\\nodeagent" -logFile "D:\\IBM\\WebSphere\\AppServer\\profiles\\AppSrv01\\logs\\nodeagent\\startnodeagent.log" -restart true -startType automatic
```
**APP SERVER AGENT**
```ruby
WASService.exe -add server1 -serverName server1 -profilePath "D:\\IBM\\WebSphere\\AppServer\\profiles\\AppSrv01" -wasHome "D:\\IBM\\WebSphere\\AppServer" -logRoot "D:\\IBM\\WebSphere\\AppServer\\profiles\\AppSrv01\\logs\\server1" -logFile "D:\\IBM\\WebSphere\\AppServer\\profiles\\AppSrv01\\logs\\server1\\startserver1.log" -restart true -startType automatic
```
**CUSTOM NODE AGENT**
```ruby
WASService.exe -add Custom01_nodeagent -serverName nodeagent -profilePath "D:\\IBM\WebSphere\\AppServer\\profiles\Custom01" -wasHome "D:\\IBM\\WebSphere\\AppServer" -logRoot "D:\\IBM\WebSphere\\AppServer\\profiles\\Custom01\\logs\nodeagent" -logFile "D:\\IBM\\WebSphere\\AppServer\\profiles\\Custom01\\logs\\nodeagent\\startServer.log" -restart true -startType automatic
```
**CUSTOM SERVER AGENT**
```ruby
WASService.exe -add server1 -serverName server1 -profilePath "D:\\IBM\WebSphere\\AppServer\\profiles\\Custom01" -wasHome "D:\\IBM\\WebSphere\\AppServer" -logRoot "D:\\IBM\WebSphere\\AppServer\\profiles\\Custom01\\logs\\server1" -logFile "D:\\IBM\\WebSphere\\AppServer\\profiles\\Custom01\\logs\\server1\\startserver1.log" -restart true -startType automatic
```
**HTTP SERVER**
```ruby
cd D:\IBM\HTTPServer\bin
httpd.exe -k install -n IBMHTTPServerV8.5 -f D:\\IBM\\HTTPServer\\conf\\httpd.conf D:\\IBM\\WebSphere\\Plugins\\bin\\32bits\\mod_was_ap22_http.dll
```
