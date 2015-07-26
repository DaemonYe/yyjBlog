package cn.yeyangjie.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.yeyangjie.domain.Admin;
import cn.yeyangjie.utils.MD5Utils;

@Repository
public class AdminDao extends BaseDao<Admin> {

	private final String GET_ADMIN = "from Admin where email = ? and password = ?";
	private final String GET_ADMIN_DESC = "select adminDesc from Admin where adminId = 1";

	/**
	 * 查找站长
	 * 
	 * @param admin
	 * @return
	 */
	public Admin findAdmin(Admin admin) {
		Object[] values = { admin.getEmail(), MD5Utils.md5(admin.getPassword()) };
		List<Admin> admins = (List<Admin>) getHibernateTemplate().find(
				GET_ADMIN, values);
		if (admins.size() == 1) {
			return admins.get(0);
		} else {
			return null;
		}
	}

	public String getAdminDesc() {
		return getHibernateTemplate().find(GET_ADMIN_DESC).get(0) + "";
	}
}
