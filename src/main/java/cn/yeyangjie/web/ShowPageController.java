package cn.yeyangjie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.yeyangjie.domain.Blog;
import cn.yeyangjie.service.AdminService;
import cn.yeyangjie.service.BlogService;

@Controller
public class ShowPageController extends BaseController {

	@Autowired
	private BlogService blogService;
	@Autowired
	private AdminService adminService;

	/**
	 * 展示aboutMe页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/aboutMe.htm")
	public ModelAndView aboutMePage() {
		ModelAndView view = new ModelAndView();
		String adminDesc = adminService.getAdminDesc();
		view.addObject("adminDesc", adminDesc);
		view.setViewName("aboutMe");
		return view;
	}

	/**
	 * 展示growth页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/growth.htm")
	public String growthPage() {
		return "growth";
	}

	/**
	 * 展示首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index.htm")
	public ModelAndView indexPage() {
		ModelAndView view = new ModelAndView();
		List<Blog> blogs = blogService.getIndexBlogs();
		view.addObject("blogs", blogs);
		view.setViewName("index");
		return view;
	}

}
