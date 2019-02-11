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
* Dominios IPC en Oracle
    * Usuario: Repositorio2_Metadatos
    * Password: repositorio
    * Usuario: Dominio2_Metadatos
    * Password: dominio
    * Servicio de Integración
        * Usuario: Administrator
        * Password: Administrator
    * IPC
        * Domain Name: Domain_ApeironIPC
        * Gateway Host: 127.0.0.1 (localhost)
        * Gateway Port: 6005
        * Usuarios: 
                * Usuario: UsuarioIPCCreado 
                * Password: usuario
                * Usuario: AzeemLinkedIn
                * Password: usuario 

# Basic Configuration
* Some basic information about the basics

## Import A source File
* ***Note:*** When importing a source file, you just import the **SOURCE/TARGET DEFINITION** Not the real connection. 
* The real connection it's configured within the Informatica Workflow Designer. See the section: **Add a New Database Connection**
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

* Once configured the powrmart.ini file and installed the 32 bits MySQL drivers, it's neccesary to add the new *System DNS data sources* within the ODBC Data Source Administrator Program (*C:\Windows\SysWOW64\odbcad32.exe*). 
* Doing the steps mentioned before now we are able to stablish a 32 bits ODBC connection between the Informatica Power Center clients and the MySQL server. 

## Solving: The specified DSN contains an architecture mismatch between the Driver and Application (ODBC related error)
* A database server can use a 32 bits or 64 bits ODBC connection.   
* The Informatica Power Center **Clients** (Designer, Workflow, Monitor) are applications under a 32 bits architecture. 
* The Informatica Power Center **Server** (Integration Services, Repository) is an application under a 64 bits architecture. 
* When using the **Designer** application to get an eschema definition, the client uses a **32 bits ODBC** connection to **connect** to the database server, therefore, when trying to get an eschema definition the Designer follows the next steps:
    * Designer -> 32 Bits ODBC connection -> System Dns on ODBC Data Source Administrator -> Database server
* When using the **Workflow** application in order to run a SQL statement inside a Session(Mapping) the workflow application **despite of** being a 32 Bits application, connects first to the Informatica Power Center Server which is a **64 Bits application**; the **IPC server it's the one who actually executes the SQL statement.** In other words, when running a workflow the Workflow application executes the following steps:
    * Workflow -> Informatica Power Center Server -> **64 Bits** ODBC connection -> Database Server

## Connection considerations for Designer and Workflow appplication
* In order to connect the Designer to a Database Server you need to configure the System DNS connections inside the *C:\Windows\SysWOW64\odbcad32.exe* 32 Bits ODBC Data Source Administrator program. 
* In order to connect the Workflow to a Database Server you need to configure the System DNS connections inside the *C:\Windows\System32\odbcad32.exe* 64 Bits ODBC Data Source Administrator program. 

## Add a Relational connection from the Workflow Designer
The steps below are different for a Workflow - MySQL and Workflow - Oracle, connection. 

### Workflow - ORACLE
1. Open the Informatica Workflow Designer
2. Connections -> Relational -> New ..
3. In the Select Subtype window:
    1. If you already have an **Oracle Native ODBC driver**, in the Subtype window: 
        * New -> Oracle
        * Choose a name, user name and password
        * In the Conect String box, you should write the **Service Name** declared inside the **C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN\tnsnames.ora** file (*XE* in this case)
    2. If you are goin to use and **ODBC connection** in the Subtype window:
        * New -> ODBC
        * Choose a name, user name and password
        * In the Conect String box, you should write the **System Data Sources in the System DNS tab within the ODBC Data Source Administrator program** of the following path *C:\Windows\System32\odbcad32.exe*. 
        * Notice this System Data Source Name is also stored in the *C:\Windows\ODBC.INI* file

### Workflow - MySQL
1. Open the Informatica Workflow Designer
2. Connections -> Relational -> New ..
3. For the MySQL connection you can only choose an **ODBC connection** in the Subtype window:
    * New -> ODBC
    * Choose a name, user name and password
    * In the Conect String box, you should write the **System Data Sources in the System DNS tab within the ODBC Data Source Administrator program** of the following path *C:\Windows\System32\odbcad32.exe*. 
    * Notice this System Data Source Name is also stored in the *C:\Windows\ODBC.INI* file


# Administrator configuration

## How to Configure a Repository Service
* Windows Button -> Informatica 9.6.1 -> Server -> Informatica Administrator Home
* User: Administrator - Password: Administrator
* On the Serices and Nodes tab, select actions 
* Select: PowerCenter Repository Service
* Choose the RepositoryDatabase (already created in the DBMS server)
* Check the box: No content exists under specified connection string.
* Check the box: Enable version control (A versioned ...)

## Grant permissions to read a folder
* [INFO about granting permissons to read](https://network.informatica.com/thread/18072 "info about granting permissons to read")

## Read from different source files 
* When importing a Target Definition from the Designer, the **Datatype** column it's already considered for inserting each row; if the Datatype column is an integer even if it's already defined in the database as a Varchar, the IPC server will mantain the Datatype from the Target Definition. This will lead to the error: Data conversion overflow/error. 


# Explaining Errors
* Everytime an error occurs in the session of the kind: Target Failed Rows or Total Transformation Errors, if some bada data is encountered, the IPC server doesn't do a commit, instead the server does a rollback. [Rollback instead of commit, info](https://network.informatica.com/thread/4051 "Rollback on Bad rows Informatica Power center server")
* The Informatica Power Center serves has something called **commit interval**, option which does a commit every N-Rows inserted. 
    * The *commit interval* option can be found inside the Wofkflow -> Edit tasks -> Properties tab -> General Options Section -> Commit interval
    * By default the commit interval option is "10000" rows. 
    * Note: A commit interval is the no. of rows at which the intergration service will apply the commit to the target. *Increasing the commit interval is considered as one of the target side performance optimization technique.*

## Session log
* In the Task Details section: 
    * Target Failed Rows: 
        * Total Rows that are rejected due to a table definition on the target
        * This error can be 'fixed' 
    * Total Transformation Errors:
        * Total Rows that are rejected due to an illegal transformation operation (a sum of a string + char)


# Importing data to the IPC client
* **General Considerations**: 
    * Everytime a schema definition is imported by the Designer, such name will be used when executing the Query from the IPC server, therefore, if the source/target schema definition name it's modified the Monitor will show the error: **WRT_8164 Error loading into source/target** because the IPC server can't find the schema. 
        * In order to solve this error yo should explicity declare the *Table Name Prefix*  and *Target Table Name* from the session options within the Workflow. 
* **Deleting duplicates (all columns) from the Source**
    * If it's neccesary to remove duplicate rows from the Source table, one option to erase such rows it's to **check the *distinct* box** inside the Designer -> Source Qualifier -> Edit transformations -> Properties -> Select distinct 
* 


# Informatica Power Center Transformations 
Section about each one of the all IPC transformations

## Source Qualifier
* The source Qualifier (SQ) is added automatically everytime a Source is drag to the *Mapping designer* 
* The main objective of the SQ is to **CREATE** a **SELECT** statement, could be a *single* statement without any restriction such as: *SELECT * FROM TABLE* or a *compound* statement with many restrictions such as: *SELECT DISTINCT * FROM TABLE WHERE CONDITION1=VALUE*
* The SQ advanced options could be defined at Mapping (Designer) level or at Session (Workflow) level.
* The SQ has the following options:
    * **Source Filter**: Enables to add a Filter (*WHERE* clause) 
        * Note: If a filter is added there is no need to add the **WHERE** clause, it's already added by the SQ transformacion, therefore the Source Filter will be as follows: 
            * LOCATION_TEST.ModifiedDate>='2018-01-01'
    * **Select Distinct**: Does a select statement will all the columns from the source. It's used in order to remove duplicate rows.
    * **Pre SQL**: enables to execute a SQL statement in the Source at Database Server level, before any session event.
        * Practical example: to add text to the columns or some *CASE* statement as a kind of view. 
    * **Post SQL**: enables to execute a SQL statement in the Source at Database Server level, after all session events 
        * Practical example: truncate the source table. 


### Importing from a flat file
* When defining the values from the CSV, **each row should match the datatype defined by the Target Definition**, if not, the Workflow will try to do a CAST and eventually will lead to an error type. 
* .........................


# Session Parameters


## Show the default Informatica Session (in the Workflow) Parameters
* The informatica default parameters will be available in the **Informatica Administrator**. To navigate do the following:
1. Login to the Informatica Administrator web link
2. Select the Integration Service in the Domain Navigator(on the left)
3. Select the Processes tab (on the right)
* By default: 
    * $PMRootDir: C:\Informatica\9.6.1\server\infa_shared
    * $PMSessionLogDir: $PMRootDir/SessLogs
    * $PMBadFileDir: $PMRootDir/BadFiles
    * $PMCacheDir: $PMRootDir/Cache
    * $PMTargetFileDir: $PMRootDir/TgtFiles
    * $PMSourceFileDir: $PMRootDir/SrcFiles
    * $PMExtProcDir: ./ExtProc
    * $PMWorkflowLogDir: $PMRootDir/WorkflowLogs
    * $PMLookuFileDir: $PMRootDir/LkpFiles
    * $PMStorageDir: $PMRootDir/Storage





























