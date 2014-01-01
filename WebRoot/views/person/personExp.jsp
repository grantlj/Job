<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.job.person.personExpBean" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'personExp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>  
     <h1 align="center">项目经验</h1>
     <hr/>
     <center>
      
   
        
         <%
            personExpBean peb=(personExpBean) request.getAttribute("peb");
            int argCount=peb.getArgCount();
            
            String[] start_year=peb.getStart_year();
		    String[] start_month=peb.getStart_month();
		    String[] end_year=peb.getEnd_year();
		    String[] end_month=peb.getEnd_month();
		    String[] name=peb.getName();
		    String[] tool=peb.getTool();
		    String[] hw_env=peb.getHw_env();
		    String[] sw_env=peb.getSw_env();
		    String[] description=peb.getDescription();
		    String[] duty=peb.getDuty();
		    String[] save=peb.getSave();
		    
		    /**)
            for (int i=0;i<argCount;i++)
              {
                out.println("<tr>");
                out.println("<td>"+String.valueOf(i+1)+"</td>");
                out.println("<td><a href=\"#"+"m"+String.valueOf(i+1)+"\">"+name[i]+"</a></td>");
                out.println("<tr/>");
              }
            */
          %>
      
       
       </hr>
       
       <%
          for (int i=0;i<argCount;i++)
             {
                out.println("<a name=\""+"m"+String.valueOf(i+1)+"\">");
                out.println("<h2>"+name[i]+"</h2>");
                out.println("</a>");
                out.println("</hr>");
               
                out.println("<table border=1>");
                out.println("<tr>");
                out.println("<th>开始年份</th>");
                out.println("<th>开始月份</th>");
                out.println("<th>结束年份 </th>");
                out.println("<th>结束月份</th>");
                out.println("<th>开发工具</th>");
                out.println("<th>硬件平台</th>");
                out.println("<th>软件平台</th>"); 
                out.println("<th>项目描述</th>");
                out.println("<th>任务分工</th>");
                out.println("<th>保存简历</th>");
                out.println("</tr>");
                
                out.println("<tr>");
                out.println("<td>"+start_year[i]+"</td>");
                out.println("<td>"+start_month[i]+"</td>");
                out.println("<td>"+end_year[i]+"</td>");
                out.println("<td>"+end_month[i]+"</td>");
                out.println("<td>"+tool[i]+"</td>");
                out.println("<td>"+hw_env[i]+"</td>");
                out.println("<td>"+sw_env[i]+"</td>");
                out.println("<td>"+description[i]+"</td>");
                out.println("<td>"+duty[i]+"</td>");
                out.println("<td>"+save[i]+"</td>");   
                out.println("</tr>");
                out.println("</table>");
             }
        %>
       
     </center>
  </body>
</html>
