## Restrict WebSphere DMGR Console Access with IP’s or Hosts

Let’s move on **implementation**  now.

 - Login into DMGR Console
 
 - Go to System administration >> Deployment manager

![image](https://user-images.githubusercontent.com/3519706/80277817-56893500-86fa-11ea-8af5-e8b15e344417.png)

 - Click on Web container transport chains

![image](https://user-images.githubusercontent.com/3519706/80277827-69036e80-86fa-11ea-97a6-c56e29b4a90b.png)

 - Click on WCInbouceAdminSecure if DMGR is SSL enabled. If not, click
   on WCInbouceAdmin.
![image](https://user-images.githubusercontent.com/3519706/80277837-7c163e80-86fa-11ea-8153-a217a5e70b45.png)

**Note:**  if both are enabled – you have to do it for both.

Click on TCP inbound channel (TCP_3)

![image](https://user-images.githubusercontent.com/3519706/80277853-93552c00-86fa-11ea-95b3-e942e5af1c82.png)

 - Enter the IP in “Address include list”
 
 - Enter the hostname in “Hostname include list

![image](https://user-images.githubusercontent.com/3519706/80277876-ba136280-86fa-11ea-8a00-2d8b4a3074c6.png)

 - Click on Apply and Ok
   
 - Review and save the configuration

   

 - Restart the DMGR to get the configuration effective

So in above example, I have included only **172.16.179.135**  as allowed IP. Let’s see what happens when I try from the hostname or different IP.

**Accessing with hostname**

![image](https://user-images.githubusercontent.com/3519706/80277910-01015800-86fb-11ea-811b-4e449d117fda.png)

so you see it’s blocked.

you can see exlude list on `server.xml`

![image](https://user-images.githubusercontent.com/3519706/80277954-402fa900-86fb-11ea-8818-d60c9c39dfc7.png)
