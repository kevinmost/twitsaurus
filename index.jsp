<!DOCTYPE html>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="twitter4j.Query,twitter4j.QueryResult,twitter4j.Status,twitter4j.Twitter,twitter4j.TwitterException,twitter4j.TwitterFactory,twitter4j.conf.ConfigurationBuilder" %>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

		<title>Twitsaurus</title>

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
					<form class="navbar-form navbar-right" role="form" action="index.jsp" method="GET">
						<div class="form-group">
							<input type="text" placeholder="Enter text to search" class="form-control" name="search">
						</div>
						<button type="submit" value="Submit" class="btn btn-danger disabled">Search!</button>
					</form>
				</div>
			</div>
		</div>
		<div>
			<!-- Main component for a primary marketing message or call to action -->
			<div class="col-xs-4" id="column-twitter">
				<h2>Here's what people on Twitter are saying about <strong>"<%= request.getParameter("search") %>"</strong></h2>
				<%
					if (request.getParameter("search") !=  null) {
						ConfigurationBuilder cb = new ConfigurationBuilder();
						cb.setDebugEnabled(true)
						  .setOAuthConsumerKey("IumnEae0GIvKylSsJPbjA")
						  .setOAuthConsumerSecret("uXs22bo5zDCeX18ax5Fq4IgNxJbVmdJpShXvYUCD8")
						  .setOAuthAccessToken("2228768737-pqYhT8oJd7b6lRmznmGrgGphm9Jw5ePJ8TQnxf2")
						  .setOAuthAccessTokenSecret("SD0JwlGvOb9kipB4Bgom5E7p4j379mzArTRnNU4jEmKrD");
						TwitterFactory tf = new TwitterFactory(cb.build());
					
						Twitter twitter = tf.getInstance();
						
						Query query = new Query(request.getParameter("search"));
						QueryResult result = twitter.search(query);
						for (Status status : result.getTweets()) {
							out.println("<strong>@" + status.getUser().getScreenName() + ":</strong>" + status.getText());
							out.println("<br />");
						}
					}
				%>
			</div>

			<div class="col-xs-4" id="column-picture">			
				<h2>Here is a picture of <strong>"<%= request.getParameter("search") %>"</strong></h2>
				<% 
					String source = new BufferedReader(new InputStreamReader(new URL("http://" + request.getParameter("search") + ".jpg.to/").openStream())).readLine();
					out.println(source.replaceAll("(?<=img )(.*)(?=src)", ""));
				%>


			</div>

			<div class="col-xs-4" id="column-definition">
				<h2>Here is the definition of <strong>"<%= request.getParameter("search") %>"</strong></h2>
				<%
					URL url = new URL("http://www.thefreedictionary.com/p/" + request.getParameter("search"));
					URLConnection spoof = url.openConnection();
					
					spoof.setRequestProperty( "User-Agent", "Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; H010818)" );
					BufferedReader in = new BufferedReader(new InputStreamReader(spoof.getInputStream()));
					String strLine = "";
					source = "";
					while ((strLine = in.readLine()) != null){
						source += strLine + "\n";
					}
					
					String startDelimiter = "<div class=\"ds-single\">";
					if (source.contains(startDelimiter)) {
						source = source.substring(source.indexOf(startDelimiter));
						source = source.substring(startDelimiter.length(), source.indexOf("</div>"));
						out.println(source);
					}
					else {
						out.println("No definition found");
					}
				%>
			</div>
		</div>

		<div id="footer">
			<a href="http://www.ivefinancial.com/inc/store/store_eCommerce.php?id_corp=11777">BUY AD SPACE</a>
		</div>
		


		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/javascript.js"></script>
	</body>
</html>
