package cn.yeyangjie.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.yeyangjie.domain.Blog;
import cn.yeyangjie.domain.Comment;

@Repository
public class CommentDao extends BaseDao<Comment> {

	// 通过博文ID获得评论列表
	private final String GET_COMMENTS_BY_BLOGID = "from Comment where blogId = ? and checkStatus != '2'  order by commentTime";
	// 通过父评论
	private final String GET_PARENT_COMMENTS_BY_BLOGID = "from Comment where blogId = ? and parentId is null and checkStatus != '2' order by commentTime desc";
	private final String GET_PAGED_COMMENTS = "from Comment order by commentTime desc";
	private final String GET_UNCHECKED_COMMENTS = "from Comment where checkStatus = '0'";
	private final String GET_RECENT_COMMENTS = "from Comment where checkStatus = '1' order by commentTime";
	private final String GET_PAGED_CHECK_COMMENTS = "from Comment where checkStatus = '1' order by commentTime";
	private final String GET_PAGED_NO_CHECK_COMMENTS = "from Comment where checkStatus = '2' order by commentTime";

	/**
	 * 根据博文Id获得评论
	 * 
	 * @param blog
	 * @return
	 */
	public List<Comment> getCommentsByBlogId(Blog blog) {
		return (List<Comment>) getHibernateTemplate().find(
				GET_COMMENTS_BY_BLOGID, blog);
	}

	/**
	 * 根据博文Id获得没有子评论的父评论
	 * 
	 * @param blog
	 * @return
	 */
	public List<Comment> getParentCommentsByBlogId(Blog blog) {
		return (List<Comment>) getHibernateTemplate().find(
				GET_PARENT_COMMENTS_BY_BLOGID, blog);
	}

	/**
	 * 获得默认的评论列表
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getPagedBlogs(Integer pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_COMMENTS, pageNo, pageSize);
	}

	/**
	 * 获得未审核的评论
	 * 
	 * @return
	 */
	public List<Comment> getUncheckedComments() {
		return (List<Comment>) getHibernateTemplate().find(
				GET_UNCHECKED_COMMENTS);
	}

	/**
	 * 获得最近评论
	 * 
	 * @return
	 */
	public List<Comment> getRecentComments() {
		List<Comment> comments = (List<Comment>) getHibernateTemplate().find(
				GET_RECENT_COMMENTS);
		if (comments.size() > 5) {
			return comments.subList(0, 5);
		} else {
			return comments;
		}
	}

	/**
	 * 获得已审核评论
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getPagedCheckComments(Integer pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_CHECK_COMMENTS, pageNo, pageSize);
	}

	/**
	 * 获得未通过审核评论
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getNoPagedCheckComments(Integer pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_NO_CHECK_COMMENTS, pageNo, pageSize);
	}

}
