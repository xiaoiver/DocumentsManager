package nju.dm.domain;

import java.util.Date;

/**
 * DocumentTag entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class DocumentTag implements java.io.Serializable {

	// Fields

	private Integer documentTagId;
	private User user;
	private Tag tag;
	private Document document;
	private Date addTime;

	// Constructors

	/** default constructor */
	public DocumentTag() {
	}

	/** full constructor */
	public DocumentTag(User user, Tag tag, Document document, Date addTime) {
		this.user = user;
		this.tag = tag;
		this.document = document;
		this.addTime = addTime;
	}

	// Property accessors

	public Integer getDocumentTagId() {
		return this.documentTagId;
	}

	public void setDocumentTagId(Integer documentTagId) {
		this.documentTagId = documentTagId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Tag getTag() {
		return this.tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}

	public Document getDocument() {
		return this.document;
	}

	public void setDocument(Document document) {
		this.document = document;
	}

	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

}