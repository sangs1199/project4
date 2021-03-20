<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.LoginCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<html>
<head>
<style type="text/css">
input[type=text],input[type=password] {
	width: 186px;
	padding: 5px ;
}
 input[type=button], input[type=submit], input[type=reset] {
    
    padding: 5px 28px;
    border-radius: 4px;
}
</style>
</head>
<body bgcolor="">
    <form action="<%=ORSView.LOGIN_CTL%>" method="post">
        <%@ include file="Header.jsp"%>

        <jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
            scope="request"></jsp:useBean>

        <center>
            <h1>Login</h1>

            <H2><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
                <font color="red"><%=ServletUtility.getErrorMessage("message", request) %></font>
            </H2>
              
              <input type="hidden" name="id" value="<%=bean.getId()%>">
              <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
              <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
              <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
              <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

            <table align="center" style="margin-left:38%">
                <tr>
                    <th>LoginId*</th>
                    <td><input type="text" name="login" placeholder="Email Id"
                        value="<%=DataUtility.getStringData(bean.getLogin())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
                </tr>
                <tr>
                    <th>Password*</th>
                    <td><input type="password" name="password" placeholder="Password"
                        value="<%=DataUtility.getStringData(bean.getPassword())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font></td>
                </tr>
                <tr>
                    <th></th>
                    <td colspan="2"><input type="submit" name="operation"
                        value="<%=LoginCtl.OP_SIGN_IN %>"> 
                        <input type="submit"
                        name="operation" value="<%=LoginCtl.OP_SIGN_UP %>" > &nbsp;</td>
                </tr>
                <tr><th></th>
                <td><a href="<%=ORSView.FORGET_PASSWORD_CTL%>"><b>Forget my password</b></a>&nbsp;</td>
            </tr>
            </table>
            <input type="hidden" name="URI" value="<%=request.getAttribute("URI")%>">
    </form>
    </center>
    <%@ include file="Footer.jsp"%>
</body>
</html>