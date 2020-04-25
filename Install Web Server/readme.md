## Install Web Server

t’s time to install the downloaded plugin through  [Installation Manager](https://geekflare.com/ibm-im-installation-guide/).

-   Launch IBM IM, usually it will be under  **/opt/IBM/InstallationManager/eclipse/IBMIM**

-   Click on File >> Preferences

-   Click on Add Repository

-   Click on Browser and select the  **repository.config**  file, which you got after extraction

-   Click ok and OK again

![image](https://user-images.githubusercontent.com/3519706/80290065-a8a67680-874b-11ea-8b2b-6dadad1a963e.png)

Click on Install on IM Wizard

![image](https://user-images.githubusercontent.com/3519706/80290075-b6f49280-874b-11ea-9e1c-5f48f9994774.png)

Select the version and click Next

![image](https://user-images.githubusercontent.com/3519706/80290084-c542ae80-874b-11ea-9b5d-9cef3cd1c3e7.png)

-   Accept the license and Next

-   Select the directory where you wish to install the plugin. By default, it will install under  **/opt/IBM/WebSphere/Plugins**. If you are ok with it, click Next

![image](https://user-images.githubusercontent.com/3519706/80290097-d7245180-874b-11ea-8e06-8e649a96a09a.png)

-   Select the 64-bit runtime environment for Java and Next

-   Review the summary and click on Install to begin the installation

![image](https://user-images.githubusercontent.com/3519706/80290106-e73c3100-874b-11ea-923f-8967e33274f7.png)

It may take some time and once done, you will get confirmation – The packages are installed. Click on **Finish**.

![image](https://user-images.githubusercontent.com/3519706/80290112-f327f300-874b-11ea-8b42-d707954edb26.png)

This concludes plug-in is installed  **successfully**  and time to configure them.

## Add Web Server in WebSphere Console

-   Login into WebSphere Administrative Console

-   Click on Servers>>Server Types>>Web servers

![image](https://user-images.githubusercontent.com/3519706/80290119-02a73c00-874c-11ea-8e37-992811cfefd0.png)

Click on New

![image](https://user-images.githubusercontent.com/3519706/80290125-0dfa6780-874c-11ea-8e7a-a18af48ca002.png)

-   Select node – leave it to default if IHS is running on the same server as WebSphere else select the node of web server

-   Enter the Server name

-   Select Type as “**IBM HTTP Server**” and click next

-   Leave the default web server template, click next

![image](https://user-images.githubusercontent.com/3519706/80290135-1fdc0a80-874c-11ea-822e-3b2e75bb9ca1.png)

-   Port – if HTTP Server is running on different port than 80 then change here

-   Web server installation location – verify IHS is installed here else change the location

-   Plug-in installation location – verify if plugin is installed here else change it

-   Click next

![image](https://user-images.githubusercontent.com/3519706/80290163-57e34d80-874c-11ea-984c-ba51b10df217.png)

Review the web server definition and click Finish

You will get a confirmation about new server created **successfully** and option to review the changes. Click on review

![image](https://user-images.githubusercontent.com/3519706/80290179-6fbad180-874c-11ea-8d7e-25081f1200a7.png)

It will display the newly added web server in the list

![image](https://user-images.githubusercontent.com/3519706/80290191-7fd2b100-874c-11ea-8b79-74f701fea65f.png)

It’s time to  **generate**  &  **propagate**  the plug-in now. Select the newly added web server and click on first

**Generate Plug-in**

And then click on

**Propagate Plug-in**

![image](https://user-images.githubusercontent.com/3519706/80290201-8fea9080-874c-11ea-8f01-d67b1c6957b9.png)

This is the plugin you need to use in HTTP Server. Let’s configure this in httpd.conf of IHS.

## Add Plug-in in IHS (httpd.conf)

There are two things you need to do in httpd.conf file to make IHS talk to WebSphere using a plugin.

1.  Add mod_was_ap22_http.so

2.  Add plugin-cfg.xml path

-   Go to the conf path of IHS. By default it will be under /opt/IBM/HTTPServer/conf

-   Take a backup of httpd.conf file

-   Add following two lines
```
LoadModule was_ap22_module "/opt/IBM/WebSphere/Plugins/bin/64bits/mod_was_ap22_http.so"
WebSpherePluginConfig "/opt/IBM/HTTPServer/Plugins/config/webserver1/plugin-cfg.xml"
```
**Tip:**  if you are not sure the file location of mod_was_ap22_http.so then you can use  [find](https://geekflare.com/useful-linux-find-commands-for-system-administrator/)  command.

-   Restart HTTP server

This concludes you have successfully integrated IBM HTTP Server with IBM WebSphere Application Server.

**Note:**  In order to have context root accessible through a web server, you must select Web Server as the target during deployment.

Whenever you add new application or changes in context root, you must generate and propagate plug-in.

[Reference](https://geekflare.com/integrate-http-server-with-websphere-8-5/)