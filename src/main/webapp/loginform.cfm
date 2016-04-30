<h2>Please Log In</h2>
<cfoutput>
	<form action="#CGI.script_name#?#CGI.query_string#" method="post">
		<table>
			<tr>
				<td>user name:</td>
				<td><input type="text" name="j_username" /></td>
			</tr>
			<tr>
				<td>password:</td>
				<td><input type="password" name="j_password" /></td>
			</tr>
		</table>
		<br />
		<input type="submit" value="Log In" />
	</form>
</cfoutput>
