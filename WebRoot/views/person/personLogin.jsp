<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>登录</TITLE>
<SCRIPT language=JavaScript>
<!--
if (self != top) top.location.href = window.location.href
//-->
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
a,div{
	line-height:20px;
	FONT-FAMILY: "微软雅黑";COLOR:#FFF;FONT-SIZE: 12px;TEXT-DECORATION: none
	}

BODY{FONT-SIZE: 12px; }
BODY{SCROLLBAR-3DLIGHT-COLOR: buttonhighlight;
background-image: url(../../images/login_bg3.png);
  background-repeat: no-repeat;
  background-position: 50% 25%;

}

#logo{
	margin:0 auto;
	position:relative;
	right:333px;
	background-image:url(../../images/logo.png);
	width:200px;
	height:31px;

}
a:hover{
	color: #06F;
	}
	
 #login:hover{
	 background-image:url(../../images/login.gif);
	 
	 }
.wenbenkuang{
	float:left;
	text-indent:10px;;
	width:130px;
	height:23px;
	BORDER-BOTTOM: #999999 1px solid;BORDER-LEFT: #999999 1px solid;COLOR: #333333;FONT-SIZE: 14px;BORDER-TOP: #999999 1px solid;BORDER-RIGHT: #999999 1px solid
	}

#biaodan {
	margin-top:80px;
	float:right;
	background-image: url(../../images/textarea_bg.png);	
	width:250px;
	height:270px;
	
	
}

	
	#biaoti{

		position:relative;
		top:20px;
		float:left;
		margin-left:70px;
	FONT-FAMILY: "微软雅黑";
	color:#FF980D;
	font-weight:bold;
	FONT-SIZE: 18px;
	TEXT-DECORATION: none;
	
	}
	
	
	
	#login{
		float:left;
		margin-left:35px;
		cursor:pointer;
		border:0;
		width:185px;
		height:32px;
		background-image: url(../../images/login_hovered.gif);
	}
	
	.text {
		margin-left:20px;
		float:left;
		width:55px;
		
		}
		.yzm {
			margin-left:10px;
		top:5px;
		float:left;
		
		}
		
		
		.kuang{
			
			position:relative;
			top:0px;
			margin:0 auto;
			width:1000px;
			height:600px;
			}
	

</style>
<SCRIPT language=javascript>
<!--
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
function check()
{
  if(checkspace(document.admininfo.admin.value)) {
	document.admininfo.admin.focus();
    alert("请输入用户名");
	return false;
  }
  if(checkspace(document.admininfo.password.value)) {
	document.admininfo.password.focus();
    alert("密码不能为空");
	return false;
  }
    if(checkspace(document.admininfo.yzm.value)) {
	document.admininfo.yzm.focus();
    alert("验证码不能为空");
	return false;
  }
    if(document.admininfo.yzm.value != document.admininfo.yzm1.value) {
	document.admininfo.yzm.focus();
	document.admininfo.yzm.value = '';
	document.admininfo.yzm1.value = '';
    alert("验证码不同，请重新输入！");
	return false;
  }
	document.admininfo.submit();
  }
//-->
</SCRIPT>
</HEAD>

<%
   if ((String)request.getSession().getAttribute("loginUserId")!=null)
      response.sendRedirect("personMsgDo");
   %>

<BODY align="center" >
		<div id="logo"></div>
        <div class="kuang">
        	
          <div id="biaodan">
                <FORM method=post name="admininfo" action="/Job/views/person/personLoginDo">
     
                     
                            
                                    <div id="biaoti">个人登录</div><br><br><br>
                                    
                                    <div>
                                        <div class="text">用户名</div> 						<div><INPUT class="wenbenkuang" size=14 name="username"></div><br><br>
                                        <div class="text">密 &nbsp;&nbsp;码</div>			<div><INPUT class="wenbenkuang" size=14 type="password" name="userpwd"></div><br><br>
                                        
                                    
                                        <div class="text">验证码</div>						<div><INPUT style="width:80px;" class="wenbenkuang"  maxLength=5 size=8 type="text" name="yzm"> </div>
                                        
                                                                                            <div class="yzm" style="BACKGROUND-COLOR: #ffffff"><FONT color=#ff3333>8856</FONT>
                                        </div><br><br>
                                        <INPUT id="login" onClick="return check();" border=0  type="submit" value="" name="submit"> <br><br>
                                        
                                        
                                        <a  style=" margin-left:30px;margin-right:30px;"href="">忘记密码？</a>
                                        <a href="">免费注册</a>
                                    </div>
                            
                            
                     
                          
                    </FORM>
             </div>
        </div>
   

</BODY>
</HTML>