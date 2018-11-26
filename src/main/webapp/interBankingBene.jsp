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
	<%@include file="headers/homeheader.jsp"%>>
	${user.custID}
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
					<div class=" ">
						 
							 
						<p style="font-size:22px;font-weight: bold"></p><i>Your Account Details</i><p>
						<table class="table table-striped">
							 
							<tr>
								<th>Account Number</th>
								<th>Account holder name</th>
								<th>Balance</th>

							</tr>
							<c:forEach var="c1" items="${accountlist}">
								<tr>
									<td>${c1.accountNumber}</td>
									<td>${c1.accountHolderName}</td>
									<td>${c1.amount}</td>

									</td>

								</tr>
							</c:forEach>
						</table>
							
					</div>
					<br><br>
					<div class=" ">
						 
						 
    <p style="font-size:22px;font-weight: bold">List of Beneficiaries</p> 
	<table class="table table-striped">
                <th>Beneficiary Name</th>
                <th>Beneficiary Account Number</th>
                <th>Select beneficary</th>
              
            </tr>
            <c:forEach var="c1" items="${beneficarylist}">
                <tr>
                    <td>${c1.name}</td>
                    <td>${c1.accNumber}</td>
                    <td><input type="button" value="select benificiary"
						onclick="location.href='choosebenificiary${c1.bID}'">
                    
                    </td>
                  
                </tr>
            </c:forEach>
            </table>
						 
					</div>
					 
					<p class="p">* Selecting at least one beneficiary in mandatory</p>
					<a href="add_benificiary.jsp"><p class="p">* Click to add a beneficiary first if not added previously</p></a>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer/footer.jsp"%>


</body>
</html>