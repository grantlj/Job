package com.job.enter;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import org.dom4j.*;


public class ModifyPwd extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("rawtypes")
	public void doPost(HttpServletRequest req,HttpServletResponse resp) 
				throws ServletException,IOException{
				
				String companyPwd = req.getParameter("company_password");
				String newPwd = req.getParameter("new_password");
				//读取session
				HttpSession session =req.getSession();
				String enterName = (String)session.getAttribute("username");
				ReadXML rx=new ReadXML();
				String path = getServletContext().getRealPath("/WEB-INF/classes/enter.xml");
				Document doc=rx.getDocument(path);
	
				List list = doc.selectNodes("//username" );
			    Iterator iter=list.iterator();
				while(iter.hasNext()){
					Element e=(Element)iter.next();
					if(enterName.equals(e.getText())){
						Element parent=e.getParent();
						Element child=parent.element("password");
						if(child.getText().equals(companyPwd)){
							child.setText(newPwd);
							break;
						}
						
					}
				}
				rx.writeXml(doc,path);
			}
	}
			


