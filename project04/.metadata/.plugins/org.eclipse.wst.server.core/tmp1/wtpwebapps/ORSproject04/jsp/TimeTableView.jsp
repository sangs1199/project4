<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.controller.TimeTableCtl"%>
<%@page import="java.util.HashMap"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../js/jquery-ui.css"></link>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com//jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
function noSunday(date){
	return [date.getDay()==0 ? false:true]
};
$(function(){
	$("#date").datepicker({
		changeMonth:true,
		changeYear:true,
		//maxDate:100,
		//maxYear:2,
		minDate: 0,
		beforeShowDay:noSunday,
		//beforeShowDay1: noSunday1,
		
		yearRange:"-0:+1"
		//yearRange:"+10:"
		
		
		//defaultDate:"01/01/1999"
	});	
});
</script>

 <!-- /* $(function() {
	 var endyear=new Date();
	 var startyear=new Date().getFullYear()-2;
		$("#datepicker2").datepicker({
			dateFormat : 'mm/dd/yy',
			minDate: new Date(),
			maxDate: new Date().getFullYear()-2,
			changeMonth : true,
			changeYear : true,
			beforeShowDay: noSunday,
			yearRange : "endyear:startyear" 
		});
	});  */ -->
<link rel="stylesheet" type="text/css" href="../format.css"></link>
</head>
<body bgcolor="Thistle">

<div><%@ include file="Header.jsp"%></div>
	<div align="center" >
		
		<form action="<%=ORSView.TIMETABLE_CTL%>" method="post">


			<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.TimeTableBean" scope="request"></jsp:useBean>
			<%
				List coursel = (List) request.getAttribute("courseList");
				List subjectl = (List) request.getAttribute("subjectList");
			%>
			<br>
			<br>
			<br>
			<br>
			<%
				if (bean.getId() > 0) {
			%>
			<h1 align="center">Update TimeTable</h1>
			<%
				} else {
			%>
			<h1 align="center">Add TimeTable</h1>
			<%
				}
			%>
			<h2 align="center">
				<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
			
			<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
			</h2>
	</div>

	<input type="hidden" name="id" value="<%=bean.getId()%>">
	<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
	<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
	<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
	<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">


	
		<table align="center">
			<colgroup>
				<col style="width: 22%">
				<col style="width: 22%">
				<col style="width: 56%">
			</colgroup>
			<table align="center" style="margin-left:5% ">

				<tr>
					<th align="left">Course Name<font color="red">*</font></th>
					<td><%=HTMLUtility.getList("courseId", String.valueOf(bean.getCourseId()), coursel)%><font
						color="red"> <%=ServletUtility.getErrorMessage("courseId", request)%></font></td>
				</tr>
				<tr>
					<th align="left">Subject Name<font color="red">*</font></th>
					<td><%=HTMLUtility.getList("subjectId", String.valueOf(bean.getSubjectId()), subjectl)%><font
						color="red"> <%=ServletUtility.getErrorMessage("subjectId", request)%></font></td>
				</tr>
				
				<tr>
					<th align="left">Semester<font color="red">*</font></th>
					<td>
						<%
							HashMap map = new HashMap();

							map.put("I", "I");
							map.put("II", "II");
							map.put("III", "III");
							map.put("IV", "IV");
							map.put("V", "V");
							map.put("VI", "VI");
							map.put("VII", "VII");
							map.put("VIII", "VIII");

							String htmlList = HTMLUtility.getList("semester", bean.getSemester(), map);
							DataUtility.getString("semester");
						%> <%=htmlList%><font color="red"> <%=ServletUtility.getErrorMessage("semester", request)%></font>

					</td>
				</tr>
				

				<tr>
					<th align="left">Exam Date<font color="red">*</font></th>
					<td><input type="text" name="examDate"
						  placeholder="Date Of Exam(Click Here)" readonly="readonly"
						value="<%=DataUtility.getDateString(bean.getExamDate())%>"  id="date"><font
						color="red"> <%=ServletUtility.getErrorMessage("examDate", request)%></font></td>
				</tr>
                  
				<tr>
					<th align="left">Time<font color="red">*</font></th>
					<td>
						<%
							HashMap map1 = new HashMap();

						    map1.put( "08:00 am to 11:00am", "08:00 am to 11:00am");
						    map1.put("10:00 am to 01:00pm", "10:00 am to 01:00pm");
							map1.put("01:00 pm to 04:00pm", "01:00 pm to 04:00pm");
							

							String htmlList1 = HTMLUtility.getList("time", bean.getTime(), map1);
						%> <%=htmlList1%><font color="red"> <%=ServletUtility.getErrorMessage("time", request)%></font>

					</td>
				</tr>
				
				<tr></tr><tr></tr><tr></tr><tr></tr>

				<tr>
					<td></td>
					<td><input type="submit" name="operation"
						value="<%=(bean.getId()<=0)?TimeTableCtl.OP_SAVE:TimeTableCtl.OP_UPDATE%>" style="width: 99px;"> 
						<input type="submit" name="operation"
						value="<%=TimeTableCtl.OP_CANCEL%>" style="width: 97px;"></td>
				</tr>

			</table>
			</form>
			</div>
			
			
			</div>
</body>
<%@include file="Footer.jsp"%>
</html>