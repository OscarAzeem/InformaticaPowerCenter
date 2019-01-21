# General Info
* The Informatica power center clients works on 32 bits, when configuring an ODBC connnection from the clients to a certain DATABASE it's neccesary to use an ODBC 32 bits driver. It's possible to follow the installation (Domain Databases and Repository databases) on a 64 bit database server, but when adding a source from the Informatica Designer, you should use a 32 bits driver. [Info about the 32 bits ODBC driver](https://network.informatica.com/thread/85144 "ODBC driver problem")

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

## Add a Relational connection from the Workflow Designer
1. Open the Informatica Workflow Designer
2. Select the type of connection (where it's the source and target tables)
3. clic on New
4. Give a Name and complete the user and password requirements.
5. In connection write the **SERVICE_NAME** as the tnsnames.ora file, **XE** in this case. 
