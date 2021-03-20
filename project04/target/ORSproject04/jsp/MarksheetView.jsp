<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.MarksheetCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<html><style type="text/css">
input[type=text],input[type=password],textarea{
	width: 180px;
	padding: 3px ;
}
select{
width:188px;
padding: 3px;}


input[type=button], input[type=submit], input[type=reset] {
    
    padding: 5px 27px;
    border-radius: 4px;
}
</style>
<body bgcolor="">

    <form action="<%=ORSView.MARKSHEET_CTL%>" method="post">
        <%@ include file="Header.jsp"%>

        <jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.MarksheetBean"
            scope="request"></jsp:useBean>

        <%
            List l = (List) request.getAttribute("studentList");
        %>

        <center>
            			<%
				if (bean.getId() == 0) {
			%>
			<h1>Add Marksheet</h1>
			<%
				} else {
			%><h1>Update Marksheet</h1>
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
</center>

            <input type="hidden" name="id" value="<%=bean.getId()%>">
            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
            

            <table align="center" style="margin-left: 38%">
                <tr>
                    <th>Rollno*</th>
                    <td><input type="text" name="rollNo" placeholder="Roll NO"
                        value="<%=DataUtility.getStringData(bean.getRollNo())%>"
                        <%=(bean.getId() > 0) ? "readonly" : ""%>> <font
                        color="red"> <%=ServletUtility.getErrorMessage("rollNo", request)%></font></td>
                </tr>
                <tr>
                    <th>Name*</th>
                    <td><%=HTMLUtility.getList("studentId",
                    String.valueOf(bean.getStudentId()), l)%> <font
                        color="red"> <%=ServletUtility.getErrorMessage("studentId", request)%></font></td>
                </tr>
                <tr>
                    <th>Physics</th>
                    <td><input type="text" name="physics" placeholder="Physics"
                        value="<%=DataUtility.getStringData(bean.getPhysics())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("physics", request)%></font></td>
                </tr>
                <tr>
                    <th>Chemistry</th>
                    <td><input type="text" name="chemistry" placeholder="Chemistry"
                        value="<%=DataUtility.getStringData(bean.getChemistry())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("chemistry", request)%></font></td>
                </tr>
                <tr>
                    <th>Maths</th>
                    <td><input type="text" name="maths" placeholder="Maths"
                        value="<%=DataUtility.getStringData(bean.getMaths())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("maths", request)%></font></td>

                </tr>
                <tr>
                    <th></th>
                     <%
     if (bean.getId() > 0) {
 %><td colspan="2"><input type="submit" name="operation"
                        value="<%=MarksheetCtl.OP_UPDATE%>">&nbsp;&nbsp;
                        <input type="submit" name="operation"
                        value="<%=MarksheetCtl.OP_CANCEL%>"> </td><%
     }else{
 %><td> <input type="submit" name="operation"
                        value="<%=MarksheetCtl.OP_SAVE%>">&nbsp;&nbsp;
                        <input type="submit" name="operation"
                        value="<%=MarksheetCtl.OP_RESET%>"> </td><%} %>
                </tr>
            </table>
        </form>
        <%@ include file="Footer.jsp"%>
    </body>
</html>