package nju.dm.domain;

/**
 * Configuration entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Configuration implements java.io.Serializable {

	// Fields

	private Integer configurationId;
	private String confKey;
	private String confValue;
	private String comment;

	// Constructors

	/** default constructor */
	public Configuration() {
	}

	/** minimal constructor */
	public Configuration(String confKey) {
		this.confKey = confKey;
	}

	/** full constructor */
	public Configuration(String confKey, String confValue, String comment) {
		this.confKey = confKey;
		this.confValue = confValue;
		this.comment = comment;
	}

	// Property accessors

	public Integer getConfigurationId() {
		return this.configurationId;
	}

	public void setConfigurationId(Integer configurationId) {
		this.configurationId = configurationId;
	}

	public String getConfKey() {
		return this.confKey;
	}

	public void setConfKey(String confKey) {
		this.confKey = confKey;
	}

	public String getConfValue() {
		return this.confValue;
	}

	public void setConfValue(String confValue) {
		this.confValue = confValue;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}