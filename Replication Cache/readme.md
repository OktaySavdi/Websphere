## Websphere Replication Cache

You can make cache elements highly available by using memory-to-memory replication. To enable cache replication in WebSphere Application Server, complete the following steps:

1. Click **Servers** -> **Server Types** -> **WebSphere application servers**.

2. Select your desired application server

![image](https://user-images.githubusercontent.com/3519706/80278931-e9c66880-8702-11ea-8e42-fc0799be00eb.png)

3. In the Container Settings section, expand **Container Services**, and then select **Dynamic cache service**

![image](https://user-images.githubusercontent.com/3519706/80278954-12e6f900-8703-11ea-8e69-1174329b0212.png)

4. Select the **Enable cache replication** option, and then select the desired Replication domain and Replication type. Click **Apply**,

![image](https://user-images.githubusercontent.com/3519706/80278970-3611a880-8703-11ea-865a-9e0e5cd4fb4d.png)

5. Click **Review**, click **Synchronize changes with nodes**

6. Tüm JVM’ler için aynı işlem yapılacak

7. Restart the affected application servers by clicking **Servers** -> **Server Types** ->**WebSphere application servers**