package cn.yeyangjie.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yeyangjie.dao.BlogDao;
import cn.yeyangjie.dao.CommentDao;
import cn.yeyangjie.dao.Page;
import cn.yeyangjie.domain.Blog;
import cn.yeyangjie.domain.Comment;

@Service
public class CommentService {

	@Autowired
	private CommentDao commentDao;
	@Autowired
	private BlogDao blogDao;

	/**
	 * 添加评论
	 * 
	 * @param comment
	 */
	public void addComment(Comment comment) {
		Blog blog = blogDao.get(comment.getBlogId().getBlogId());
		comment.setBlogId(blog);
		Comment parentComment = comment.getParentId();
		if (parentComment != null) {
			parentComment = commentDao.get(parentComment.getCommentId());
			comment.setParentId(parentComment);
		}
		comment.setCommentTime(new Date());
		comment.setCheckStatus('0');
		commentDao.save(comment);

		int blogReplies = blog.getBlogReplies();
		blog.setBlogReplies(blogReplies + 1);
		blogDao.update(blog);

	}

	/**
	 * 根据博文查找评论
	 * 
	 * @param blog
	 * @return
	 */
	public List<Comment> getCommentsByBlogId(Blog blog) {
		return commentDao.getCommentsByBlogId(blog);
	}

	/**
	 * 根据博文查找没有子评论的评论
	 * 
	 * @param blog
	 * @return
	 */
	public List<Comment> getParentCommentsByBlogId(Blog blog) {
		return commentDao.getParentCommentsByBlogId(blog);
	}

	/**
	 * 根据评论ID查找评论
	 * 
	 * @param parseInt
	 * @return
	 */
	public Comment getCommentByCommentId(int commentId) {
		return commentDao.get(commentId);
	}

	/**
	 * 或得默认的评论列表
	 * 
	 * @param pageNo
	 * @param adminPageSize
	 * @return
	 */
	public Page getPagedComments(Integer pageNo, int pageSize) {
		return commentDao.getPagedBlogs(pageNo, pageSize);
	}

	/**
	 * 获得未审核评论
	 * 
	 * @return
	 */
	public List<Comment> getUncheckedComments() {
		return commentDao.getUncheckedComments();
	}

	/**
	 * 更改评论状态
	 * 
	 * @param comment
	 */
	public void updateCheckStatus(int commentId, String checked) {
		Comment comment = commentDao.get(commentId);
		if (checked.equals("yes")) {
			comment.setCheckStatus('1');
		} else {
			comment.setCheckStatus('2');
		}
		commentDao.update(comment);
	}

	/**
	 * 获得最近评论
	 * 
	 * @return
	 */
	public List<Comment> getRecentComments() {
		return (List<Comment>) commentDao.getRecentComments();
	}

	/**
	 * 获得已审核评论
	 * 
	 * @param pageNo
	 * @param adminPageSize
	 * @return
	 */
	public Page getPagedCheckComments(Integer pageNo, int pageSize) {
		return commentDao.getPagedCheckComments(pageNo, pageSize);
	}

	/**
	 * 获得未通过审核评论
	 * 
	 * @param pageNo
	 * @param adminPageSize
	 * @return
	 */
	public Page getNoPagedCheckComments(Integer pageNo, int pageSize) {
		return commentDao.getNoPagedCheckComments(pageNo, pageSize);
	}
}
