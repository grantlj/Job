<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import=" java.io.*, org.dom4j.*,com.job.enter.*"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title> 人才评价</title>
  <meta name="Generator" content="">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
<link rel="stylesheet" type="text/css" href="../../css/enter/talentSearch.css"/>
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
							<td>序号</td>
							<td>姓名</td>
							<td>工种</td>
							<td>等级</td>
							<td>类别</td>
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
                			out.print("<td>"+e.element("id").getText()+"</td>");
                			out.print("<td>"+e.element("name").getText()+"</td>");
                			out.print("<td>"+e.element("gz").getText()+"</td>");
                			out.print("<td>"+e.element("grade").getText()+"</td>");
                			out.print("<td>"+e.element("type").getText()+"</td>");
                			out.print("<td><a href = \"#\">评估管理</a></td>");
                			out.print("</tr>");
                			i++;
							}
							}
                 %>
						


				</table>
			
		</div>
 </body>
</html>
