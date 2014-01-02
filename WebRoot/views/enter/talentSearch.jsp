<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import=" java.io.*, org.dom4j.*,com.job.enter.*"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <head>
  <title> 人才推荐查询 </title>
  <meta name="Generator" content="">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <link href="../../css/enter/talentSearch.css" rel="stylesheet" type="text/css">
  <%
		String userName=(String)session.getAttribute("username");
		ReadXML rx=new ReadXML();
		String path1 = getServletContext().getRealPath("/WEB-INF/classes/rencai.xml");
		Document doc=rx.getDocument(path1);
		List list = doc.selectNodes("//person" );
	    
 %>
 </head>

 <body>
		<div id="table">
				<table>
						<tr id="first_line">
							<td>姓名</td>
							<td>性别</td>
							<td>年龄</td>
							<td>学历</td>
							<td>期望工作</td>
							<td>操作</td>
							
						</tr>
						<%	
                		Iterator iter=list.iterator();
                		int i = 1;
                		while(iter.hasNext()){
                			Element e=(Element)iter.next();
                			if(e.element("tuijian").getText().equals("ture")) {
                				if(i%2!=0){
                					out.print("<tr class=\"odd_line\">");
                				}else {
                					out.print("<tr class=\"even_line\">");
                					}
                			out.print("<td>"+e.element("name").getText()+"</td>");
                			out.print("<td>"+e.element("sex").getText()+"</td>");
                			out.print("<td>"+e.element("age").getText()+"</td>");
                			out.print("<td>"+e.element("education").getText()+"</td>");
                			out.print("<td>"+e.element("job").getText()+"</td>");
                			out.print("<td><a href = \"#\">查看详情</a></td>");
                			out.print("</tr>");
							}
							i++;
							}
                 %>
						
					

				</table>
			
		</div>
 </body>
</html>
