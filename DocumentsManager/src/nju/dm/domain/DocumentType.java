package nju.dm.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * DocumentType entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class DocumentType implements java.io.Serializable {

	// Fields

	private Integer documentTypeId;
	private String name;
	private String description;

	// Constructors

	/** default constructor */
	public DocumentType() {
	}

	/** minimal constructor */
	public DocumentType(String name) {
		this.name = name;
	}

	/** full constructor */
	public DocumentType(String name, String description) {
		this.name = name;
		this.description = description;
	}

	// Property accessors

	public Integer getDocumentTypeId() {
		return this.documentTypeId;
	}

	public void setDocumentTypeId(Integer documentTypeId) {
		this.documentTypeId = documentTypeId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}