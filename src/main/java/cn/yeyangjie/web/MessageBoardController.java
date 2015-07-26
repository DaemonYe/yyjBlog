package cn.yeyangjie.web;

import java.io.IOException;
import java.util.ArrayList;
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
import cn.yeyangjie.domain.Message;
import cn.yeyangjie.service.MessageService;

@Controller
public class MessageBoardController extends BaseController {

	@Autowired
	private MessageService messageService;

	@RequestMapping(value = "/listMessage.htm")
	public ModelAndView listMessage(
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view = new ModelAndView();
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedMessages = messageService.getPagedMessages(pageNo,
				CommonConstant.MESSAGE_PAGE_SIZE);
		List<Message> messages = (List<Message>) pagedMessages.getResult();
		List<Message> childMessage = new ArrayList<Message>();
		for (Message message : messages) {
			List<Message> cMessage = messageService.getChildMessages(message);
			for (Message message2 : cMessage) {
				childMessage.add(message2);
			}
		}
		view.addObject("childMessage", childMessage);
		view.addObject("pagedMessages", pagedMessages);
		view.setViewName("messageBoard");
		return view;
	}

	@RequestMapping(value = "/addMessage.htm")
	public String addMessage(HttpServletRequest request,
			HttpServletResponse response, Message message) throws IOException {
		String parentId = request.getParameter("pId");
		if (!(parentId == null || parentId.equals(""))) {
			Message parentMessage = messageService
					.getMessageByMessageId(Integer.parseInt(parentId));
			message.setParentId(parentMessage);
		}
		String error = check(message);
		if (!(error == null || error.isEmpty())) {
			request.setAttribute("errorMsg", error);
			return "forward:/404.jsp";
		}
		messageService.addMessage(message);
		return "success";
	}

	private String check(Message message) {
		String messageAuthor = message.getMessageAuthor();
		if (messageAuthor == null || messageAuthor.trim().isEmpty()) {
			return "留言者昵称不能为空！";
		} else if (messageAuthor.length() < 3 || messageAuthor.length() > 20) {
			return "留言者昵称长度必须在3~20之间！";
		}
		String messageEmail = message.getMessageEmail().trim();
		if (messageEmail == null || messageEmail.isEmpty()) {
			return "留言者Email不能为空！";
		} else if (!messageEmail
				.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$")) {
			return "留言者Email格式错误！";
		}
		String messageContent = message.getMessageContent().trim();
		if (messageContent == null || messageContent.isEmpty()) {
			return "留言内容不能为空！";
		}
		return null;
	}

	/**
	 * 显示未审核留言页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/uncheckedMessagePage.htm")
	public ModelAndView uncheckMessagePage() {
		ModelAndView view = new ModelAndView();
		List<Message> uncheckedMessage = messageService.getUncheckedMessages();
		view.addObject("uncheckedMessage", uncheckedMessage);
		view.setViewName("admin/message/uncheckedMessageList");
		return view;
	}

	/**
	 * 显示审核通过留言页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/checkedMessagePage.htm")
	public ModelAndView checkMessagePage(
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view = new ModelAndView();
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedMessages = messageService.getPagedCheckComments(pageNo,
				CommonConstant.ADMIN_PAGE_SIZE);
		view.addObject("pagedMessages", pagedMessages);
		view.setViewName("admin/message/checkedMessageList");
		return view;
	}

	/**
	 * 显示审核未通过留言页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/nocheckedMessagePage.htm")
	public ModelAndView nocheckMessagePage(
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view = new ModelAndView();
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedMessages = messageService.getNoPagedCheckComments(pageNo,
				CommonConstant.ADMIN_PAGE_SIZE);
		view.addObject("pagedMessages", pagedMessages);
		view.setViewName("admin/message/checkedMessageList");
		return view;
	}

	/**
	 * 显示留言详细页面(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/descMessage.htm")
	public ModelAndView descMessage(@RequestParam("messageId") String messageId) {
		ModelAndView view = new ModelAndView();
		Message message = messageService.getMessageByMessageId(Integer
				.parseInt(messageId));
		view.addObject("message", message);
		view.setViewName("admin/message/descMessage");
		return view;
	}

	/**
	 * 审核评论(权限：站长)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/checkMessage.htm")
	public String checkMessage(@RequestParam("messageId") String messageId,
			@RequestParam("checked") String checked) {
		messageService.updateCheckStatus(Integer.parseInt(messageId), checked);
		return "admin/success";
	}
}
