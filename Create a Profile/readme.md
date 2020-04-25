# Create a Profile in WebSphere ND

You can create a WebSphere Application Server profile in two ways.

1.  GUI – using Profile Management Tool

2.  Silent – using manageprofile.sh script

In this post, will use GUI to create a Cell profile.

-   Login to server where WAS is installed

-   Go to WAS binary location >> bin >> ProfileManagement (in default installation location, it will be 
/opt/IBM/WebSphere/AppServer/bin/ProfileManagement)

-   Launch Profile Management Tool
```
./pmt.sh
```
-   It will open a “WebSphere Customization Toolbox” window, click Create

![image](https://user-images.githubusercontent.com/3519706/80289626-6d567880-8748-11ea-80f2-7885526d4c4f.png)

Select “Cell” environment and click Next

![image](https://user-images.githubusercontent.com/3519706/80289646-9bd45380-8748-11ea-934c-2c9bf6889021.png)

In  **next screen**, you will have the option to select the profile creation process. There are two processes.

1.  **Typical**  profile creation – profile will be created with the default configuration and port numbers. In most of the cases, you can select this.

2.  **Advanced**  profile creation – If you are looking to customize the default ports, configuration then you will need to use this.

-   Let’s proceed with “Typical” profile creation, click Next

-   Enter the user and password for DMGR, if you don’t want DMGR to be password protected then you can uncheck the “Enable administrative security” box.

![image](https://user-images.githubusercontent.com/3519706/80289659-b5759b00-8748-11ea-92cf-8a49697059c6.png)

-   Review the profile summary and click “Create”. If you want you can copy the information from this screen as it will contain a lot of useful information like.
```
Location
Profile name
Cell name
Node name
Ports
Profile type
```
![image](https://user-images.githubusercontent.com/3519706/80289677-d63df080-8748-11ea-8dd1-eb36c3b23b1f.png)

It will take few minutes for profile creation and once done, you should see a **confirmation**.

![image](https://user-images.githubusercontent.com/3519706/80289689-e8b82a00-8748-11ea-8293-e7bbac23b50e.png)

If you notice, I’ve kept default option “**Launch the First steps console**” in above screen.

This will open first steps wizard where you can verify the installation. Verification is  **essential**  so you know your profile is functional and ready to deploy the necessary application for your business.

-   Click “Installation verification”

![image](https://user-images.githubusercontent.com/3519706/80289698-fd94bd80-8748-11ea-8e7c-abdd77cca811.png)

This concludes profile is created  **successfully**.

Let’s try to access the DMGR URL

![image](https://user-images.githubusercontent.com/3519706/80289718-22893080-8749-11ea-8a68-66b7897ad96f.png)

[Reference](https://geekflare.com/create-websphere-profile/)
