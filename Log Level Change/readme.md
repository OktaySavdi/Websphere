## Webshere Log Level Change

1- In the Application Server Administrative Console, expand Troubleshooting and select Logs and Trace.

![image](https://user-images.githubusercontent.com/3519706/80279832-a40c9e80-8708-11ea-9a1f-f40b62cd1bd0.png)

2- In the Logging and Tracing page, select your server and then Diagnostic Trace.

![image](https://user-images.githubusercontent.com/3519706/80279860-be467c80-8708-11ea-820b-82bb4faf46aa.png)

3- Ensure that Enable Log is selected.

4- Under Trace Output, select File, and accept the defaults. It is recommended to set the number of historical trace files to 10 and the size of each historical trace file to 100MB.

![image](https://user-images.githubusercontent.com/3519706/80279874-d9b18780-8708-11ea-8f53-ae35e092081a.png)

5. Click OK and save your configuration.

6. Again, expand Troubleshooting and select Logs and Trace.

7. In the Logging and Tracing page, select your server and then Change Log Detail Levels.

![image](https://user-images.githubusercontent.com/3519706/80279884-ee8e1b00-8708-11ea-9a8f-180a8f494d2b.png)

8. Enter the following trace string: 

If connecting to a database: 
```
*=info:WAS.j2c=all:RRA=all:Transaction=all
```
**Note:** Refer to Collecting JDBC Driver Tracing in WebSphere Application Server if DB2 or Oracle JDBC driver tracing is required.


If connecting to a messaging system:
```
*=info:WAS.j2c=all:Messaging=all:JMSApi=all:Transaction=all
```
If connecting to an enterprise information system:
```
*=info:WAS.j2c=all:com.ibm.connector2.*=all:Transaction=all
```
```
*=info:WAS.j2c=all:RRA=all:Transaction=all:com.ibm.ws.security.*=all:com .ibm.websphere.security.*=all:com.ibm.websphere.wim.*=all:com.ibm.wsspi.wim.*=all:com.ibm.ws.wim.*=all
```
```
*=Warning, all, detail, fatal veya aşağıdaki adresten alınabilir
```
TCP Channel trace
```
*=info:HTTPChannel=all:TCPChannel=all:GenericBNF=all
```