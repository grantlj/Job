package com.job.person;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;

import com.job.util.*;

public class personResumeDo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public personResumeDo() {
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
	private personResumeBean prb;
	
	private void getValues(String id)
	{
		doc=ReadXML.load(getServletContext().getRealPath("/WEB-INF/classes/person.xml"));
		Element root = doc.getRootElement();
		Element profileList=root.element("resumeList");
		Element person=profileList.elementByID(id);
		
		prb=new personResumeBean();
		
		String type,abilityClass,creditClass,salaryClass,
        eduClass,worktimeClass,projClass,generalSkill,
        artSkill,progSkill_fore,progSkill_back,dbSkill,
        mgrSkill;
		
		type=person.element("type").getText();
		abilityClass=person.element("abilityClass").getText();
		creditClass=person.element("creditClass").getText();
		salaryClass=person.element("salaryClass").getText();
		eduClass=person.element("eduClass").getText();
		worktimeClass=person.element("worktimeClass").getText();
		projClass=person.element("projClass").getText();
		generalSkill=person.element("generalSkill").getText();
		artSkill=person.element("artSkill").getText();
	    progSkill_fore=person.element("progSkill_fore").getText();
		progSkill_back=person.element("progSkill_back").getText();
		dbSkill=person.element("dbSkill").getText();
		mgrSkill=person.element("mgrSkill").getText();

		prb.setAbilityClass(abilityClass);prb.setArtSkill(artSkill);
		prb.setCreditClass(creditClass);prb.setDbSkill(dbSkill);
		prb.setEduClass(eduClass);prb.setGeneralSkill(generalSkill);
		prb.setMgrSkill(mgrSkill);prb.setProgSkill_back(progSkill_back);
		prb.setProgSkill_fore(progSkill_fore);prb.setProjClass(projClass);
		prb.setSalaryClass(salaryClass);prb.setType(type);
		prb.setWorktimeClass(worktimeClass);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
   
    String id=(String) request.getSession().getAttribute("loginUserId");
    if (id!=null)
    {
	   getValues(id);
	   request.setAttribute("prb", prb);
	   request.getRequestDispatcher("personResume.jsp").forward(request, response);
	   
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
