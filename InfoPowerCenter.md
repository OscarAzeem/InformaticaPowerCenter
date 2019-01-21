# Basic Configuration
* Some basic information about the basics

## Import A source File
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
* From the first time, no one ODBC connection is configured, in order to configure a new one you have to do the following: 
1. Open Designer
2. Select Source analyzer
3. Clic on the tree dots from the *ODBC data source* option. 
4. Clic System DNS
5. clic on add: 
	* ***IF THE FOLLOWING ERROR APPEARS: You are logged in with non-Administrative privileges. System DSNs could not be created or modified*** Follow the *Solving ODBC error* steps.

#### Solving the error: ODBC System DSN Warning You are logged on with non-Administrative privileges
* Cause: Some installations of MS Office block the creation of System DSNs and programs cannot be run as administrator [Cause Link](https://knowledge.exlibrisgroup.com/Voyager/Knowledge_Articles/Creating_ODBC_DSN_fails_ODBC_System_DSN_Warning_You_are_logged_on_with_non-Administrative_privileges "ODBC solution")
* Resolution steps: 
    1. Windows key, search the following: **odbcad32.exe**
    2. Right clic and select run as administrator.
    3. Add the new sytem dns (**Oracle in XE for the Informatica Installation**)



