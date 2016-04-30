<cfoutput>Today is: #now()#</cfoutput>
<cfdump var="#Application#" />
<cfdump var="#GetAuthUser()#" />
<cfif GetAuthUser() NEQ "">
	<cfoutput>
		<form action="securitytest.cfm" method="Post"><input type="submit" name="Logout" value="Logout" /></form>
	</cfoutput>
</cfif>
