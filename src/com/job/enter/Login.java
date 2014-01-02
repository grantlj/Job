package com.job.enter;

import java.io.*;
import java.util.Iterator;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import org.dom4j.Document;
import org.dom4j.Element;


public class Login extends HttpServlet{
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		public void doPost(HttpServletRequest req,HttpServletResponse resq) 
					throws ServletException{
			try {
			String userName=req.getParameter("admin");
			String passWd=req.getParameter("password");
			ReadXML rx=new ReadXML();
			String path = getServletContext().getRealPath("/WEB-INF/classes/enter.xml");
			Document doc=rx.getDocument(path);
			@SuppressWarnings("rawtypes")
			List list = doc.selectNodes("//username" );
			if(list != null){
				@SuppressWarnings("rawtypes")
				Iterator iter=list.iterator();
				while(iter.hasNext()){
					Element e=(Element)iter.next();
					if(userName.equals(e.getText())){
						Element parent=e.getParent();
						Element child=parent.element("password");
						if(child.getText().equals(passWd)){
							
							HttpSession session=req.getSession(true);
							//璁剧疆Session鍊�
							session.setAttribute("username",userName);
							session.setMaxInactiveInterval(10*60);
							resq.sendRedirect("/Job/views/enter/center.jsp");
						}else {
							resq.sendRedirect("/Job/views/login.html");
						}
						break;
					}
				}
				//rx.writeXml(doc,path); 
			}else {
				resq.sendRedirect("/job/views/login.html");
			}
		} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
	
		}
}
}
