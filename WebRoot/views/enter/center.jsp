<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; " />
<title>无标题文档</title>
<script type="text/javascript" src="../../js/jquery-1.4.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../css/reset_c.css"/>
<link rel="stylesheet" type="text/css" href="../../css/base_c.css"/>
<link rel="stylesheet" type="text/css" href="../../css/module_c.css"/>
<link rel="stylesheet" type="text/css" href="../../css/layout_c.css"/>
<link rel="stylesheet" type="text/css" href="../../css/center_c.css"/>
</head>

<body>
<!--start			header部分			-->
<div id="header">
	<div id="logo">
    	<a href="index.html" target="_self"><img src="../../images/logo.png" alt="logo" /></a>
    </div>
    <div class="topnav">
    	<a href="../../views/person/center.jsp" target="_blank">个人中心</a>
        <a href="../../views/enter/login.html" target="_blank">企业中心</a>
        <a href="#" target="_blank">管理中心</a>
    </div>
    <div class="topnav topnavRight"><a href="#" target="_blank">网站导航</a></div>
</div>
<!--end			header部分			-->
<div id="nav">
	<div id="nav_container">
    	<div id="nav_home">
        	<img src="../../images/home.png" alt="icon_home" />
        	<a href="../../index.html" target="_self">首页</a>
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

<div id="wrapper">
	<div id="subnav">
    	<span></span>
        <ul>
        	<a href=" password.jsp" target="iframepage"><li><img src="../../images/subnav_icon.png" />密码修改</li></a>
            <a href="sysInfo.jsp" target="iframepage"><li><img src="../../images/subnav_icon.png" />消息查询</li></a>
            <a href="enterData.jsp" target="iframepage"><li><img src="../../images/subnav_icon.png" />企业基础资料</li></a>
            <a href="fabu.html" target="iframepage"><li><img src="../../images/subnav_icon.png" />招聘信息发布</li></a>
            <a href="conpetence.html" target="iframepage"><li><img src="../../images/subnav_icon.png" />人才能力分布表</li></a>
            <a href="	talentSearch.jsp" target="iframepage"><li><img src="../../images/subnav_icon.png" />人才推荐查询</li></a>
            <a href="rencai.jsp" target="iframepage"><li><img src="../../images/subnav_icon.png" />人才查询</li></a>
            <a href="	talentSearch.html" target="iframepage"><li><img src="../../images/subnav_icon.png" />人才登记</li></a>
            <a href="abilityAssess.jsp" target="iframepage"><li><img src="../../images/subnav_icon.png" />人才评价</li></a>
        </ul>
    </div>
    <div id="content">
    	<span>消息查询</span>
    	<iframe name="iframepage" id="Iframe" scrolling="no" frameborder="0"  style="width:100%; height:100%"></iframe>
    </div>
</div>

<!--start			footer部分			-->
<hr style="height:4px; border:none; border-top:#135097 4px solid;" />
<div id="footer">
	<div id="link"></div>
    <div id="copyright"></div>
</div>
<!--end			footer部分			-->


<script type="text/javascript">
	//var ifm = document.getElementById("Iframe").contentDocument.body.scrollHeight;
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
