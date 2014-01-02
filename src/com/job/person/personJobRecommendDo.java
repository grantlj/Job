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
public class personJobRecommendDo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public personJobRecommendDo() {
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
	private personJobRecommendBean pjrb;
	
	private void getValues(String id)
	{
		doc=ReadXML.load(getServletContext().getRealPath("/WEB-INF/classes/person.xml"));
		Element root = doc.getRootElement();
		Element wRList=root.element("workRecommendList");
		Element person=wRList.elementByID(id);
	    pjrb=new personJobRecommendBean();
	    
		pjrb.setArgCount(Integer.parseInt(person.attributeValue("count")));
		
		String[] wAddr=new String[pjrb.getArgCount()];
		String[] rType=new String[pjrb.getArgCount()];
		String[] sPosi=new String[pjrb.getArgCount()];
		String[] cPosi=new String[pjrb.getArgCount()];
		
		for (int i=1;i<=pjrb.getArgCount();i++)
	   	{
	   		Element tmpwR=person.elementByID(String.valueOf(i));
	   		@SuppressWarnings("unchecked")
			List<Element> el = tmpwR.elements();
	   		wAddr[i-1]=el.get(0).getTextTrim();
	   		rType[i-1]=el.get(1).getTextTrim();
	   		sPosi[i-1]=el.get(2).getTextTrim();
	   		cPosi[i-1]=el.get(3).getTextTrim();
	   	}
	   	
	    pjrb.setwAddr(wAddr);pjrb.setrType(rType);pjrb.setsPosi(sPosi);pjrb.setcPosi(cPosi);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id=(String) request.getSession().getAttribute("loginUserId");
		if (id!=null) 
		{
		   getValues(id);
		   request.setAttribute("pjrb", pjrb);
	       request.getRequestDispatcher("personJobRecommend.jsp").forward(request, response);
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
