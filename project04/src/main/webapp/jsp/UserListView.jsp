<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.UserListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.model.UserModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<style type="text/css">
input[type=button], input[type=submit], input[type=reset] {
	padding: 5px 24px;
	border-radius: 4px;
}

input[type=text], input[type=password], textarea {
	width: 195px;
	padding: 3px;
}

select {
	width: 196px;
	padding: 3px;
}
</style>
<script type="text/javascript">
	function checkedAll() {
		
		var totalElement = document.forms[0].elements.length;
		

		for (var i = 0; i < totalElement; i++) {
			var en = document.forms[0].elements[i].name;
			if (en != undefined & en.indexOf("chk_1") != -1) {
				document.forms[0].elements[i].checked = document.frm.chk_all.checked;

			}
		}
	}
	function check() {
		var en = document.forms[0].elements[5].name;

		if (en != undefined & en.indexOf("chk_1") != -1) {
			document.forms[0].elements[4].checked = document.frm.chk_all.unchecked;
		}
	}
</script>
<body bgcolor="">

	<%@include file="Header.jsp"%>

	<center>
		<h1>User List</h1>
		<h2>
			<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
			<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
		</h2>

		<form action="<%=ORSView.USER_LIST_CTL%>" method="post" name="frm">
			<jsp:useBean id="fbean" class="in.co.sunrays.proj4.bean.UserBean"
				scope="request"></jsp:useBean>
			<%
				List list = ServletUtility.getList(request);
				List l = (List) request.getAttribute("studentId");
				if (list.size() > 0) {
			%>

			<table width="100%">
				<tr>
					<td align="center"><label>Name :</label> <%=HTMLUtility.getList("studentId", String.valueOf(fbean.getFirstName()), l)%><%-- <font
    						color="red"> <%=ServletUtility.getErrorMessage("studentId", request)%></font> --%>
						&emsp; <label>LoginId:</label> <input type="text" name="login"
						placeholder=" Login Id"
						value="<%=ServletUtility.getParameter("login", request)%>">
						&emsp; <input type="submit" name="operation"
						value="<%=UserListCtl.OP_SEARCH%>">&nbsp;&nbsp;<input type="submit" name="operation"
						value="<%=UserListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<br>

			<table border="1" width="100%">
				<tr>
					<th style="width: 100px"><input type="checkbox" name="chk_all"
						onclick="checkedAll()" />Select All</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>LoginId</th>
					<th>Gender</th>
					<th>DOB</th>
					<th>Edit</th>
				</tr>

				<%
					UserModel model = new UserModel();
						int pageNo = ServletUtility.getPageNo(request);
						int pageSize = ServletUtility.getPageSize(request);
						int index = ((pageNo - 1) * pageSize) + 1;

						Iterator<UserBean> it = list.iterator();
						UserBean bean = null;
						while (it.hasNext()) {
							bean = it.next();
				%>
				<tr align="center">
					<td><input type="checkbox" id="ids" name="chk_1"
						onchange="check()" value="<%=bean.getId()%>"></td>
					<td><%=bean.getFirstName()%></td>
					<td><%=bean.getLastName()%></td>
					<td><%=bean.getLogin()%></td>
					<td><%=bean.getGender()%></td>
					<td><%=bean.getDob()%></td>
					<td><a href="UserCtl?id=<%=bean.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						value="<%=UserListCtl.OP_PREVIOUS%>" <%if (pageNo == 1) {%>
						disabled="disabled" <%}%>></td>
					<td><input type="submit" name="operation"
						value="<%=UserListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						value="<%=UserListCtl.OP_DELETE%>"></td>
					<td align="right"><input type="submit" name="operation"
						value="<%=UserListCtl.OP_NEXT%>"
						<%if (list.size() < pageSize || model.nextPK() - 1 == bean.getId()) {%>
						disabled="disabled" <%}%>></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
			<%
				} else {
			%>
			<input type="submit" name="operation"
				value="<%=UserListCtl.OP_BACK%>">
			<%
				}
			%>
		</form>
	</center>


</body>
<%@include file="Footer.jsp"%>
</html>