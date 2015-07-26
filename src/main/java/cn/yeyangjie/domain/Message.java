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
 * 留言板
 * 
 * @author Daemon
 * 
 */
@Entity
@Table(name = "t_message")
public class Message extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "message_id")
	private int messageId;

	@Column(name = "message_author")
	private String messageAuthor;

	@Column(name = "message_email")
	private String messageEmail;

	@Column(name = "message_website")
	private String messageWebsite;

	@Column(name = "message_content")
	private String messageContent;

	@Column(name = "check_status")
	private char checkStatus;

	@ManyToOne(targetEntity = Message.class, cascade = { CascadeType.PERSIST,
			CascadeType.MERGE })
	@JoinColumn(name = "parent_id")
	private Message parentId;

	@Column(name = "message_time")
	private Date messageTime;

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public String getMessageAuthor() {
		return messageAuthor;
	}

	public void setMessageAuthor(String messageAuthor) {
		this.messageAuthor = messageAuthor;
	}

	public String getMessageEmail() {
		return messageEmail;
	}

	public void setMessageEmail(String messageEmail) {
		this.messageEmail = messageEmail;
	}

	public String getMessageWebsite() {
		return messageWebsite;
	}

	public void setMessageWebsite(String messageWebsite) {
		this.messageWebsite = messageWebsite;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public char getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(char checkStatus) {
		this.checkStatus = checkStatus;
	}

	public Message getParentId() {
		return parentId;
	}

	public void setParentId(Message parentId) {
		this.parentId = parentId;
	}

	public Date getMessageTime() {
		return messageTime;
	}

	public void setMessageTime(Date messageTime) {
		this.messageTime = messageTime;
	}

}
