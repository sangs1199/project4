<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <style type="text/css">
input[type=text],input[type=password],textarea{
	width: 190px;
	padding: 3px ;
}
select{
width:196px;
padding: 3px;}
/* input[type=button], input[type=submit], input[type=reset] {
    
    padding: 5px 24px;
    border-radius: 4px;
}
 */
</style> -->
<%@page import="in.co.sunrays.proj4.bean.RoleBean"%>
<%@page import="in.co.sunrays.proj4.controller.LoginCtl"%>
<%@page import="in.co.sunrays.proj4.bean.UserBean"%>
<%@page import="in.co.sunrays.proj4.controller.ORSView"%>
<%
	UserBean userBean = (UserBean) session.getAttribute("user");

	boolean userLoggedIn = userBean != null;

	String welcomeMsg = "Hi, ";

	if (userLoggedIn) {
		String role = (String) session.getAttribute("role");
		welcomeMsg += userBean.getFirstName() + " (" + role + ")";
	} else {
		welcomeMsg += "Guest";
	}
%>

<table width="100%" border="0" bgcolor="">
	<tr>
		<td width="90%"><a href="<%=ORSView.WELCOME_CTL%>">Welcome</b></a>
			&emsp;|&emsp; <%
 	if (userLoggedIn) {
 %> <a
			href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</b></a>

			<%
				} else {
			%> <a href="<%=ORSView.LOGIN_CTL%>">Login</b></a> <%
 	}
 %></td>
		<td rowspan="2">
			<h1 align="Right">
				<img src="<%=ORSView.APP_CONTEXT%>/img/rays.png" width="240"
					height="50">
			</h1>
		</td>

	</tr>

	<tr>
		<td>
			<h3>
				<%=welcomeMsg%></h3>
		</td>
	</tr>


	<%
		if (userLoggedIn) {
	%>

	<tr>
		<td colspan="2">&emsp; <a href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</b></a>
			&emsp; <a href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</b></a>&emsp;<a
			href="<%=ORSView.GET_MARKSHEET_CTL%>">Get Marksheet</b></a> &emsp; <a
			href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>">Marksheet Merit List</b>
		</a> &emsp; <%
 	if (userBean.getRoleId() == RoleBean.ADMIN) {
 %> <a href="<%=ORSView.MARKSHEET_CTL%>">Add Marksheet</b></a> &emsp;
			<a href="<%=ORSView.MARKSHEET_LIST_CTL%>">Marksheet List</b></a> &emsp; <a
			href="<%=ORSView.USER_CTL%>">Add User</b></a> &emsp; <a
			href="<%=ORSView.USER_LIST_CTL%>">User List</b></a> &emsp;<a
			href="<%=ORSView.COLLEGE_CTL%>">Add College</b></a> &emsp;<a
			href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</b></a> &emsp; <a
			href="<%=ORSView.STUDENT_CTL%>">Add Student</b></a><br>
		<br> &emsp; <a href="<%=ORSView.STUDENT_LIST_CTL%>">Student
				List</b>
		</a> &emsp; <a href="<%=ORSView.ROLE_CTL%>">Add Role</b></a> &emsp;<a
			href="<%=ORSView.ROLE_LIST_CTL%>">Role List</b></a> &emsp; <a
			href="<%=ORSView.COURSES_CTL%>">Add Course</b></a> &emsp; <a
			href="<%=ORSView.COURSES_LIST_CTL%>">Courses List</a>&emsp; <a
			href="<%=ORSView.FACULTY_CTL%>">Add Faculty</b></a> &emsp; <a
			href="<%=ORSView.FACULTY_LIST_CTL%>">Faculty List</a>&emsp; <a
			href="<%=ORSView.SUBJECTS_CTL%>">Add Subjects</b></a> &emsp; <a
			href="<%=ORSView.SUBJECTS_LIST_CTL%>">Subjects List</a>&emsp; <a
			href="<%=ORSView.TIMETABLE_CTL%>">Add TimeTable</b></a> &emsp; <a
			href="<%=ORSView.TIMETABLE_LIST_CTL%>"> TimeTable List</a>&emsp;<a
			href="<%=ORSView.JAVA_DOC_VIEW%>" target="blank">Java Doc</b></a> &emsp;
			<%
				}
			%></td>

	</tr>
	<%
		}
	%>
</table>
<hr>