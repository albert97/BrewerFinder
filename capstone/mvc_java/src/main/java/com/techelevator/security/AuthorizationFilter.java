package com.techelevator.security;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techelevator.entity.User;

public class AuthorizationFilter implements Filter {

	public static final String LOGGED_USER = "sessionUser";
	public String userRoleRequired;
	public String urlToRedirectTo;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String configuredRoleNameRequired = filterConfig.getInitParameter("roleName");
		this.urlToRedirectTo = filterConfig.getInitParameter("redirectPath");
		if (configuredRoleNameRequired!=null && !configuredRoleNameRequired.isEmpty()){
			this.userRoleRequired = configuredRoleNameRequired;
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;

		User sessionUser = getUserFromSession(httpRequest);

		String urlRequested = httpRequest.getRequestURI();

		if(sessionUser == null) {
			redirectToLoginPage(httpRequest, httpResponse);
		} else {
			if (!sessionUser.isMemberOfRole(userRoleRequired)) {
				if (urlToRedirectTo == null || urlToRedirectTo.isEmpty())
					redirectToLoginPage(httpRequest, httpResponse);
				httpResponse.sendRedirect(this.urlToRedirectTo);
			}
		}
		chain.doFilter(request, response);
	}

	private void redirectToLoginPage(HttpServletRequest httpRequest, HttpServletResponse httpResponse)
			throws IOException {

		String originalRequest = httpRequest.getRequestURL().toString();
		String queryString = httpRequest.getQueryString();
		if(queryString != null) {
			originalRequest = originalRequest + "?" + queryString;
		}

		String context = httpRequest.getServletContext().getContextPath();
		httpResponse.sendRedirect(context+"/login?destination="+URLEncoder.encode(originalRequest, "UTF-8"));
	}

	private User getUserFromSession(HttpServletRequest httpRequest) {
		return (User)httpRequest.getSession().getAttribute(LOGGED_USER);
	}

	@Override
	public void destroy() {

	}

}
