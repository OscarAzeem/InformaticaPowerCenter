# General Info
* The Informatica power center clients works on 32 bits, when configuring an ODBC connnection from the clients to a certain DATABASE it's neccesary to use an ODBC 32 bits driver. It's possible to follow the installation (Domain Databases and Repository databases) on a 64 bit database server, but when adding a source from the Informatica Designer, you should use a 32 bits driver. [Info about the 32 bits ODBC driver](https://network.informatica.com/thread/85144 "ODBC driver problem")
* Contrasenas: 
* oracle: masteroracledatabase
    * IPC services (server): Master2019?
    * Domain user name: Administrator
    * Pass: Administrator
    * UsuarioIPCCreado: 
    * PssUsuarioIPCExterno: usuario
* Mysql: 
    * Puerto: 3306
    * X protocol port: 33060
    * Pass: mastermysqldatabase
    * Dba user: Administrator
    * Pass Dba user: Administrator

# Basic Configuration
* Some basic information about the basics

## Import A source File
* ***Note:*** When importing a source file, you just import the **SOURCE/TARGET DEFINITION** Not the real connection. 
* The real connection it's configured whithin the Informatica Workflow Designer. See the section: **Add a New Database Connection**
* Informatica power center can import files from: 
    * Database: Microsoft SQL Server, Oracle, SAP HANA, Sybase, Teradata etc.
    * File: flat files
    * COBOL file
    * Salesforce.com
    * XML
    * ***CREATE*** You can create your own data source from scratch

### How to import a new source
1. From Informatica Designer, 
2. Select the Source analyzer option, clic tools
3. Import from and select one.

### Add an ODBC (connection) data source
From the first time, no one ODBC connection is configured, in order to configure a new one you have to do the following: 
1. Open Designer
2. Select Source analyzer
3. Clic on the tree dots from the *ODBC data source* option. 
4. Clic System DNS
5. clic on add: 
	* ***IF THE FOLLOWING ERROR APPEARS: You are logged in with non-Administrative privileges. System DSNs could not be created or modified*** Follow the *Solving ODBC error* steps.
6. Select the option: ** Data Direct 7.1 ODBC Oracle Wire Protocol Setup** (the informatica Installation that I use, runs over the Oracle Express edition server)
7. Clic on End
8. Add a Data Source Name and description
9. TNS Service Name leave it blank
10. Host: The same as the **tnsnames.ora** file in: **C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN**
11. Port Number, the default port for the Oracle XE installation: 1521
12. Service name: XE
13. Clic on Test Connection
14. User name: User for such connection (hr and hr)
15. Add the just created ODBC data source in the Import Tables Window.


#### Solving the error: ODBC System DSN Warning You are logged on with non-Administrative privileges
* Cause: Some installations of MS Office block the creation of System DSNs and programs cannot be run as administrator [Cause Link](https://knowledge.exlibrisgroup.com/Voyager/Knowledge_Articles/Creating_ODBC_DSN_fails_ODBC_System_DSN_Warning_You_are_logged_on_with_non-Administrative_privileges "ODBC solution")
* Resolution steps: 
    1. Press the Windows key, search the following: **odbcad32.exe**
    2. Right clic and select run as administrator.
    3. Add the new sytem dns (**Oracle in XE for the Informatica Installation**)

#### Solving the ODBC 32 bits vs ODBC 64 bits error
* [Problem with ODBC 32/64 bits drivers](https://syntaxdrops.wordpress.com/2013/06/18/installing-and-configuring-mysql-32-bit-odbc-driver-on-a-64-bit-operating-system/ "ODBC solution")
* Explanation: 
    * What happens is that you have a 64 bit operating system, and you need to install an ODBC driver that would work with a 32 bit application.
    * If you install a 64 bit ODBC driver, **it will be listed** and configurable in “ODBC Data Source Administrator” (Start\Control Panel\All Control Panel Items\Administrative Tools\Data Source (ODBC)), **but it will not be able to work with 32 bit application.**
    * if you try to install the 32 bit driver, the system will not recognise it, and it *will not appear* in your default Data Sources (ODBC) **inside the control panel**, so you will not be able to configure it and connect to MySQL.
    * In order to see the 32 bit ODBC driver, it should be added by **odbcad32.exe** program mentioned earlier. 

#### Solving the OBDC 32/64 Bits, PATH error
* [Info abouth the PATH on windows about the 32/64 bits ODBC drivers](https://network.informatica.com/thread/52202 "worth read. trust me this one")

## Configuring and ODBC connection for a MySQL server 
* By defaut the windows variable PATH, which you cand find as follows ([on windows 7](https://www.computerhope.com/issues/ch000549.htm)):
    1. From the desktop, right-click the Computer icon and select Properties. 
    2. Click the Advanced System Settings link in the left column.
    3. In the System Properties window, click on the Advanced tab, then click the Environment Variables button near the bottom of that tab.
    4. In the Environment Variables window (pictured below), highlight the Path variable in the "System variables" section and click the Edit button. Add or modify the path lines with the paths you want the computer to access. Each different directory is separated with a semicolon
* So by default the Variable **PATH¨** It's configured to **READ** first the path: 
    1.  C:\Windows\System32, in which it's **stored** the  **odbcad32.exe** program for the [**64 bits** System DNS connections](https://kb.informatica.com/howto/6/Pages/2/157292.aspx "ODBC System DNS"), in other words, everytime you hit the Designer - Source Analyzer - Import from Database - ... - ODBC data source Administrator - System DNS, the **odbcad32.exe** for 64 bits is launched. But as you could remember, the Informatica Power Center Clientes are build under a **32 Bits** architecture, therefore in order to **connect** to a MySQL server with a **32 bits** ODBC driver, the System DNS connection should be declared within the **odbcad32.exe** for **32 bits**
    2. After reading the *C:\Windows\System32* path, the **PATH** reads the *C:\Windows\SysWOW64* path, which stores the **odbcad32.exe** progam for **32 bits** ODBC connection. (yeah, i know, this is so mixed up, because Windows)
    3. You should change the order of the **PATH** path, to read first the:  *C:\Windows\SysWOW64\odbcad32.exe* ODBC program and then *C:\Windows\System32\odbcad32.exe* ODBC program
* Being adjusted the order *PATH*, you need to install the 32 Bits ODBC driver on both the Client and Server side, from the [Mysql connector page](https://dev.mysql.com/downloads/connector/odbc/ "Mysql Connectors") downloading the **32 BITS** and MSI installer. 
* Installed the 32 Bits Mysql ODBC Driver, the Informatica Power Center will ask for a modification for the *C:\Informatica\9.6.1\clients\PowerCenterClient\client\bin\powrmart.ini* file, in which you should add the following lines below the *[ODBCDLL]* section: 
    * [ODBCDLL]

     MySQL=PMODBC.DLL

* Once configured the powrmart.ini file and installed the 32 bits MySQL drivers, it's neccesary to add the new *System DNS data sources* whithin the ODBC Data Source Administrator Program (*C:\Windows\SysWOW64\odbcad32.exe*). 
* Doing the steps mentioned before now we are able to stablish a 32 bits ODBC connection between the Informatica Power Center clients and the MySQL server. 

## Solving: The specified DSN contains an architecture mismatch between the Driver and Application (ODBC related error)
* A database server can use a 32 bits or 64 bits ODBC connection.   
* The Informatica Power Center **Clients** (Designer, Workflow, Monitor) are applications under a 32 bits architecture. 
* The Informatica Power Center **Server** (Integration Services, Repository) is an application under a 64 bits architecture. 
* When using the **Designer** application to get an eschema definition, the client uses a **32 bits ODBC** connection to **connect** to the database server, therefore, when trying to get an eschema definition the Designer follows the next steps:
    * Designer -> 32 Bits ODBC connection -> System Dns on ODBC Data Source Administrator -> Database server
* When using the **Workflow** application in order to run a SQL statement inside a Session(Mapping) the workflow application **despite of** being a 32 Bits application, connects first to the Informatica Power Center Server which is a **64 Bits application**; the **IPC server it's the one who actually executes a SQL statement.** In other words, when running a workflow the Workflow application executes the following steps:
    * Workflow -> Informatica Power Center Server -> **64 Bits** ODBC connection -> Database Server

## Connection considerations for Designer and Workflow appplication
* In order to connect the Designer to a Database Server you need to configure the System DNS connections inside the *C:\Windows\SysWOW64\odbcad32.exe* 32 Bits ODBC Data Source Administrator program. 
* In order to connect the Workflow to a Database Server you need to configure the System DNS connections inside the *C:\Windows\System32\odbcad32.exe* 64 Bits ODBC Data Source Administrator program. 

## Add a Relational connection from the Workflow Designer
1. Open the Informatica Workflow Designer
2. Select the type of connection (where it's the source and target tables)
3. clic on New
4. Give a Name and complete the user and password requirements.
5. In connection write the **SERVICE_NAME** as the tnsnames.ora file, **XE** in this case. 

