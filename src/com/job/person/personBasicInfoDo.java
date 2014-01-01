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
public class personBasicInfoDo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public personBasicInfoDo() {
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
	private personBasicInfoBean pbib;

	private void getValues(String id)
	{
		doc=ReadXML.load("d:\\person.xml");
		Element root = doc.getRootElement();
		Element personList=root.element("personList");
		Element person=personList.elementByID(id);
		
		pbib=new personBasicInfoBean();
	    pbib.setName(person.element("name").getTextTrim());
	    pbib.setSex(person.element("sex").getTextTrim());
	    pbib.setBirth_year(person.element("birth_year").getTextTrim());
	    pbib.setBirth_mon(person.element("birth_mon").getTextTrim());
	    pbib.setCareer_year(person.element("career_year").getTextTrim());
	    pbib.setMarriage(person.element("marriage").getTextTrim());
	    pbib.setCountry(person.element("country").getTextTrim());
	    pbib.setLisenceType(person.element("lisenceType").getTextTrim());
	    pbib.setLisenceId(person.element("lisenceId").getTextTrim());
	    pbib.setAbroad(person.element("abroad").getTextTrim());
	    pbib.setPolitical(person.element("political").getTextTrim());
	    pbib.setCity_org(person.element("city_org").getTextTrim());
	    pbib.setCity_now(person.element("city_now").getTextTrim());
	    pbib.setAddress(person.element("address").getTextTrim());
	    pbib.setPost(person.element("post").getTextTrim());
	    pbib.setPhone_work(person.element("phone_work").getTextTrim());
	    pbib.setPhone_home(person.element("phone_home").getTextTrim());
	    pbib.setPhone_mobi(person.element("phone_mobi").getTextTrim());
	    pbib.setEmail(person.element("email").getTextTrim());
	    pbib.setPage(person.element("page").getTextTrim());
	   	
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       
	   String id=(String) request.getSession().getAttribute("loginUserId");
	   if (id!=null)
	   {
	       getValues(id);
	       request.setAttribute("pbib", pbib);
		   request.getRequestDispatcher("personBasicInfo.jsp").forward(request, response);
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
