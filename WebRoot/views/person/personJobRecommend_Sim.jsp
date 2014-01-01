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
div {
	float: left;
}
#applyTitle {
	width: 95%;
	height: 50px;
	line-height: 50px;
	background-color: gray;
}
#apply1 {
	width: 450px;
	float: left;
}
#apply2 {
	float: right;
}
#selectOp {
	width: 126px;
}
.headApply {
	width: 95%;
	height: 50px;
	background-color: blue;
	line-height: 50px;
}
.headApply button {
	background:url(../../images/person/button.jpg) no-repeat;
	width: 102px;
	height: 26px;
}
.headRight {
	float: right;
}
.bodyApply {
	width: 100%;
	font-size:12px;
}
.jianli {
	width: 480px;
}
.bodyApply .hideDiv {

}
.bodyApply .hideDiv button {
	background:url(../../images/person/apply.jpg) no-repeat;
	width: 100px;
	height: 24px;
}
</style>
</head>
<body>
<div id="applyTitle">
	<div id="apply1">
		<table>
			<tr>
				<td>
				和我的简历
				</td>
				<td>
				<form id="electOp">
					<select name="applySelect">
					<option value="#">车工/焊工/</option>
					<option value="#">土木工程/</option>
					<option value="#" selected="selected">软件/互联网开发/</option>
					<option value="#">后期制作/</option>
					</select>
				</form>
				</td>
				<td>
				相似的人申请了
				</td>
			</tr>
		</table>
	</div>
	<div id="apply2"><a href="#">留下对职位推荐的意见或建议</a></div>
</div>
<div class="headApply">
	<div class="headLeft">
	<table>
		<form>
			<tr>
				<td>
					<input type="checkbox" name="allSelect" value="allS" /> 全选
				</td>
				<td>
					<button type="button" value=""></button>
				</td>
			</tr>
		</form>
	</table>
	</div>
	<div class="headRight">
		<table>
			<form>
				<tr>
					<td>
						工作地点
					</td>
					<td>
						<select name="applySelect">
						<option value="#">重庆</option>
						<option value="#">北京</option>
						<option value="#" selected="selected">西安</option>
						<option value="#">上海</option>
						</select>
					</td>
				</tr>
			</form>
		</table>
	</div>
</div>
<div class="bodyApply">
	<table class="body1">
		<tr>
			<td rowspan="4"><input type="checkbox" name="workSelect" value="workS"/></td>
			<td rowspan="4"><img src="../../images/person/per.jpg"></td>
			<td style="font-size: 15px;font-weight:bolder;" class="jianli">项目高级经理</td>
			<td><div style="float: right;">2013-12-27</div></td>
		</tr>
		<tr>
			<td class="jianli"><a href="#">重庆重邮信科通信技术有限公司</a></td>
			<td rowspan="3">
				<div class="hideDiv">
					<button type="button" value=""></button>
					<br/>
					<a href="#">相似职位</a>
					<a href="#">收藏职位</a>
				</div>
			</td>
		</tr>
		<tr>
			<td class="jianli">地点：重庆 公司性质：股份制 规模:1000-9999 人 经验：1-3 年 学历：本科</td>
		</tr>
		<tr>
			<td class="jianli">
				岗位职责： 岗位要求 1、2、通信、电子相关专业本科以上学历 3、1 年以上通信项目管理经验 4、具有国家重大项目申报、管理经验的优先
			</td>
		</tr>
	</table>
	<hr/>
	<table class="body2">
		<tr>
			<td rowspan="4"><input type="checkbox" name="workSelect" value="workS"/></td>
			<td rowspan="4"><img src="../../images/person/per.jpg"></td>
			<td style="font-size: 15px;font-weight:bolder;" class="jianli">项目高级经理</td>
			<td><div style="float: right;">2013-12-27</div></td>
		</tr>
		<tr>
			<td class="jianli"><a href="#">重庆重邮信科通信技术有限公司</a></td>
			<td rowspan="3">
				<div class="hideDiv">
					<button type="button" value=""></button>
					<br/>
					<a href="#">相似职位</a>
					<a href="#">收藏职位</a>
				</div>
			</td>
		</tr>
		<tr>
			<td class="jianli">地点：重庆 公司性质：股份制 规模:1000-9999 人 经验：1-3 年 学历：本科</td>
		</tr>
		<tr>
			<td class="jianli">
				岗位职责： 岗位要求 1、2、通信、电子相关专业本科以上学历 3、1 年以上通信项目管理经验 4、具有国家重大项目申报、管理经验的优先
			</td>
		</tr>
	</table>
	<hr/>
	<table class="body3">
		<tr>
			<td rowspan="4"><input type="checkbox" name="workSelect" value="workS"/></td>
			<td rowspan="4"><img src="../../images/person/per.jpg"></td>
			<td style="font-size: 15px;font-weight:bolder;" class="jianli">项目高级经理</td>
			<td><div style="float: right;">2013-12-27</div></td>
		</tr>
		<tr>
			<td class="jianli"><a href="#">重庆重邮信科通信技术有限公司</a></td>
			<td rowspan="3">
				<div class="hideDiv">
					<button type="button" value=""></button>
					<br/>
					<a href="#">相似职位</a>
					<a href="#">收藏职位</a>
				</div>
			</td>
		</tr>
		<tr>
			<td class="jianli">地点：重庆 公司性质：股份制 规模:1000-9999 人 经验：1-3 年 学历：本科</td>
		</tr>
		<tr>
			<td class="jianli">
				岗位职责： 岗位要求 1、2、通信、电子相关专业本科以上学历 3、1 年以上通信项目管理经验 4、具有国家重大项目申报、管理经验的优先
			</td>
		</tr>
	</table>
	<hr/>
	<table class="body4">
		<tr>
			<td rowspan="4"><input type="checkbox" name="workSelect" value="workS"/></td>
			<td rowspan="4"><img src="../../images/person/per.jpg"></td>
			<td style="font-size: 15px;font-weight:bolder;" class="jianli">项目高级经理</td>
			<td><div style="float: right;">2013-12-27</div></td>
		</tr>
		<tr>
			<td class="jianli"><a href="#">重庆重邮信科通信技术有限公司</a></td>
			<td rowspan="3">
				<div class="hideDiv">
					<button type="button" value=""></button>
					<br/>
					<a href="#">相似职位</a>
					<a href="#">收藏职位</a>
				</div>
			</td>
		</tr>
		<tr>
			<td class="jianli">地点：重庆 公司性质：股份制 规模:1000-9999 人 经验：1-3 年 学历：本科</td>
		</tr>
		<tr>
			<td class="jianli">
				岗位职责： 岗位要求 1、2、通信、电子相关专业本科以上学历 3、1 年以上通信项目管理经验 4、具有国家重大项目申报、管理经验的优先
			</td>
		</tr>
	</table>
	<hr/>
	<table class="body5">
		<tr>
			<td rowspan="4"><input type="checkbox" name="workSelect" value="workS"/></td>
			<td rowspan="4"><img src="../../images/person/per.jpg"></td>
			<td style="font-size: 15px;font-weight:bolder;" class="jianli">项目高级经理</td>
			<td><div style="float: right;">2013-12-27</div></td>
		</tr>
		<tr>
			<td class="jianli"><a href="#">重庆重邮信科通信技术有限公司</a></td>
			<td rowspan="3">
				<div class="hideDiv">
					<button type="button" value=""></button>
					<br/>
					<a href="#">相似职位</a>
					<a href="#">收藏职位</a>
				</div>
			</td>
		</tr>
		<tr>
			<td class="jianli">地点：重庆 公司性质：股份制 规模:1000-9999 人 经验：1-3 年 学历：本科</td>
		</tr>
		<tr>
			<td class="jianli">
				岗位职责： 岗位要求 1、2、通信、电子相关专业本科以上学历 3、1 年以上通信项目管理经验 4、具有国家重大项目申报、管理经验的优先
			</td>
		</tr>
	</table>
	<hr/>			
</div>
</body>
</html>
