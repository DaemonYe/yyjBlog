package cn.yeyangjie.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.yeyangjie.domain.Message;

@Repository
public class MessageDao extends BaseDao<Message> {

	private final String GET_PAGED_MESSAGES_DEFAULT = "from Message order by messageTime desc";
	// 获得评论
	private final String GET_PAGED_MESSAGES = "from Message where checkStatus != '2' and parentId is null order by messageTime desc";
	private final String GET_UNCHECKED_MESSAGES = "from Message where checkStatus = '0'";
	// 获得子留言
	private final String GET_CHILDREN_MESSAGES = "from Message where parentId = ? and checkStatus != '2' order by messageTime";
	private final String GET_PAGED_CHECK_MESSAGES = "from Message where checkStatus = '1' order by messageTime";
	private final String GET_PAGED_NO_CHECK_MESSAGES = "from Message where checkStatus = '2' order by messageTime";

	/**
	 * 获得默认的留言列表
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getPagedBlogs(Integer pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_MESSAGES_DEFAULT, pageNo, pageSize);
	}

	/**
	 * 获得未审核的评论
	 * 
	 * @return
	 */
	public List<Message> getUncheckedMessages() {
		return (List<Message>) getHibernateTemplate().find(
				GET_UNCHECKED_MESSAGES);
	}

	/**
	 * 获得分页的留言
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getPagedMessages(Integer pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_MESSAGES, pageNo, pageSize);
	}

	/**
	 * 根据父留言获得子留言
	 * 
	 * @param message
	 * @return
	 */
	public List<Message> getChildMessages(Message message) {
		return (List<Message>) getHibernateTemplate().find(
				GET_CHILDREN_MESSAGES, message);
	}

	/**
	 * 获得审核通过的留言
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getPagedCheckComments(Integer pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_CHECK_MESSAGES, pageNo, pageSize);
	}

	/**
	 * 获得审核未通过的留言
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getNoPagedCheckComments(Integer pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_NO_CHECK_MESSAGES, pageNo, pageSize);
	}

}
