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
	 <%if(session.getAttribute("user")!=null){ %>
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
					<p style="font-size: 25px; background-color: #66b3ff; color: white">
						<b>Transaction Account</b>
					 	<div class="ben-form">
						 <p style="color:red">${transpassstatus}</p>
						 <p style="color:red">${neftstatus}</p>
							<form action="confirm" method="POST">
								<div class="form-group">
									<label for="amount">Enter Ammount:</label> <input type="number" min="0" max="500000"
										class="form-control" id="name" name="amount" required>
								</div>
								<div class="form-group">
									<label for="bac">Enter Purpose:</label> <input
										type="text" pattern="[A-Za-z]{3,20}" title="must be minimum of 3 charachters"class="form-control" id="purpose" name="purpose">
								</div>
								 <div class="form-group">
									<label for="bac">Enter Transaction Id:</label> <input
										type="text" class="form-control" id="purpose" name="transpass"  pattern=[0-9]{3,8} title="must be a three digit number" required>
								</div>
								<div class="checkbox">
									<label><input type="checkbox"> Remember me</label>
								</div>
								<input type="submit" class="btn btn-default"> </input>
							</form>
						</div>
					<br><br>
					<hr>
					<p class="p">* All fields are mandatory</p>
					<p class="p">* The IFSC should be 11 digit aplha-numeric code</p>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer/footer.jsp"%>
<%} else{response.sendRedirect("session_out.jsp");}%>

</body>
</html>