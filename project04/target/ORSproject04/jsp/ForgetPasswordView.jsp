<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.ForgetPasswordCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<head>
<style type="text/css">
input[type=text] {
	width: 186px;
	padding: 5px;
}

input[type=submit] {
	padding: 5px 28px;
	border-radius: 4px;
}
</style>
</head>
<html>
<body bgcolor="">
	<form action="<%=ORSView.FORGET_PASSWORD_CTL%>" method="post">

		<%@ include file="Header.jsp"%>

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
			scope="request"></jsp:useBean>

		<center>
			<h1>Forgot your password?</h1>
			<input type="hidden" name="id" value="<%=bean.getId()%>">
			<H2>
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H2>
			<H2>
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font>
			</H2>
			<table align="center" style="margin-left: 35%">
				<lable>Submit your email address and we'll send you
				password.</lable>
				<br>
				<br><th>
				<label>Email Id :</label>&emsp;
				<input type="text" name="login" placeholder="Enter ID Here"
					value="<%=ServletUtility.getParameter("login", request)%>">&emsp;
				<input type="submit" name="operation"
					value="<%=ForgetPasswordCtl.OP_GO%>">&nbsp;
				<font color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></th>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>