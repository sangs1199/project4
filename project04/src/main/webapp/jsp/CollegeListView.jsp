<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="in.co.sunrays.proj4.controller.CollegeListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.bean.CollegeBean"%>
<%@page import="in.co.sunrays.proj4.model.CollegeModel"%>
<%@page import="in.co.sunrays.proj4.controller.ORSView"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<style type="text/css">
input[type=text],input[type=password] {
	width: 186px;
	padding: 5px ;
}
 input[type=button], input[type=submit], input[type=reset] {
    
    padding: 5px 28px;
    border-radius: 4px;
}
select {
	width: 176px;
padding:5px
}
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
<jsp:useBean id="cbean" class="in.co.sunrays.proj4.bean.CollegeBean" scope="request"></jsp:useBean>
    <%@include file="Header.jsp"%>
    <center>
        <h1>College List</h1>
        <h2><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font>
        <font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h2>

        <form action="<%=ORSView.COLLEGE_LIST_CTL%>" method="POST" name="frm">
        <% List list = ServletUtility.getList(request);
        List l=(List)request.getAttribute("clist");
        if(list.size()>0){%>

            <table width="100%">
                <tr>
                    <td align="center"><label> Name :</label><%=HTMLUtility.getList("collegeId",String.valueOf(cbean.getId()),l) %> 
                    
                    <%-- <input type="text"
                        name="name" placeholder=" Name"
                        value="<%=ServletUtility.getParameter("name", request)%>"> --%>
                        
                        <label>City :</label> <input type="text" name="city" placeholder=" City"
                        value="<%=ServletUtility.getParameter("city", request)%>">
                        <input type="submit" name="operation"
                        value="<%=CollegeListCtl.OP_SEARCH%>">&emsp;<input type="submit" name="operation"
                        value="<%=CollegeListCtl.OP_RESET%>"></td>
                </tr>
            </table>
            <br>
            <table border="1" width="100%">
                <tr><th style="width: 100px"><input type="checkbox" name="chk_all" onclick="checkedAll()"/>Select All</th>
                    <th>S.No.</th>
                    <th>Name.</th>
                    <th>Address.</th>
                    <th>State.</th>
                    <th>City.</th>
                    <th>PhoneNo.</th>
                    <th>Edit</th>
                </tr>
                
                <%CollegeModel model=new CollegeModel();
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    
                    Iterator<CollegeBean> it = list.iterator();
                    CollegeBean bean=null;

                    while (it.hasNext()) {

                         bean = it.next();
                %>
                <tr align="center"><td><input type="checkbox" id="sid" name="chk_1" onchange="check()" 
                    value="<%=bean.getId()%>"></td>
                    <td><%=index++%></td>
                    <td><%=bean.getName()%></td>
                    <td><%=bean.getAddress()%></td>
                    <td><%=bean.getState()%></td>
                    <td><%=bean.getCity()%></td>
                    <td><%=bean.getPhoneNo()%></td>
                    <td><a href="CollegeCtl?id=<%=bean.getId()%>">Edit</a></td>
                </tr>
                <%
                    }
                %>
            </table>
            <table width="100%">
                <tr>
                    <td><input type="submit" name="operation"
                        value="<%=CollegeListCtl.OP_PREVIOUS%>" <%if (pageNo == 1) {%>
					disabled="disabled" <%}%>></td>
                    <td><input type="submit" name="operation"
                        value="<%=CollegeListCtl.OP_NEW%>"></td>
                    <td><input type="submit"
                        name="operation" value="<%=CollegeListCtl.OP_DELETE%>"></td>
                    <td align="right"><input type="submit" name="operation"
                        value="<%=CollegeListCtl.OP_NEXT%>" <%if (list.size() < pageSize || model.nextPK()-1 == bean.getId()) {%>
					disabled="disabled" <%}%>></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>"> <%}else{ %>
                <input type="submit" name="operation" value="Back"><%} %>
        </form>
    </center><br>
    <div id="footer">
	<%@ include file="Footer.jsp"%></div>
</body>
</html>