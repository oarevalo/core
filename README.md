'Core' framework (v 1.4.2) 
===============
https://github.com/oarevalo/core

**Core** is a very lightweight and general purpose MVC framework for developing web applications in ColdFusion. Core is based on the MVC and Front Controller patterns and its goal is to be minimally intrusive and leverage existing 
CFML constructs instead of providing too many features.


> Copyright 2009-2012 - Oscar Arevalo (http://www.oscararevalo.com)
>
> Licensed under the Apache License, Version 2.0 (the "License"); 
> you may not use this file except in compliance with the License. 
> You may obtain a copy of the License at 
>
> http://www.apache.org/licenses/LICENSE-2.0 
>
> Unless required by applicable law or agreed to in writing, software 
> distributed under the License is distributed on an "AS IS" BASIS, 
> WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
> See the License for the specific language governing permissions and 
> limitations under the License. 


Contents:
-----------------------------------------------------
 - What Is It?
 - How Do I Use It?
 - How Do I Make it Do Something?
 - How Do I Configure It?
 - How Do I Add Settings & Services?


What is It?
-----------
'Core' is a very lightweight and general purpose MVC framework for developing web applications in ColdFusion. Core is based on the MVC and Front Controller patterns and its goal is to be minimally intrusive and leverage existing 
CFML constructs instead of providing too many features.



How Do I Use It?
----------------
You can use Core either from a central location or by including the 'core' directory within your application.

* The easiest ways to use it is by having your main `Application.cfc` extend `core.coreApp.cfc`; However you can also use coreApp by creating an instance of it, setting the appropriate settings and calling the `onRequestStart()` method on every request.

* Configure your application programmatically using the available config options (see next section)

* Create an index.cfm file with the following content:

    <cfinclude template="core/core.cfm">
	
* Define your application actions on CFCs (these are called event handlers). For convenience your event handler CFCs should extend core.eventHandler, but that is not a requirement.	
	
All the rest is up to you, but usually you will want to have some views and event handlers for your app to do anything useful.



How Do I Make it Do Something?
------------------------------
All 'core' actions are driven by a variable named 'event'. This can come from a URL, from a Form post, or from anywhere as long as its set before the call to the main onRequestStart() method 

**TIP:** you can also set the event variable on `onMissingTemplate()` in `Application.cfc`.

The event variable determines what event handler to execute. The rule is:

`event = something`
	This will execute the method something() on the main event handler (see config section)
	
`event = somecfc.something`
	This will execute the method something() on the component somecfc.cfc of the handlers directory

`event = somemodule.somecfc.something`
	This will execute the method something() on the component somecfc.cfc in the module somemodule


For convenience event handlers should extend core.eventHandler, since it provides a few methods that are useful to interact with the framework workflow:

`getValue(), setValue()` : gets or sets a value on the "request state" structure. This is available to views under the request.requestState structure
						
`setView()` : sets the name of a template to include as a view

`setLayout()` : sets the name of a template to use as a layout. Layouts must contain the following code to display the selected view:

    <cfinclude template="#request.requestState.viewTemplatePath#">	  

`setNextEvent()` : reloads the current request but pointing to a different event

`getSetting()` : retrieves the value of an application setting (NOT a framework setting) defined on the settings xml document.
				
`getService()` : retrieves the instance of an application service declared on the settings xml document.

`getPath()` : returns the resolved path for any framework element. Paths are returned as relative urls from the webroot. Any of the elements set on the `this.paths.*` variables can be used as the argument i.e: `getPath("app")` returns the path where the application is located.

`setMessage()` : Sets a system Message to be displayed on the view or layout. These messages are persistent across page redirects, but may only be displayed once. 




How Do I Configure It?
----------------------
All settings are done programatically by overriding variables defined in coreApp. All settings are optional, but you will most likely want to override at least some of those.

`this.mainHandler:`
	This is the name of the component used as the main event handler, core will call the methods `onApplicationStart()`, `onRequestStart()` and `onRequestEnd()` on the main handler if any of them exists. 
	Also, if the requested event is not qualified by an event handler CFC or by a module, it will call the event on the main handler. For example, typing the following URL on the browser will call the event "hello" on the main handler.: 

    http://your_server_name/index.cfm?event=hello 	

`this.defaultEvent:`
	This is the name of the event that will be called when no event is explicitly 	indicated

`this.defaultLayout:`
	This is the name of the layout template that will be used by default

`this.errorHandler:`
	An event to call whenever an error occurs.

`this.restartKey:`
	This is an arbitrary value that can be set to force a reload of the application upon deploy without explicitly requiring to use the resetApp flag. Whenever this value is set to something different, a reload will be done.

`this.configDoc:`
	This is the name of an optional xml file to provide application settings and to declare simple services to ba available as singletons.

`this.dirs.handlers:`
	Name of the directory (relative to the application root) where all handler CFCs will be stored.

`this.dirs.layouts:`
	Name of the directory (relative to the application root) where all layout templates will be stored.

`this.dirs.views:`
	Name of the directory (relative to the application root) where all view templates will be stored.

`this.dirs.modules:`
	Name of the directory (relative to the application root) where all modules will be stored.

`this.paths.app:`
	Path to where the application lives.

`this.paths.core:`
	Path to where the Core framework lives. By default assumes that its on a subdirectory named 'core' 

`this.paths.error:`
	Path to a template to show whenever an error occurs. Defaults to /path_to_core/includes/error.cfm

`this.paths.handlers:`
	Use this to indicate an explicit path for where to locate the event handlers. By default assumes that its on a subdirectory indicated by the setting this.dirs.handlers 

`this.paths.layouts:`
	Use this to indicate an explicit path for where to locate the layout templates. By default assumes that its on a subdirectory indicated by the setting this.dirs.layouts 

`this.paths.views:`
	Use this to indicate an explicit path for where to locate the views templates. By default assumes that its on a subdirectory indicated by the setting this.dirs.views 

`this.paths.modules:`
	Use this to indicate an explicit path for where to locate the modules. By default assumes that its on a subdirectory indicated by the setting this.dirs.modules 

`this.paths.config:`
	Use this to indicate an explicit path for where to locate the config file. If not empty, then this setting needs to point to the actual config file, 	if empty then core uses the setting this.configDoc to obtain the location
	of the file.

	

How Do I Add Settings & Services?
----------------------------------
**This is a completely optional feature**

'Core' allows you to declare a set of global values and services that are available to the entire application. 

Settings are simple key-value pairs, and Services are persistent instances of components.

Settings and Services are declared in an XML document. You can use the this.paths.config or this.configDoc settings to indicate the location of this xml document.

Both settings and services are stored in the Application scope and can be access from event handlers using the `getSetting()` and `getService()` methods.

To declare a setting use:
    
    <setting name="sampleSetting" value="some_value" />
	
To declare a service use:

    <service name="some_name" class="path.to.component">
		<init-param name="some_argument_name" settingName="name_of_a_setting" />
		<init-param name="some_other_name" serviceName="name_of_another_service" />
        <init-param name="yet_another_one">some_value</init-param />
    </service>

To force a reload of settings and services use the `resetApp=1` URL flag


