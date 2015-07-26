package cn.yeyangjie.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 博文评论
 * 
 * @author Daemon
 * 
 */

@Entity
@Table(name = "t_comment")
public class Comment extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comment_id")
	private int commentId;

	@Column(name = "comment_author")
	private String commentAuthor;

	@Column(name = "comment_email")
	private String commentEmail;

	@Column(name = "comment_website")
	private String commentWebsite;

	@Column(name = "comment_content")
	private String commentContent;

	@ManyToOne(targetEntity = Blog.class, cascade = { CascadeType.PERSIST,
			CascadeType.MERGE })
	@JoinColumn(name = "blog_id")
	private Blog blogId;

	@Column(name = "check_status")
	private char checkStatus;

	@ManyToOne(targetEntity = Comment.class, cascade = { CascadeType.PERSIST,
			CascadeType.MERGE })
	@JoinColumn(name = "parent_id")
	private Comment parentId;

	@Column(name = "comment_time")
	private Date commentTime;

	public Comment getParentId() {
		return parentId;
	}

	public Date getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}

	public void setParentId(Comment parentId) {
		this.parentId = parentId;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getCommentAuthor() {
		return commentAuthor;
	}

	public void setCommentAuthor(String commentAuthor) {
		this.commentAuthor = commentAuthor;
	}

	public String getCommentEmail() {
		return commentEmail;
	}

	public void setCommentEmail(String commentEmail) {
		this.commentEmail = commentEmail;
	}

	public String getCommentWebsite() {
		return commentWebsite;
	}

	public void setCommentWebsite(String commentWebsite) {
		this.commentWebsite = commentWebsite;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Blog getBlogId() {
		return blogId;
	}

	public void setBlogId(Blog blogId) {
		this.blogId = blogId;
	}

	public char getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(char checkStatus) {
		this.checkStatus = checkStatus;
	}

}
