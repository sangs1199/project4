<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.GetMarksheetCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.controller.ORSView"%>
<html>
<body bgcolor="Thistle">
    <%@ include file="Header.jsp"%>

    <jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.MarksheetBean"
        scope="request"></jsp:useBean>

    <center>
        <h1>Get Marksheet</h1>

        <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
        </font>

        <H2>
            <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
            </font>
        </H2>

        <form action="<%=ORSView.GET_MARKSHEET_CTL%>" method="post">

            <input type="hidden" name="id" value="<%=bean.getId()%>">
           
                <label>RollNo :</label>&emsp;
                <input type="text" name="rollNo"
                    value="<%=ServletUtility.getParameter("rollNo", request)%>">&emsp;
                <input type="submit" name="operation" value="<%=GetMarksheetCtl.OP_GO%>">
                <br>
                <font color="red"><%=ServletUtility.getErrorMessage("rollNo", request)%></font>

                <%
                    if (bean.getRollNo() != null && bean.getRollNo().trim().length() > 0) {
                %>
 <table border="4" width="60%"  bgcolor="magenta" bordercolor="violet">
                <tr>
                  <td colspan="2"> Rollno : <%=DataUtility.getStringData(bean.getRollNo())%><br>
                    Name : <%=DataUtility.getStringData(bean.getName())%></td>
                </tr>
                <tr>
                <th>Subjects</th>
                <th>Marks</th>
                </tr>
                <tr>
                    <td>Physics :</td>
                    <td><%=bean.getPhysics()>=33 ? bean.getPhysics():bean.getPhysics()+ "<font color='red'>*</font>" %></td>
                </tr>
                <tr>
                    <td>Chemistry :</td>
                    <td><%=bean.getChemistry()>=33 ? bean.getChemistry():bean.getChemistry()+ "<font color='red'>*</font>" %></td>
                </tr>
                <tr>
                    <td>Maths :</td>
                    <td><%=bean.getMaths()>=33 ? bean.getMaths():bean.getMaths()+ "<font color='red'>*</font>" %></td><h1></h1>

                </tr>
                
                <% int phy=bean.getPhysics();
                int math=bean.getMaths();
                int chem=bean.getChemistry();
                float total=bean.getPhysics()+bean.getMaths()+bean.getChemistry();%>
                <tr>
                <td colspan="2" style="padding-left:30%"><b>Total Marks:</b> &nbsp;<%=total%><br><b>Result :</b> &nbsp;<%=(phy>=33 && chem>=33 && math>=33)?String.format("%.2f", (total/3))+"%":"<font color='red'>FAILED</font>" %></td>
</tr>
                <tr>
                    </td>
                </tr>
            </table>
            <%
                }
            %>
        </form>
    </center>
    <%@ include file="Footer.jsp"%>
</body>
</html>