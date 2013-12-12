package nju.dm.domain;

/**
 * DocumentRelation entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class DocumentRelation implements java.io.Serializable {

	// Fields

	private Integer documentRelationId;
	private Document documentByDocumentId;
	private Relation relation;
	private Document documentByReferenceId;

	// Constructors

	/** default constructor */
	public DocumentRelation() {
	}

	/** minimal constructor */
	public DocumentRelation(Relation relation) {
		this.relation = relation;
	}

	/** full constructor */
	public DocumentRelation(Document documentByDocumentId, Relation relation,
			Document documentByReferenceId) {
		this.documentByDocumentId = documentByDocumentId;
		this.relation = relation;
		this.documentByReferenceId = documentByReferenceId;
	}

	// Property accessors

	public Integer getDocumentRelationId() {
		return this.documentRelationId;
	}

	public void setDocumentRelationId(Integer documentRelationId) {
		this.documentRelationId = documentRelationId;
	}

	public Document getDocumentByDocumentId() {
		return this.documentByDocumentId;
	}

	public void setDocumentByDocumentId(Document documentByDocumentId) {
		this.documentByDocumentId = documentByDocumentId;
	}

	public Relation getRelation() {
		return this.relation;
	}

	public void setRelation(Relation relation) {
		this.relation = relation;
	}

	public Document getDocumentByReferenceId() {
		return this.documentByReferenceId;
	}

	public void setDocumentByReferenceId(Document documentByReferenceId) {
		this.documentByReferenceId = documentByReferenceId;
	}

}