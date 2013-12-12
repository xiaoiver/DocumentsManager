package nju.dm.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * Relation entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Relation implements java.io.Serializable {

	// Fields

	private Integer relationId;
	private String name;
	private Set<DocumentRelation> documentRelations = new HashSet<DocumentRelation>(0);

	// Constructors

	/** default constructor */
	public Relation() {
	}

	/** minimal constructor */
	public Relation(String name) {
		this.name = name;
	}

	/** full constructor */
	public Relation(String name, Set<DocumentRelation> documentRelations) {
		this.name = name;
		this.documentRelations = documentRelations;
	}

	// Property accessors

	public Integer getRelationId() {
		return this.relationId;
	}

	public void setRelationId(Integer relationId) {
		this.relationId = relationId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<DocumentRelation> getDocumentRelations() {
		return this.documentRelations;
	}

	public void setDocumentRelations(Set<DocumentRelation> documentRelations) {
		this.documentRelations = documentRelations;
	}

}