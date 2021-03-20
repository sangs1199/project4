<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.CollegeCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<html>
<style type="text/css">
input[type=text],input[type=password] {
	width: 180px;
	padding: 5px ;
}
input[type=button], input[type=submit], input[type=reset] {
    
    padding: 5px 25px;
    border-radius: 4px;
}
</style>
<body bgcolor="">
    <form action="CollegeCtl" method="POST">
        <%@ include file="Header.jsp"%>

        <jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.CollegeBean"
            scope="request"></jsp:useBean>

        <center><%if(bean.getId()>0){ %>
            <h1>Update College</h1><%}else{ %>
            <h1>Add College</h1><%} %>

            <H2>
                <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font>
            </H2>
            <H2>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
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

            <table align="center" style="margin-left:35% ">
                <tr>
                    <th>Name*</th>
                    <td><input type="text" name="name" placeholder=" Name"
                        value="<%=DataUtility.getStringData(bean.getName())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("name", request)%></font></td>
                </tr>
                <tr>
                    <th>Address*</th>
                    <td><input type="text" name="address" placeholder=" Address"
                        value="<%=DataUtility.getStringData(bean.getAddress())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("address", request)%></font></td>
                </tr>
                <tr>
                    <th>State*</th>
                    <td><input type="text" name="state" placeholder=" State"
                        value="<%=DataUtility.getStringData(bean.getState())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("state", request)%></font></td>
                </tr>
                <tr>
                    <th>City*</th>
                    <td><input type="text" name="city" placeholder=" City"
                        value="<%=DataUtility.getStringData(bean.getCity())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("city", request)%></font></td>
                </tr>
                <tr>
                    <th>PhoneNo*</th>
                    <td><input type="text" name="phoneNo" placeholder=" Phone No"
                        value="<%=DataUtility.getStringData(bean.getPhoneNo())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("phoneNo", request)%></font></td>
                </tr>


                <tr>
                    <th></th>
                    <td colspan="2"><input type="submit" name="operation"
                        value="<%=bean.getId()>0?CollegeCtl.OP_UPDATE:CollegeCtl.OP_SAVE%>">&nbsp;&nbsp;
                        <input type="submit" name="operation"
                        value="<%=bean.getId()>0?CollegeCtl.OP_CANCEL:CollegeCtl.OP_RESET%>">
                        </td>
                </tr>
            </table>
    </form>
    </center>
    <%@ include file="Footer.jsp"%>
</body>
</html>