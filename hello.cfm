<cfset rs = request.requestState />

<cfoutput>
	<p>
		Hello from '#rs.hostName#'
	</p>
</cfoutput>