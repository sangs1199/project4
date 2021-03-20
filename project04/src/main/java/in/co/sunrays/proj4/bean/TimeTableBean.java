package in.co.sunrays.proj4.bean;

import java.util.Date;

/**
 * TimeTable JavaBean encapsulates TimeTable attributes
 *
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 *
 */

public class TimeTableBean extends BaseBean {
	
	
	/**
	 * Id Of Course
	 */
	private long courseId;
	/**
	 * Name Of Course
	 */
	private String courseName;
	/**
	 * Id Of Subject
	 */
	private long subjectId;
	/**
	 * Name Of Subject
	 */
	private String subjectName;
	/**
	 * Semester Detail
	 */
	private String semester;
	/**
	 * Date Of Exam
	 */
	private Date examDate;
	/**
	 * Time Of Exam
	 */
	private String time;
	
	

	/**
	 * accessor
	 */
	public long getCourseId() {
		return courseId;
	}

	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(long subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public Date getExamDate() {
		return examDate;
	}

	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String getKey() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getValue() {
		// TODO Auto-generated method stub
		return null;
	}

}
