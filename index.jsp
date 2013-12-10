<!DOCTYPE html>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

		<title>Fixed Top Navbar Example for Bootstrap</title>

		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.css" rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="css/style.css" rel="stylesheet">

		<!-- Just for debugging purposes. Don't actually copy this line! -->
		<!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
	</head>

	<body>

		<!-- Fixed navbar -->
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Twitsaurus</a>
					<form class="navbar-form navbar-right" role="form">
						<div class="form-group">
							<input type="text" placeholder="Enter text to search" class="form-control">
						</div>
						<button type="submit" class="btn btn-success">Search!</button>
					</form>
				</div>
			</div>
		</div>

		<!-- Main component for a primary marketing message or call to action -->
		<div class="col-xs-4">
			TWITTER FEED GOES HERE
		</div>

		<div class="col-xs-4">			
			<% 
				String source = new BufferedReader(new InputStreamReader(new URL("http://banana.jpg.to/").openStream())).readLine();
				out.println("<img src=\"" + source.substring(source.indexOf("src=")+5, source.lastIndexOf("\"")) + "\" /\"");
			%>


		</div>

		<div class="col-xs-4">
			DICTIONARY ENTRY GOES HERE
		</div>

		<div class="jumbotron">
			AD SPACE GOES HERE

			<p>Also here is the time just because I can motherfucker: <%= new java.util.Date() %> </p>
		</div>
		


		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>
