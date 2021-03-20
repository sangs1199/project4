<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.UserCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<html>
<head>
<link rel="stylesheet" href="<%=ORSView.APP_CONTEXT%>/js/jquery-ui.css">
<!-- <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<script src="https://code.jquery.com//jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function() {
		$("#date").datepicker({

			changeMonth : true,
			changeYear : true,
			//maxDate:100,
			//maxYear:3,
			//minDate: 0+1,
			//beforeShowDay: noSunday,
			//beforeShowDay1: noSunday1,

			yearRange : "-67:-3"
		//yearRange:"+10:"

		//defaultDate:"01/01/2005"
		});
	});
</script>
<style type="text/css">
input[type=text], input[type=password], textarea {
	width: 180px;
	padding: 3px;
}

select {
	width: 186px;
	padding: 3px;
}

input[type=button], input[type=submit], input[type=reset] {
	padding: 5px 24px;
	border-radius: 4px;
}
</style>
<link rel="stylesheet" type="text/css" href="../format.css"></link>
</head>
<body bgcolor="">
	<form action="<%=ORSView.USER_CTL%>" method="post">
		<%@ include file="Header.jsp"%>
		<script type="text/javascript" src="../js/calendar.js"></script>
		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
			scope="request"></jsp:useBean>

		<%
			List l = (List) request.getAttribute("roleList");
		%>

		<center>
			<%
				if (bean.getId() == 0) {
			%>
			<h1>Add User</h1>
			<%
				} else {
			%><h1>Update User</h1>
			<%
				}
			%>
			<H2>
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font>
			</H2>

			<H2>
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H2>



			<input type="hidden" name="id" value="<%=bean.getId()%>"> <input
				type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy"
				value="<%=bean.getModifiedBy()%>"> <input type="hidden"
				name="createdDatetime"
				value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime"
				value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">


			<table align="center" style="margin-left: 30%">
				<tr>
					<th>First Name*</th>
					<td><input type="text" name="firstName" placeholder=" First Name"
						value="<%=DataUtility.getStringData(bean.getFirstName())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
				</tr>
				<tr>
					<th>Last Name*</th>
					<td><input type="text" name="lastName" placeholder=" Last Name"
						value="<%=DataUtility.getStringData(bean.getLastName())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
				</tr>
				<tr>
					<th>LoginId*</th>
					<td><input type="text" name="login" placeholder=" Email Id"
						value="<%=DataUtility.getStringData(bean.getLogin())%>"
						<%=(bean.getId() > 0) ? "readonly" : ""%>><font
						color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
				</tr>
				<tr>
					<th>Password*</th>
					<td><input type="password" name="password" placeholder=" Password"
						value="<%=DataUtility.getStringData(bean.getPassword())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font></td>
				</tr>
				<tr>
					<th>Confirm Password*</th>
					<td><input type="password" name="confirmPassword" placeholder=" Confirm Password"
						value="<%=DataUtility.getStringData(bean.getPassword())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("confirmPassword", request)%></font></td>
				</tr>
				<tr>
					<th>Gender</th>
					<td>
						<%
							HashMap map = new HashMap();

							map.put("M", "Male");
							map.put("F", "Female");

							String htmlList = HTMLUtility.getList("gender", bean.getGender(), map);
						%> <%=htmlList%><font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>
					</td>
				</tr>
				<tr>
					<th>Role :</th>
					<td><%=HTMLUtility.getList("roleId", String.valueOf(bean.getRoleId()), l)%><font
						color="red"> <%=ServletUtility.getErrorMessage("roleId", request)%></font></td>
				</tr>
				<tr>
					<th>Date Of Birth (mm/dd/yyyy)</th>
					<td><input type="text" name="dob" readonly="readonly" placeholder="  DOB"
						id="date" value="<%=DataUtility.getDateString(bean.getDob())%>">
						<!-- <a href="javascript:getCalendar(document.forms[0].dob);">
                            <img src="../img/cal.jpg" width="16" height="15" border="0"
                            alt="Calender">
                    </a> -->
						<font color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="2">
						<%
							if (bean.getId() > 0) {
						%><input type="submit" name="operation"
						value="<%=UserCtl.OP_UPDATE%>">&emsp;&nbsp; <input
						type="submit" name="operation" value="<%=UserCtl.OP_CANCEL%>">
						<%
							} else {
						%><input type="submit" name="operation"
						value="<%=UserCtl.OP_SAVE%>">&emsp;&nbsp;<input
						type="submit" name="operation" value="<%=UserCtl.OP_RESET%>">
						<%
							}
						%>
					</td>
				</tr>
			</table>
	</form>
	</center>
	<div style="margin-top: 5%"><%@ include file="Footer.jsp"%></div>
</body>
</html>