<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	
<form method="post" >
	<table border="1" cellpadding="5">
            <caption><h2>List of Applicants</h2></caption>
            <tr>
                <th>Customer ID</th>
                <th>Applicant Name</th>
                <th>View applicant</th>
              
            </tr>
            <c:forEach var="c" items="${adminlist}">
                <tr>
                    <td>${c.custID}</td>
                    <td>${c.firstName}</td>
                    <td><input type="button" value="viewsingleapplicant" onclick="location.href='<c:url value="singleapplicant${c.custID}"/>';">
                    </td>
                  
                </tr>
            </c:forEach>
            </table>

</form>

</body>
</html>