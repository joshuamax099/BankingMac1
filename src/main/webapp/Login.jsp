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
	<%if(request.getSession(false)==null){   
	  response.sendRedirect("Login.jsp");
	  } %>
		  
	<%@ include file="headers/regheader.jsp"%>
	<div class="border"></div>
	<div class="container-fluid">
	

		<div class="row">
			<div class="col-lg-12">
				<p style="background-color: #42bcf4; color: white; font-size: 25px">
					<b>Login to Aam Aadmi Bank</b>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="login-form">
					<p style="color:red"><i>${message}</i></p>
					<form action="Login" method="POST">
						<p>Customer ID*</p>
						<input type="text" name="custID" required><label><p style="margin-left: 2.5em">
								<a href="register.jsp">New User? Register</a>
							</p></label>

						<p>Password*</p>
						<input type="password" name="password" required><label><p style="margin-left: 2.5em">
								<a href="forgotPassword.jsp">Forgot Password</a>
							</p></label> <br>
						<button type="submit" class=".submit-btn1">Login</button>
						<button type="reset" class=".submit-btn2">Reset</button>
					</form>
				</div>
			</div>
			<div class="col-md-6">
				<img src="img/keyboard.png" style="height: 350px; width: 100%"
					alt="asd" />
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
	  <%@include file="footer/footer.jsp" %> 
</body>
</html>