package cn.yeyangjie.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.yeyangjie.domain.Blog;
import cn.yeyangjie.domain.Classification;

@Repository
public class BlogDao extends BaseDao<Blog> {
	// 获得所有的博文列表，按更改时间降序
	private final String GET_PAGED_BLOGS = "from Blog order by updateTime desc";
	// 获得已删除的博文列表，按更改时间降序
	private final String GET_DELETE_BLOGS = "from Blog where deleteStatus = '1' order by updateTime desc";
	// 获得所有推荐的博文列表（未删除）
	private final String GET_RECOMMEND_BLOGS = "from Blog where recommendStatus = '1' and deleteStatus = '0' order by updateTime desc";
	// 获得某一分类下的所有博文
	private final String GET_PAGED_BLOGS_BY_CLASSIFICATION = "from Blog where classificationId = ? and deleteStatus!='1'  order by updateTime desc";
	// 获得与关键字相关的所有博文
	private final String GET_PAGED_BLOGS_BY_SEARCH = "from Blog where ( blogTitle like ? or blogContent like ? ) and deleteStatus = '0' order by updateTime desc ";
	// 更新博文
	private final String UPDATE_BLOG = "update Blog set blogTitle=? , blogContent=? , classificationId=? , updateTime =? where blogId = ?";
	private final String DELETE_BLOG_BY_CLASSIFICATION = "delete from Blog where classificationId = ?";
	private final String GET_SEARCH_BLOGS = "select blogId, blogTitle, blogContent from Blog";
	private final String GET_INDEX_BLOGS = "from Blog where recommendStatus = '1' and deleteStatus = '0' order by updateTime desc";

	/**
	 * 获得分页的博文列表
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getPagedBlogs(Integer pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_BLOGS, pageNo, pageSize);
	}

	/**
	 * 更新博文
	 * 
	 * @param blog
	 */
	public void updateBlog(Blog blog) {
		Object[] values = { blog.getBlogTitle(), blog.getBlogContent(),
				blog.getClassificationId(), blog.getUpdateTime(),
				blog.getBlogId() };
		getHibernateTemplate().bulkUpdate(UPDATE_BLOG, values);

	}

	/**
	 * 获得某一分类的博文列表
	 * 
	 * @param classificationId
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getPagedBlogsByClassificaitonId(
			Classification classificationId, Integer pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_BLOGS_BY_CLASSIFICATION, pageNo, pageSize,
				classificationId);
	}

	/**
	 * 通过关键字搜索博文
	 * 
	 * @param searchContent
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getPagedBlogsBySearch(String searchContent, Integer pageNo,
			int pageSize) {
		Object[] values = { '%' + searchContent + '%',
				'%' + searchContent + '%' };
		return pagedQuery(GET_PAGED_BLOGS_BY_SEARCH, pageNo, pageSize, values);
	}

	/**
	 * 根据ClassificationId删除博文
	 * 
	 * @param classification
	 */
	public void deleteBlogByClassificationId(Classification classification) {
		getHibernateTemplate().bulkUpdate(DELETE_BLOG_BY_CLASSIFICATION,
				classification);

	}

	/**
	 * 建立索引时搜索
	 * 
	 * @return
	 */
	public List<Blog> getSearchBlogs() {
		return (List<Blog>) getHibernateTemplate().find(GET_SEARCH_BLOGS);
	}

	/**
	 * 获得首页推荐文章
	 * 
	 * @return
	 */
	public List<Blog> getIndexBlogs() {
		List<Blog> blogs = (List<Blog>) getHibernateTemplate().find(
				GET_INDEX_BLOGS);
		if (blogs.size() > 5) {
			return blogs.subList(0, 5);
		} else {
			return blogs;
		}
	}

	/**
	 * 获得推荐文章
	 * 
	 * @return
	 */
	public Page getRecommendBlogs(Integer pageNo, int pageSize) {
		return pagedQuery(GET_RECOMMEND_BLOGS, pageNo, pageSize);
	}

	/**
	 * 获得删除博文
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getDeleteBlogs(Integer pageNo, int pageSize) {
		return pagedQuery(GET_DELETE_BLOGS, pageNo, pageSize);
	}
}
