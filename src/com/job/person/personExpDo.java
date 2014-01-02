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
public class personExpDo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public personExpDo() {
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
	
	private Document doc;
	private personExpBean peb;
	
	private void getValues(String id)
	{
		doc=ReadXML.load(getServletContext().getRealPath("/WEB-INF/classes/person.xml"));
		Element root = doc.getRootElement();
		Element proExperienceList=root.element("proExperienceList");
		Element person=proExperienceList.elementByID(id);
		
		
		peb=new personExpBean();
		
		int expCount=Integer.parseInt(person.attributeValue("count"));
		peb.setArgCount(expCount);
		
		String[] start_year=new String[peb.getArgCount()];
		String[] start_month=new String[peb.getArgCount()];
		String[] end_year=new String[peb.getArgCount()];
		String[] end_month=new String[peb.getArgCount()];
		String[] name=new String[peb.getArgCount()];
		String[] tool=new String[peb.getArgCount()];
		String[] hw_env=new String[peb.getArgCount()];
		String[] sw_env=new String[peb.getArgCount()];
		String[] description=new String[peb.getArgCount()];
		String[] duty=new String[peb.getArgCount()];
		String[] save=new String[peb.getArgCount()];
		
		
		for (int i=1;i<=expCount;i++)
		{
			Element tmp=person.elementByID(String.valueOf(i));
			start_year[i-1]=tmp.element("start_year").getText();
			start_month[i-1]=tmp.element("start_month").getText();
			end_year[i-1]=tmp.element("end_year").getText();
			end_month[i-1]=tmp.element("end_month").getText();
			name[i-1]=tmp.element("name").getText();
			tool[i-1]=tmp.element("tool").getText();
			hw_env[i-1]=tmp.element("hw_env").getText();
			sw_env[i-1]=tmp.element("sw_env").getText();
			description[i-1]=tmp.element("description").getText();
			duty[i-1]=tmp.element("duty").getText();
			save[i-1]=tmp.element("save").getText();
		}
		
		peb.setStart_year(start_year);peb.setStart_month(start_month);
		peb.setEnd_year(end_year);peb.setEnd_month(end_month);
		peb.setName(name);peb.setTool(tool);
		peb.setHw_env(hw_env);peb.setSw_env(sw_env);
		peb.setDescription(description);peb.setDuty(duty);
		peb.setSave(save);

		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id=(String) request.getSession().getAttribute("loginUserId");
		if (id!=null) 
		{
		   getValues(id);
	       request.setAttribute("peb", peb);
	       request.getRequestDispatcher("personExp.jsp").forward(request, response);
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
