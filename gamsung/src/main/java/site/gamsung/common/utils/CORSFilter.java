package site.gamsung.common.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class CORSFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletResponse httpResponse = (HttpServletResponse) response;
    	// 허용할 Method 목록
		httpResponse.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
		httpResponse.setHeader("Access-Control-Max-Age", "3600");
	    	// 허용할 Header 목록
		httpResponse.setHeader("Access-Control-Allow-Headers", "x-requested-with, content-type, Authorization");
	    	// 허용할 다른 출처 도메인 목록
		httpResponse.setHeader("Access-Control-Allow-Origin", "*");
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	
}
