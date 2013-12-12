package nju.dm.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * AttachmentType entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class AttachmentType implements java.io.Serializable {

	// Fields

	private Integer attachmentTypeId;
	private String name;
	private Set<Attachment> attachments = new HashSet<Attachment>(0);

	// Constructors

	/** default constructor */
	public AttachmentType() {
	}

	/** minimal constructor */
	public AttachmentType(String name) {
		this.name = name;
	}

	/** full constructor */
	public AttachmentType(String name, Set<Attachment> attachments) {
		this.name = name;
		this.attachments = attachments;
	}

	// Property accessors

	public Integer getAttachmentTypeId() {
		return this.attachmentTypeId;
	}

	public void setAttachmentTypeId(Integer attachmentTypeId) {
		this.attachmentTypeId = attachmentTypeId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Attachment> getAttachments() {
		return this.attachments;
	}

	public void setAttachments(Set<Attachment> attachments) {
		this.attachments = attachments;
	}

}