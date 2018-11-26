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
				<form id="forgot-form" action="change" method="POST">
								<marquee><p style="font-size:22px; color:orange"><i> Please Answer you security question to reset password</i></p></marquee> 
								 
								 <div class="form-group">
									<label for="bac">Enter your CustID:</label> <input
										type="text" class="form-control" pattern="{3,20}" id="pwd" name="custID">
								</div>
								 
								 <div class="form-group">
									<label for="bac">Enter new password:</label> <input
										type="text" class="form-control" pattern="{3,20}" id="pwd" name="password">
								</div>
								 
									  
								 
								 
								 
								<input type="submit" class="btn btn-default"> </input>
				</form>
			</div>
		</div>

	</div>
	<%@include file="footer/footer.jsp"%>
	
</body>
</html>