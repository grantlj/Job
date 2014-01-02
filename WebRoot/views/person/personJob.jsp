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
<title>工作查询</title>
<script type="text/javascript" src="../../js/jquery-1.4.4.min.js"></script>

<style type="text/css">
a {
    text-decoration:none;
}

table tr td{
    padding:2px 5px;
}
#search_work .left,#searchWorkResult .left{
    text-align:left;
    padding-right:20px;
    background-color:#EEE;
}
#search_work .right,#searchWorkResult .right{
    text-align:right;
    background-color:#999;
}
#search_work div,#searchWorkResult div{
    float:left;
    text-align:center;padding-top:20px;
    margin:0 auto;
}
#search_work,#searchWorkResult {
    width:700px;
    margin:0 auto;
}

#search_work .searchWorkShow,.searchWorkHide {
    width: 100%;
}
.searchWorkHide {
    display: none;
    margin:0;
    padding:0;
    width:700px;
    height:auto;
}
#search_work .doesSearch {
    background:url(../../images/person/personJobSearch.gif) -2px -2px no-repeat;
    width:52px;
    height:25px;
}
#searchWFoot .slideUp a{
background:url(../images/sligup.png) left center no-repeat;
padding:6px 0 5px 22px;
line-height:20px;
}
#searchWFoot .slideUp a .down{
background:url(../images/sligdown.png) left center no-repeat;
}
#searchWFoot .slideUp{
margin-top:15px;
height:36px;
}
</style>
<script>
$(document).ready(function(){
    var searchNum = 0;
    $(".searchWFoot .slideUp").live('click','a',function() {
        if (searchNum == 0){
            $(this).text("收起").toggleClass('down');
            searchNum++;
        }else {
            $(this).text('更多').toggleClass('down');
            searchNum--;
        }
        $(".searchWorkHide").slideToggle('400');
    });
});
</script>
</head>
<body>
<div id="search_work">
    <div class="searchWorkShow">
    	<table>
        	<tr>
            	<td class="right">职位类别：</td>
                <td class="left">
                	<select>
                    	<option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                    </select>
                </td>
                <td class="right">行业类别：</td>
                <td class="left">
                	<select>
                    	<option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                    </select>
                </td>
                <td class="right">发布时间：</td>
                <td class="left">
                    <select>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                    </select>
                </td>
            </tr>
            <tr>
            	<td class="right">关键字：</td>
                <td class="left" colspan="3">
                	<input type="text" class="workKeyword" size="40px"/>
                </td>
                <td class="right">工作地点：</td>
                <td class="left">
                	<select>
                    	<option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                    </select>
                </td>
            </tr>
        </table>    
    </div>
    <div class="searchWorkHide">    
        <table>
            <tr>
                <td class="right">工作经验：</td>
                <td class="left">
                    <select>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                    </select>
                </td>
                <td class="right">学历要求：</td>
                <td class="left">
                    <select>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                    </select>
                </td>
                <td class="right">月薪范围：</td>
                <td class="left">>=<input type="text" class="money" size="6px"/>元</td>
            </tr>
            <tr>
                <td class="right">公司性质：</td>
                <td class="left">
                    <select>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                    </select>
                </td>
                <td class="right">公司规模：</td>
                <td class="left">
                    <select>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                        <option>java程序员</option>
                    </select>
                </td>
                <td class="right" colspan="2">
                <div class="job-category">
                    <label class="category">
                    <input type="checkbox" checked="" value="2" name="EmplType">
                     全职
                    </label>
                    <label class="category">
                    <input type="checkbox" checked="" value="1" name="EmplType">
                    兼职
                    </label>
                    <label class="category">
                    <input type="checkbox" checked="" value="4" name="EmplType">
                    实习
                    </label>
                    </div>
                </td>            
            </tr>
        </table>
    </div>
    <div style="width: 90%"><hr/></div>
    <div class="searchWFoot">
        <div class="slideUp">
            <a class='down' href="javascript:void(0)">更多</a>
            <!--a class='up' href="javascript:void(0)">收起</a-->
        </div>
        <div style="width:280px"></div>
        <div>    
            <button class="doesSearch" type="submit"> </button>
            <a href="#">地图搜索></a>
        </div>
    </div>
</div>
<div id="searchWorkResult">     
    <div style="width: 100%;text-align: center;background-color:#999"><h3>查询结果</h3></div> 
    <!--以下这个div为查询结果，由jsp标签循环生成-->
    <div class="result" style="width: 100%">
        <table>
             <tr>
                <td class="right">职位类别：</td>
                <td class="left">测试测试</td>
                <td class="right">行业类别：</td>
                <td class="left">测试测试</td>
                <td class="right">发布时间：</td>
                <td class="left">测试测试</td>
            </tr>
            <tr>
                <td class="right">工作经验：</td>
                <td class="left">测试测试</td>
                <td class="right">学历要求：</td>
                <td class="left">测试测试</td>
                <td class="right">工作地点：</td>
                <td class="left">测试测试</td>
            </tr>
            <tr>
                <td class="right">公司性质：</td>
                <td class="left">测试测试</td>
                <td class="right">公司规模：</td>
                <td class="left">测试测试</td>
                <td class="right">职位类型：</td>
                <td class="left">测试测试</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
