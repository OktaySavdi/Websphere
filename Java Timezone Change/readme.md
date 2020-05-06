## Websphere Java Timezone Change

The relevant file is downloaded from

http://www.ibm.com/developerworks/java/jdk/dst/jtzu.html 

Edit **`runjtzuenv.sh`**

the java address the application is running on is given

![image](https://user-images.githubusercontent.com/3519706/81199912-f3d24c00-8fcb-11ea-811c-2bfb78242ba2.png)

After determining the Java home, "runjtzu" is run again

"**Non-Interactive**" mode is selected and the warning is passed with "**OK**"

![image](https://user-images.githubusercontent.com/3519706/81200092-267c4480-8fcc-11ea-8645-8c2c6cb2e534.png)

OK, warning is passed

![image](https://user-images.githubusercontent.com/3519706/81200167-41e74f80-8fcc-11ea-8750-4000ad3f7750.png)

Automatic search starts and the application finds and fixes the files that need to be changed.

After finishing the process, automatic editing is done and we complete our steps with "OK".

![image](https://user-images.githubusercontent.com/3519706/81200318-79ee9280-8fcc-11ea-8eab-8f662a27d64e.png)

and restart
- jvm
- node
- cell manager