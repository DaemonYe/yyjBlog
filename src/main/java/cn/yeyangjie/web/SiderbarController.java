package cn.yeyangjie.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.yeyangjie.domain.Comment;
import cn.yeyangjie.domain.Tag;
import cn.yeyangjie.service.CommentService;
import cn.yeyangjie.service.TagService;

@Controller
public class SiderbarController extends BaseController {

	@Autowired
	private CommentService commentService;

	@Autowired
	private TagService tagService;

	@RequestMapping(value = "/siderbar.htm")
	public String linkage(HttpSession session, HttpServletResponse response)
			throws IOException {
		List<Tag> hotTags = tagService.getHotTags();
		handleJson(hotTags, response);
		return null;
	}

	@RequestMapping(value = "/siderbar2.htm")
	public String linkage2(HttpSession session, HttpServletResponse response)
			throws IOException {
		List<Comment> comments = commentService.getRecentComments();
		handleJson2(comments, response);
		return null;
	}

	/**
	 * 处理Json数据，将Json数据传回前台
	 * 
	 * @param classification
	 * @param response
	 * @throws IOException
	 */
	private void handleJson(List<Tag> hotTags, HttpServletResponse response)
			throws IOException {
		// 将list转换成JSON对象
		JSONArray jsonObj = new JSONArray();
		// 组装成json数据
		for (Tag tag : hotTags) {
			JSONObject obj = new JSONObject();
			obj.put("id", tag.getTagId());
			obj.put("name", tag.getTagName());
			jsonObj.put(obj);
		}
		PrintWriter out = response.getWriter();
		// 将JSON对象转换成String类型传入前台
		String jsonClassification = jsonObj.toString();
		out.print(jsonClassification);
		out.flush();
		out.close();
	}

	private void handleJson2(List<Comment> comments,
			HttpServletResponse response) throws IOException {
		// 将list转换成JSON对象
		JSONArray jsonObj = new JSONArray();
		// 组装成json数据
		for (Comment comment : comments) {
			JSONObject obj = new JSONObject();
			obj.put("blogId", comment.getBlogId().getBlogId());
			obj.put("commentAuthor", comment.getCommentAuthor());
			String commentContent = comment.getCommentContent();
			if (commentContent.length() > 15) {
				commentContent = commentContent.substring(0, 15);
			}
			obj.put("commentContent", commentContent);
			jsonObj.put(obj);
		}
		PrintWriter out = response.getWriter();
		// 将JSON对象转换成String类型传入前台
		String jsonClassification = jsonObj.toString();
		out.print(jsonClassification);
		out.flush();
		out.close();
	}

}
