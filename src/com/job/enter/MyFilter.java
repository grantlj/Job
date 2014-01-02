package com.job.enter;
import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;

public class MyFilter implements Filter{
	 public void doFilter(ServletRequest request, ServletResponse response,
			 FilterChain chain) throws IOException, ServletException { 
	  HttpServletRequest req = (HttpServletRequest) request; 
	  HttpServletResponse res = (HttpServletResponse) response; 
	  HttpSession session = req.getSession(true); 
	  String user_name = (String) session.getAttribute("username"); 
	  String path = req.getServletPath();   
	    if(!"/views/enter/login.html".equals(path) && !"/views/enter/enterlogin".equals(path)){ 
	    	if ((user_name == null || "".equals(user_name)) ) {   
	    	 res.sendRedirect("/Job/views/enter/login.html");
	         res.setHeader("Cache-Control","no-store"); 
	         res.setDateHeader("Expires",0); 
	         res.setHeader("Pragma","no-cache"); 
	    	}  else { 
	         chain.doFilter(request,response); 
	    	} 
	    }else {
	    	chain.doFilter(request,response); 
	    }
	  }

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	

}
