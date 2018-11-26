<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@include file="/headers/regheader.jsp"%>
	<hr>

	<div class="container-fluid">
		<div class="main-form">
			<form action="services" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-lg-12">
						<p
							style="background-color: #66b3ff; color: white; font-size: 20px">
							<b>About Fund Transfer</b>
						</p>
					</div>
				</div>
				<p>* With AAB.com, transferring funds from your AAM ADMI Bank
					Account is very simple and convenient. There are various options
					provided online for transferring funds.</p>

				<h5>1.Inter Bank Transfer</h5>
				<P>Inter Bank Transfer enables electronic transfer of funds from
					the account of the remitter in one Bank to the account of the
					beneficiary maintained with any other Bank branch. There are two
					systems of Inter Bank Transfer – RTGS and NEFT. Both these systems
					are maintained by Reserve Bank of India.</P>

				<p>RTGS- Real Time Gross Settlement- This is a system where the
					processing of funds transfer instructions takes place at the time
					they are received (real time). Also the settlement of funds
					transfer instructions occurs individually on an instruction by
					instruction basis (gross settlement). RTGS is the fastest possible
					interbank money transfer facility available through secure banking
					channels in India.</p>

				<p>NEFT- National Electronic Fund Transfer- This system of fund
					transfer operates on a Deferred Net Settlement basis. Fund transfer
					transactions are settled in batches as opposed to the continuous,
					individual settlement in RTGS. Presently, NEFT operates in hourly
					batches from 9 am to 7 pm on week days and Working Saturdays</P>
				<h5>2. Minimum/maximum amount for RTGS/NEFT transactions under
					Retail Internet Banking</h5>

				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">Type</th>
							<th scope="col">Minimum</th>
							<th scope="col">Maximum</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">NEFT</th>
							<td>No Minimum</td>
							<td>Rs.5 Lakhs</td>

						</tr>
						<tr>
							<th scope="row">RTGS</th>
							<td>Rs.2 Lakhs</td>
							<td>Rs.5 Lakhs</td>

						</tr>
					</tbody>
				</table>
				<h5>3.Intra Bank Transfer</h5>
				<p>It is used to realize transfer between savings account added
					to Internet banking of a corporate customer and savings account of
					the Bank within Metropolitan Bank, and provide functions of
					beneficiary selection and saving with currency limited to RMB.</p>

			</form>
		</div>
		
	</div>
	<%@include file="footer/footer.jsp"%>
	
	 
</body>
</html>