<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

hello

<form>
${applicant.custID}<br>
${applicant.firstName}<br>
${applicant.add.state}<br>
${applicant.misc.accountType}<br>
${applicant.status}<br>

<c:set var="status" value="Applicant"></c:set>
<c:set var="status1" value="Customer"></c:set>


<c:if  test="${applicant.status eq status}">
<input type="submit" value="Approve" formaction="approvalstatusApprovel">
<input type ="submit" value="Reject" formaction="approvalstatusReject">
</c:if>

<c:if  test="${applicant.status eq status1}">
<input type="submit" value="delete" formaction="deletecustomers">
</c:if>




</form>
</body>
</html>