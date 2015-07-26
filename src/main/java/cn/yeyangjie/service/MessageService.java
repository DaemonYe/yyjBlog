package cn.yeyangjie.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yeyangjie.dao.MessageDao;
import cn.yeyangjie.dao.Page;
import cn.yeyangjie.domain.Message;

@Service
public class MessageService {

	@Autowired
	private MessageDao messageDao;

	/**
	 * 获得留言
	 * 
	 * @param pageNo
	 * @param messagePageSize
	 * @return
	 */
	public Page getPagedMessages(Integer pageNo, int pageSize) {
		return messageDao.getPagedMessages(pageNo, pageSize);
	}

	/**
	 * 根据父留言获得子留言
	 * 
	 * @param message
	 * @return
	 */
	public List<Message> getChildMessages(Message message) {
		return messageDao.getChildMessages(message);
	}

	/**
	 * 根据ID获得Message
	 * 
	 * @param parseInt
	 * @return
	 */
	public Message getMessageByMessageId(int id) {
		return messageDao.get(id);
	}

	/**
	 * 增加一条留言
	 * 
	 * @param message
	 */
	public void addMessage(Message message) {
		message.setMessageTime(new Date());
		message.setCheckStatus('0');
		messageDao.save(message);
	}

	/**
	 * 获得未审核留言
	 * 
	 * @return
	 */
	public List<Message> getUncheckedMessages() {
		return messageDao.getUncheckedMessages();
	}

	/**
	 * 更改留言状态
	 * 
	 * @param comment
	 */
	public void updateCheckStatus(int messageId, String checked) {
		Message message = messageDao.get(messageId);
		if (checked.equals("yes")) {
			message.setCheckStatus('1');
		} else {
			message.setCheckStatus('2');
		}
		messageDao.update(message);
	}

	/**
	 * 获得审核通过留言列表
	 * 
	 * @param pageNo
	 * @param adminPageSize
	 * @return
	 */
	public Page getPagedCheckComments(Integer pageNo, int pageSize) {
		return messageDao.getPagedCheckComments(pageNo, pageSize);
	}

	/**
	 * 获得审核未通过留言列表
	 * 
	 * @param pageNo
	 * @param adminPageSize
	 * @return
	 */
	public Page getNoPagedCheckComments(Integer pageNo, int pageSize) {
		return messageDao.getNoPagedCheckComments(pageNo, pageSize);
	}

}
