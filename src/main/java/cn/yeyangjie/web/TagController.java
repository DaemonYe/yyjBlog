package cn.yeyangjie.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.yeyangjie.domain.Tag;
import cn.yeyangjie.service.TagService;

@Controller
public class TagController extends BaseController {

	@Autowired
	private TagService tagService;

	/**
	 * 展示添加标签页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/addTagPage.htm")
	public String addTagPage() {
		return "admin/tag/addTag";
	}

	/**
	 * 添加标签
	 * 
	 * @param tag
	 * @return
	 */
	@RequestMapping(value = "/admin/addTag.htm")
	public String addTag(HttpServletRequest request, Tag tag) {
		String error = check(tag);
		if (!(error == null || error.isEmpty())) {
			request.setAttribute("errorMsg", error);
			return "admin/404";
		}
		tagService.addTag(tag);
		return "admin/success";
	}

	private String check(Tag tag) {
		String tagName = tag.getTagName().trim();
		if (tagName == null || tagName.isEmpty()) {
			return "标签名不能为空！";
		} else if (tagName.length() > 50) {
			return "标签名长度必须在50之间！";
		}
		return null;
	}

	/**
	 * 判断标签是否存在
	 * 
	 * @param response
	 * @param classificationName
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/admin/validateTagName.htm")
	public String validateClassificationName(HttpServletResponse response,
			@RequestParam("tagName") String tagName) throws IOException {
		String str = new String(tagName.getBytes("ISO-8859-1"), "UTF-8");
		Tag tag = tagService.getTagByName(str);
		JSONObject obj = new JSONObject();
		PrintWriter out = response.getWriter();
		if (tag == null) {
			obj.put("result", true);
		} else {
			obj.put("result", false);
		}

		// 将JSON对象转换成String类型传入前台
		String jsonTag = obj.toString();
		out.print(jsonTag);
		out.flush();
		out.close();

		return null;
	}

	/**
	 * 显示标签页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/listTag.htm")
	public ModelAndView listTag() {
		ModelAndView view = new ModelAndView();
		List<Tag> tags = tagService.getTags();
		view.addObject("tags", tags);
		view.setViewName("admin/tag/tagList");
		return view;
	}

	/**
	 * 展示更新标签页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/updateTagPage.htm")
	public ModelAndView updateTagPage(@RequestParam("tagId") String tagId) {
		ModelAndView view = new ModelAndView();
		Tag tag = tagService.getTagByTagId(Integer.parseInt(tagId));
		view.addObject("tag", tag);
		view.setViewName("admin/tag/updateTag");
		return view;
	}

	/**
	 * 更新标签
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/updateTag.htm")
	public String updateTag(HttpServletRequest request, Tag tag) {
		String error = check(tag);
		if (!(error == null || error.isEmpty())) {
			request.setAttribute("errorMsg", error);
			return "admin/404";
		}
		tagService.updateTag(tag);
		return "admin/success";
	}

	/**
	 * 删除标签
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/deleteTag.htm")
	public String deleteTag(@RequestParam("tagId") String tagId) {
		tagService.deleteTag(tagId);
		return "admin/success";
	}

}
