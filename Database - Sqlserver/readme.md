# Websphere Sqlserver Configuration

db user is defined firstly

security > Global security > Java Authentication and Authorization Service > J2C authentication data > new

![image](https://user-images.githubusercontent.com/3519706/81496241-fcbe6880-92be-11ea-9b44-4a1f41b38bfd.png)

jdbc definition is made according to the database type to be used

Resources > JDBC > JDBC providers > New

![image](https://user-images.githubusercontent.com/3519706/81496927-d9e28300-92c3-11ea-89e2-6a73f0c734c6.png)

![image](https://user-images.githubusercontent.com/3519706/81496941-f2529d80-92c3-11ea-9392-ba1e2f93752c.png)

![image](https://user-images.githubusercontent.com/3519706/81496958-05fe0400-92c4-11ea-9dd3-be04dd8092a1.png)

Access to the directory of sqljdbc4.jar file is granted
```ruby
chmod 764 -R /opt/mssql/
```
Datasource is defined for the selected database.

Resources > JDBC > Data source > New

![image](https://user-images.githubusercontent.com/3519706/81497041-8fadd180-92c4-11ea-9f8c-96b821fc91f0.png)

select previously created JDBC driver

![image](https://user-images.githubusercontent.com/3519706/81497049-9b00fd00-92c4-11ea-8b63-b773256ae278.png)

![image](https://user-images.githubusercontent.com/3519706/81497068-c08e0680-92c4-11ea-9644-bab0039cad1e.png)

![image](https://user-images.githubusercontent.com/3519706/81497092-d4d20380-92c4-11ea-8f44-bf64336b6b2a.png)

access control is done

![image](https://user-images.githubusercontent.com/3519706/81497120-1498eb00-92c5-11ea-92cb-30a41e2d783e.png)
