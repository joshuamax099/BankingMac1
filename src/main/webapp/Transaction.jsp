<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- <form action="confirmaccount" method="post"> -->
<form action="addAmount" method="post">
Benificiary Account number:<input type="text" name="accNumber" value="${accno}" readonly /><br>
Purpose:<input type="text" name="purpose"/><br>
Amount:<input type="text" name="amount"/><br>
<input type="submit" value="submit"/>
 

<!--<input type="button" value="confirm amount" onclick="location.href='<c:url value="confirmaccount${accno}"/>'"> -->
</form>
</body>
</html>