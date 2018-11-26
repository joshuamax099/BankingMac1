<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="headers/homeheader.jsp"%> 

	 
	<div class="container-fluid">
		<div class="account-head">
			<div class="row">
				<div id="date" class="col-md-3">
					<%=(new java.util.Date()).toLocaleString()%>

				</div>
				<div class="col-md-6">
					<marquee>
						<i>Please notify any unauthorized electronic transaction.</i>
					</marquee>
				</div>
				<div id="name" class="col-md-3">
					<p style="font-size: 22px;">Welcome</p>
					<p id="name" style="margin: 0px;">
						<i>${user.salutation} ${user.firstName} ${user.lastName}</i>
					</p>
				</div>
			</div>
		</div>
		<hr>


		<div class="row">
			<div class="col-md-3">
				<p style="font-size: 20px; background-color: #4d4d4d; color: white">Quick
					Links</p>
			</div>

		</div>

		<div class="row">
			<div class="col-md-3">
				<ul class="list-group">
					<a href="add_benificiary.jsp"><li class="list-group-item ">Add
							Beneficiary</li></a>
					<a href="interBanking.jsp"><li class="list-group-item active">InterBanking</li></a>
					<a href="intraBanking.jsp"><li class="list-group-item">IntraBanking</li></a>
				</ul>
			</div>
			<div class="col-md-9">
				<div class="trans-home">
					<c:if var="neft" test="${not empty neftdata }">

					<p style="font:22px;font-weight: bold">Your transfer has been successfully completed</p> 
					</c:if>
					<c:if test="${neft == true }">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td>Name</td>
									<td>${remitter.accountHolderName}</td>
								</tr>
								<tr>
									<td>Account No</td>
									<td>${remitter.accountNumber}</td>
								</tr>
								<tr>
									<td>Amount</td>
									<td>&#8377;&nbsp;${neftdata.get(0)}</td>
								</tr>
								<tr>
									<td>GST</td>
									<td>&#8377;&nbsp;${neftdata.get(2)}</td>
								</tr>
								<tr>
									<td>Total</td>
									<td>&#8377;&nbsp; ${neftdata.get(3)} </td>
								</tr>
							</tbody>
						</table>
					</c:if>
					  
						<a href="home.jsp"> <button style="margin-left:40%" type="submit" >Back to home</button></a>
					 

				</div>
			</div>
		</div>
	</div>
	<%@include file="footer/footer.jsp"%>


</body>
</html>