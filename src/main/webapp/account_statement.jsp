<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload="noBack();">
	<%@include file="headers/homeheader.jsp" %>>
	 
	<hr>
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
			<div class="col-md-9">
				<p>You are here:/ My Account / Account Statement</p>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<ul class="list-group">
					<a href="account_summary.jsp"><li class="list-group-item  ">Account Summary</li></a>
					<a href="account_statement.jsp"><li class="list-group-item list-group-item-action active">Account
						Statement</li></a>
					<li class="list-group-item list-group-item-action">Change
						Password</li>
				</ul>
			</div>
			<div class="col-md-9">
				 <div class="trans-home">
					<p style="font-size: 25px; background-color: #66b3ff; color: white">
						<b>Account Statement</b>
					<p>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Account No</th>
								<th>Branch</th>
								<th>Available Balance</th>
								<th>Transactions</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>31840970674</td>
								<td>BELTOLA</td>
								<td>20000.00</td>
								<td>Click here for last 10 transaction</td>
							</tr>

						</tbody>
					</table>
				</div>
		</div> 
	</div>
	<%@include file="footer/footer.jsp"%>
 
	 
</body>
</html>