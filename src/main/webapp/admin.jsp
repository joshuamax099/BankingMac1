<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aam Adami Bank</title>
</head>
<body>
	<%@include file="/headers/homeheader.jsp"%>
	<hr>
	<div class="container-fluid">
		<div class="account-head">
			<div  class="row">
				<div id="date" class="col-md-3">
					<%=(new java.util.Date()).toLocaleString()%>

				</div>
				<div class="col-md-6">
					<marquee>
						<i>Please notify any unauthorized electronic transaction.</i>
					</marquee>
				</div>
				<div id="name"class="col-md-3">
					<p style="font-size:22px;">Welcome</p>
					<p id="name" style="margin: 0px;">
						<i>${user.salutation} ${user.firstName} ${user.lastName}</i>
					</p>
				</div>
			</div>
		</div>


		<iframe src="admincontrol.jsp" height="700" width="20%" ></iframe>
		<iframe src="viewapplicants" height="700" width="78%" name="iframe_a"></iframe>		
		
	</div>	
	<%@include file="footer/footer.jsp"%>
</body>
</html>