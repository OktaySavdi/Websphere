## Websphere Silent Install

Required folders are created
```bash
mkdir /opt/Record
mkdir /opt/Log
```

install silent **Installation Manager**
```ruby
cd /opt/insmgr/disk_linux.gtk.x86_64/InstallerImage_linux.gtk.x86_64/
```
```ruby
./installc -log /opt/Log/install.log -acceptLicense
```
**For Record file for  Websphere application server**
```bash
cd /opt/IBM/InstallationManager/eclipse/
```
**Silent file is created**
```ruby
./IBMIM -skipInstall "/opt/Record/imRegistry" -record /opt/Record/install_response_file.xml
```
**proceeds like a normal installation**

![image](https://user-images.githubusercontent.com/3519706/81184937-a816a700-8fb9-11ea-87a7-b6df1c8cf439.png)

![image](https://user-images.githubusercontent.com/3519706/81185024-c1b7ee80-8fb9-11ea-8ad7-d8538d3eb684.png)

![image](https://user-images.githubusercontent.com/3519706/81185105-da280900-8fb9-11ea-8f98-84981aaf587f.png)

![image](https://user-images.githubusercontent.com/3519706/81185355-25421c00-8fba-11ea-8c4b-2b9b44dcc5cf.png)

![image](https://user-images.githubusercontent.com/3519706/81185355-25421c00-8fba-11ea-8c4b-2b9b44dcc5cf.png)

After the install step, install **response file.xml** silent file will be created
![image](https://user-images.githubusercontent.com/3519706/81185927-e365a580-8fba-11ea-8067-cba67d312f22.png)


**Use the response file to install the product.** 

Go to a command line on each of the systems on which you want to install the product, change to the eclipse/tools subdirectory in the directory where you installed Installation Manager, and install the product.
```bash
cd /opt/IBM/InstallationManager/eclipse/tools
```
```ruby
./imcl -acceptLicense input "/opt/Record/install_response_file.xml" -log  /opt/Log/install_log.xml
```
![image](https://user-images.githubusercontent.com/3519706/81187231-705d2e80-8fbc-11ea-9f7e-6c9f8d6673fe.png)
