<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.MarksheetMeritListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.bean.MarksheetBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<style type="text/css">
input[type=text], input[type=password] {
	width: 186px;
	padding: 5px;
}

input[type=button], input[type=submit], input[type=reset] {
	padding: 5px 28px;
	border-radius: 4px;
}
</style>
</head>
<!-- <script type="text/javascript">
function checkedAll()
{
	
	var totalElement=document.forms[0].elements.length;
	for(var i=0;i<totalElement;i++){
		var en=document.forms[0].elements[i].name;
		
		if(en!=undefined & en.indexOf("chk_")!=-1)
		{	
			document.forms[0].elements[i].checked=document.frm.chk_all.checked;
		 
		}		
	}
}
function check(){
	var en=document.forms[0].elements[1].name;
	if(en!=undefined & en.indexOf("chk_")!=-1)
	{	
		document.forms[0].elements[0].checked=document.frm.chk_all.unchecked;
	}	
}
</script> -->
<body bgcolor="">
	<%@include file="Header.jsp"%>
	<center>
		<h1>Marksheet Merit List</h1>

		<form action="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>" method="POST"
			name="frm">
			<br>
			<table border="1" width="100%">
				<tr>
					<!-- <th style="width: 100px"><input type="checkbox" name="chk_all" onclick="checkedAll()"/>Select All</th> -->

					<th align="center">S.No.</th>
					<th align="center">Roll No</th>
					<th align="center">Name</th>
					<th align="center">Physics</th>
					<th align="center">Chemistry</th>
					<th align="center">Maths</th>

				</tr>
				<%-- <tr>
					<td colspan="8"><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></td>
				</tr> --%>
				<%
					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;

					List list = ServletUtility.getList(request);
					Iterator<MarksheetBean> it = list.iterator();

					while (it.hasNext()) {

						MarksheetBean bean = it.next();
				%>
				<tr>
					<%-- <td><input type="checkbox" id="sid" name="chk_1" onchange="check()" 
                    value="<%=bean.getId()%>"></td> --%>

					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getRollNo()%></td>
					<td align="center"><%=bean.getName()%></td>
					<td align="center"><%=bean.getPhysics()%></td>
					<td align="center"><%=bean.getChemistry()%></td>
					<td align="center"><%=bean.getMaths()%></td>

				</tr>

				<%
					}
				%>
			</table>
			<table>
				<tr>
					<td align="right"><input type="submit" name="operation"
						value="<%=MarksheetMeritListCtl.OP_BACK%>"></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>