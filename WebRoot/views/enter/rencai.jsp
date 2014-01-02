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
<title>人才查询</title>
<link type="text/css" rel="stylesheet" href="../../css/enter/css.css" />
<%
		String userName=(String)session.getAttribute("username");
		ReadXML rx=new ReadXML();
		String path1 = getServletContext().getRealPath("/WEB-INF/classes/rencai.xml");
		Document doc=rx.getDocument(path1);
		List list = doc.selectNodes("//person" );
	    
 %>
</head>
<body>
<div id="search_talents">
	<h2>人才查询</h2>
    <div class="one">
    	<span class="float_left">
            当前企业账号：<%=userName %>>&nbsp;&nbsp;
            <input type="button" value="安全退出" />
        </span>
    	<span class="float_right">上次登录时间：2011年12月12日 12:12</span>
        <div class="clear"></div>
    </div>
    <div class="two">
    	<span class="float_left">
            <input type="button" value="我的人才" class="my"/>
            <input type="button" value="我的企业" class="my" />
        </span>
        <span class="float_right search_content">
        	<b>关键字：</b>
            	<input type="text" class="search_text" />
            	<input type="button" value="查找" class="search_button"/>
        </span>
        <div class="clear"></div>
    </div>
    <div class="three">
    	<table>
        	<tr>
            	<td class="right">人才类型：</td>
                <td class="left">
                	<select>
                    	<option value="java程序员">java程序员</option>
                        <option value="">销售经历</option>
                        <option>保洁员</option>
                        <option>厨司</option>
                    </select>
                </td>
                <td class="right">能力等级：</td>
                <td class="left">
                	<select>
                    	<option>A</option>
                        <option>B</option>
                        <option>C</option>
                        <option>D</option>
                    </select>
                </td>
            </tr>
            <tr>
            	<td class="right">信用等级：</td>
                <td class="left">
                	<select>
                    	<option>A</option>
                        <option>B</option>
                        <option>C</option>
                        <option>D</option>
                    </select>
                </td>
                <td class="right">求职状态：</td>
                <td class="left">
                	<select>
                    	<option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                    </select>
                </td>
            </tr>
            <tr>
            	<td class="right">薪资要求：</td>
                <td class="left">>=<input type="text" class="money" />元</td>
                <td class="right">学历：</td>
                <td class="left">
                	<select>
                    	<option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                    </select>
                </td>
            </tr>
            <tr>
            	<td></td>
                <td></td>
                <td></td>
                <td><input type="button" value="筛选" class="look_up" /></td>
            </tr>
        </table>
    </div>
    <h3>查询结果</h3>
    
    <!--以下这个div为查询结果，由jsp标签循环生成-->
    <div class="result">
    	<a href="#"><img src="../../images/test.png" /></a>
        	<table>
                <tr>
                    <td class="right">人才类型：</td>
                    <td class="left">测试测试</td>
                    <td class="right">能力等级：</td>
                    <td class="left">测试测试</td>
                </tr>
                <tr>
                    <td class="right">信用等级：</td>
                    <td class="left">测试测试</td>
                    <td class="right">求职状态：</td>
                    <td class="left">测试测试</td>
                </tr>
                <tr>
                    <td class="right">薪资要求：</td>
                    <td class="left">>=4000元</td>
                    <td class="right">学历：</td>
                    <td class="left">测试测试</td>
                </tr>
            </table>
    </div>
</div>
</body>
</html>
