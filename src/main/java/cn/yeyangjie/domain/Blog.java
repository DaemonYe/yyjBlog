package cn.yeyangjie.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 博文PO类
 * 
 * @author Daemon
 * 
 */
@Entity
@Table(name = "t_blog")
public class Blog extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "blog_id")
	private int blogId;

	@Column(name = "blog_title")
	private String blogTitle;

	@Column(name = "blog_content")
	private String blogContent;

	@ManyToOne(targetEntity = Classification.class, cascade = {
			CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "classification_id")
	private Classification classificationId;

	@Column(name = "blog_type")
	private char blogType;

	@Column(name = "recommend_status")
	private char recommendStatus;

	@Column(name = "blog_views")
	private int blogViews;

	@Column(name = "blog_replies")
	private int blogReplies;

	@Column(name = "create_time")
	private Date createTime;

	@Column(name = "update_time")
	private Date updateTime;

	@Column(name = "delete_status")
	private char deleteStatus;

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "t_tag_blog", joinColumns = { @JoinColumn(name = "blog_id") }, inverseJoinColumns = { @JoinColumn(name = "tag_id") })
	private List<Tag> tags = new ArrayList<Tag>();

	public char getRecommendStatus() {
		return recommendStatus;
	}

	public void setRecommendStatus(char recommendStatus) {
		this.recommendStatus = recommendStatus;
	}

	public int getBlogId() {
		return blogId;
	}

	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}

	public String getBlogTitle() {
		return blogTitle;
	}

	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}

	public String getBlogContent() {
		return blogContent;
	}

	public void setBlogContent(String blogContent) {
		this.blogContent = blogContent;
	}

	public Classification getClassificationId() {
		return classificationId;
	}

	public void setClassificationId(Classification classificationId) {
		this.classificationId = classificationId;
	}

	public char getBlogType() {
		return blogType;
	}

	public void setBlogType(char blogType) {
		this.blogType = blogType;
	}

	public int getBlogViews() {
		return blogViews;
	}

	public void setBlogViews(int blogViews) {
		this.blogViews = blogViews;
	}

	public int getBlogReplies() {
		return blogReplies;
	}

	public void setBlogReplies(int blogReplies) {
		this.blogReplies = blogReplies;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public char getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(char deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

}
