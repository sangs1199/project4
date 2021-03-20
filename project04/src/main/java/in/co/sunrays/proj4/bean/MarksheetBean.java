package in.co.sunrays.proj4.bean;

/**
 * Marksheet JavaBean encapsulates Marksheet attributes
 *
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 *
 */
public class MarksheetBean extends BaseBean{
	 /**
     * Rollno of Student
     */
	private String rollNo;
	 /**
     * ID of Student
     */
	private long studentId;
	  /**
     * Name of Student
     */
	private String name;
	 /**
     * Physics marks of Student
     */
	private Integer physics;
	 /**
     * Chemistry marks of Student
     */
	private Integer chemistry;
	 /**
     * Mathematics marks of Student
     */
	private Integer maths;
	
	  /**
     * accessor
     */

	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}
	public long getStudentId() {
		return studentId;
	}
	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPhysics() {
		return physics;
	}
	public void setPhysics(int physics) {
		this.physics = physics;
	}
	public Integer getChemistry() {
		return chemistry;
	}
	public void setChemistry(int chemistry) {
		this.chemistry = chemistry;
	}
	public Integer getMaths() {
		return maths;
	}
	public void setMaths(int maths) {
		this.maths = maths;
	}
	   @Override
	    public String getKey() {
	        return id + "";
	    }

	    @Override
	    public String getValue() {
	        return rollNo;
	    }


}
