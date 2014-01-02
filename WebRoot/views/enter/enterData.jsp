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
<meta http-equiv="Content-Type"  charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../css/base.css"/>
<link rel="stylesheet" type="text/css" href="../../css/layout.css"/>
<title>企业基础资料</title>
<%
		String userName=(String)session.getAttribute("username");
		ReadXML rx=new ReadXML();
		String path1 = getServletContext().getRealPath("/WEB-INF/classes/enter.xml");
		Document doc=rx.getDocument(path1);
		List list = doc.selectNodes("//username" );
		Iterator iter=list.iterator();
		Element parent = null;
        while(iter.hasNext()){
                Element e=(Element)iter.next();
				if(userName.equals(e.getText())){
					parent = e.getParent();
				}
		}
 %>
</head>

<body>
<div class="iframepage">
	<div class="mb15"><span class="f20">公司名称：</span><%=parent.element("name").getText() %></div>
    <div class="mb15"><span class="f20">营业执照号码：</span><%=parent.element("code").getText() %></div>
    <div class="mb15"><span class="f20 vt">营业执照图片：</span><img src=<%=parent.element("img").getText() %> /></div>
    <div class="mb15">
    	<form action="/job/views/enter/enterData" method="post">
        	<div class="mb15">
            	<span class="f20">所属行业：</span>
                	<select name="profession" class="w250">
                    	<option value="internet" <% if(parent.element("profession").getText().equals("internet")) 
                    							out.print("selected=\"selected\""); %>>互联网</option>
                        <option value="jianzhu"   <% if(parent.element("profession").getText().equals("jianzhu")) 
                    							out.print("selected=\"selected\""); %>>建筑</option>
                        <option value="internet">互联网</option>
                        <option value="internet">互联网</option>
                    </select>
            </div>
            <div class="mb15">
            	<span class="f20">公司性质：</span>
                <select name="character" class="w250">
                    	<option value="国营" <% if(parent.element("character").getText().equals("国营") )
                    							out.print("selected") ;%>>国营</option>
                        <option value="外资"<% if(parent.element("character").getText().equals("外资") )
                    							out.print("selected") ;%>>外资</option>
                        <option value="internet">互联网</option>
                        <option value="internet">互联网</option>
                </select>
            </div>
            <div class="mb15">
            	<span class="f20">员工数量：</span>
                <input type="radio" name="number" value="100" <% if(parent.element("number").getText().equals("100") )
                    							out.print("checked") ;%>/>1-100人
                <input type="radio" name="number" value="500" <% if(parent.element("number").getText().equals("500") )
                    							out.print("checked"); %>/>100-500人
                <input type="radio" name="number" value="1000" <% if(parent.element("number").getText().equals("1000") )
                    							out.print("checked"); %>/>500-1000人
                <input type="radio" name="number" value="rest" <% if(parent.element("number").getText().equals("rest") )
                    							out.print("checked"); %>/>其他
            </div>
            <div class="mb15">
            	<span class="f20 vt" style="height:100px;">公司简介：</span>
                <textarea class="w300" name="produce" style="resize:none; height:100px;"><%=parent.element("produce").getText() %></textarea>
            </div>
            <div style="position:relative; left:150px;" class="mb15">
            	<input type="submit" class="w70 h24 f14 " style="background:#FFF; border:#999999 1px solid" value="保存" />
                <input type="reset"  class="w70 h24 f14 " style="background:#FFF; border:#999999 1px solid" value="重置" />
            </div>
           <input type=hidden name=username value= <%=userName %>> 
        </form>
    </div>
</div>
</body>
</html>
