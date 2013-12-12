package nju.dm.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * AbstractUser entity provides the base persistence definition of the User entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public abstract class User  implements java.io.Serializable {

    // Fields    

     private Integer userId;
     private UserType userType;
     private String username;
     private String password;
     private String name;
     private String email;
     private String phone;
     private Date regDate;
     private Set<Document> documents = new HashSet<Document>(0);
     private Set<DocumentTag> documentTags = new HashSet<DocumentTag>(0);
     private Set<Tag> tags = new HashSet<Tag>(0);
     private Set<Attachment> attachments = new HashSet<Attachment>(0);
     private Set<Comment> comments = new HashSet<Comment>(0);


    // Constructors

    /** default constructor */
    public User() {
    }

	/** minimal constructor */
    public User(UserType userType, String username, String password, Date regDate) {
        this.userType = userType;
        this.username = username;
        this.password = password;
        this.regDate = regDate;
    }
   
    // Property accessors

    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public UserType getUserType() {
        return this.userType;
    }
    
    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getRegDate() {
        return this.regDate;
    }
    
    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Set<Document> getDocuments() {
        return this.documents;
    }
    
    public void setDocuments(Set<Document> documents) {
        this.documents = documents;
    }

    public Set<DocumentTag> getDocumentTags() {
        return this.documentTags;
    }
    
    public void setDocumentTags(Set<DocumentTag> documentTags) {
        this.documentTags = documentTags;
    }

    public Set<Tag> getTags() {
        return this.tags;
    }
    
    public void setTags(Set<Tag> tags) {
        this.tags = tags;
    }

    public Set<Attachment> getAttachments() {
        return this.attachments;
    }
    
    public void setAttachments(Set<Attachment> attachments) {
        this.attachments = attachments;
    }

    public Set<Comment> getComments() {
        return this.comments;
    }
    
    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }
   








}