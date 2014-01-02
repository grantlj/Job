package com.job.person;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import com.job.util.ReadXML;

@SuppressWarnings("serial")
public class personChangePwdDo extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Document doc;
 
		String id = (String) request.getSession().getAttribute("loginUserId");
		if (id != null) {
			
		
			doc = ReadXML.load(getServletContext().getRealPath("/WEB-INF/classes/person.xml"));
			Element root = doc.getRootElement();
			Element passwordList = root.element("passwordList");
			Element person = passwordList.elementByID(id);
			String old = person.element("nowPwd").getText();
			String oldP = request.getParameter("oldPassword");
			
			request.getSession().setAttribute("tmpPwd", old);
			
			response.sendRedirect("personChangePwd.jsp");
			
			if (!old.equals(oldP)) {
//				
			} else {
				String newPass = request.getParameter("newPassword");
				person.element("nowPwd").setText(newPass);
				OutputFormat format = OutputFormat.createPrettyPrint();
				// 设置输出编码
				format.setEncoding("UTF-8");
				// 创建需要写入的File对象
				File file = new File("d:\\person.xml");
				// 生成XMLWriter对象，构造函数中的参数为需要输出的文件流和格式

				XMLWriter writer;

				writer = new XMLWriter(new FileOutputStream(file), format);
				writer.write(doc);
                response.getWriter().println("密码修改成功！");
			}
		} else {
			response.sendRedirect("personLogin.jsp");
		}
	}
}
