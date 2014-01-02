package com.job.enter;

import java.io.*;
import java.util.Iterator;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import org.dom4j.Document;
import org.dom4j.Element;


public class EnterData extends HttpServlet{
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		@SuppressWarnings("rawtypes")
		public void doPost(HttpServletRequest req,HttpServletResponse resq) 
					throws ServletException{
			try {
			String profession=req.getParameter("profession");
			String character=req.getParameter("character");
			String number=req.getParameter("number");
			String produce=req.getParameter("produce");
			String userName=req.getParameter("username");
			System.out.println(userName);
			ReadXML rx=new ReadXML();
			String path = getServletContext().getRealPath("/WEB-INF/classes/enter.xml");
			Document doc=rx.getDocument(path);
			List list = doc.selectNodes("//username" );
			if(list != null){
				Iterator iter=list.iterator();
				while(iter.hasNext()){
					Element e=(Element)iter.next();
					if(userName.equals(e.getText())){
						Element parent=e.getParent();
						System.out.println(profession);
						System.out.println(character);
						System.out.println(number);
						System.out.println(produce);
						Element child=parent.element("profession");
						child.setText(profession);
						child=parent.element("character");
						child.setText(character);
						child=parent.element("number");
						child.setText(number);
						child=parent.element("produce");
						child.setText(produce);
						break;
					}
				}
				rx.writeXml(doc,path); 
			}else {
				resq.sendRedirect("/Job/views/login.html");
			}
		} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
	
		}
}
}
