## Websphere Timezone Change

•	Start the **administrative console.**

•	In the topology tree, expand **Servers >> Application Servers.**

•	Click on application server for which you want to set the time zone

•	On the application server page, click **Process Definition>>Java Virtual Machine>>Custom Properties>>New**

•	Specify **user.timezone** in the Name field and **timezone** in the Value field, where timezone is the supported value for your time zone.

•	Click Apply/ok

•	Save the configuration

![image](https://user-images.githubusercontent.com/3519706/81201010-6d1e6e80-8fcd-11ea-8e6a-04cea817cea2.png)