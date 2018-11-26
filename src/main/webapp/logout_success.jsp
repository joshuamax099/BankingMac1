<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="headers/regheader.jsp"%>
	<hr>
	<div class="container">
		<div class="logout">
			<img src="img/logout.jpg" style="width:100px; height:100px;margin-left:45% ">
			<h3>Logout Successful</h3>
			<marquee style="color:blue;font-size:50px"><i>Thank you for visiting us.....</i></marquee>
		</div>
		<div id="logout-success">
			<a href="index.jsp"><button type="submit" class="submit-btn1" autofocus>Back to home page</button></a>
		</div> 
	</div>
	<script type="text/javascript" language="javascript">
		function disableBackButton() {
			window.history.forward()
		}
		disableBackButton();
		window.onload = disableBackButton();
		window.onpageshow = function(evt) {
			if (evt.persisted)
				disableBackButton()
		}
		window.onunload = function() {
			void (0)
		}
</body>
</html>