<!doctype HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head><title>
			Security test page
		</title></head>
	<body>
		<cfoutput><h2>Welcome #GetAuthUser()#!</h2></cfoutput>
		ALL Logged-in Users see this message.
		<br />
		<br />

		<cfscript> 
		    if (IsUserInRole("Human Resources")) 
		        WriteOutput("Human Resources members see this message.<br><br>"); 
		    if (IsUserInRole("Documentation")) 
		        WriteOutput("Documentation members see this message.<br><br>"); 
		    if (IsUserInRole("Sales")) 
		        WriteOutput("Sales members see this message.<br><br>"); 
		    if (IsUserInRole("Manager")) 
		        WriteOutput("Managers see this message.<br><br>"); 
		    if (IsUserInRole("Employee")) 
		        WriteOutput("Employees see this message.<br><br>"); 
		    if (IsUserInRole("Contractor")) 
		        WriteOutput("Contractors see this message.<br><br>"); 
		</cfscript> 
	</body>
</html>
