<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.job.person.personHistoryBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人简历管理</title>
<style type="text/css">
*{ margin:0px; padding:0px; list-style:none; font-size:12px;}
#wrapper{ width:770px; margin:0 auto;}
table{ width:770px; text-align:center; }
thead{ background:#4876ff; font-size:14px;color:#FFF; font-weight:100;}
th,td{ height:40px; width:25%;}
.hr{ height:5px; width:100%; text-align:center; background:#eee5de;margin-top:20px; }
.btn{ width:100%; margin-top:20px;}
.btn button{ width:100px; height:28px; border:none; background:#4876ff; float:right; color:#FFF; cursor:pointer;}
</style>
</head>
<body>

<%
   personHistoryBean phb=(personHistoryBean) request.getAttribute("phb");
   
   int argCount=phb.getArgCount();
   String[] name=phb.getName();
   String[] update=phb.getUpdate();
   String[] priv=phb.getPriv();
 %>


 
<div id="wrapper">
  <table cellpadding="0" cellspacing="0" border="0">
    <thead>
      <th>简历名称</th>
      <th>更新时间</th>
      <th>公开程度</th>
      <th>更多操作</th>
    </thead>
    <tbody>
      <%
         for (int i=0;i<argCount;i++)
           {
      %>
         <tr>
            <td><a href="#"><% out.print(name[i]);%></a></td>
            <td><a href="#"><% out.print(update[i]);%></a></td>
            <td>
            <select>
               <option value="all" <%if (priv[i].equals("1")) out.print("selected"); %> >完全公开</option>
               <option value="fri" <%if (priv[i].equals("2")) out.print("selected"); %> >好友可见</option>
               <option value="ome" <%if (priv[i].equals("3")) out.print("selected"); %> >完全保密</option>
            </select>
            </td>
            
            <td>
             <select>
               <option value="more">更多操作</option>
             </select>
            </td>
            
         </tr>
       <%
          };
        %>
    </tbody>
  </table>
  <div class="hr">&nbsp;</div>
  <div class="btn">
    <button>保存并返回</button>
    &nbsp;&nbsp;&nbsp;
    <button>创建新的简历</button>
    
  </div>
</div>
    
   
</html>
