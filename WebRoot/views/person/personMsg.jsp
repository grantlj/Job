<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.job.person.personMsgBean" %>

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
<link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../css/base.css"/>
<link rel="stylesheet" type="text/css" href="../../css/layout.css"/>
<title>个人消息</title>
<style>
.info {
	width:600px;
	height:400px;
	border:1px solid #006;
}
.tab,.tab ul {
	width:100%;
	height:40px;
	background:#996;
}
.tab li {
	float:left;
	text-align:center;
	color:#FFFFFF;
	background:#006;
	width:25%;
	height:inherit;
	line-height:40px;
	cursor:pointer;
}
.tab li:hover{
	color:#FF3300;
}
.tab li.select {
	background:#FFF;
	color:#006;
}
.tabCon {
	width:100%;
	height:340px;
	padding-top:20px;
	display:none;
	text-indent:2em;
	line-height:30px;
}
.info div.select {
	display:block;
}
</style>
<script type="text/javascript">
	$(document).ready(function(e) {
        $(".tab li").bind("click",function(){
			//alert(this);
			$(".tab li").removeClass("select");
			$(this).addClass("select");
			var index = $(".tab li").index(this);
			dis(index);
			//alert(index);
		});
    });
	function dis(index){
		$(".tabCon").css("display","none");
		$(".tabCon").eq(index).css("display","block");
	}
</script>
</head>

<%
   personMsgBean pmb=(personMsgBean) request.getAttribute("pmb");
   
   int arg1Count,arg2Count,arg3Count;
   arg1Count=pmb.getArg1Count();arg2Count=pmb.getArg2Count();arg3Count=pmb.getArg3Count();
   String[] jMsg=pmb.getjMsg();
   String[] hMsg=pmb.gethMsg();
   String[] oMsg=pmb.getoMsg();

 %>
<body>
<div class="iframepage">
	<div class="info">
    	<div class="tab">
        	<ul>
            	<li class="select">我的全部动态</li>
                <li>我的职位动态</li>
                <li>我的简历动态</li>
                <li>我的其他动态</li>
            </ul>
        </div>
        <div class="tabCon select">
        <ul>
         
          <%
             for (int i=0;i<arg1Count;i++)
               {
          %>
          <li><a href="#"><% out.print("[职位动态]"+jMsg[i]); %></a></li>
          
          <%
               };
            for (int i=0;i<arg2Count;i++)
               {
           %>
           <li><a href="#"><% out.print("[简历动态]"+hMsg[i]); %></a></li>
           
           <%
               };
              
            for (int i=0;i<arg3Count;i++)
              {
           %>
           <li><a href="#"><%out.print("[其他动态]"+oMsg[i]); %></a></li>
           
           <%
              };
            %>
        </ul>
        
        </div>
        
        <div class="tabCon">
        <ul>
          <%
             for (int i=0;i<arg1Count;i++)
               {
          %>
          <li><a href="#"><% out.print(jMsg[i]); %></a></li>
          
          <%
            };
           %>
        
        
        </ul>
        
        </div>
        <div class="tabCon">
          <ul>
          <%
             for (int i=0;i<arg2Count;i++)
               {
          %>
          <li><a href="#"><% out.print(hMsg[i]); %></a></li>
          
          <%
            };
           %>
        
        
        </ul>
        
        </div>
        <div class="tabCon">
          <ul>
          <%
             for (int i=0;i<arg3Count;i++)
               {
          %>
          <li><a href="#"><% out.print(oMsg[i]); %></a></li>
          
          <%
            };
           %>
        
        
        </ul>
        
        </div>
    </div>
</div>
</body>
</html>
