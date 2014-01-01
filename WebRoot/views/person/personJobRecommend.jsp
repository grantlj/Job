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
#Recommendation {
	width: 760px;
	height:600px;
}
#Recommendation div {
	float:left;
}
.workTitle {
	width: 110px;
	height: 50px;
	border: 1px solid #F00;
}
#centerD {
	width: 760px;
	height: 1000px;
}
</style>
</head>
<body>
<div id="Recommendation">
	<div id="leftD" class="workTitle">
		<a href="personJobRecommend_His.jsp" target="oframe">根据历史申请推荐的职位</a>
	</div>
	<div id="rightD" class="workTitle">
		<a href="personJobRecommend_Sim.jsp" target="oframe">和我相似的人申请的职位</a>
	</div>
	<div id="centerD">
		<iframe src="personJobRecommend_Sim.jsp" name="oframe" id="opinionFrame" frameborder="0" scrolling="no" style="width:100%;height: 100%"></iframe>
	</div>
    <div style="clear:both"></div>
</div>
</body>
</html>
