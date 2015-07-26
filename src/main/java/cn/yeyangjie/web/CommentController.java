package cn.yeyangjie.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.yeyangjie.cons.CommonConstant;
import cn.yeyangjie.dao.Page;
import cn.yeyangjie.domain.Comment;
import cn.yeyangjie.service.CommentService;

@Controller
public class CommentController extends BaseController {
	@Autowired
	private CommentService commentService;

	/**
	 * 新增评论(权限：客户端)
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/blog/commentBlog.htm")
	public String addComment(HttpServletRequest request,
			HttpServletResponse response, Comment comment) throws IOException {
		String error = check(comment);
		if (!(error == null || error.isEmpty())) {
			request.setAttribute("errorMsg", error);
			return "404";
		}
		commentService.addComment(comment);
		return "success";
	}

	private String check(Comment comment) {
		String commentAuthor = comment.getCommentAuthor();
		if (commentAuthor == null || commentAuthor.trim().isEmpty()) {
			return "评论者昵称不能为空！";
		} else if (commentAuthor.length() < 3 || commentAuthor.length() > 20) {
			return "评论者昵称长度必须在3~20之间！";
		}
		String commentEmail = comment.getCommentEmail().trim();
		if (commentEmail == null || commentEmail.isEmpty()) {
			return "评论者Email不能为空！";
		} else if (!commentEmail
				.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$")) {
			return "评论者Email格式错误！";
		}
		String commentContent = comment.getCommentContent().trim();
		if (commentContent == null || commentContent.isEmpty()) {
			return "评论内容不能为空！";
		}
		return null;
	}

	/**
	 * 显示评论列表(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/listComment.htm")
	public ModelAndView listBlog(
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view = new ModelAndView();
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedComments = commentService.getPagedComments(pageNo,
				CommonConstant.ADMIN_PAGE_SIZE);
		view.addObject("pagedComments", pagedComments);
		view.setViewName("admin/listComment");
		return view;
	}

	/**
	 * 显示未审核评论页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/uncheckedCommentPage.htm")
	public ModelAndView uncheckCommentPage() {
		ModelAndView view = new ModelAndView();
		List<Comment> uncheckedComment = commentService.getUncheckedComments();
		view.addObject("uncheckedComment", uncheckedComment);
		view.setViewName("admin/comment/uncheckedCommentList");
		return view;
	}

	/**
	 * 显示已审核评论页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/checkedCommentPage.htm")
	public ModelAndView checkCommentPage(
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view = new ModelAndView();
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedComments = commentService.getPagedCheckComments(pageNo,
				CommonConstant.ADMIN_PAGE_SIZE);
		view.addObject("pagedComments", pagedComments);
		view.setViewName("admin/comment/checkedCommentList");
		return view;
	}

	/**
	 * 显示未通过审核评论页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/nocheckedCommentPage.htm")
	public ModelAndView nocheckCommentPage(
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view = new ModelAndView();
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedComments = commentService.getNoPagedCheckComments(pageNo,
				CommonConstant.ADMIN_PAGE_SIZE);
		view.addObject("pagedComments", pagedComments);
		view.setViewName("admin/comment/checkedCommentList");
		return view;
	}

	/**
	 * 显示评论详细页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/descComment.htm")
	public ModelAndView descComment(@RequestParam("commentId") String commentId) {
		ModelAndView view = new ModelAndView();
		Comment comment = commentService.getCommentByCommentId(Integer
				.parseInt(commentId));
		view.addObject("comment", comment);
		view.setViewName("admin/comment/descComment");
		return view;
	}

	/**
	 * 审核评论(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/checkComment.htm")
	public String checkComment(@RequestParam("commentId") String commentId,
			@RequestParam("checked") String checked) {
		commentService.updateCheckStatus(Integer.parseInt(commentId), checked);
		return "admin/success";
	}

}
