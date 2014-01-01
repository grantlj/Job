package com.job.person;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;

import com.job.util.ReadXML;

@SuppressWarnings("serial")
public class personMsgDo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public personMsgDo() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       this.doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	private personMsgBean pmb;
	private Document doc;
	
	private void getValues(String id)
	{
		doc=ReadXML.load("d:\\person.xml");
		Element root = doc.getRootElement();
		Element msgList=root.element("msgList");
		Element person=msgList.elementByID(id);
		
		int arg1Count,arg2Count,arg3Count;
		Element jobMsgList=person.element("jobMsgList");arg1Count=Integer.parseInt(jobMsgList.attributeValue("count"));
		Element hisMsgList=person.element("hisMsgList");arg2Count=Integer.parseInt(hisMsgList.attributeValue("count"));
		Element othMsgList=person.element("othMsgList");arg3Count=Integer.parseInt(othMsgList.attributeValue("count"));
		
	    pmb=new personMsgBean();
	    
	    pmb.setArg1Count(arg1Count);pmb.setArg2Count(arg2Count);pmb.setArg3Count(arg3Count);
	    
	   	String[] jMsg=new String[pmb.getArg1Count()];
	   	String[] hMsg=new String[pmb.getArg2Count()];
	   	String[] oMsg=new String[pmb.getArg3Count()];
	   	
	    for (int i=1;i<=arg1Count;i++)
	      jMsg[i-1]=jobMsgList.elementByID(String.valueOf(i)).getTextTrim();
	    
	    for (int i=1;i<=arg2Count;i++)
		   hMsg[i-1]=hisMsgList.elementByID(String.valueOf(i)).getTextTrim();
	    
	    for (int i=1;i<=arg3Count;i++)
	      oMsg[i-1]=othMsgList.elementByID(String.valueOf(i)).getTextTrim();
	    
	    pmb.sethMsg(hMsg);
	    pmb.setjMsg(jMsg);
	    pmb.setoMsg(oMsg);
	       
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=(String) request.getSession().getAttribute("loginUserId");
		
		if (id!=null) 
		{
			getValues(id);
		    request.setAttribute("pmb", pmb);
		    request.getRequestDispatcher("personMsg.jsp").forward(request, response);
		}
		else
			response.sendRedirect("personLogin.jsp");
	
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
