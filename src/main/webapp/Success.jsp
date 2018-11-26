<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
	<%@include file="headers/regheader.jsp" %>
	<hr>
	<div class="container">
	
	<h1>Thank you for applying</h1>
	<h3>You can check your status after 24 hours</h3>
	<h3 style="color: red">Please note the Customer ID</h3>
	<table class="table table-striped">
    <thead>
      <tr>
        <th>Application Id</th>
        <th>Applicant Name</th>
        <th>Applicant Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>${reguser.custID}</td>

        <td>${reguser.firstName} ${reguser.middleName} ${reguser.lastName}</td>
        <td>${reguser.emailID}</td>
      </tr>
      
      
      
    </tbody>
  </table>
	 
		<a href="index.jsp"><button type="submit" class="submit-btn1">Back to home page</button></a>
	</div>
</body>
</html>