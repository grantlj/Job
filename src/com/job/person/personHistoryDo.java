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
public class personHistoryDo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public personHistoryDo() {
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
	
	private personHistoryBean phb;
	private Document doc;
	
	private void getValues(String id)
	{
		doc=ReadXML.load("d:\\person.xml");
		Element root = doc.getRootElement();
		Element historyList=root.element("historyList");
		Element person=historyList.elementByID(id);
	    phb=new personHistoryBean();
	    
		phb.setArgCount(Integer.parseInt(person.attributeValue("count")));

	   	String[] name=new String[phb.getArgCount()];
	   	String[] update=new String[phb.getArgCount()];
	   	String[] priv=new String[phb.getArgCount()];
	   	
	   	for (int i=1;i<=phb.getArgCount();i++)
	   	{
	   		Element tmpHis=person.elementByID(String.valueOf(i));
	   		@SuppressWarnings("unchecked")
			List<Element> el = tmpHis.elements();
	   		name[i-1]=el.get(0).getTextTrim();
	   		update[i-1]=el.get(1).getTextTrim();
	   		priv[i-1]=el.get(2).getTextTrim();
	   	}
	   	
	   	phb.setName(name);
	   	phb.setUpdate(update);
	   	phb.setPriv(priv);
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id=(String) request.getSession().getAttribute("loginUserId");
		if (id!=null) 
		{
		   getValues(id);
	       request.setAttribute("phb", phb);
	       request.getRequestDispatcher("personHistory.jsp").forward(request, response);
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
