<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>密码修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <script>
  function checkValid()
  {
   
   var oldPwd=document.getElementById("oldPwd").value;
   var newPwd=document.getElementById("newPwd").value;
   var newPwd2=document.getElementById("newPwd2").value;

   if (newPwd!=newPwd2)
   {
      alert("密码确认错误！");
     // clearAll();
      return false;
   }
   else
     {
      var tmpPwd="<%=(String)request.getSession().getAttribute("tmpPwd")%>";
      if (tmpPwd!=oldPwd)
      {
         alert("原密码不正确，请核对！");
         //clearAll();
         return false;
       }
     }
    return true;
 
  }
  
 var code ; // 在全局 定义验证码
function createCode(){ 
code = new Array();
var codeLength = 4;// 验证码的长度
 var checkCode = document.getElementById("checkCode");
checkCode.value = "";

var selectChar = new Array(2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');

for(var i=0;i<codeLength;i++) {
   var charIndex = Math.floor(Math.random()*32);
   code +=selectChar[charIndex];
}
if(code.length != codeLength){
   createCode();
}
checkCode.value = code;
}


function validateCode () {
var inputCode = document.getElementById("indentify").value.toUpperCase();

if(inputCode.length <=0) {
   alert(" 请输入验证码！");
   return false;
}
else if(inputCode != code ){
   alert(" 验证码输入错误！");
   createCode();
   return false;
}
else {
  // alert(" 成功！");
   return true;
}
}
  function clearAll()
  {
    document.getElementById("oldPwd").value="";
    document.getElementById("newPwd").value="";
    document.getElementById("newPwd2").value="";
    document.getElementById("indentify").value="";
    createCode();
  }
  
function valid()
{
 
  var res=validateCode() && checkValid();
  if (!res)
    clearAll();
  else
    alert("密码修改成功！");
  return res;
}

  </script>
  
<style type="text/css">
.code{
background:url(111.jpg) no-repeat;
font-family:Arial,                   宋体;
font-style:italic;
color:green;
border:0;
padding:2px 3px;
letter-spacing:3px;
font-weight:bolder;
cursor:pointer;
}
.unchanged {
border:0;
}
.changPass table{
border:1px solid blue;
width:750px;
}

</style>

  </head>
  
  <body onLoad="createCode();">
	<table width ="760" border = "0" align= "center">
		<td>
			<form action= "views/person/personChangePwdDo" method="get" onSubmit="return valid()">
			<fieldset>
			<legend><h1>密码修改</h1></legend>
			<table width = "70%" border ="0" align = "center" >
				<caption align = "center"><strong>
					<strong></caption>
				<colgroup align = "right"></colgroup>
				<tr> 
					<td>旧密码：</td>
					<td><input type = "password" name = "oldPassword" id="oldPwd"/>
				</tr> 
				<tr>
					<td>新密码：</td>
					<td><input type = "password" name = "newPassword" id="newPwd"/>
				</tr>
				<tr>
					<td>再次输入新密码：</td>
					<td><input type = "password" name = "newPassword2" id="newPwd2"/>
				</tr>
				<tr>
					<td>验证码：</td>
					<td>
						<input type="text" id="indentify" />
					</td>
					<td>
						<input type="button" id="checkCode" class="code" style="width:60px" onClick="createCode()"/>
					
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" name="affirm" value="完成修改"/>
					</td>
					<td>
					  <input type="reset" value="重填">
					</td>
				</tr>
			</table>
			</form>
		</td>
	</table>
</body>

</html>
