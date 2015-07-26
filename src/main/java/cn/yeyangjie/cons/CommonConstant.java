package cn.yeyangjie.cons;

/**
 * 整个应用通用的常量
 * 
 * @author Daemon
 * 
 */
public class CommonConstant {

	/**
	 * 后台每页的记录数
	 */
	public static final int ADMIN_PAGE_SIZE = 20;
	/**
	 * 前台博文列表每页的记录数
	 */
	public static final int BLOG_PAGE_SIZE = 5;
	/**
	 * 前台留言板每页的记录数
	 */
	public static final int MESSAGE_PAGE_SIZE = 20;
	/**
	 * 将登录前的URL放到Session中的键名称
	 */
	public static final String LOGIN_TO_URL = "toUrl";
	/**
	 * 索引的存放位置
	 */
	public final static String INDEX_STORE_PATH = "G:\\webstudio\\yyjBlog\\WebRoot\\Index";
}
