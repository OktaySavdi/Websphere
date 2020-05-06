## IHS Remote install

**Configuring a remote web server in a distributed environment**

1. Launch the stand-alone WebSphere Customization Toolbox.

2. Select the Web Server Plug-ins Configuration Tool and click **Launch Selected Tool**.

3. Select a plug-in runtime location. Click **Add** in the Web Server Plug-in Runtime Locations tab.

– Enter a name for the plug-in location.

– Browse to the location of where the plug-in is installed.

![image](https://user-images.githubusercontent.com/3519706/81195822-00a07100-8fc7-11ea-8529-82e23837d28d.png)

Click **Finish**.

4. Add the web server configuration information. In the Web Server Plug-in Configurations

area, click **Create**.

5. Select the web server you want to configure and click **Next**.

![image](https://user-images.githubusercontent.com/3519706/81195919-1746c800-8fc7-11ea-812e-a694e928a718.png)

6. Select the existing HTTP Server configuration file and provide the web server port. 

![image](https://user-images.githubusercontent.com/3519706/81196005-2e85b580-8fc7-11ea-9c36-45851f06fe01.png)

Click **Next**.

7. If you are configuring an IBM HTTP web server plug-in, complete the following steps:

a. Enter a port number for the administration server. Keep the default of 8008 or enter a unique port.

b. Create a user ID for the administration server authentication. the userID is _ihsadmin_ and the Password is _ihsadmin_

![image](https://user-images.githubusercontent.com/3519706/81196128-5248fb80-8fc7-11ea-88b6-3ecde79a47d5.png)

Click **Next**.

c. Provide a unique user ID and group for web server administration.  the user ID and Group is _ihs_

![image](https://user-images.githubusercontent.com/3519706/81196276-82909a00-8fc7-11ea-969d-8eca4b0de667.png)

Click **Next**.

8. Specify a unique name for the web server definition, Click **Next**.

![image](https://user-images.githubusercontent.com/3519706/81196352-99cf8780-8fc7-11ea-8d5d-f484e29f6cb8.png)

9. Select the remote scenario configuration. Provide a host name or IP address of the application server or deployment manager,

![image](https://user-images.githubusercontent.com/3519706/81196441-b8358300-8fc7-11ea-877c-24073e5b69cd.png)

Click **Next**.

10.On the Summary window, review the settings and click **Configure**. 

11.When the configuration is complete, clear the **Launch the plug-in configuration**  **roadmap** check box and click **Finish**. Also note the manual configuration step that must be performed 

![image](https://user-images.githubusercontent.com/3519706/81196540-d9966f00-8fc7-11ea-85d8-859e43f613bb.png)

12.You can see the configuration file in the WebSphere Customization Toolbox. Exit the WebSphere Customization Toolbox. When the WebSphere Customization Toolbox GUI is used for the plug-in configuration, the selections made are saved and are available in a 
response file.

![image](https://user-images.githubusercontent.com/3519706/81196625-f632a700-8fc7-11ea-9250-9d58f55d195e.png)

13.The Web Server Plug-ins Configuration Tool creates the **configure_web_server_name_** script in the _plugins_root_/bin/ directory on the machine with the web server. Examine the 
script and make any needed changes. You may need to compensate for file encoding differences to prevent script failure.

The Web Server Plug-ins Configuration Tool also creates the plugin-cfg.xml file in the _plugins_root_/config/_web_server_name_ directory.

14.Copy the **configure_web_server_name_** script in the **_plugins_root_**/bin/ directory to _profile_root_/Dmgr/bin.

15.Run the **configure_web_server_name_** script. If administrative security is enabled, provide the **-username** and **-password** arguments or wait until prompted for the credentials.

The following command is run on the DMR machine.
```ruby
/opt/IBM/WebSphere/AppServer/bin/configurewebserver1.sh -profileName "Dmgr01" -user "admin" -password "xxxxxx" -ihsAdminPassword "xxxxxx" 
```
It is necessary to see the successful finished screen

![image](https://user-images.githubusercontent.com/3519706/81197298-c59f3d00-8fc8-11ea-8056-530df9653c48.png)

Dmgr on the server
```ruby
cp -rf /opt/IBM/WebSphere/AppServer/profiles/Dmgr01/config/cells/was01Cell01/nodes/was01.mydomain.local-node/servers/webserver1 /opt/IBM/WebSphere/Plugins/config
```
The following command is run on the server where Webserver is installed.
```ruby
/opt/IBM/HTTPServer/bin/apachectl -k start
```

The result should be as follows.
![image](https://user-images.githubusercontent.com/3519706/81197952-950bd300-8fc9-11ea-9be9-bdcca6d462a1.png)
