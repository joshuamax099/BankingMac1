<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="headers/cssfile.jsp"%>

</head>
<body>
	<%if(session.getAttribute("user")!=null){ %>
	
	<%@include file="headers/homeheader.jsp"%>
	<%}else{ %>
	<%@include file="headers/regheader.jsp"%>
	<%} %>
	<hr>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<img src="img/forgot.jpg">
			</div>
			
			<div class="col-md-6">
				<form id="forgot-form" action="forgotPassword" method="POST">
								<marquee><p style="font-size:22px; color:orange"><i> Please Answer you security question to reset password</i></p></marquee> 
								<div class="form-group">
								 
								 <div class="form-group">
									<label for="customerid">Your Customer ID:</label> <input
										type="text" class="form-control" placeholder="Your answer" pattern="[0-9]{3,20}" id="customerid" title="Must be a number and contains 3 to 20" name="custID" required>
								</div>
								 
									  
								<div class="form-group">
									<label for="securityquestion">Security Question:</label> <input
										type="text" class="form-control" placeholder="Your answer"  Pattern="[A-Za-z0-9]{1,20}"  title="contains 1 to 20 character "  name="answer" required>
								</div>
								 
								<input type="submit" class="btn btn-default"> </input>
				</form>
			</div>
		</div>

	</div>
	<%@include file="footer/footer.jsp"%>
	
</body>
</html>