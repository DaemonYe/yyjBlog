package cn.yeyangjie.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.yeyangjie.domain.Tag;

@Repository
public class TagDao extends BaseDao<Tag> {
	private final String GET_HOT_TAG = "from Tag order by tagViews desc";
	private final String GET_TAGS = "from Tag order by tagViews desc";
	private final String GET_TAGS_BY_NAME = "from Tag where tagName = ?";

	/**
	 * 获得热门标签
	 * 
	 * @return
	 */
	public List<Tag> getHotTags() {
		List<Tag> tags = (List<Tag>) getHibernateTemplate().find(GET_HOT_TAG);
		if (tags.size() > 10) {
			return tags.subList(0, 10);
		} else {
			return tags;
		}
	}

	public List<Tag> findAll() {
		return (List<Tag>) getHibernateTemplate().find(GET_TAGS);
	}

	/**
	 * 通过标签名获得tag
	 * 
	 * @param tagName
	 * @return
	 */
	public Tag getTagByName(String tagName) {
		List<Tag> tags = (List<Tag>) getHibernateTemplate().find(
				GET_TAGS_BY_NAME, tagName);
		if (tags.size() == 0) {
			return null;
		} else {
			return tags.get(0);
		}
	}

}
