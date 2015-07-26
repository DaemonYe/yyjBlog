package cn.yeyangjie.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.yeyangjie.domain.Classification;

@Repository
public class ClassificationDao extends BaseDao<Classification> {
	private final String GET_TOP_CLASSIFICATION = "from Classification c where c.parentId is null";
	private final String GET_CLASSIFICATION_BY_PARENTID = "from Classification c where c.parentId = ?";
	private final String GET_CLASSIFICATION_BY_NAME = "from Classification c where c.classificationName = ?";

	/**
	 * 根据父类ID获得对应的二级分类
	 * 
	 * @param parentId
	 * @return
	 */
	public List<Classification> queryClassificationByParentId(
			Classification parentId) {
		return (List<Classification>) getHibernateTemplate().find(
				GET_CLASSIFICATION_BY_PARENTID, parentId);
	}

	/**
	 * 获得所有一级分类
	 * 
	 * @return
	 */
	public List<Classification> queryTopClassification() {
		return (List<Classification>) getHibernateTemplate().find(
				GET_TOP_CLASSIFICATION);
	}

	/**
	 * 根据标签名查找标签
	 * 
	 * @param classificationName
	 * @return
	 */
	public Classification getClassificationByName(String classificationName) {
		List<Classification> classifications = (List<Classification>) getHibernateTemplate()
				.find(GET_CLASSIFICATION_BY_NAME, classificationName);
		if (classifications.size() == 0) {
			return null;
		} else {
			return classifications.get(0);
		}
	}

}
