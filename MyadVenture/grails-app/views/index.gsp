<!DOCTYPE html>

<html>

<!-- This is the opening page of the WebApp so this is where I am putting the log-in functionality -->

	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
            
			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
		
		<!-- Log-In via Linked-In Functionality -->
			
		<script type="text/javascript" src="http://platform.linkedin.com/in.js">
			api_key: x07lieazci3p
			onLoad: onLinkedInLoad
			scope: r_emailaddress r_fullprofile
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
		
		<!-- End Log-In Via Linked-In -->
		
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Application Status</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>Grails version: <g:meta name="app.grails.version"/></li>
				<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h1>Installed Plugins</h1>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1>Welcome to Grails</h1>
			<p>Congratulations, you have successfully started your first Grails application! At the moment
			   this is the default page, feel free to modify it to either redirect to a controller or display whatever
			   content you may choose. Below is a list of controllers that are currently deployed in this application,
			   click on each to execute its default action:</p>

			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
			
			<!-- Log-In Via LinkedIn -->
			<script type="IN/Login"></script>
			
			<script type="IN/Login">
				<g:formRemote name="Login Form"
			</script>
			
			<!--script type="IN/Login"> 
				<form action="/register.html"> 
					<p>Your Name: <input type="text" name="name" value="<?js= firstName ?> <?js= lastName ?>" /></p>
					<p>Your Password: <input type="password" name="password" /></p>
					<input type="hidden" name="linkedin-id" value="<?js= id ?>" />
					<input type="submit" name="submit" value="Sign Up"/>
			</script-->
			<div id="profiles"></div>
			
			<oauth:connect provider="linkedin"> Login in via LinkedIn -- Grails oAuth </oauth:connect>
			<!-- End Log-In Via LinkedIn -->
			
		</div>
	</body>
</html>
