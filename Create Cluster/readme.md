# Create Cluster in IBM WebSphere ND

-   Login to WAD DMGR Admin Console

-   Navigate Servers >> Clusters >> WebSphere application server clusters

![image](https://user-images.githubusercontent.com/3519706/80289879-48fb9b80-874a-11ea-8347-5f2faf567e8a.png)

Click New >> Enter the “Cluster name” and click Next

![image](https://user-images.githubusercontent.com/3519706/80289781-a6dbb380-8749-11ea-9ddf-badb6d9dd2d3.png)

Enter the Cluster member name and select the node where you want to create

![image](https://user-images.githubusercontent.com/3519706/80289787-ba871a00-8749-11ea-8c4b-9447b0fb52fc.png)

You have the option to create the member using an application server template, using an existing JVM as a template, convert existing JVM as a cluster member or create an empty cluster.

-   I’ve chosen to create using a default template, click Next

-   You can create additional cluster member on next screen if you need, click Next

![image](https://user-images.githubusercontent.com/3519706/80289798-cecb1700-8749-11ea-986a-b737b725004d.png)

Review the summary and click Finish

![image](https://user-images.githubusercontent.com/3519706/80289806-dc809c80-8749-11ea-94c3-9f887f40aa03.png)

-   Review and synchronize the configuration changes

This concludes cluster is created and ready to be used. Let’s  **verify.**

-   Go to WebSphere application servers under “Server Types.”

![image](https://user-images.githubusercontent.com/3519706/80289811-eaceb880-8749-11ea-9989-991f38d928f7.png)

-   As you can see, I’ve created tow JVM under “**Cluster-1**”. By default, they will be stopped state.

To  **start**, you can either start the JVM or whole cluster

![image](https://user-images.githubusercontent.com/3519706/80289820-fae69800-8749-11ea-8dc1-2fa2e084ab4c.png)

If you have multiple JVM’s in a cluster and need to restart all, then you can restart the whole cluster.

**Tip**: if you need to create JVM in existing cluster then you can do as following.

-   Go to Servers >> Clusters >> WebSphere application server clusters

-   Click the Cluster from the list where you want to create a JVM

-   Click “Cluster members” under Additional Properties

![image](https://user-images.githubusercontent.com/3519706/80289870-397c5280-874a-11ea-9da5-b327ae603ec2.png)

-   Click New

-   Enter the JVM name >> select the node where you want to get it created and click “Add Member.”

![image](https://user-images.githubusercontent.com/3519706/80289851-25d0ec00-874a-11ea-84c9-f30f23c7d6da.png)

-   Once added, click Next and then Finish

Don’t forget to review and synchronize the changes.

[Reference](https://geekflare.com/create-websphere-cluster/)