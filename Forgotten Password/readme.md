## Websphere canceling a forgotten password

```ruby
/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/config/cells/was01Cell01
```
in file `security.xml`

Go to **`enabled = true`**

![image](https://user-images.githubusercontent.com/3519706/81193466-17919400-8fc4-11ea-8187-dbe91974a626.png)

and restart `DMGR`

Method 2
```bash
cd /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/
```
```ruby
wsadmin -conntype NONE
```
```ruby
wsadmin> securityoff
```
```ruby
wsadmin> exit
```
```ruby
Restart the servers.
```
Enable the security from administrative console.

Once the needed corrections are made, you can re-enable security in the admin console and then restart WebSphere.