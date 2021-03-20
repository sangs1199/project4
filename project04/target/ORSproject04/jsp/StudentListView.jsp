<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.StudentListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.bean.StudentBean"%>
<%@page import="in.co.sunrays.proj4.model.StudentModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<style type="text/css">
input[type=button], input[type=submit], input[type=reset] {
    
    padding: 5px 24px;
    border-radius: 4px;
}
input[type=text],input[type=password] {
	width: 160px;
	padding: 5px ;
}
select{
width:196px;
padding: 3px;}
</style>
<script type="text/javascript">
function checkedAll()
{
	
	var totalElement=document.forms[0].elements.length;

	for(var i=0;i<totalElement;i++){
		var en=document.forms[0].elements[i].name;
		if(en!=undefined & en.indexOf("chk_1")!=-1)
		{	
			document.forms[0].elements[i].checked=document.frm.chk_all.checked;
		 
		}		
	}
}
function check(){
	var en=document.forms[0].elements[5].name;
	
	if(en!=undefined & en.indexOf("chk_1")!=-1)
	{	
		document.forms[0].elements[4].checked=document.frm.chk_all.unchecked;
	}	
}
</script>
<body bgcolor="">
<jsp:useBean id="sbean" class="in.co.sunrays.proj4.bean.StudentBean" scope="request"></jsp:useBean>
    <%@include file="Header.jsp"%>
    <center>
        <h1>Student List</h1>
        <h2><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font>
        <font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h2>

        <form action="<%=ORSView.STUDENT_LIST_CTL%>" method="post" name="frm">
        <%List list = ServletUtility.getList(request);
        List l=(List)request.getAttribute("studentId");
        if(list.size()>0){%>
            <table width="100%">
                <tr>
                    <td align="center"><label> Name :</label> <%=HTMLUtility.getList("studentId",String.valueOf(sbean.getId()),l) %>
                    <%-- <input
                        type="text" name="firstName" placeholder=" First Name"
                        value="<%=ServletUtility.getParameter("firstName", request)%>">&nbsp;&nbsp;
                        <label>LastName :</label> <input type="text" name="lastName" placeholder=" Last Name"
                        value="<%=ServletUtility.getParameter("lastName", request)%>"> --%>
                        
                        &nbsp;&nbsp;<label>Email_Id
                            :</label> <input type="text" name="email" placeholder=" Email"
                        value="<%=ServletUtility.getParameter("email", request)%>">&nbsp;&nbsp;
                        <input type="submit" name="operation" value="<%=StudentListCtl.OP_SEARCH %>">
                        <input type="submit" name="operation" value="<%=StudentListCtl.OP_RESET%>"></td>
                </tr>
            </table>
            <br>
            <table border="1" width="100%">
                <tr><th style="width: 100px"><input type="checkbox" name="chk_all" onclick="checkedAll()"/>Select All</th>
                    <th>S.No.</th>
                    <th>College.</th>
                    <th>First Name.</th>
                    <th>Last Name.</th>
                    <th>Date Of Birth.</th>
                    <th>Mobil No.</th>
                    <th>Email ID.</th>
                    <th>Edit</th>
                </tr>
                
                <%
                StudentModel model=new StudentModel();
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    
                    Iterator<StudentBean> it = list.iterator();
                    StudentBean bean=null;

                    while (it.hasNext()) {

                         bean = it.next();
                %>
                <tr align="center"><td><input type="checkbox" id="sid" name="chk_1" onchange="check()" 
                    value="<%=bean.getId()%>"></td>
                    <td><%=index++%></td>
                    
                    <td><%=bean.getCollegeName()%></td>
                    <td><%=bean.getFirstName()%></td>
                    <td><%=bean.getLastName()%></td>
                    <td><%=bean.getDob()%></td>
                    <td><%=bean.getMobileNo()%></td>
                    <td><%=bean.getEmail()%></td>
                    <td><a href="StudentCtl?id=<%=bean.getId()%>">Edit</a></td>
                </tr>
                <%
                    }
                %>
            </table>
            <table width="100%">
                <tr>
                    <td><input type="submit" name="operation"
                        value="<%=StudentListCtl.OP_PREVIOUS%>" <%if (pageNo == 1) {%>
					disabled="disabled" <%}%>></td><td><input type="submit" name="operation"
                        value="<%=StudentListCtl.OP_NEW%>"></td>
                     <td ><input type="submit"
                        name="operation" value="<%=StudentListCtl.OP_DELETE%>"></td>
                    <td align="right"><input type="submit" name="operation"
                        value="<%=StudentListCtl.OP_NEXT%>" <%if (list.size() < pageSize || model.nextPK()-1 == bean.getId()) {%>
					disabled="disabled" <%}%>></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"><input
                type="hidden" name="pageSize" value="<%=pageSize%>"><%}else{ %>
                <input type="submit" name="operation" value="back" ><%} %>


        </form>
    </center><%@ include file="Footer.jsp"%>
</body>
</html>