# Install WebSphere 9 ND in Linux

```markup
/opt/instmgr/InstallerImage_linux.gtk.x86_64/install
```
it will prompt an installation wizard, click Next

![image](https://user-images.githubusercontent.com/3519706/80289425-02587200-8747-11ea-8f1e-737efbc0c37a.png)

-   Accept the license and click Next

-   By default, it will install on /opt/IBM however, if you wish to change then you may do on next screen

![image](https://user-images.githubusercontent.com/3519706/80289436-18fec900-8747-11ea-9316-8b59ec678572.png)

-   Review the summary information and click Install

-   It will take few seconds and give you the confirmation on successfully installed

![image](https://user-images.githubusercontent.com/3519706/80289451-2c119900-8747-11ea-9f71-f1456d3fea89.png)

## Installing IBM WAS 9

We will install WebSphere using IBM IM through an online repository. If not already, open IBM IM

-   Go to File >> Preferences

![image](https://user-images.githubusercontent.com/3519706/80289468-3cc20f00-8747-11ea-832e-5234037dac08.png)

Click “Add Repository”, it will open a prompt where you can enter the repository path and click Ok

![image](https://user-images.githubusercontent.com/3519706/80289481-4ba8c180-8747-11ea-9ee5-ec5a4dea8867.png)

-   Click “Install”

-   Select the WAS ND 9 & Java 8 from the list and click Next

![image](https://user-images.githubusercontent.com/3519706/80289491-5fecbe80-8747-11ea-9394-c73f06f64a70.png)

-   Accept the license and click Next

-   By default, shared resources will be installed on  
**/opt/IBM/IMShared**  and if you need, you can change on next screen

![image](https://user-images.githubusercontent.com/3519706/80289507-785cd900-8747-11ea-929d-071ad8bac498.png)
![image](https://user-images.githubusercontent.com/3519706/80289514-81e64100-8747-11ea-9349-6e852a41a69b.png)

-   Select the additional language if needed and click Next

-   Review the installation summary and click “Install”

![image](https://user-images.githubusercontent.com/3519706/80289526-90ccf380-8747-11ea-86ea-d666b58b3100.png)

It will take few minutes to install and once done, you will get the confirmation screen.

![image](https://user-images.githubusercontent.com/3519706/80289534-a2160000-8747-11ea-97ec-504d2ab2f81c.png)

[Reference](https://geekflare.com/was9-installation-guide/)
