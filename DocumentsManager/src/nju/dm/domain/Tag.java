package nju.dm.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Tag entity. @author MyEclipse Persistence Tools
 */
@SuppressWarnings("serial")
public class Tag implements java.io.Serializable {
	// Fields
	private Integer tagId;
	private User user;
	private String name;
	private Date createTime;
	private Set<DocumentTag> documentTags = new HashSet<DocumentTag>(0);
	
	// Constructors

	/** default constructor */
	public Tag() {
	}

	/** minimal constructor */
	public Tag(User user, String name, Date createTime) {
		this.user = user;
		this.name = name;
		this.createTime = createTime;
	}

	/** full constructor */
	public Tag(User user, String name, Date createTime, Set<DocumentTag> documentTags) {
		this.user = user;
		this.name = name;
		this.createTime = createTime;
		this.documentTags = documentTags;
	}
	
	// Property accessors

	public Integer getTagId() {
		return this.tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Set<DocumentTag> getDocumentTags() {
		return this.documentTags;
	}

	public void setDocumentTags(Set<DocumentTag> documentTags) {
		this.documentTags = documentTags;
	}
}
