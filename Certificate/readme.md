# Websphere deploy certificate on DMGR

**Convert the x.509 cert and key to a pkcs12 file**
```ruby
openssl pkcs12 -export -in /root/papirus/papirus.mydomain.local.crt -inkey /root/papirus/papirus.mydomain.local.rsa \
               -out papirus.p12 -name papirus \
               -CAfile /root/papirus/ca.crt -caname root
Enter Export Password: password
Verifying - Enter Export Password: password
```
Via the Websphere console

Security > SSL certificate and key management > Manage endpoint security configurations 

click **`CellDefault SLSetting`**

![image](https://user-images.githubusercontent.com/3519706/81495775-69cfff00-92bb-11ea-92e4-982e10592c0c.png)

Key stores and certificates > CellDefaultKeyStore > Personal certificates > import

![image](https://user-images.githubusercontent.com/3519706/81495858-0eead780-92bc-11ea-92f1-3be690f6de32.png)

After installing the certificate, the screen returns to the first screen.

SSL certificate and key management > Manage endpoint security configurations

![image](https://user-images.githubusercontent.com/3519706/81495775-69cfff00-92bb-11ea-92e4-982e10592c0c.png)

Installed certificate is selected

![image](https://user-images.githubusercontent.com/3519706/81495927-91739700-92bc-11ea-8775-9f43f5ec39d6.png)

Then (NodeDefaultSSLSettings) fields are selected

![image](https://user-images.githubusercontent.com/3519706/81496008-1a8ace00-92bd-11ea-9546-778044c67fc0.png)

Override inherited values are removed

SSL configuration :  **CellDefaultSSLSettings**

![image](https://user-images.githubusercontent.com/3519706/81496069-8bca8100-92bd-11ea-9944-8d6589db0bca.png)

The final version should be as follows

![image](https://user-images.githubusercontent.com/3519706/81496091-a4d33200-92bd-11ea-85ec-9293903ee281.png)

Restart JVM's