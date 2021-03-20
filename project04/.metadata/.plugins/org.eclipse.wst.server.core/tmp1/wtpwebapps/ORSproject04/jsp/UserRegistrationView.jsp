<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.UserRegistrationCtl"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com//jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
<script>

$(function(){
	$("#date").datepicker({
		
		changeMonth:true,
		changeYear:true,
		//maxDate:100,
		//maxYear:2,
		//minDate: 0+1,
		//beforeShowDay: noSunday,
		//beforeShowDay1: noSunday1,
		
		yearRange:"-67:-3"
		//yearRange:"+10:"
		
		
		//defaultDate:"01/01/1999"
	});	
}); 
    
</script>
<html>
<body bgcolor="Thistle">
    <form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="post">

        <%@ include file="Header.jsp"%>
        <script type="text/javascript" src="./js/calendar.js"></script>
        <jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
            scope="request"></jsp:useBean>

        <center>
            <h1>User Registration</h1>

            <H2>
                <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font>
            </H2>
            <H2>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
            </H2>

            <input type="hidden" name="id" value="<%=bean.getId()%>">
            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
            

            <table>

                <tr>
                    <th>First Name*</th>
                    <td><input type="text" name="firstName" placeholder="First Name"
                        value="<%=DataUtility.getStringData(bean.getFirstName())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
                </tr>
                <tr>
                    <th>Last Name*</th>
                    <td><input type="text" name="lastName" placeholder="Last Name"
                        value="<%=DataUtility.getStringData(bean.getLastName())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
                </tr>
                <tr>
                    <th>LoginId*</th>
                    <td><input type="text" name="login"
                        placeholder="Must be Email ID"
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
                    <th>Confirm Password*</th>
                    <td><input type="password" name="confirmPassword" placeholder="Password"
                        value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>"><font
                        color="red"> <%=ServletUtility
                    .getErrorMessage("confirmPassword", request)%></font></td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td>
                        <%
                            HashMap map = new HashMap();
                            map.put("M", "Male");
                            map.put("F", "Female");

                            String htmlList = HTMLUtility.getList("gender", bean.getGender(),
                                    map);
                        %> <%=htmlList%>

                    </td>
                </tr>

                <tr>
                    <th>Date Of Birth (mm/dd/yyyy)</th>
                    <td><input type="text" name="dob" readonly="readonly" id="date"
                        value="<%=DataUtility.getDateString(bean.getDob())%>"> <!-- <a
                        href="javascript:getCalendar(document.forms[0].dob);"> <img
                            src="./img/cal.jpg" width="16" height="15" border="0"
                            alt="Calender"> -->
                    </a><font color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
                </tr>
                <tr>
                    <th></th>
                    <td colspan="2">&emsp;&emsp;&emsp;
                        &nbsp; <input type="submit" name="operation" value="<%=UserRegistrationCtl.OP_SIGN_UP %>">
                    </td>
                </tr>
            </table>
    </form>
    </center>
    <%@ include file="Footer.jsp"%>
</body>
</html>