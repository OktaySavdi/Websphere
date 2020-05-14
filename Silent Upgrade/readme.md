# Websphere Silent Upgrade

1- Download a file that contains the fix pack from Fix Central, and use local updating.

2- Transfer the compressed fix file in binary format to the IBM i systems on which it will be installed.

3- Extract the compressed repository file to a directory on your system.

4- Stop all servers and applications on the WebSphere Application Server installation that is being updated.

5- Change to this directory:
```ruby
cd /opt/IBM/InstallationManager/eclipse/tools/
```
6- Install the fix pack using this command:
```ruby
./imcl -updateAll -repositories [path to WAS repository] -installDirectory [WAS installLocation] -acceptLicense -sP
```
Example:
```ruby
./imcl -updateAll -repositories /opt/was-fix,/opt/http-fix -installationDirectory /opt/IBM/WebSphere/AppServer -acceptLicense -sP
```
Verify installation by running command
```
./imcl listInstalledPackages -features -long
```
or
```ruby
/opt/IBM/WebSphere/AppServer/bin/versionInfo.sh
```