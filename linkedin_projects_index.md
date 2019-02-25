# Building a Workflow and Mapping metadata table using predefined Workflow and Built-in variables from Informatica PowerCenter

1. Introduction
	1. Benefits: wouldn't be cool to have an only place to review all the metadata every time a workflow and mapping is run
	2. Predefined Workflow Variables
		1. Introduction
		2. IPC help
	3. Built-In variables
		1. Introduction
		2. IPC help
		3. Using predefined workflow variables in a mapping and using built in variables in a workflow. 
	4. Prerrequisites
		1. A database in which store al the medatata METADATA_IPC
		2. A session who actually reads and writes data SRDT
2. Example
	1. Target analyzer, adding the target
	3. Building the Workflow
		1. Workflow Variables
		2. Build-in variables
		1. Adding the session with such mapping
		2. Configuring the session (post session assignment)
	5. Bulding the assignment task
	4. Adding the built-in variables from the SRDT mapping session
	2. Source Analyzer, adding a Dummy Variable
	6. Building the mapping who writes in the database
	7. Adding the new mapping to a new session within the workflow
		1. Configuring the session (pre session assignment)
	8. Executing the workflow!