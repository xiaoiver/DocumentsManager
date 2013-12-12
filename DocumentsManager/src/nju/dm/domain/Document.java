package nju.dm.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Document entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Document implements java.io.Serializable {

	// Fields

	private Integer documentId;
	private User user;
	private DocumentType documentType;
	private Date addTime;
	private String title;
	private String author;
	private String year;
	private Integer pages;
	private String abstracts;
	private String keywords;
	private String publisher;
	private String url;
	private String publication;
	private String city;
	private String volume;
	private String issue;
	private String editor;
	private String isbn;
	private String bookName;
	private String schoolName;
	private String doi;
	
	private Double avrRank;
	private Set<DocumentTag> documentTags = new HashSet<DocumentTag>(0);
	private Set<DocumentRelation> documentRelationsForDocumentId = new HashSet<DocumentRelation>(0);
	private Set<Attachment> attachments = new HashSet<Attachment>(0);
	private Set<DocumentRelation> documentRelationsForReferenceId = new HashSet<DocumentRelation>(0);
	private Set<Comment> comments = new HashSet<Comment>(0);

	// Constructors

	/** default constructor */
	public Document() {
	}

	/** minimal constructor */
	public Document(User user, DocumentType documentType, Date addTime,
			String title, String author, String year, Integer pages,
			String abstracts, String keywords, String publisher, String url) {
		this.user = user;
		this.documentType = documentType;
		this.addTime = addTime;
		this.title = title;
		this.author = author;
		this.year = year;
		this.pages = pages;
		this.abstracts = abstracts;
		this.keywords = keywords;
		this.publisher = publisher;
		this.url = url;
	}

	// Property accessors

	public Integer getDocumentId() {
		return this.documentId;
	}

	public void setDocumentId(Integer documentId) {
		this.documentId = documentId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public DocumentType getDocumentType() {
		return this.documentType;
	}

	public void setDocumentType(DocumentType documentType) {
		this.documentType = documentType;
	}

	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getYear() {
		return this.year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Integer getPages() {
		return this.pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	public String getAbstracts() {
		return this.abstracts;
	}

	public void setAbstracts(String abstracts) {
		this.abstracts = abstracts;
	}

	public String getKeywords() {
		return this.keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getPublisher() {
		return this.publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPublication() {
		return this.publication;
	}

	public void setPublication(String publication) {
		this.publication = publication;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getVolume() {
		return this.volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getIssue() {
		return this.issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}

	public String getBookName() {
		return this.bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getSchoolName() {
		return this.schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getEditor() {
		return this.editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}
	
	public String getIsbn() {
		return this.isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	public String getDoi() {
		return this.doi;
	}

	public void setDoi(String doi) {
		this.doi = doi;
	}

	public Double getAvrRank() {
		return this.avrRank;
	}

	public void setAvrRank(Double avrRank) {
		this.avrRank = avrRank;
	}

	public Set<DocumentTag> getDocumentTags() {
		return this.documentTags;
	}

	public void setDocumentTags(Set<DocumentTag> documentTags) {
		this.documentTags = documentTags;
	}

	public Set<DocumentRelation> getDocumentRelationsForDocumentId() {
		return this.documentRelationsForDocumentId;
	}

	public void setDocumentRelationsForDocumentId(
			Set<DocumentRelation> documentRelationsForDocumentId) {
		this.documentRelationsForDocumentId = documentRelationsForDocumentId;
	}

	public Set<Attachment> getAttachments() {
		return this.attachments;
	}

	public void setAttachments(Set<Attachment> attachments) {
		this.attachments = attachments;
	}

	public Set<DocumentRelation> getDocumentRelationsForReferenceId() {
		return this.documentRelationsForReferenceId;
	}

	public void setDocumentRelationsForReferenceId(
			Set<DocumentRelation> documentRelationsForReferenceId) {
		this.documentRelationsForReferenceId = documentRelationsForReferenceId;
	}

	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

}