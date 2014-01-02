package com.job.enter;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.dom4j.*;


public class Fabu extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session =req.getSession();
		String userName = (String)session.getAttribute("username");
		String jobName = req.getParameter("jobName");
		//String job_type_button = req.getParameter("jobMH");
		String zhiZe = req.getParameter("zhize");
		String yaoQiu = req.getParameter("yaoqiu");
		String number = req.getParameter("number");
		//String jobName = req.getParameter("jobName");
		String area = req.getParameter("area");
		//String jieZhi = req.getParameter("jiezhi");
		String time = req.getParameter("time");
		String education = req.getParameter("education");
		String property = req.getParameter("property");
		String minMoney = req.getParameter("minMoney");
		String maxMoney = req.getParameter("maxMoney");
		//String name = req.getParameter("name");
		//String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String huiFu = req.getParameter("huiFu");
		ReadXML rx=new ReadXML();
		String path = getServletContext().getRealPath("/WEB-INF/classes/zhaoping.xml");
		try {
			Document doc=rx.getDocument(path);
			Element root=doc.getRootElement();
			Element parent=root.addElement("msg");
			parent.addElement("userName").addText(userName);
			parent.addElement("jobName").addText(jobName);
			parent.addElement("zhize").addText(zhiZe);
			parent.addElement("yaoqiu").addText(yaoQiu);
			parent.addElement("number").addText(number);
			parent.addElement("area").addText(area);
			parent.addElement("time").addText(time);
			parent.addElement("education").addText(education);
			parent.addElement("property").addText(property);
			parent.addElement("minMoney").addText(minMoney);
			parent.addElement("maxMoney").addText(maxMoney);
			//parent.addElement("name").addText(name);
			//parent.addElement("phone").addText(phone);
			parent.addElement("email").addText(email);
			parent.addElement("huifu").addText(huiFu);		
			rx.writeXml(doc,path);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
