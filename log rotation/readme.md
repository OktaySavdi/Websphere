## Webshere Configure log rotation, file size & historical log files

-   Navigate to Servers>>Server Types>>WebSphere Application Server

-   Click on desired JVM

-   Click on Logging and tracing under Additional Properties

-   Click on JVM Logs from the list

To configure the  **maximum single log file size,**  you can enter the value in “Maximum Size.” In this ex, I have given 100 MB (by default it’s configured with 1 MB).

To keep the number of historical log files, you can enter the value in “Maximum Number of Historical Log Files. The number in a range of 1 through 200.” In this ex, I have given 30, which will keep 30 log files all the time

Repeat the same configuration for SystemErr.log. Here is the screenshot of above configuration.

![image](https://user-images.githubusercontent.com/3519706/80285423-7ab23980-872d-11ea-857e-693bbe8cdb05.png)