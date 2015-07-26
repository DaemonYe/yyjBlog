package cn.yeyangjie.web.filter;

import static cn.yeyangjie.cons.CommonConstant.LOGIN_TO_URL;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import cn.yeyangjie.domain.Admin;

public class PrivilegeFilter implements Filter {
	private static final String FILTERED_REQUEST = "@@session_context_filtered_request";

	// 执行过滤
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 保证该过滤器在一次请求中只被调用一次
		if (request != null && request.getAttribute(FILTERED_REQUEST) != null) {
			chain.doFilter(request, response);
		} else {

			// 设置过滤标识，防止一次请求多次过滤
			request.setAttribute(FILTERED_REQUEST, Boolean.TRUE);
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			Admin admin = getSessionAdmin(httpRequest);

			// 站长未登录, 且当前URI资源需要登录才能访问
			if (admin == null) {
				String toUrl = httpRequest.getRequestURL().toString();
				if (!StringUtils.isEmpty(httpRequest.getQueryString())) {
					toUrl += "?" + httpRequest.getQueryString();
				}

				// 将用户的请求URL保存在session中，用于登录成功之后，跳到目标URL
				httpRequest.getSession().setAttribute(LOGIN_TO_URL, toUrl);
				httpRequest.getSession().setAttribute("errorMsg",
						"您还没有登录，不要瞎遛达！");

				// 转发到登录页面
				request.getRequestDispatcher("/login.htm").forward(request,
						response);
				return;
			}
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	protected Admin getSessionAdmin(HttpServletRequest request) {
		return (Admin) request.getSession().getAttribute("Admin");
	}

	public void destroy() {

	}
}
