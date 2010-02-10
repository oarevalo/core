<cfcomponent extends="core.eventHandler">
	
	<cffunction name="onRequestStart">
		<cfset setMessage("info","Hey there!")>
	</cffunction>	
	
	<cffunction name="sayHello">
		<cfset setValue("hostname",CGI.server_name)>
		<cfset setView("hello")>
	</cffunction>
	
</cfcomponent>