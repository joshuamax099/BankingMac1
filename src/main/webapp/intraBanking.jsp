<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action= "intrabanking" method="post">


<h1>Benificiary Details</h1>
<table>
<tr>
<th>Name</th>
<th>Account number</th>
<th>IFSC</th>
</tr>

<c:forEach items="${message}" var="list">


<tr>
<td>${list.name}</td>
<td>${list.accNumber} </td>
<td>${list.IFSC}</td>
<td><input type="button" value="select benificiary" onclick="location.href='<c:url value="selectedbenificiary${list.bID}"/>'"> </td>
 


</tr>

</c:forEach>
</table>
</form>
</body>
</html>