package com.job.person;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import com.job.util.*;

public class personResumeRefreshDo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public personResumeRefreshDo() {
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
	
	String type,abilityClass,creditClass,salaryClass,
    eduClass,worktimeClass,projClass,generalSkill,
    artSkill,progSkill_fore,progSkill_back,dbSkill,
    mgrSkill;
	
	
	private String transferToBit(String[] s)
	{
	    char[] c=new char[8];
	    for (int i=0;i<8;i++)
	    	c[i]='0';
	   	for (int i=0;i<s.length;i++)
	   	  c[8-Integer.parseInt(s[i])]='1';
	   	return String.valueOf(c);
	}
	
	
	private void getValues(HttpServletRequest request)
	{
	   	salaryClass=request.getParameter("salary");
	   	type=request.getParameter("type");
	   	eduClass=request.getParameter("record");
	    
	   	generalSkill=transferToBit(request.getParameterValues("common"));
	   	artSkill=transferToBit(request.getParameterValues("art"));
	   	
	   	progSkill_fore=transferToBit(request.getParameterValues("Reception"));
	   	progSkill_back=transferToBit(request.getParameterValues("Background"));
	   	
	   	dbSkill=transferToBit(request.getParameterValues("database"));
	   	mgrSkill=transferToBit(request.getParameterValues("project"));
	   	
	   	projClass=request.getParameter("proj_count");
	   	
	   	worktimeClass=request.getParameter("work_years");
	   	
	}
	
	Document doc;
	private void saveToXML(String id) throws IOException
	{
		doc = ReadXML.load(getServletContext().getRealPath("/WEB-INF/classes/person.xml"));
		Element root = doc.getRootElement();
		Element profileList=root.element("resumeList");
		Element person=profileList.elementByID(id);
		
		person.element("type").setText(type);
		//person.element("abilityClass").getText();
		//person.element("creditClass").getText();
		person.element("salaryClass").setText(salaryClass);
		person.element("eduClass").setText(eduClass);
		person.element("worktimeClass").setText(worktimeClass);
		person.element("projClass").setText(projClass);
		person.element("generalSkill").setText(generalSkill);
		person.element("artSkill").setText(artSkill);
	    person.element("progSkill_fore").setText(progSkill_fore);
		person.element("progSkill_back").setText(progSkill_back);
		person.element("dbSkill").setText(dbSkill);
		person.element("mgrSkill").setText(mgrSkill);
		
		
		Element msgList=root.element("msgList");
	    person=msgList.elementByID(id);
	    Element hisMsgList=person.element("hisMsgList");
	    
	    hisMsgList.addAttribute("count",String.valueOf(Integer.parseInt(hisMsgList.attributeValue("count"))+1));
		Element hisMsg=hisMsgList.addElement("hisMsg");
		hisMsg.addAttribute("ID",String.valueOf(Integer.parseInt(hisMsgList.attributeValue("count"))));
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  kk:mm:ss ");Date d = new Date();
		hisMsg.setText(sdf.format(d)+"：简历修改成功！");
		
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setEncoding("UTF-8");
		File file = new File(getServletContext().getRealPath("/WEB-INF/classes/person.xml"));
	

		XMLWriter writer;

		writer = new XMLWriter(new FileOutputStream(file), format);
		writer.write(doc);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		getValues(request);
		String ret;
		
		response.setCharacterEncoding("utf-8");
		try
		{
		   saveToXML((String) request.getSession().getAttribute("loginUserId"));
		   ret="简历保存成功！";
		}
		catch (Exception e)
		{
		   ret="简历保存失败！";
		}
		
	    PrintWriter pw=response.getWriter();
	    pw.println("<html>");
	    pw.println("<body>");
	    pw.println("<center>");
		pw.println("<h1>"+ret+"</h1>");
		pw.println("</center>");
		pw.println("</body>");
		pw.println("</html>");
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
