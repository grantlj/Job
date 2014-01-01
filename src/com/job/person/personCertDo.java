package com.job.person;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;

import com.job.util.ReadXML;

@SuppressWarnings("serial")
public class personCertDo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public personCertDo() {
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
       this.doPost(request, response);
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

	private Document doc;
	private personCertBean pcb;
	
	private void getValues(String id)
	{
		doc=ReadXML.load("d:\\person.xml");
		Element root = doc.getRootElement();
		Element certificateList=root.element("certificateList");
		Element person=certificateList.elementByID(id);
	    pcb=new personCertBean();
	    
		pcb.setArgCount(Integer.parseInt(person.attributeValue("count")));

	   	String[] certName=new String[pcb.getArgCount()];
	   	String[] certTime=new String[pcb.getArgCount()];
	   	String[] certExpl=new String[pcb.getArgCount()];
	   	
	   	for (int i=1;i<=pcb.getArgCount();i++)
	   	{
	   		Element tmpCert=person.elementByID(String.valueOf(i));
	   		@SuppressWarnings("unchecked")
			List<Element> el = tmpCert.elements();
	   		certName[i-1]=el.get(0).getTextTrim();
	   		certTime[i-1]=el.get(1).getTextTrim();
	   		certExpl[i-1]=el.get(2).getTextTrim();
	   	}
	   	
	   	pcb.setCertName(certName);
	   	pcb.setCertTime(certTime);
	   	pcb.setCertExpl(certExpl);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=(String) request.getSession().getAttribute("loginUserId");
		if (id!=null) 
		{
		   getValues(id);
	       request.setAttribute("pcb", pcb);
	       request.getRequestDispatcher("personCert.jsp").forward(request, response);
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
