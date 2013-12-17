package nju.dm.domain;

/**
 * UserType entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class UserType implements java.io.Serializable {

	// Fields

	private Integer userTypeId;
	private String name;

	// Constructors

	/** default constructor */
	public UserType() {
	}

	/** full constructor */
	public UserType(String name) {
		this.name = name;
	}

	// Property accessors

	public Integer getUserTypeId() {
		return this.userTypeId;
	}

	public void setUserTypeId(Integer userTypeId) {
		this.userTypeId = userTypeId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
}