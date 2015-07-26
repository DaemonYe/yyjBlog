package cn.yeyangjie.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.yeyangjie.domain.Admin;
import cn.yeyangjie.service.AdminService;

@Controller
public class AdminController extends BaseController {

	@Autowired
	private AdminService adminService;

	/**
	 * 展示站长登陆页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login.htm")
	public String loginPage() {
		return "login";
	}

	/**
	 * 站长登陆
	 * 
	 * @param request
	 * @param admin
	 * @return
	 */
	@RequestMapping("/doLogin.htm")
	public ModelAndView login(HttpServletRequest request, Admin admin) {
		ModelAndView view = new ModelAndView();

//		// 1 判断验证码是否正确
//		// 获得客户端验证码
//		String checkcode = request.getParameter("checkcode");
//		// 获得session验证码
//		String checkcode_session = (String) request.getSession().getAttribute(
//				"checkcode_session");
//		request.getSession().removeAttribute("checkcode_session");
//		if (checkcode == null || !checkcode.equals(checkcode_session)) {
//			// 验证码错误
//			view.setViewName("forward:/login.htm");
//			view.addObject(ERROR_MSG_KEY, "验证码错误！！！");
//			return view;
//		}

		Admin loginAdmin = adminService.login(admin);

		view.setViewName("forward:/login.htm");
		if (loginAdmin == null) {
			view.addObject(ERROR_MSG_KEY, "邮箱或密码错误");
		} else {
			request.getSession().setAttribute("Admin", loginAdmin);
			view.setViewName("redirect:/admin/listBlog.htm");
		}
		return view;
	}

	/**
	 * 展示站长登陆页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/logout.htm")
	public String logout(HttpSession session) {
		session.removeAttribute("Admin");
		return "forward:/index.jsp";
	}

	/**
	 * 展示更新站长信息页面
	 * 
	 * @return
	 */
	@RequestMapping("/admin/updateAboutMePage.htm")
	public ModelAndView updateAboutMePage() {
		ModelAndView view = new ModelAndView();
		String adminDesc = adminService.getAdminDesc();
		view.addObject("adminDesc", adminDesc);
		view.setViewName("admin/aboutMe/updateAboutMe");
		return view;
	}

	@RequestMapping("/admin/updateAboutMe.htm")
	public String updateAboutMe(HttpServletRequest request,
			@RequestParam("adminDesc") String adminDesc) {
		adminDesc = adminDesc.trim();
		if (adminDesc == null || adminDesc.isEmpty()) {
			request.setAttribute(ERROR_MSG_KEY, "站长详情不能为空！");
			return "admin/404";
		}
		adminService.updateAdminDesc(adminDesc);
		return "admin/success";
	}

}
