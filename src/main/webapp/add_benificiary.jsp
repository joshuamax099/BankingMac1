<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="jquery.bootstrap.year.calendar.css">

<script src="jquery.bootstrap.year.calendar.js"></script>

<title>Insert title here</title>
</head>
<body>
	<%@include file="headers/homeheader.jsp"%>>

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
			${message}
			<div class="col-md-9">
				<p>You are here:/ Add Beneficiary</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<ul class="list-group">
					<a href="add_benificiary.jsp"><li
						class="list-group-item active ">Add Beneficiary</li></a>
					<a href="intraBanking.jsp"><li class="list-group-item">IntraBanking</li></a>
					<a href="interBanking.jsp"><li class="list-group-item ">InterBanking</li></a>
				</ul>
			</div>



			<div class="col-md-9">
				<div class="trans-home">
					<p style="font-size: 25px; background-color: #66b3ff; color: white">
						<b>Transaction Account</b>
					<p>
					<div class="ben-form">
						<form action="BenificiaryDetails" method="POST">
							<div class="form-group">
								<label for="email">Beneficiary Name:</label> <input type="text"
									class="form-control" id="name" title="atleast 3 minimum character" pattern="[A-Za-z]{3,20}" name="name" required>
							</div>
							<div class="form-group">
								<label for="bac">Beneficiary Account Number:</label> <input
									type="number" class="form-control" pattern=[0-9]{16} id="pwd" title="account number should be of 16 digit"name="accNumber" required>
							</div>
							<div class="form-group">
								<%!String IFSC[] = {"AAB102","AAB106","SBI102","AAB104"};int l = 0;%>
								<label>Select your branch IFSC code* </label><select name="IFSC" required="required">
								 	<%for(l=0;l<IFSC.length;l++){%>
								 		<option><option value="<%=IFSC[l]%>"><%=IFSC[l]%></option>
								 	 <%
									}
								%>
								</select>
							</div>
							<div class="checkbox">
								<label><input type="checkbox"> Remember me</label>
							</div>
							<input type="submit" class="btn btn-default"> </input>
						</form>
						${message}
					</div>
					<hr>
					<p class="p">* All fields are mandatory</p>
					<p class="p">* The IFSC should be 11 digit aplha-numeric code</p>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer/footer.jsp"%>


</body>
</html>