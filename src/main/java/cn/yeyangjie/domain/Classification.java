package cn.yeyangjie.domain;

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
 * 博文类别PO类
 * 
 * @author Daemon
 * 
 */
@Entity
@Table(name = "t_classification")
public class Classification extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "classification_id")
	private int classificationId;

	@Column(name = "classification_name")
	private String classificationName;

	@Column(name = "classification_desc")
	private String classificationDesc;

	@ManyToOne(targetEntity = Classification.class, cascade = {
			CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "parent_id")
	private Classification parentId;

	public int getClassificationId() {
		return classificationId;
	}

	public void setClassificationId(int classificationId) {
		this.classificationId = classificationId;
	}

	public String getClassificationName() {
		return classificationName;
	}

	public void setClassificationName(String classificationName) {
		this.classificationName = classificationName;
	}

	public String getClassificationDesc() {
		return classificationDesc;
	}

	public void setClassificationDesc(String classificationDesc) {
		this.classificationDesc = classificationDesc;
	}

	public Classification getParentId() {
		return parentId;
	}

	public void setParentId(Classification parentId) {
		this.parentId = parentId;
	}

}
