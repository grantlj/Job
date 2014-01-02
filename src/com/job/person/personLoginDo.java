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
public class personLoginDo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public personLoginDo() {
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
	
	private String userId;
	private Document doc;
	
	private boolean checkValid(String u,String p)
	{
		System.out.println("in");
		doc=ReadXML.load(getServletContext().getRealPath("/WEB-INF/classes/person.xml"));
		
		Element root = doc.getRootElement();
		Element personList=root.element("personList");
		int personCount=Integer.parseInt((String)personList.attributeValue("count"));
		
		for (int i=1;i<=personCount;i++)
		{
			Element nowPerson=personList.elementByID(String.valueOf(i));
			String nowName=nowPerson.element("name").getTextTrim();
			
			if (nowName.equals(u))
			{
			   
			   userId=String.valueOf(i);
			   break;
			}
			
		}
		
		if (userId!=null)
		{
	     	Element passwordList=root.element("passwordList");
		    Element nowPerson=passwordList.elementByID(userId);
		    String nowPwd=nowPerson.element("nowPwd").getTextTrim();
		    if (nowPwd.equals(p))
		     return true;
		    else
		    	return false;
		}
		
		return false;
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       
	   String username=(String) request.getParameter("username");
       String userpwd=(String) request.getParameter("userpwd");
       
       if (checkValid(username,userpwd))
       {
    	   request.getSession().setAttribute("loginUserId", userId);
    	   response.sendRedirect("/Job/views/person/center.jsp");
    	   
       }
       
       else
          response.sendRedirect("/Job/views/person/personLogin.jsp");
	   
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
