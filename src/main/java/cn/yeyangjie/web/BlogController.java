package cn.yeyangjie.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.yeyangjie.cons.CommonConstant;
import cn.yeyangjie.dao.Page;
import cn.yeyangjie.domain.Blog;
import cn.yeyangjie.domain.Classification;
import cn.yeyangjie.domain.Comment;
import cn.yeyangjie.domain.Tag;
import cn.yeyangjie.service.BlogService;
import cn.yeyangjie.service.ClassificationService;
import cn.yeyangjie.service.CommentService;
import cn.yeyangjie.service.TagService;

@Controller
public class BlogController extends BaseController {

	@Autowired
	private BlogService blogService;

	@Autowired
	private ClassificationService classificationService;

	@Autowired
	private CommentService commentService;

	@Autowired
	private TagService tagService;

	/**
	 * 显示博文列表(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/listBlog.htm")
	public ModelAndView listBlog(
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view = new ModelAndView();
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedBlogs = blogService.getPagedBlogs(pageNo,
				CommonConstant.ADMIN_PAGE_SIZE);
		view.addObject("pagedBlogs", pagedBlogs);
		view.setViewName("admin/blog/listBlogs");
		return view;
	}

	/**
	 * 显示已删除博文列表(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/listDeleteBlog.htm")
	public ModelAndView listDeleteBlog(
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view = new ModelAndView();
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedBlogs = blogService.getDeleteBlogs(pageNo,
				CommonConstant.ADMIN_PAGE_SIZE);
		view.addObject("pagedBlogs", pagedBlogs);
		view.setViewName("admin/blog/deleteBlogList");
		return view;
	}

	/**
	 * 显示推荐博文列表(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/listRecommendBlog.htm")
	public ModelAndView listRecommendBlog(
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view = new ModelAndView();
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedBlogs = blogService.getRecommendBlogs(pageNo,
				CommonConstant.ADMIN_PAGE_SIZE);
		view.addObject("pagedBlogs", pagedBlogs);
		view.setViewName("admin/blog/recommendBlogList");
		return view;
	}

	/**
	 * 显示博文添加页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/addBlogPage.htm")
	public ModelAndView addBlogPage() {
		ModelAndView view = new ModelAndView();
		List<Tag> tags = tagService.getTags();
		view.addObject("tags", tags);
		view.setViewName("admin/blog/addBlog");
		return view;
	}

	/**
	 * 添加博文(权限：站长)
	 * 
	 * @param blog
	 * @return
	 */
	@RequestMapping(value = "/admin/addBlog.htm")
	public String addBlog(HttpServletRequest request,
			@RequestParam("cid") String cid, @RequestParam("tag") String[] tag,
			Blog blog) {
		String error = check(cid, tag, blog);
		if (!(error == null || error.isEmpty())) {
			request.setAttribute(ERROR_MSG_KEY, error);
			return "admin/404";
		}
		List<Tag> tags = new ArrayList<Tag>();
		for (String tagId : tag) {
			Tag t = tagService.getTagByTagId(Integer.parseInt(tagId));
			tags.add(t);
		}
		blog.setClassificationId(classificationService
				.getClassificationByClassificationId(Integer.parseInt(cid)));
		blog.setTags(tags);
		blogService.addBlog(blog);
		return "admin/success";
	}

	private String check(String cid, String[] tag, Blog blog) {
		if (cid == null || cid.trim().isEmpty()) {
			return "二级分类不能为空！";
		}
		if (tag.length == 0) {
			return "标签不能为空！";
		}
		String blogTitle = blog.getBlogTitle();
		if (blogTitle == null || blogTitle.trim().isEmpty()) {
			return "博文标题不能为空！";
		} else if (blogTitle.length() < 3 || blogTitle.length() > 255) {
			return "博文标题长度必须在3~255之间！";
		}
		blog.setBlogTitle(blog.getBlogTitle().trim());
		String blogContent = blog.getBlogContent();
		if (blogContent == null || blogContent.trim().isEmpty()) {
			return "博文内容不能为空！";
		}
		blog.setBlogContent(blog.getBlogContent().trim());
		return null;
	}

	/**
	 * 删除博文(权限：站长)
	 * 
	 * @param blogId
	 * @return
	 */
	@RequestMapping(value = "/admin/deleteBlog.htm")
	public String deleteBlog(@RequestParam("blogId") String blogId) {
		blogService.deleteBlogByBlogId(Integer.parseInt(blogId));
		return "admin/success";
	}

	/**
	 * 取消删除博文(权限：站长)
	 * 
	 * @param blogId
	 * @return
	 */
	@RequestMapping(value = "/admin/noDeleteBlog.htm")
	public String noDeleteBlog(@RequestParam("blogId") String blogId) {
		blogService.noDeleteBlogByBlogId(Integer.parseInt(blogId));
		return "admin/success";
	}

	/**
	 * 取消推荐博文(权限：站长)
	 * 
	 * @param blogId
	 * @return
	 */
	@RequestMapping(value = "/admin/noRecommendBlog.htm")
	public String noRecommendBlog(@RequestParam("blogId") String blogId) {
		blogService.noRecommendBlogByBlogId(Integer.parseInt(blogId));
		return "admin/success";
	}

	/**
	 * 推荐博文(权限：站长)
	 * 
	 * @param blogId
	 * @return
	 */
	@RequestMapping(value = "/admin/recommendBlog.htm")
	public String recommendBlog(@RequestParam("blogId") String blogId) {
		blogService.recommendBlogByBlogId(Integer.parseInt(blogId));
		return "admin/success";
	}

	/**
	 * 显示博文更新页面(权限：站长)
	 * 
	 * 1.获得博文详细内容 2.获得所有tag
	 * 
	 * @param blogId
	 * @return
	 */
	@RequestMapping(value = "/admin/updateBlogPage.htm")
	public ModelAndView updateBlogPage(@RequestParam("blogId") String blogId) {
		ModelAndView view = new ModelAndView();
		Blog blog = blogService.getBlogByBlogId(Integer.parseInt(blogId));
		List<Tag> tags = tagService.getTags();
		view.addObject("blog", blog);
		view.addObject("tags", tags);
		view.setViewName("admin/blog/updateBlog");
		return view;
	}

	/**
	 * 更新博文(权限站长)
	 * 
	 * @param blogId
	 * @param blogContent
	 * @return
	 */
	@RequestMapping(value = "/admin/updateBlog.htm")
	public String updateBlog(HttpServletRequest request,
			@RequestParam("cid") String cid, @RequestParam("tag") String[] tag,
			Blog blog) {
		String error = check(cid, tag, blog);
		if (!(error == null || error.isEmpty())) {
			request.setAttribute(ERROR_MSG_KEY, error);
			return "admin/404";
		}
		Blog oldBlog = blogService.getBlogByBlogId(blog.getBlogId());
		oldBlog.setBlogTitle(blog.getBlogTitle());
		oldBlog.setBlogContent(blog.getBlogContent());
		List<Tag> tags = new ArrayList<Tag>();
		for (String tagId : tag) {
			Tag t = tagService.getTagByTagId(Integer.parseInt(tagId));
			tags.add(t);
		}
		oldBlog.setClassificationId(classificationService
				.getClassificationByClassificationId(Integer.parseInt(cid)));
		oldBlog.setTags(tags);
		blogService.updateBlog(oldBlog);
		return "admin/success";
	}

	/**
	 * 根据分类id列出该分类下的所有博文(权限：所有人)
	 * 
	 * @param boardId
	 * @param pageNo
	 * @return
	 */
	@RequestMapping(value = "/blog/listBlogsByClassification-{classificationId}", method = RequestMethod.GET)
	public ModelAndView listBlogsByClassification(
			@PathVariable Integer classificationId,
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view = new ModelAndView();
		Classification classification = classificationService
				.getClassificationByClassificationId(classificationId);
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedBlogs = blogService.getPagedBlogsByClassificationId(
				classification, pageNo, CommonConstant.BLOG_PAGE_SIZE);
		view.addObject("classification", classification);
		view.addObject("pagedBlogs", pagedBlogs);
		view.setViewName("blog/blogList");
		return view;
	}

	/**
	 * 查看博文详情(权限：所有人)
	 * 
	 * @param blogId
	 * @return
	 */
	@RequestMapping(value = "/blog/descBlog-{blogId}", method = RequestMethod.GET)
	public ModelAndView descBlog(@PathVariable Integer blogId) {
		ModelAndView view = new ModelAndView();
		Blog blog = blogService.getBlogByBlogId(blogId);
		// 浏览量+1
		blogService.updateBlogView(blog);
		// 上一篇
		Blog preBlog = blogService.getBlogByBlogId(blogId - 1);
		// 下一篇
		Blog nextBlog = blogService.getBlogByBlogId(blogId + 1);
		List<Comment> allComments = commentService.getCommentsByBlogId(blog);
		if (allComments != null) {
			List<Comment> parentComments = commentService
					.getParentCommentsByBlogId(blog);
			view.addObject("parentComments", parentComments);
		}
		view.addObject("allComments", allComments);
		view.addObject("blog", blog);
		view.addObject("preBlog", preBlog);
		view.addObject("nextBlog", nextBlog);
		view.setViewName("blog/descBlog");
		return view;
	}

	/**
	 * 通过标签列出该标签下所有博文(权限：所有人)
	 * 
	 * @param boardId
	 * @param pageNo
	 * @return
	 */
	@RequestMapping(value = "/blog/listBlogsByTag-{tagId}", method = RequestMethod.GET)
	public ModelAndView listBlogsByTag(@PathVariable Integer tagId) {
		ModelAndView view = new ModelAndView();
		Tag tag = tagService.getTagByTagId(tagId);
		List<Blog> blogs = tag.getBlogs();
		List<Blog> pagedBlogs = new ArrayList<Blog>();
		for (Blog blog : blogs) {
			if (blog.getDeleteStatus() == '0') {
				pagedBlogs.add(blog);
			}
		}
		view.addObject("pagedBlogs", pagedBlogs);
		view.addObject("tag", tag);
		view.setViewName("blog/blogTagList");
		return view;
	}

	/**
	 * 通过关键字搜索博文(权限：所有人)
	 * 
	 * @param boardId
	 * @param pageNo
	 * @return
	 */
	@RequestMapping(value = "/blog/searchBlogs.htm")
	public ModelAndView searchBlogs(
			@RequestParam("searchContent") String searchContent,
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view = new ModelAndView();
		view.setViewName("forward:/404.jsp");
		searchContent = searchContent.trim();
		if (searchContent == null || searchContent.equals("")) {
			view.addObject("errorMsg", "错误操作！");
			return view;
		}
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedBlogs = blogService.getPagedBlogsBySearch(searchContent,
				pageNo, CommonConstant.BLOG_PAGE_SIZE);
		view.addObject("searchContent", searchContent);
		view.addObject("pagedBlogs", pagedBlogs);
		view.setViewName("blog/blogSearchList");
		return view;
	}

}
