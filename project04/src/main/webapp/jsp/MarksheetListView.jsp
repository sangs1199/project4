<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.MarksheetListCtl"%>
<%@page import="in.co.sunrays.proj4.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.bean.MarksheetBean"%>
<%@page import="in.co.sunrays.proj4.model.MarksheetModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html><style type="text/css">
input[type=text],input[type=password] {
	width: 186px;
	padding: 5px ;
}
 input[type=button], input[type=submit], input[type=reset] {
    
    padding: 5px 28px;
    border-radius: 4px;
}
select{
width:188px;
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
    <%@include file="Header.jsp"%>
     <jsp:useBean id="bean1" class="in.co.sunrays.proj4.bean.MarksheetBean"
            scope="request"></jsp:useBean>
    <%
            List l = (List) request.getAttribute("studentList");
        %>
    
    <center>
        <h1>Marksheet List</h1>
                    <h2><font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
        <font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h2>

        <form action="<%=ORSView.MARKSHEET_LIST_CTL%>" method="POST" name="frm">
        <% List list = ServletUtility.getList(request);
        if(list.size()>0){%>
        
        

            <table width="100%">
                <tr>
                    <td align="center"><label> Name :</label><%=HTMLUtility.getList("studentId",
                    String.valueOf(bean1.getStudentId()), l)%> <font
                        color="red"> <%=ServletUtility.getErrorMessage("studentId", request)%></font>
                        &emsp; <label>RollNo :</label> <input type="text" name="rollNo" placeholder="Roll No"
                        value="<%=ServletUtility.getParameter("rollNo", request)%>">&emsp;
                        <input type="submit" name="operation" value="<%=MarksheetListCtl.OP_SEARCH %>">&emsp;
                        <input type="submit" name="operation"
                        value="<%=MarksheetListCtl.OP_RESET%>"></td>
                </tr>
            </table>
            <br>
            <table border="1" width="100%">
                <tr><th style="width: 100px"><input type="checkbox" name="chk_all" onclick="checkedAll()"/>Select All</th>
                    <th>S.No.</th>
                    <th>RollNo</th>
                    <th>Name</th>
                    <th>Physics</th>
                    <th>Chemistry</th>
                    <th>Maths</th>
                    <th>Edit</th>
                </tr>
                
                <%
                MarksheetModel model=new MarksheetModel();
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    
                    Iterator<MarksheetBean> it = list.iterator();
                    MarksheetBean bean=null;

                    while (it.hasNext()) {

                         bean = it.next();
                %>
                <tr align="center"> 
                <td><input type="checkbox" id="sid" name="chk_1" onchange="check()" 
                    value="<%=bean.getId()%>"></td>
                    
                    <td><%=index++%></td>
                    <td><%=bean.getRollNo()%></td>
                    <td><%=bean.getName()%></td>
                    <td><%=bean.getPhysics()%></td>
                    <td><%=bean.getChemistry()%></td>
                    <td><%=bean.getMaths()%></td>
                    <td><a href="MarksheetCtl?id=<%=bean.getId()%>">Edit</a></td>
                </tr>

                <%
                    }
                %>
            </table>
            <table width="100%">
                <tr>
                    <td><input type="submit" name="operation"
                        value="<%=MarksheetListCtl.OP_PREVIOUS%>" <%if (pageNo == 1) {%>
					disabled="disabled" <%}%>></td>
                    <td><input type="submit" name="operation"
                        value="<%=MarksheetListCtl.OP_NEW%>"></td>
                    <td><input type="submit"
                        name="operation" value="<%=MarksheetListCtl.OP_DELETE%>"></td>
                    <td align="right"><input type="submit" name="operation"
                        value="<%=MarksheetListCtl.OP_NEXT%>" <%if (list.size() < pageSize || model.nextPK()-1 == bean.getId()) {%>
					disabled="disabled" <%}%>></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>"><%}else{%><input type="submit" name="operation" value="<%=MarksheetListCtl.OP_BACK%>">
     <%} %>   </form>
    </center>
    <%@include file="Footer.jsp"%>
</body>
</html>