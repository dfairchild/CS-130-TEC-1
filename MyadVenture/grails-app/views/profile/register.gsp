<%@ page import="myadventure.Profile" %>
<!DOCTYPE html>
<html>
	<head>
	
		<script type="text/javascript" src="http://platform.linkedin.com/in.js">
			api_key: x07lieazci3p
			onLoad: onLinkedInLoad
			scope: r_emailaddress r_fullprofile
			authorize: true
		</script>
		
		<script type="text/javascript">
		
		function onLinkedInLoad() {
			<!-- IN.UI.Authorize().params({"scope":["r_fullprofile", "r_emailaddress"]}).place(); -->
			IN.Event.on(IN, "auth", onLinkedInAuth);
		}
		
		function onLinkedInAuth() {
			IN.API.Profile("me").fields("firstName", "lastName", "emailAddress").result(displayProfiles);		
		}
		
		function displayProfiles(profiles) {
			var profilesDiv = document.getElementById("profiles");

			var members = profiles.values;
			for (var member in members) {
				profilesDiv.innerHTML += "<p>" + members[member].firstName + " " + members[member].lastName + 
				" has email " + members[member].emailAddress + " .";
			}
		}
		
		</script>
		
	</head>
	
	<body>
	
		<p> LinkedIn data is currently being updated to our database, this page will redirect to your
			profile shortly. </p>
			
		<script type="IN/Login"></script>
			
		<div id="profiles"></div>
	
	</body>
</html>