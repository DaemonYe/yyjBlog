package cn.yeyangjie.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yeyangjie.dao.BlogDao;
import cn.yeyangjie.dao.Page;
import cn.yeyangjie.domain.Blog;
import cn.yeyangjie.domain.Classification;

@Service
public class BlogService {

	@Autowired
	private BlogDao blogDao;

	/**
	 * 添加一篇博文
	 * 
	 * @param blog
	 */
	public void addBlog(Blog blog) {
		blog.setBlogType('0');
		blog.setRecommendStatus('0');
		blog.setDeleteStatus('0');
		blog.setCreateTime(new Date());
		blog.setUpdateTime(new Date());
		blogDao.save(blog);
	}

	/**
	 * 获得所有博文
	 * 
	 * @return
	 */
	public List<Blog> getAllBlogs() {
		return blogDao.loadAll();
	}

	/**
	 * 根据博文Id删除博文
	 * 
	 * @param parseInt
	 */
	public void deleteBlogByBlogId(int blogId) {
		Blog blog = blogDao.get(blogId);
		blog.setUpdateTime(new Date());
		blog.setDeleteStatus('1');
		blogDao.update(blog);
	}

	/**
	 * 根据博文Id获得博文
	 * 
	 * @param id
	 * @return
	 */
	public Blog getBlogByBlogId(int id) {
		return blogDao.get(id);
	}

	/**
	 * 更新博文
	 * 
	 * @param blog
	 */
	public void updateBlog(Blog blog) {
		blog.setUpdateTime(new Date());
		// blogDao.updateBlog(blog);
		blogDao.update(blog);

	}

	/**
	 * 获取分页的博文列表，以最后发布时间降序排列
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getPagedBlogs(Integer pageNo, int pageSize) {
		return blogDao.getPagedBlogs(pageNo, pageSize);
	}

	/**
	 * 获取某一分类的博文列表，以浏览数降序排列
	 * 
	 * @param classification
	 * @param pageNo
	 * @param blogPageSize
	 * @return
	 */
	public Page getPagedBlogsByClassificationId(
			Classification classificationId, Integer pageNo, int pageSize) {
		return blogDao.getPagedBlogsByClassificaitonId(classificationId,
				pageNo, pageSize);
	}

	/**
	 * 通过关键字搜索博文
	 * 
	 * @param searchContent
	 * @param pageNo
	 * @param blogPageSize
	 * @return
	 */
	public Page getPagedBlogsBySearch(String searchContent, Integer pageNo,
			int pageSize) {
		return blogDao.getPagedBlogsBySearch(searchContent, pageNo, pageSize);
	}

	/**
	 * 修改博文回复数
	 * 
	 * @param blog
	 */
	public void updateBlogReplies(Blog blog) {
		blogDao.update(blog);
	}

	/**
	 * 搜索推荐文章
	 * 
	 * @return
	 */
	public List<Blog> getIndexBlogs() {
		return blogDao.getIndexBlogs();
	}

	/**
	 * 后台推荐文章
	 * 
	 * @return
	 */
	public Page getRecommendBlogs(Integer pageNo, int pageSize) {
		return blogDao.getRecommendBlogs(pageNo, pageSize);
	}

	/**
	 * 更新博文浏览量
	 */
	public void updateBlogView(Blog blog) {
		int blogViews = blog.getBlogViews();
		blog.setBlogViews(blogViews + 1);
		blogDao.updateBlog(blog);
	}

	/**
	 * 取消推荐
	 * 
	 * @param parseInt
	 */
	public void noRecommendBlogByBlogId(int blogId) {
		Blog blog = blogDao.get(blogId);
		blog.setUpdateTime(new Date());
		blog.setRecommendStatus('0');
		blogDao.update(blog);

	}

	/**
	 * 获得删除博文列表
	 * 
	 * @param pageNo
	 * @param adminPageSize
	 * @return
	 */
	public Page getDeleteBlogs(Integer pageNo, int pageSize) {
		return blogDao.getDeleteBlogs(pageNo, pageSize);
	}

	/**
	 * 取消删除博文
	 * 
	 * @param parseInt
	 */
	public void noDeleteBlogByBlogId(int blogId) {
		Blog blog = blogDao.get(blogId);
		blog.setUpdateTime(new Date());
		blog.setDeleteStatus('0');
		blogDao.update(blog);
	}

	/**
	 * 推荐博文
	 * 
	 * @param parseInt
	 */
	public void recommendBlogByBlogId(int blogId) {
		Blog blog = blogDao.get(blogId);
		blog.setUpdateTime(new Date());
		blog.setRecommendStatus('1');
		blogDao.update(blog);
	}

}
