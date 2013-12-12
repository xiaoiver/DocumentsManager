package nju.dm.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * UserType entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class UserType implements java.io.Serializable {

	// Fields

	private Integer userTypeId;
	private String name;
	private Set<User> users = new HashSet<User>(0);

	// Constructors

	/** default constructor */
	public UserType() {
	}

	/** minimal constructor */
	public UserType(String name) {
		this.name = name;
	}

	/** full constructor */
	public UserType(String name, Set<User> users) {
		this.name = name;
		this.users = users;
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

	public Set<User> getUsers() {
		return this.users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}