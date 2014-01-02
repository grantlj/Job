<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" src="../../js/jquery-1.4.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../css/reset_c.css"/>
<link rel="stylesheet" type="text/css" href="../../css/base_c.css"/>
<link rel="stylesheet" type="text/css" href="../../css/module_c.css"/>
<link rel="stylesheet" type="text/css" href="../../css/layout_c.css"/>
<link rel="stylesheet" type="text/css" href="../../css/center_c.css"/>
<title>个人中心</title>
</head>

<body>
<!--start			header部分			-->
<div id="header">
	<div id="logo">
    	<img src="../../images/logo.png" alt="logo" />
    </div>
    <div class="topnav">
    	<a href="../../views/person/center.jsp" target="_blank">个人中心</a>
        <a href="#" target="_blank">企业中心</a>
        <a href="#" target="_blank">管理中心</a>
    </div>
    <div class="topnav topnavRight"><a href="#" target="_blank">网站导航</a></div>
    
</div>
<!--end			header部分			-->
<div id="nav">
	<div id="nav_container">
    	<div id="nav_home">
        	<img src="../../images/home.png" alt="icon_home" />
        	<a href="#" target="_self">首页</a>
        </div>
        <div id="nav_menu">
        	<ul>
            	<li class="nav_menu"><a href="#">找工作</a></li>
                <li class="nav_menu"><a href="#">找人才</a></li>
            	<li class="nav_menu"><a href="#">软件园地</a></li>
                <li class="nav_menu"><a href="#">自主学习</a></li>
                <li class="nav_menu"><a href="#">在线评测</a></li>
                <li class="nav_menu"><a href="#">法律法规</a></li>
                <li class="nav_menu"><a href="#">帮助中心</a></li>
            </ul>
        </div>
    </div>
</div>
   <img src="../../images/subnav_icon.png" />
   
<div id="wrapper">
	<div id="subnav">
    	<span></span>
          <ul id="tt">  
			 <a href="personMsgDo" target="iframepage"><li><img src="../../images/subnav_icon.png" />个人消息</li>
						    	
			 <a href="personCreditDo" target="iframepage"><li>  <img src="../../images/subnav_icon.png" />个人能力信用查询</li>
		     <a href="personCertDo" target="iframepage"><li>  <img src="../../images/subnav_icon.png" />获得证书</li>
			  <a href="../search.html" target="_blank"><li>  <img src="../../images/subnav_icon.png" />工作查询</li>
			 <a href="personJobRecommendDo" target="iframepage"><li>  <img src="../../images/subnav_icon.png" />工作推荐查询</li>	
						 
			 <a href="personBasicInfoDo" target="iframepage"> <li>  <img src="../../images/subnav_icon.png" />个人基础资料</li>
		      <a href="personHistoryDo" target="iframepage"> <li>  <img src="../../images/subnav_icon.png" />个人简历维护</li>
			  <a href="personExpDo" target="iframepage"><li>  <img src="../../images/subnav_icon.png" />项目经验</li>
						      
			   <a href="personChangePwdDo" target="iframepage"> <li>  <img src="../../images/subnav_icon.png" />修改密码</li> 			        
						</ul>  
    </div>
    <div id="content">
    	<iframe name="iframepage" id="Iframe" scrolling="no" frameborder="0"  style="width:100%; height:100%" src="personMsgDo"></iframe>
    </div>
</div>

<!--start			footer部分			-->
<div id="footer">
	<div id="link"></div>
    <div id="copyright"></div>
</div>
<!--end			footer部分			-->


<script type="text/javascript">

	$("#Iframe").bind("load",function(event){
				$("#Iframe").height(150);
				var ifm= document.getElementById("Iframe"); 
				var subWeb = document.frames ? document.frames["Iframe"].document : ifm.contentDocument; 
				var nk = subWeb.body.scrollHeight+100;
				//ifm.height = subWeb.body.scrollHeight;
				//alert(subWeb.body.scrollHeight);
				$("#Iframe").height(nk);
	});
	$("#subnav li").bind("click",function(event){
		$("#subnav li").attr("class","");
		$(this).attr("class","select");
	});
</script>
</body>
</html>
