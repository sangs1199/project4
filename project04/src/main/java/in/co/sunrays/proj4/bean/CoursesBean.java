package in.co.sunrays.proj4.bean;

/**
 * Course JavaBean encapsulates Course attributes
 *
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 *
 */

public class CoursesBean extends BaseBean {
	
	/**
	 * Name Of Course
	 */
	private String name;
	/**
	 * Description Of Course
	 */
	private String description;
	/**
	 * Duration Of Course
	 */
	private String duration;


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

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	@Override
	public String getKey() {

		return id+"";
	}

	@Override
	public String getValue() {
		// TODO Auto-generated method stub
		return name;
	}

}
