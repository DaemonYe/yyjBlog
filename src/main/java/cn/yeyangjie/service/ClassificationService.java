package cn.yeyangjie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yeyangjie.dao.BlogDao;
import cn.yeyangjie.dao.ClassificationDao;
import cn.yeyangjie.domain.Classification;

@Service
public class ClassificationService {
	@Autowired
	private ClassificationDao classificationDao;

	@Autowired
	private BlogDao blogDao;

	/**
	 * 根据id获得分类对象
	 * 
	 * @param id
	 * @return
	 */
	public Classification getClassificationByClassificationId(int id) {
		return classificationDao.get(id);
	}

	/**
	 * 添加分类
	 * 
	 * @param classification
	 */
	public void addClassification(Classification classification) {
		int pid = classification.getParentId().getClassificationId();
		classification.setParentId(getClassificationByClassificationId(pid));
		classificationDao.save(classification);
	}

	/**
	 * 根据父分类ID查询分类
	 * 
	 * @param parentId
	 * @return
	 */
	public List<Classification> getClassificationsByParentId(int parentId) {
		return classificationDao
				.queryClassificationByParentId(getClassificationByClassificationId(parentId));
	}

	/**
	 * 获得所有一级分类
	 * 
	 * @return
	 */
	public List<Classification> getTopClassification() {
		return classificationDao.queryTopClassification();

	}

	/**
	 * 获得所有分类
	 * 
	 * @return
	 */
	public List<Classification> getAllClassification() {
		return classificationDao.loadAll();
	}

	/**
	 * 更改分类
	 * 
	 * @param classification
	 */
	public void updateClassification(Classification classification) {
		int pid = classification.getParentId().getClassificationId();
		classification.setParentId(getClassificationByClassificationId(pid));
		classificationDao.update(classification);
	}

	/**
	 * 删除二级分类
	 * 
	 * @param classification
	 */
	public void deleteSecondClassification(Classification classification) {
		blogDao.deleteBlogByClassificationId(classification);
		classificationDao.remove(classification);
	}

	/**
	 * 判断是否有相同的分类名
	 * 
	 * @param classificationName
	 * @return
	 */
	public Classification getClassificationByName(String classificationName) {
		return classificationDao.getClassificationByName(classificationName);
	}
}
