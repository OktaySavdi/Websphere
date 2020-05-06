## Websphere Core Group


![image](https://user-images.githubusercontent.com/3519706/81187602-f37e8480-8fbc-11ea-9b85-2c3f7ec46972.png)

**Creating a new core group**

To create a new core group, complete the following steps:

1. Click **Servers** -> **Core Groups** -> **Core group settings**.

2. Click **New** to create new core group,

![image](https://user-images.githubusercontent.com/3519706/81187700-0db86280-8fbd-11ea-9539-69c081c05793.png)

Specify the name, the number of coordinators, and the transport memory size in the

Configuration tab,

![image](https://user-images.githubusercontent.com/3519706/81187775-258fe680-8fbd-11ea-91de-972179c37ea2.png)

4. Next, you can add Additional Properties.

5. Click **Review**, click **Synchronize changes with nodes**,

**Moving core group members between core groups**

Bu işlemden önce taşınacak JVM veya Node stop edilmelidir

1. Click **Servers** -> **Core Groups** -> **Core group settings**

2. Select your desired core group

![image](https://user-images.githubusercontent.com/3519706/81187834-38a2b680-8fbd-11ea-9630-f8a5d9731665.png)

3. Click **Core group servers** under Additional Properties

![image](https://user-images.githubusercontent.com/3519706/81187891-52dc9480-8fbd-11ea-9e6e-9d661ffca744.png)

5. From a drop-down menu, select a core group name to which to move members and click **Apply**,

![image](https://user-images.githubusercontent.com/3519706/81188273-cb435580-8fbd-11ea-9167-4a985215b7a2.png)

6. Click **Review**, click **Synchronize changes with nodes**

**Bridging core groups**

1. Click **Servers** -> **Core Groups** -> **Core group bridge settings**.

2. Select **Access point groups** under Additional Properties

![image](https://user-images.githubusercontent.com/3519706/81188501-0b0a3d00-8fbe-11ea-82f5-69ac4b650cb4.png)

3. For our topology, we select **DefaultAccessPointGroup**,

![image](https://user-images.githubusercontent.com/3519706/81188554-1fe6d080-8fbe-11ea-8315-cbd0b9fbf3a1.png)

4. Select **Core group access points**,

![image](https://user-images.githubusercontent.com/3519706/81188611-33923700-8fbe-11ea-9ba0-2f26d11b5a5c.png)

5. Select **CGAP_1\DefaultCoreGroup** and click **Show Detail**,

![image](https://user-images.githubusercontent.com/3519706/81188668-4b69bb00-8fbe-11ea-8b0a-23ec84ff75e6.png)

6. Select **Bridge interfaces** from Additional Properties

![image](https://user-images.githubusercontent.com/3519706/81188726-5cb2c780-8fbe-11ea-994f-033d0c688b1e.png)

7. Click **New** to create a new Bridge interface for the CGAP_1 Core group access point,

![image](https://user-images.githubusercontent.com/3519706/81189140-ec587600-8fbe-11ea-8669-62b66a99eff0.png)

9. Click **Review**, click **Synchronize changes with nodes**,

10.For high availability purposes, define one more bridge interface by repeating steps 7 to 9 for the first core group.

11.Back on the Core group access points window, select **CGAP_2\Coregroup2** and click **Show Detail**,

![image](https://user-images.githubusercontent.com/3519706/81189232-08f4ae00-8fbf-11ea-9971-00fc6cd5c3cb.png)

12.Select **Bridge interfaces** from Additional Properties,

![image](https://user-images.githubusercontent.com/3519706/81189461-3fcac400-8fbf-11ea-991d-ab8875277cd6.png)

14.Select a process from the **Bridge interfaces** drop-down menu, Consider administrative processes first. Click **Apply**.

![image](https://user-images.githubusercontent.com/3519706/81189593-6c7edb80-8fbf-11ea-9668-d96e85c116bf.png)

**Setting up preferred coordinator servers**

This action is not mandatory. The job it does is distributing the request to the servers in the default core according to the priority you set.

1. Click **Servers** -> **Core Groups** -> **Core group settings**.

2. Select your desired core group,

![image](https://user-images.githubusercontent.com/3519706/81189789-ab149600-8fbf-11ea-920f-e5499822c217.png)

3. Click **Preferred coordinator servers** under Additional Properties

![image](https://user-images.githubusercontent.com/3519706/81189837-bc5da280-8fbf-11ea-9906-0c71c702bb13.png)

![image](https://user-images.githubusercontent.com/3519706/81189881-caabbe80-8fbf-11ea-8f53-9de0e68a1f3a.png)

Click **Review**, click **Synchronize changes with nodes**

**High availability groups**

1. Click **Servers** -> **Core Groups** -> **Core group settings**.

2. Select your desired core group,

![image](https://user-images.githubusercontent.com/3519706/81189947-e1521580-8fbf-11ea-9a44-c1023f22ef97.png)

![image](https://user-images.githubusercontent.com/3519706/81189982-ec0caa80-8fbf-11ea-91de-f549b14d481f.png)

4. Click **Show servers** to display core group servers that are hosting active high availability group members. To display high availability groups, specify the name=value pairs or * in the “Group name properties” field and click **Show groups**

![image](https://user-images.githubusercontent.com/3519706/81190094-0a72a600-8fc0-11ea-951b-cbc814632872.png)