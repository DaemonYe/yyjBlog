package cn.yeyangjie.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.yeyangjie.domain.Classification;
import cn.yeyangjie.service.ClassificationService;

@Controller
public class ClassificationController extends BaseController {

	@Autowired
	private ClassificationService classificationService;

	/**
	 * 展示添加一级分类页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/addTopClassificationPage.htm")
	public String addTopClassificationPage() {
		return "admin/classification/addTopClassification";
	}

	/**
	 * 添加一级分类
	 * 
	 * @param classification
	 * @return
	 */
	@RequestMapping(value = "/admin/addTopClassification.htm")
	public String addTopClassification(HttpServletRequest request,
			Classification classification) {
		String error = check(classification, "top");
		if (!(error == null || error.isEmpty())) {
			request.setAttribute("errorMsg", error);
			return "admin/404";
		}
		classificationService.addClassification(classification);
		return "admin/success";
	}

	/**
	 * 展示添加二级分类页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/addSecondClassificationPage.htm")
	public String addSecondClassificationpPage() {
		return "admin/classification/addSecondClassification";
	}

	/**
	 * 添加二级分类
	 * 
	 * @param classification
	 * @return
	 */
	@RequestMapping(value = "/admin/addSecondClassification.htm")
	public String addSecondClassification(HttpServletRequest request,
			Classification classification) {
		String error = check(classification, "second");
		if (!(error == null || error.isEmpty())) {
			request.setAttribute("errorMsg", error);
			return "admin/404";
		}
		classificationService.addClassification(classification);
		return "admin/success";
	}

	protected String check(Classification classification, String level) {
		String classificationName = classification.getClassificationName()
				.trim();
		if (classificationName == null || classificationName.isEmpty()) {
			return "分类标题不能为空！";
		} else if (classificationName.length() > 50) {
			return "分类标题长度必须在3~255之间！";
		}
		if (level.equals("second")) {
			Integer cid = classification.getParentId().getClassificationId();
			if (cid == null) {
				return "一级分类不能为空！";
			}
		}
		String classificationDesc = classification.getClassificationDesc()
				.trim();
		if (classificationDesc.length() > 100) {
			return "分类详情必须在100以内！";
		}
		return null;
	}

	/**
	 * 判断分类名是否存在
	 * 
	 * @param classification
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/admin/validateClassificationName.htm")
	public String validateClassificationName(HttpServletResponse response,
			@RequestParam("classificationName") String classificationName)
			throws IOException {
		String str = new String(classificationName.getBytes("ISO-8859-1"),
				"UTF-8");
		Classification classification = classificationService
				.getClassificationByName(str);
		JSONObject obj = new JSONObject();
		PrintWriter out = response.getWriter();
		if (classification == null) {
			obj.put("result", true);
		} else {
			obj.put("result", false);
		}

		// 将JSON对象转换成String类型传入前台
		String jsonClassification = obj.toString();
		out.print(jsonClassification);
		out.flush();
		out.close();

		return null;
	}

	/**
	 * 显示一级分类列表页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/listTopClassification.htm")
	public ModelAndView listTopClassification() {
		ModelAndView view = new ModelAndView();
		List<Classification> topClassification = classificationService
				.getTopClassification();
		view.addObject("topClassification", topClassification);
		view.setViewName("admin/classification/topClassificationList");
		return view;
	}

	/**
	 * 显示二级分类列表页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/listSecondClassification.htm")
	public ModelAndView listSecondClassification(
			@RequestParam("parentId") String parentId) {
		ModelAndView view = new ModelAndView();
		Classification parentClassification = classificationService
				.getClassificationByClassificationId(Integer.parseInt(parentId));
		List<Classification> secondClassification = classificationService
				.getClassificationsByParentId(Integer.parseInt(parentId));
		view.addObject("parentClassification", parentClassification);
		view.addObject("secondClassification", secondClassification);
		view.setViewName("admin/classification/secondClassificationList");
		return view;
	}

	/**
	 * 展示更新一级分类页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/updateTopClassificationPage.htm")
	public ModelAndView updateTopClassificationPage(
			@RequestParam("classificationId") String classificationId) {
		ModelAndView view = new ModelAndView();
		Classification classification = classificationService
				.getClassificationByClassificationId(Integer
						.parseInt(classificationId));
		view.addObject("classification", classification);
		view.setViewName("admin/classification/updateTopClassification");
		return view;
	}

	/**
	 * 更新一级分类(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/updateTopClassification.htm")
	public String updateTopClassification(HttpServletRequest request,
			Classification classification) {
		String error = check(classification, "top");
		if (!(error == null || error.isEmpty())) {
			request.setAttribute("errorMsg", error);
			return "admin/404";
		}
		classificationService.updateClassification(classification);
		return "admin/success";
	}

	/**
	 * 展示更新二级分类页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/updateSecondClassificationPage.htm")
	public ModelAndView updateSecondClassificationPage(
			@RequestParam("classificationId") String classificationId) {
		ModelAndView view = new ModelAndView();
		Classification classification = classificationService
				.getClassificationByClassificationId(Integer
						.parseInt(classificationId));
		view.addObject("classification", classification);
		view.setViewName("admin/classification/updateSecondClassification");
		return view;
	}

	/**
	 * 更新二级分类
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/updateSecondClassification.htm")
	public String updateSecondClassification(HttpServletRequest request,
			Classification classification) {
		String error = check(classification, "second");
		if (!(error == null || error.isEmpty())) {
			request.setAttribute("errorMsg", error);
			return "admin/404";
		}
		classificationService.updateClassification(classification);
		return "admin/success";
	}

	/**
	 * 删除二级分类
	 * 
	 * @return
	 */
	@RequestMapping(value = "admin/deleteSecondClassification.htm")
	public String deleteSecondClassificationn(
			@RequestParam("classificationId") String classificationId) {
		Classification classification = classificationService
				.getClassificationByClassificationId(Integer
						.parseInt(classificationId));
		classificationService.deleteSecondClassification(classification);
		return "admin/success";
	}

	/**
	 * 删除一级分类(取消)
	 * 
	 * @return
	 */
	// @RequestMapping(value = "admin/deleteTopClassification.htm")
	// public String deleteTopClassification(
	// @RequestParam("classificationId") String classificationId) {
	// Classification classification = classificationService
	// .getClassificationByClassificationId(Integer
	// .parseInt(classificationId));
	// classificationService.deleteClassification(classification);
	// return "admin/classification/success";
	// }

	/**
	 * 二级联动
	 * 
	 * @param classificationId
	 * @param session
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/linkage.htm")
	public String linkage(
			@RequestParam("classificationId") String classificationId,
			HttpSession session, HttpServletResponse response)
			throws IOException {
		// 初始化
		if (classificationId == null || classificationId.equals("")
				|| classificationId.equals("0")) {
			List<Classification> topClassification = classificationService
					.getTopClassification();
			handleJson(topClassification, response);
			return null;
		}
		List<Classification> classification = classificationService
				.getClassificationsByParentId(Integer
						.parseInt(classificationId));
		handleJson(classification, response);
		return null;
	}

	/**
	 * 二级联动--> 处理Json数据，将Json数据传回前台
	 * 
	 * @param classification
	 * @param response
	 * @throws IOException
	 */
	private void handleJson(List<Classification> classification,
			HttpServletResponse response) throws IOException {
		// 将list转换成JSON对象
		JSONArray jsonObj = new JSONArray();
		// 组装成json数据
		for (int i = 0; i < classification.size(); i++) {
			JSONObject obj = new JSONObject();
			Classification clas = classification.get(i);
			obj.put("id", clas.getClassificationId());
			obj.put("val", clas.getClassificationName());
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
