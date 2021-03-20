<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.UserListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.model.UserModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
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
	var en=document.forms[0].elements[4].name;
	
	if(en!=undefined & en.indexOf("chk_1")!=-1)
	{	
		document.forms[0].elements[3].checked=document.frm.chk_all.unchecked;
	}	
}
</script>
<body bgcolor="Thistle">

    <%@include file="Header.jsp"%>

    <center>
        <h1>User List</h1>

        <form action="<%=ORSView.USER_LIST_CTL%>" method="post" name="frm">

            <table width="100%">
                <tr>
                    <td align="center"><label>FirstName :</label> <input
                        type="text" name="firstName"
                        value="<%=ServletUtility.getParameter("firstName", request)%>">
                        &emsp; <label>LoginId:</label> <input type="text" name="login"
                        value="<%=ServletUtility.getParameter("login", request)%>">
                        &emsp; <input type="submit" name="operation" value="<%=UserListCtl.OP_SEARCH %>">
                    </td>
                </tr>
            </table>
            <br>

            <table border="1" width="100%">
                <tr><th style="width: 100px"><input type="checkbox" name="chk_all" onclick="checkedAll()"/>Select All</th>
                    <th>Select</th>
                    <th>FirstName</th>
                    <th>LastName</th>
                    <th>LoginId</th>
                    <th>Gender</th>
                    <th>DOB</th>
                    <th>Edit</th>
                </tr>

                <tr>
                    <td colspan="8"><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></td>
                </tr>

                <%
                UserModel model=new UserModel();
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                   
                    Iterator<UserBean> it = list.iterator();
                    UserBean bean=null;
                    while (it.hasNext()) {
                         bean = it.next();
                %>
                <tr align="center">
                   <td><input type="checkbox" id="sid" name="chk_1" onchange="check()" 
                    value="<%=bean.getId()%>"></td>
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
                    <td ><input type="submit" name="operation"
                        value="<%=UserListCtl.OP_PREVIOUS%>" <%if (pageNo == 1) {%>
					disabled="disabled" <%}%>></td>
                     <td ><input type="submit"
                        name="operation" value="<%=UserListCtl.OP_DELETE%>"></td>
                     <td align="right"><input type="submit" name="operation"
                        value="<%=UserListCtl.OP_NEXT%>" <%if (list.size() < pageSize || model.nextPK()-1 == bean.getId()) {%>
					disabled="disabled" <%}%>></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
    </center>
    <%@include file="Footer.jsp"%>
</body>
</html>