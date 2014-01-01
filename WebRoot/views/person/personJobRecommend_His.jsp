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
<title>无标题文档</title>
<script type="text/javascript">
</script>
<style type="text/css">
#opinionTitle {
	width: 95%;
	height: 50px;
	line-height: 50px;
	background-color: gray;
}
#opinion1 {
	width: 450px;
	float: left;
}
#opinion2 {
	float: left;
}
</style>
</head>
<body>
<div id="opinionTitle">
	<div id="opinion1">根据您的申请申请历史，向您推荐以下职位。</div>
	<div id="opinion2"><a href="#">留下对职位推荐的意见或建议</a></div>
	<div>
		<img src="../../images/person/11.jpg" width="770px" height="273px"/>
	</div>
</div>
</body>
</html>
