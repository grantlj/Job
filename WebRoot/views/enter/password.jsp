<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>密码修改</title>
<link rel="stylesheet" type="text/css" href="reset.css"/>
<style type="text/css">
#modify_password{
	width:770px;
	
}
.input_slip{
	border:1px solid #000;	
}
table td{
	height:30px;
}
</style>
</head>

<body>
<div id="modify_password">
<form action="/job/views/enter/modify_password" method="post">

<table>
<tr>
<td align="right">
<p>请输入原始密码：</p>
</td>
<td>

<input class="input_slip" type="text" name="company_password"/></form>
</td>
</tr>
<tr>
<td align="right" style=" height:15px">
<p>新密码：</p>
</td>
<td style=" height:15px">
<input class="input_slip" type="text"  name="new_password"></form>

</td>
</tr>
<tr> 
<td style="height:15px;">
</td>
<td style="height:15px;">
至少6位，数字，字母或常用字符至少包含两种组合
</td>
</tr>
<tr>
<td align="right">
<p>重复新密码 ：</p>
</td>
<td>
<input class="input_slip" type="text" name="renew_password"></form>
</td>
</tr>

<tr>
<td align="right">
<p>验证码 ：</p>
</td>
<td >
<input type="text" class="input_slip" width=="10px" value="123" name="yzm">看不清，点击换一个</form>
</td>
</tr>
<tr>
<td>
</td>
<td><img src="../../images/enter/check.jpg" />
</td>
</tr>


<tr>
<td>&nbsp;

</td>
<td align="left">
  <p>
    <input type="button" value="返回" name="back">&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="提交" name="submit"/>
  </p>


</td>
</tr>

</table>
</form>


</div>
</body>
</html>
