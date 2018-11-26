<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Aam Adami Bank</title>
<link rel="shortcut icon" href="img/favicon.ico">

<!-- Global Stylesheets -->

</head>

<body id="page-top">
	<%
		if (request.getSession(false) == null) {
			response.sendRedirect("Login.jsp");
		}
	%>
	${user.custID}
	<%@ include file="headers/regheader.jsp"%>
	<div class="border"></div>
	<div class="container-fluid">


		<div class="row">
			<div class="col-lg-12">
				<p
					style="background-color: #42bcf4; color: white; font-size: 30px; text-align: center">
					<b>Application Status</b>
				</p>
			</div>
		</div>
		<div class="row">

			<div class="col-md-4">
				<img src="img/abc.jpg" style="height: 350px; width: 100%"
					alt="asd" />
			</div>

			<div class="col-md-8">
				<div class="login-form">
					<p >
						<h1 style="color: red">Status:<i>${message}</i></h1>
					</p>
					<h5 style="color: red">Please note the Transaction ID</h5>
					
					<form action="Login" method="POST">
						Your status is :${message}
						<table class="table table-hover">
							<thead>
								<tr>
									
									<th scope="col">Customer ID</th>
									<th scope="col">Account Number</th>
									<th scope="col">Account Holder name</th>
									<th scope="col">Transaction ID</th>
									<th scope="col">Balance</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${acc.custID}</td>
									<td>${acc.accountNumber}</td>
									<td>${acc.accountHolderName}</td>
									<td>${acc.transPassword}</td>
									<td>${acc.amount}</td>
								</tr>
								</tbody>
								</table>
					</form>
					<a href="index.jsp"><button type="submit" class="btn btn-primary" margin-left="40%">Back to Home Page</button></a>
					
				</div>
			</div>
			 
		</div>


		<div class="row" style="magrin: 0 10px 0 10px;">
			<div class="col-lg-4">
				<div class="login-box">
					<div style="background-color: #f2f2f2; color: black;">


						<p>
							<span class="glyphicon glyphicon-print"></span> NEVER respond to
							any popup,email, SMS or phone call, no matter how appealing or
							official looking, seeking your personal information such as
							username, password(s), mobile number, ATM Card details, etc. Such
							communications are sent or created by fraudsters to trick you
							into parting with your credentials.
						</p>
					</div>

				</div>
			</div>
			<div class="col-lg-4">
				<div class="login-box">

					<div
						style="background-color: #f2f2f2; color: black; height: 160px;">
						<p>complaints</p>
					</div>

				</div>
			</div>
			<div class="col-lg-4">
				<div class="login-box">

					<div
						style="background-color: #f2f2f2; color: black; height: 160px;">
						<p>This site is certified by Verisign as a secure and trusted
							site. All information sent or received in this site is encrypted
							using 256-bit encryption</p>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%@include file="footer/footer.jsp"%>
</body>
</html>