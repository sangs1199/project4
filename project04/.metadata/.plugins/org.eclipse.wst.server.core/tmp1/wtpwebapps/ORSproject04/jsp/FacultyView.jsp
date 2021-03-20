<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="in.co.sunrays.proj4.controller.FacultyCtl"%>
<%@page import="in.co.sunrays.proj4.controller.UserCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="../js/jquery-ui.css"></link> -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com//jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(function(){
	$("#date").datepicker({
		
		changeMonth:true,
		changeYear:true,
		//maxDate:100,
		//maxYear:2,
		//minDate: 0+1,
		//beforeShowDay: noSunday,
		//beforeShowDay1: noSunday1,
		
		yearRange:"-67:-18"
		//yearRange:"+10:"
		
		
		//defaultDate:"01/01/1999"
	});	
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
input[type=text],input[type=password],textarea{
	width: 186px;
	padding: 5px ;
}


input[type=button], input[type=submit], input[type=reset] {
    
    padding: 5px 28px;
    border-radius: 4px;
}
</style>
</head>
<body bgcolor="Thistle">
	<form action="<%=ORSView.FACULTY_CTL%>" method="post">
		<div><%@ include file="Header.jsp"%></div>
		<script type="text/javascript" src="../js/calendar.js"></script>
		
			<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.FacultyBean"
				scope="request"></jsp:useBean>

			<%
				List collegeList = (List) request.getAttribute("collegeList");
				List courseList = (List) request.getAttribute("courseList");
				List subjectList = (List) request.getAttribute("subjectList");
			%>

			<br>
			
				<%
					if (bean.getId() > 0) {
				%>
				<h1 align="center" style="margin-left:3% ">Update Faculty</h1>
				<%
					} else {
				%>
				<h1 align="center" style="margin-left:3% ">Add Faculty</h1>
				<%
					}
				%>

				<H2 align="center">
					<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
					</font>
				
					<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
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

			<table class="t1">
				<colgroup>
					<col style="width: 22%">
					<col style="width: 22%">
					<col style="width: 56%">
				</colgroup>
				<table align="center">
					<tr>
						<th align="left">First Name<font color="red">*</font></th>
						<td><input type="text" name="firstName" placeholder="Enter First Name"
							value="<%=DataUtility.getStringData(bean.getFirst_name())%>"><font
							color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
					</tr>
					<tr>
						<th align="left">Last Name<font color="red">*</font></th>
						<td><input type="text" name="lastName" size="26" placeholder="Enter Last Name"
							value="<%=DataUtility.getStringData(bean.getLast_name())%>"><font
							color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
					</tr>
					<tr>
						<th align="left">Gender<font color="red">*</font></th>
						<td>
							<%
								HashMap map = new HashMap();
								map.put("Male", "Male");
								map.put("Female", "Female");

								String htmlList = HTMLUtility.getList("gender", bean.getGender(), map);
								
							%> <%=htmlList%>
						<font
								color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font></td>
					</tr>

					<tr>
						<th align="left">College Name<font color="red">*</font></th>
						<td><%=HTMLUtility.getList("collegeId", String.valueOf(bean.getCollegeId()), collegeList)%>
						<font
							color="red"> <%=ServletUtility.getErrorMessage("collegeId", request)%></font>
					</tr>
					
					<tr>
						<th align="left">Course Name<font color="red">*</font></th>
						<td><%=HTMLUtility.getList("courseId", String.valueOf(bean.getCourseId()), courseList)%>
						<font
							color="red"> <%=ServletUtility.getErrorMessage("courseId", request)%></font></td>
					</tr>
					<tr>
						<th align="left">Subject Name<font color="red">*</font></th>
						<td><%=HTMLUtility.getList("subjectId", String.valueOf(bean.getSubjectId()), subjectList)%>
						<font
							color="red"> <%=ServletUtility.getErrorMessage("subjectId", request)%></font></td>
					</tr>
					
					<tr>
						<th align="left">Qualification<font color="red">*</font></th>
						<td><input type="text" name="qualification" size="26" placeholder="Enter Qualification"
							value="<%=DataUtility.getStringData(bean.getQualification())%>"><font
							color="red"> <%=ServletUtility.getErrorMessage("qualification", request)%></font></td>
					</tr>
					<tr>
						<th align="left">EmailId<font color="red">*</font></th>
						<td><input type="text" name="emailId" size="26" placeholder="Enter Email-Id"
							value="<%=DataUtility.getStringData(bean.getEmail())%>"
							<%=(bean.getId() > 0) ? "readonly" : ""%>><font
							color="red"> <%=ServletUtility.getErrorMessage("emailId", request)%></font></td>
					</tr>

					<tr>
						<th align="left">Mobile No<font color="red">*</font></th>
						<td><input type="text" name="mobNo" size="26" placeholder="Enter Contact No"
							value="<%=DataUtility.getStringData(bean.getMobile_no())%>"><font
							color="red"> <%=ServletUtility.getErrorMessage("mobNo", request)%></font></td>
					</tr>

					<tr>
						<th align="left">Date Of Birth<font color="red">*</font></th>
						<td><input type="text" name="dob" 
							id="date" size="26" placeholder="Click Here" readonly="readonly"
							value="<%=DataUtility.getDateString(bean.getDob())%>"></a><font
							color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
					</tr>
					<tr>
						<td></td>
						<td><input style="width: 99px;" type="submit" name="operation"
							value="<%=(bean.getId() > 0) ? FacultyCtl.OP_UPDATE : UserCtl.OP_SAVE%>">
							<%if(bean.getId()>0){ %><input style="width: 97px;" type="submit" name="operation"
							value="<%=FacultyCtl.OP_CANCEL%>"><%}else{ %><input style="width: 97px;" type="submit" name="operation"
							value="<%=FacultyCtl.OP_RESET%>"><%} %></td>
					</tr>
				</table>
				
				
			</table>
		
	</form>
	
	<div><%@ include file="Footer.jsp"%></div>


</body>
</html>