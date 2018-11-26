<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="BenificiaryDetails" method="POST">
Benificiary Name:<input type="text" name="name"/><br>
Benificiary Account Number:<input type="text" name="accNumber"/><br>
IFSC Code:<input type="text" name="IFSC"/><br>
<input type="submit" value="Add Benificiary"/>

</form>
	${message}
</body>

</html>