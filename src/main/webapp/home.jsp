<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%if(session.getAttribute("user")!=null){ %>
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
						<i>${user.salutation}. ${user.firstName} ${user.lastName}</i>
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
			<div class="col-md-9"></div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<ul class="list-group">
					<a href="#"><li class="list-group-item active">Account
							Summary</li></a>

					<a href="forgotPassword.jsp">
						<li class="list-group-item list-group-item-action">Change
							Password</li>
					</a>
				</ul>
			</div>
			<div class="col-md-9">
				<div class="trans-home">
					<p style="font-size: 25px; background-color: #66b3ff; color: white">
						<b>Transaction Account</b>
					<p>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Account No</th>
								<th>Account Type</th>
								<th>Available Balance</th>
								<th>Transactions</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${user.account.accID}</td>
								<td>${user.account.accountType}</td>
								<td>${user.account.amount}</td>
								<td><a href="lastTrans">Click here for last 10
										transaction</a></td>
							</tr>

						</tbody>
					</table>

		<div class="row">
			<table class="table table-striped">
				<th>Transaction ID</th>
				<th>Account ID</th>
				<th>Transaction Type</th>
				<th>Amount</th>
				<th>IFSC</th>
				<th>BID</th>
				</tr>
				<c:forEach var="c1" items="${lst}">
					<tr>
						<td>${c1.tID}</td>
						<td>${c1.accID}</td>
						<td>${c1.TransType}</td>
						<td>${c1.amount}</td>
						<td>${c1.ifsc}</td>
						<td>${c1.bID}</td>
						 

					</tr>
				</c:forEach>
			</table>
		</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer/footer.jsp"%>
	<%} else{response.sendRedirect("session_out.jsp");}%>

</body>
</html>