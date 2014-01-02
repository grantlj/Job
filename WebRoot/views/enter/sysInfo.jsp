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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="../../js/jquery-1.4.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../css/base.css"/>
<link rel="stylesheet" type="text/css" href="../../css/layout.css"/>
<title>消息查询</title>
<style>
.iframepage{
	position:relative;
}
#title li {
	font-size:12px;
	width:90%;
	line-height:30px;
	height:30px;
	float:left;
}
#title input{
	float:left;
	margin-top:8px;
	width:10%;
}
#title ul{
	overflow:hidden;
}
#title li:hover {
	background:#CCC;
	cursor:pointer;
}
#title li span {
	ruby-align:right;
	float:right;
}
#content {
	width:80%;
	background:#FFFFFF;
	min-height:300px;
	position:absolute;
	z-index:1;
	top:50px;
	left:10%;
	border:#000 1px solid;
	display:none;
	overflow:scroll;
}
#con_title{
	height:30px;
	border-bottom:1px solid #ccc;
	line-height:30px;
}
#close {
	cursor:pointer;
}
#article {
	text-indent:2em;
}

#operate input {
	background:#FFFFFF;
	border:#999999 1px solid;
	margin-right:15px;
}

</style>
<script type="text/javascript">
	$(document).ready(function(e) {
        $("#title li").bind("click",function(){
			//alert($("#title li").index(this));
			var index = $("#title li").index(this); // 被点击数据所在的位置,通过ajax请求数据.
			conDisplay();
			titleWrite("标题"+index);
			conWrite("正文"+index);
		});
		$("#close").bind("click",function(){
			conClose();
		});
    });
	function tforward(act){
		alert(act);
		myForm.action.value = act;
		myForm.submit();
	}
	function checkAll(act){
		$("#title input:checkbox").attr("checked",act);
	}
	function submitFun(act){
		alert(act);
		myForm.action.value = act;
		myForm.submit();
	}
	function titleWrite(str){
		$("#con_title span:first").text(str);
	}
	function conWrite(str){
		$("#article").text(str);
	}
	function conDisplay(){
		$("#content").css("display","block");
	}
	function conClose(){
		$("#content").css("display","none");
	}
</script>

<%
		String userName=(String)session.getAttribute("username");
		ReadXML rx=new ReadXML();
		String path1 = getServletContext().getRealPath("/WEB-INF/classes/enter.xml");
		Document doc=rx.getDocument(path1);
		List list = doc.selectNodes("//username" );
	    
 %>
</head>

<body>
<div class="iframepage">
	<form name="sysInfo" action="views/enter/sysInfo" method="post">
        <div id="title" style="overflow:hidden;">
            <ul>
           
                <%	
                	Iterator iter=list.iterator();
                	while(iter.hasNext()){
                	Element e=(Element)iter.next();
					if(userName.equals(e.getText())){
						Element parent=e.getParent();
						List eList =parent.elements("msg");
						Iterator ite=eList.iterator();
						while(ite.hasNext()){
                			Element e1=(Element)ite.next();
                			out.print(" <input type=\"checkbox\" name=\"til\"/><li>"+e1.element("title").getText()+
                			"<span>"+e1.element("time").getText()+"</span></li>");
                			}
                			}
                			}
                 %>
            </ul>
            <div id="operate">
            	<input type="button" class="w70 h24"  value="全选" onclick="checkAll(true)" />
                <input type="button" class="w70 h24"  value="取消全选" onclick="checkAll(false)" />
                <input type="button" class="w70 h24" name="delete" value="删除" onclick="submitFun('del.jsp');" />
                <input type="button" class="w70 h24" name="read" value="标记为已读" onclick="submitFun('read.jsp');" />
            	<input type="button" class="w70 h24"  value="上一页" onclick="tforward('pre.jsp')" />
                <input type="button" class="w70 h24"  value="下一页" onclick="tforward('next.jsp')" />
                <input type="number" class="w70 h24" name="page" value=1 />
                <input type="button" class="w70 h24"  value="跳转" onclick="" />
            </div>
        </div>
    </form>
    <div id="content">
    	<div id="con_title">
        	<span class="l f12">&nbsp;这里是标题</span>
            <span id="close" class="r f12">[关闭]&nbsp;</span>
        </div>
        <div id="article" class="f12">
        </div>
    </div>
</div>
</body>
</html>
