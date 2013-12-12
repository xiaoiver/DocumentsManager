package nju.dm.domain;

import java.util.Date;

/**
 * Attachment entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Attachment implements java.io.Serializable {

	// Fields

	private Integer attachmentId;
	private Document document;
	private User user;
	private AttachmentType attachmentType;
	private Date uploadTime;
	private String name;

	// Constructors

	/** default constructor */
	public Attachment() {
	}

	/** full constructor */
	public Attachment(Document document, User user,
			AttachmentType attachmentType, Date uploadTime, String name) {
		this.document = document;
		this.user = user;
		this.attachmentType = attachmentType;
		this.uploadTime = uploadTime;
		this.name = name;
	}

	// Property accessors

	public Integer getAttachmentId() {
		return this.attachmentId;
	}

	public void setAttachmentId(Integer attachmentId) {
		this.attachmentId = attachmentId;
	}

	public Document getDocument() {
		return this.document;
	}

	public void setDocument(Document document) {
		this.document = document;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public AttachmentType getAttachmentType() {
		return this.attachmentType;
	}

	public void setAttachmentType(AttachmentType attachmentType) {
		this.attachmentType = attachmentType;
	}

	public Date getUploadTime() {
		return this.uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}