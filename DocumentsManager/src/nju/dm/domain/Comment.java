package nju.dm.domain;

import java.util.Date;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Comment implements java.io.Serializable {

	// Fields

	private Integer commentId;
	private User user;
	private Document document;
	private String commentType;
	private String content;
	private String problem;
	private String idea;
	private String experiment;
	private String contribution;
	private String improvement;
	private Short isFinished;
	private Date finishTime;
	private Integer rank;
	private Date rankTime;

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** minimal constructor */
	public Comment(User user, Document document, String commentType,
			Short isFinished) {
		this.user = user;
		this.document = document;
		this.commentType = commentType;
		this.isFinished = isFinished;
	}

	/** full constructor */
	public Comment(User user, Document document, String commentType,
			String content, String problem, String idea, String experiment,
			String contribution, String improvement, Short isFinished,
			Date finishTime, Integer rank, Date rankTime) {
		this.user = user;
		this.document = document;
		this.commentType = commentType;
		this.content = content;
		this.problem = problem;
		this.idea = idea;
		this.experiment = experiment;
		this.contribution = contribution;
		this.improvement = improvement;
		this.isFinished = isFinished;
		this.finishTime = finishTime;
		this.rank = rank;
		this.rankTime = rankTime;
	}

	// Property accessors

	public Integer getCommentId() {
		return this.commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Document getDocument() {
		return this.document;
	}

	public void setDocument(Document document) {
		this.document = document;
	}

	public String getCommentType() {
		return this.commentType;
	}

	public void setCommentType(String commentType) {
		this.commentType = commentType;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getProblem() {
		return this.problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	public String getIdea() {
		return this.idea;
	}

	public void setIdea(String idea) {
		this.idea = idea;
	}

	public String getExperiment() {
		return this.experiment;
	}

	public void setExperiment(String experiment) {
		this.experiment = experiment;
	}

	public String getContribution() {
		return this.contribution;
	}

	public void setContribution(String contribution) {
		this.contribution = contribution;
	}

	public String getImprovement() {
		return this.improvement;
	}

	public void setImprovement(String improvement) {
		this.improvement = improvement;
	}

	public Short getIsFinished() {
		return this.isFinished;
	}

	public void setIsFinished(Short isFinished) {
		this.isFinished = isFinished;
	}

	public Date getFinishTime() {
		return this.finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}

	public Integer getRank() {
		return this.rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public Date getRankTime() {
		return this.rankTime;
	}

	public void setRankTime(Date rankTime) {
		this.rankTime = rankTime;
	}

}