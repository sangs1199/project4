package in.co.sunrays.proj4.bean;

/**
 * Subjects JavaBean encapsulates Subject attributes
 *
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 *
 */

public class SubjectsBean extends BaseBean{
	
	/**
	 * Name Of Subject
	 */
	private String name;
	/**
	 * Description Of Subject
	 */
	private String description;
	/**
	 * Course Id
	 */
	private long courseId;
	
	/**
	 * accessor
	 */
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	private String courseName;

	
	
	@Override
	public String getKey() {
		// TODO Auto-generated method stub
		return id+"";
	}
	@Override
	public String getValue() {
		// TODO Auto-generated method stub
		return name;
	}
	
	

}
