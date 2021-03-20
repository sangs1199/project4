<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="in.co.sunrays.proj4.controller.RoleListCtl"%>
<%@page import="in.co.sunrays.proj4.controller.BaseCtl"%>
<%@page import="in.co.sunrays.proj4.bean.RoleBean"%>
<%@page import="in.co.sunrays.proj4.model.RoleModel"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<head>
<style type="text/css">
input[type=text],input[type=password],textarea{
	width: 186px;
	padding: 5px ;
}
select{
width: 196px;
padding: 5px;
}
 input[type=button], input[type=submit], input[type=reset] {
    
    padding: 5px 28px;
    border-radius: 4px;
}
</style>
</head>
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
	var en=document.forms[0].elements[3].name;
	if(en!=undefined & en.indexOf("chk_1")!=-1)
	{	
		document.forms[0].elements[2].checked=document.frm.chk_all.unchecked;
	}	
}
</script>

<body bgcolor="Thistle">

    <%@include file="Header.jsp"%>

    <center>
        <h1>Role List View</h1>

        <form action="<%=ORSView.ROLE_LIST_CTL%>" method="post" name="frm">
            <table width="100%">
                <tr>
                    <td align="center"><label>Name :</label> <input type="text"
                        name="name"
                        value="<%=ServletUtility.getParameter("name", request)%>">
                        &nbsp; <input type="submit" name="operation" value="<%=RoleListCtl.OP_SEARCH %>">
                    </td>
                </tr>
            </table>
            <table border="1" width="100%">
                <tr><th style="width: 100px"><input type="checkbox" name="chk_all" onclick="checkedAll()"/>Select All</th>
                    <th>S.No.</th>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Edit</th>
                </tr>
                <tr>
                    <td colspan="8"><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></td>
                </tr>

                <%
                RoleModel model=new RoleModel();
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<RoleBean> it = list.iterator();
                    RoleBean bean=null;
                    while (it.hasNext()) {
                         bean = it.next();
                %>
                <tr align="center">
                   <td><input type="checkbox" id="sid" name="chk_1" onchange="check()" 
                    value="<%=bean.getId()%>"></td>
                    <td><%=index++%></td>
                    <td><%=bean.getId()%></td>
                    <td><%=bean.getName()%></td>
                    <td><%=bean.getDescription()%></td>
                    <td><%if(bean.getId()!=1){%> <a href="RoleCtl?id=<%=bean.getId()%>">Edit</a><%} %></td>
                </tr>
                <%
                    }
                %>
            </table>
            <table width="100%">
                <tr>
                    <td><input type="submit" name="operation"
                        value="<%=RoleListCtl.OP_PREVIOUS%>" <%if (pageNo == 1) {%>
					disabled="disabled" <%}%>></td>
                    <td></td>
                    <td align="right"><input type="submit" name="operation"
                        value="<%=RoleListCtl.OP_NEXT%>" <%if (list.size() < pageSize || model.nextPK()-1 == bean.getId()) {%>
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