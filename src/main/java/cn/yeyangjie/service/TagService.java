package cn.yeyangjie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yeyangjie.dao.TagDao;
import cn.yeyangjie.domain.Tag;

@Service
public class TagService {

	@Autowired
	private TagDao tagDao;

	/**
	 * 添加标签
	 * 
	 * @param tag
	 */
	public void addTag(Tag tag) {
		tagDao.save(tag);
	}

	/**
	 * 查询所有标签
	 * 
	 * @return
	 */
	public List<Tag> getTags() {
		return tagDao.findAll();
	}

	/**
	 * 根据标签Id查询标签
	 * 
	 * @param parseInt
	 * @return
	 */
	public Tag getTagByTagId(int id) {
		return tagDao.get(id);
	}

	/**
	 * 更新标签
	 * 
	 * @param tag
	 */
	public void updateTag(Tag tag) {
		tagDao.update(tag);
	}

	/**
	 * 删除标签
	 * 
	 * @param tag
	 */
	public void deleteTag(String tagId) {
		Tag tag = getTagByTagId(Integer.parseInt(tagId));
		tagDao.remove(tag);
	}

	/**
	 * 获得热门标签
	 * 
	 * @return
	 */
	public List<Tag> getHotTags() {
		return tagDao.getHotTags();
	}

	/**
	 * 通过标签名获得标签
	 * 
	 * @param str
	 * @return
	 */
	public Tag getTagByName(String tagName) {
		return tagDao.getTagByName(tagName);
	}
}
