<cfcomponent extends="core.coreApp">
	
	<!--- Application settings --->
	<cfset this.name = "coresampleapp"> 

	<!--- Framework settings --->
	
	<!--- *** All settings are optional *** --->

	<!---
	this.mainHandler:
		This is the name of the component used as the main event handler,
		core will call the methods onApplicationStart, onRequestStart and onRequestEnd
		on the main handler if any of them exists. 
		Also, if the requested event is not qualified by an event handler CFC or by a
		module, it will call the event on the main handler. For example:
		index.cfm?event=hello 
		will call the event "hello" on the main handler.
	--->
	<cfset this.mainHandler = "main">

	<!---
	this.defaultEvent:
		This is the name of the event that will be called when no event is explicitly
		indicated
	--->
	<cfset this.defaultEvent = "sayHello">

	<!---
	this.errorHandler:
		An event to call whenever an error occurs.
	--->
	<cfset this.errorHandler = "">

	<!---
	this.restartKey:
		This is an arbitrary value that can be set to force a reload of the application
		upon deploy without explicitly requiring to use the resetApp flag.
		Whenever this value is set to something different, a reload will be done.
	--->
	<cfset this.restartKey = "">


	<!---
	this.configDoc:
		This is the name of an optional xml file to provide application settings and
		to declare simple services to ba available as singletons.
	--->
	<cfset this.configDoc = "">

	<!---
	this.dirs.handlers:
		Name of the directory (relative to the application root) where all handler 
		CFCs will be stored.
	--->
	<cfset this.dirs.handlers = "">


	<!---
	this.dirs.layouts:
		Name of the directory (relative to the application root) where all layout
		templates will be stored.
	--->
	<cfset this.dirs.layouts = "">


	<!---
	this.dirs.views:
		Name of the directory (relative to the application root) where all view
		templates will be stored.
	--->
	<cfset this.dirs.views = "">


	<!---
	this.dirs.modules:
		Name of the directory (relative to the application root) where all modules
		will be stored.
	--->
	<cfset this.dirs.modules = "">


	<!---
	this.paths.app:
		Path to where the application lives.
	--->
	<cfset this.paths.app = getDirectoryFromPath(cgi.script_name)>

	<!---
	this.paths.core:
		Path to where the Core framework lives. By default assumes that its on a
		subdirectory named 'core' 
	--->
	<cfset this.paths.core = "">


	<!---
	this.paths.error:
		Path to a template to show whenever an error occurs. 
		Defaults to /path_to_core/includes/error.cfm
	--->
	<cfset this.paths.error = "">


	<!---
	this.paths.handler:
		Use this to indicate an explicit path for where to locate the event handlers. 
		By default assumes that its on a subdirectory indicated by the 
		setting this.dirs.handlers 
	--->
	<cfset this.paths.handlers = "">


	<!---
	this.paths.layouts:
		Use this to indicate an explicit path for where to locate the layout templates. 
		By default assumes that its on a subdirectory indicated by the 
		setting this.dirs.layouts 
	--->
	<cfset this.paths.layouts = "">


	<!---
	this.paths.views:
		Use this to indicate an explicit path for where to locate the views templates. 
		By default assumes that its on a subdirectory indicated by the 
		setting this.dirs.views 
	--->
	<cfset this.paths.views = "">


	<!---
	this.paths.modules:
		Use this to indicate an explicit path for where to locate the modules. 
		By default assumes that its on a subdirectory indicated by the 
		setting this.dirs.modules 
	--->
	<cfset this.paths.modules = "">


	<!---
	this.paths.config:
		Use this to indicate an explicit path for where to locate the config file.
		If not empty, then this setting needs to point to the actual config file,
		if empty then core uses the setting this.configDoc to obtain the location
		of the file.
	--->
	<cfset this.paths.config = "">	
	
</cfcomponent>
