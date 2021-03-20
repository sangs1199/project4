package in.co.sunrays.proj4.bean;

import java.util.Date;

/**
 * Faculty JavaBean encapsulates Faculty attributes
 *
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 *
 */

public class FacultyBean extends BaseBean {
	
	/**
	 * Id Of College
	 */
	private long collegeId;
	/**
	 * Id Of Course
	 */
	private long courseId;
	/**
	 * Name Of Course
	 */
	private String courseName;
	/**
	 * First Name Of Faculty
	 */
	private String first_name;
	/**
	 * Last Name Of Faculty
	 */
	private String last_name;
	/**
	 * Id Of Subject
	 */
	private long subjectId;
	/**
	 * Name Of Subject
	 */
	private String subjectName;
	/**
	 * Name Of College
	 */
	private String collegeName;
	/**
	 * Qualification Of faculty
	 */
	private String qualification;
	/**
	 * DOB Of Faculty
	 */
	private Date dob;
	/**
	 * Gender Of Faculty
	 */
	private String gender;
	/**
	 * Mobile Number Of Faculty
	 */
	private String mobile_no;
	/**
	 * EMail Of Faculty
	 */
	private String email;
	
	
	
	
	/**
	 * accessor
	 */
	public long getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(long collegeId) {
		this.collegeId = collegeId;
	}
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
	public String getCollegeName() {
		return collegeName;
	}
	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String getKey() {
		return id+"";
	}
	@Override
	public String getValue() {
	
		return first_name+""+last_name;
	}
	

}
