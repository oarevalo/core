<cfset rs = request.requestState />

<cfoutput>
	<p>
		Hello from '#rs.hostName#'
	</p>
	<p>
		Current application path is <b>#rs.appPath#</b><br />
	</p>
</cfoutput>