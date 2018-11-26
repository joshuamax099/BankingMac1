<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
<style type="text/css">
.madatory {
	color: red;
}
</style>
<link rel="shortcut icon" href="img/favicon.ico">

<!-- Global Stylesheets -->



</head>

<body id="page-top">
	<%@ include file="headers/regheader.jsp"%>
	<%
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = formatter.format(date);
	%>

	<!--  Personal Details  -->
	<div class="container-fluid">
		<div class="main-form">
			<form action="register" method="post">
				<div class="row">
					<div class="col-lg-12">
						<p
							style="background-color: #66b3ff; color: white; font-size: 20px">
							<b>Personal Details</b>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<p>
							Customer Name<span class="madatory">*</span>
						</p>
					</div>
					<div class="col-md-9">
						<select name="salutation">
							<option value="mr">Mr</option>
							<option value="mrs">Mrs</option>
							<option value="miss">Miss</option>
							<option value="others">Others</option>
						</select> <label>First Name</label> <input type="text"
							placeholder="First Name" name="firstName"
							pattern="[A-Za-z]{3,20}"
							title="must be a character only and can contain 3 to 20 character"
							required> <label>Middle Name</label><input type="text"
							pattern="[A-Za-z]{1,20}" placeholder="Middle Name"
							title="must be a character only and can contain 1 to 20 character"
							name="middleName"> <label> Last Name</label> <input
							type="text" placeholder="Last Name" pattern="[A-Za-z]{1,20}"
							name="lastName"
							title="must be a character only and can contain 1 to 20 character"
							required>


					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<p>
							Gender<span class="madatory">*</span>
						</p>
					</div>
					<div class="col-md-9">

						<input type="radio" name="gender" value="male" checked>
						Male <input type="radio" name="gender" value="female">
						Female <input type="radio" name="gender" value="other">
						Other

					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<p>
							Date of birth<span class="madatory">*</span>
						</p>
					</div>
					<div class="col-md-9">
						<input id="date" type="date" onkeydown="return false"
							name="dateOfBirth" min="1980-01-01" max=<%=strDate%> required>
						<label> Place of birth</label><input id="date" type="text"
							pattern="[A-Za-z]{4,20}" name="placeOfBirth"
							title="must be a character only" required>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3">
						<p>
							Nationality<span class="madatory">*</span>
						</p>
					</div>
					<div class="col-md-9">
						<%!String country[] = {"Indian"};
	int i = 0;%>
						<select name="nationality" required="required">
							<%
								for (i = 0; i < country.length; i++) {
							%><option value="<%=country[i]%>"><%=country[i]%></option>
							<%
								}
							%>
						</select>

					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<p>Citizenship*</p>
					</div>
					<div class="col-md-9">
						<%!String citizenship[] = {"Native", "Descent"};
	int j = 0;%>
						<select name="citizenship" required="required">
							<%
								for (i = 0; i < citizenship.length; i++) {
							%><option value="<%=citizenship[i]%>"><%=citizenship[i]%></option>
							<%
								}
							%>
						</select>

					</div>
				</div>

				<div class="row">
					<div class="col-md-3">
						<p>Martial Status*</p>
					</div>
					<div class="col-md-9">

						<input type="radio" name="martialStatus" value="Single" checked>
						Single <input type="radio" name="martialStatus" value="Married">
						Married <input type="radio" name="martialStatus" value="Divorced">
						Divorced

					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<p>Aadhar Number*</p>
					</div>
					<div class="col-md-9">

						<input type="text" placeholder="Enter Aadhar Number "
							name="adharCardNumber" pattern="[0-9]{12}"
							title="must be a number and must have 12 digits only"
							required="required">
					</div>
				</div>

				<div class="row">
					<div class="col-md-3">
						<p>Pan Number*</p>
					</div>
					<div class="col-md-9">

						<input type="text" placeholder="Enter Pan Number "
							name="panNumber" pattern="[A-Z]{4}[0-9]{6}"
							title="must be a 10 digits alphanumeric number only first 4 alphabets and rest 6 numbers"
							required="required">
					</div>
				</div>

				<div class="row">
					<div class="col-md-3">
						<p>Enter Email ID*</p>
					</div>
					<div class="col-md-9">

						<input type="email" placeholder="Enter Email ID"
							pattern=[A-Za-z.@]{8,15}
							title="must contain @ and.com only and 8 to 15" name="emailID"
							required="required"> <label> Mobile Number </label><input
							id="mobile" type="text" pattern=[7-9]{1}[0-9]{9}
							title="Must be 10 digit first number should be 7 or 9"
							placeholder="Enter Mobile Number" name="phoneNumber"
							required="required">
					</div>
				</div>

				<div class="row">
					<div class="col-md-3">
						<p>Password*</p>
					</div>
					<div class="col-md-9">

						<input type="password" id="password"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}"
							title="must contain an uppercase,lowercase and number and can only consist 8-15 characters"
							placeholder="Enter password " name="password" required="required">
					</div>
				</div>

				<div class="row">
					<div class="col-md-3">
						<p>Confirm password*</p>
					</div>
					<div class="col-md-9">

						<input type="password" id="confirm_password"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}"
							title="must contain an uppercase,lowercase and number and can only consist 8-15 characters"
							placeholder="Confirm password " required="required">
					</div>
				</div>
				<!--  Personal Details  -->



				<!--  Address Details  -->
				<div class="row">
					<div class="col-lg-12">
						<p
							style="background-color: #66b3ff; color: white; font-size: 20px">Address
							Details</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<p>Plot Number*</p>
					</div>
					<div class="col-md-9">

						<input type="text" pattern="{1,250}"
							title="Can contain 1 to 250 characters"
							placeholder="Enter Plot Number " name="plotNo"
							required="required">
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<p>Street*</p>
					</div>
					<div class="col-md-9">

						<input type="text" pattern="{3,20}"
							title="Can contain 3 to 20 characters" placeholder="Enter Street"
							name="street" required="required">


						<%!String state[] = {"Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujrat",
			"Haryana", "Himachal", "Jammu & kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh",
			"Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim",
			"Tamil Nadu", "Telengana", "Tripura", "Uttrakhand", "Uttar Pradesh", "West Bengal"};
	int k = 0;%>
						<label>State*</label> <select name="state" required="required">
							<%
								for (k = 0; k < state.length; k++) {
							%><option value="<%=state[k]%>"><%=state[k]%></option>
							<%
								}
							%>
						</select> <label>City*</label><input type="text"
							placeholder="Enter city name " name="city" required="required">
					</div>

				</div>
				<div class="row">
					<div class="col-md-3">
						<p>Postal Code*</p>
					</div>
					<div class="col-md-9">

						<input type="text" pattern="[0-9]{6}"
							title="Enter Postal Code must contain only 6 digits"
							placeholder="Enter Postal Code must contain only 6 digits"
							name="postalCode" required="required">

						<%!String country1[] = {"India"};int l = 0;%>
						<label>Country* </label><select name="conuntry"
							required="required">
							<%
								for (l = 0; l < country1.length; l++) {
							%><option value="<%=country[l]%>"><%=country[l]%></option>
							<%
								}
							%>
						</select>
					</div>
				</div>

				<!--  address Details  -->
				<!-- ----------------Miscellenous Details-------------------------->

				<div class="row">
					<div class="col-lg-12">
						<p
							style="background-color: #66b3ff; color: white; font-size: 20px">Miscellaneous
							Details</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<p>Religion</p>
					</div>
					<div class="col-md-9">

						<input type="text" pattern="{3,20}"
							title="Can contain 3 to 20 characters"
							placeholder="Enter Religion " name="religion"> <label>Category*</label><input
							type="text" pattern="{3,20}"
							title="Can contain 3 to 20 characters"
							placeholder="Enter Category " name="category" required="required">

					</div>

				</div>

				<div class="row">
					<div class="col-md-3">
						<p>Employment*</p>
					</div>
					<div class="col-md-9">

						<input type="text" placeholder="Enter Employment "
							pattern="{3,20}" title="Can contain 3 to 20 characters"
							name="employment" required="required">
					</div>
				</div>

				<div class="row">
					<div class="col-md-3">
						<p>Occupation*</p>
					</div>
					<div class="col-md-9">

						<input type="text" placeholder="Enter Occupation "
							pattern="{3,20}" title="Can contain 3 to 20 characters"
							name="occupation" required="required">

					</div>
				</div>


				<div class="row">
					<div class="col-md-3">
						<p>Annual Income*</p>
					</div>
					<div class="col-md-9">

						<input type="number" min="100000" max="5000000000"
							placeholder="Enter Annual Income " name="annualIncome"
							required="required">

					</div>
				</div>


				<div class="row">
					<div class="col-md-3">
						<p>Account Type*</p>
					</div>
					<div class="col-md-9">
						<input type="radio" value="savings" name="accountType" checked>Saving<input
							type="radio" value="current" name="accountType">Current<br>
					</div>
				</div>



				<div class="row">
					<div class="col-md-3">
						<p>Initial Balance*</p>
					</div>
					<div class="col-md-9">
						<input type="number" value=20000 readonly="readonly"
							placeholder="Enter Initial Balance " name="balance"
							required="required">

					</div>
				</div>


				<div class="row">
					<div class="col-md-3">
						<p>Security question: "What is your mother's maiden name"</p>
					</div>
					<div class="col-md-9">
						<input type="text" placeholder="Enter your answer "
							pattern="{3,20}" title="Can contain 3 to 20 characters"
							name="ans1" required="required">

					</div>
				</div>





				<!-- ----------------------------------------------------------------->
				<input type="submit" class="submit-btn1" value="submit" /> <input
					type="reset" class="submit-btn2" value="reset" /> <br> <br>
			</form>
		</div>
	</div>
	<script>
		var password = document.getElementById("password"), confirm_password = document
				.getElementById("confirm_password");

		function validatePassword() {
			if (password.value != confirm_password.value) {
				confirm_password.setCustomValidity("Passwords Don't Match");
			} else {
				confirm_password.setCustomValidity('');
			}
		}

		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;
	</script>
</body>
</html>

