## Webshere Error Page Message

• Login to WebSphere Administrative Console

• Go to the Servers >> Server Types >> WebSphere application servers

• Click the JVM where you want to override the error

• Expand “Web Container Settings” and click “Web container”

• Click Custom properties

![image](https://user-images.githubusercontent.com/3519706/80280317-fef3c500-870b-11ea-9599-430113be3ae6.png)

• Click New and Enter the Name as
```
com.ibm.ws.webcontainer.webgroupvhostnotfound
```
• and Value the error message you want to show. For ex:
```
“Sorry, requested page not found.”
```
• Click OK

![image](https://user-images.githubusercontent.com/3519706/80280335-1a5ed000-870c-11ea-9b93-996a0fb9967d.png)

• Review and save the configuration

• Restart the JVM

Now, let’s try to access some page which doesn’t exist.

![image](https://user-images.githubusercontent.com/3519706/80280363-48dcab00-870c-11ea-862d-a1291c3d7590.png)
