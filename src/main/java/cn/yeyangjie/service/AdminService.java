package cn.yeyangjie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yeyangjie.dao.AdminDao;
import cn.yeyangjie.domain.Admin;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;

	/**
	 * 登陆
	 * 
	 * @param admin
	 * @return
	 */
	public Admin login(Admin admin) {
		return adminDao.findAdmin(admin);
	}

	/**
	 * 获得个人信息
	 * 
	 * @return
	 */
	public String getAdminDesc() {
		return adminDao.getAdminDesc();
	}

	/**
	 * 更改个人信息
	 */
	public void updateAdminDesc(String adminDesc) {
		Admin admin = adminDao.get(1);
		admin.setAdminDesc(adminDesc);
		adminDao.update(admin);
	}

}
