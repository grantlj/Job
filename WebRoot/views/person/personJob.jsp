﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../css/base.css"/>
<link rel="stylesheet" type="text/css" href="../../css/module.css"/>
<link rel="stylesheet" type="text/css" href="../../css/layout.css"/>
<link rel="stylesheet" type="text/css" href="../../css/search.css"/>
<script>
$(document).ready(function(){
    var searchMore = 0;
    $(".searchForm .slideUp").live('click','a',function() {
        if (searchMore == 0){
            $(this).text('收起').toggleClass('down');
            searchMore++;
        }else {
            $(this).text('更多搜索条件').toggleClass('down');
            searchMore--;
        }
        $("#moreoption").slideToggle('400');
    });
    $(".searchForm .keyword").live('click','.keyword-tab', function(event) {
        $(this).addClass('current');
        event.preventDefault();
    });
});

</script>
<script type="text/javascript">

function submitfrom() {
    var keyword = $("#KeyWord_kw2").val();
    if (keyword.length < 2) {
    }
    if (keyword === "请输入关键词,例如:JAVA,销售代表,行政助理等" || keyword === "请输入公司名称或关键词,例如:联想,华为等" || keyword === "请输入职位名称或关键词,例如:会计经理,开发工程师等") {
        $("#KeyWord_kw2").val("");
    }
    var city = $("#JobLocation").val();
    if (city === "选择城市" || city === "") {
        alert("请选择城市！");
        return false;
    }
    return true;
}
function formReset() {
    document.getElementById("myFrom").reset();
}
</script>
</head>

<body>


<div id="wrapper">
    <div id="search-box">
        <div class="Search-boxtop"></div>
        <div class="search">
            <div class="funSearch">
                <div class="searchForm">
                    <form id="myFrom" action="#" method="get" name="frmSearch">
                        <div class="industry">
                            <span>职位类别</span>
                            <input id="buttonSelJobType" type="button" title="选择职位" value="选择职位" name="buttonSelJobType"/>
                        </div>
                        <div class="job">
                            <span>行业类别</span>
                            <input id="buttonSelIndustry" type="button" title="选择行业" value="选择行业" name="buttonSelIndustry">
                        </div>
                        <div class="time">
                            <span>发布时间</span>
                            <select id="Release-time">
                                <option value="">所有时间</option>
                                <option value="1">今天</option>
                                <option value="3">最近三天</option>
                                <option value="7">最近一周</option>
                                <option value="30">最近一个月</option>
                            </select>
                        </div>
                        <div class="keyword">
                            <span class="keyword-tab">
                                <a class="current" href="#">全文</a>
                                <a href="#">公司名</a>
                                <a href="#">职位名</a>
                            </span>
                            <!--span class="ui-helper-hidden-accessible" role="status" aria-live="polite"></span-->
                            <input id="KeyWord_kw2" class="ui-autocomplete-input" type="text" autocomplete="off" value="请输入关键词,例如:JAVA,销售代表,行政助理等" iskeyword="1" ktype="0" submitform="1" xhrstyle="k" sjmodule="AutoComplete" maxlength="100" name="KeyWord">
                        </div>
                        <div class="city2">
                            <span>工作地点</span>
                            <!--span class="ui-helper-hidden-accessible" role="status" aria-live="polite"></span-->
                            <input id="JobLocation" class="ui-autocomplete-input" type="text" autocomplete="off" value="选择城市" name="JobLocation" title="北京">
                            <input id="buttonSelCity" class="search-citybtn" type="button" name="buttonSelCity">
                        </div>
                        <div class="hot-keyword">
                            <em>热门关键字：</em>
                            <a href="#')">java</a>|
                            <a href="#')">.net</a>|
                            <a href="#')">PHP</a>|
                            <a href="#')">Android</a>|
                            <a href="#')">财务</a>|
                            <a href="#')">测试</a>|
                            <a href="#')">销售</a>|
                            <a href="#')">翻译</a>|
                            <a href="#')">广告</a>|
                            <a href="#')">客服</a>|
                            <a href="#')">人力资源</a>|
                            <a href="#')">设计</a>
                        </div>
                        <div id="moreoption" style="display: none;">
                            <div class="workingtime">
                                <span>工作经验</span>
                                <input id="buttonSelWorkingTime" type="button" title="不限" value="不限" name="buttonSelWorkingTime">
                            </div>
                            <div class="degree">
                                <span>学历要求</span>
                                <input id="buttonSelDegree" type="button" title="不限" value="不限" name="buttonSelDegree">
                            </div>
                            <div class="Salary-range">
                                <span>月薪范围</span>
                                <select name="SchSalaryFromAdv">
                                    <option value="0">0</option>
                                    <option value="1000">1000</option>
                                    <option value="1500">1500</option>
                                    <option value="2000">2000</option>
                                    <option value="3000">3000</option>
                                    <option value="4000">4000</option>
                                    <option value="5000">5000</option>
                                    <option value="6000">6000</option>
                                    <option value="8000">8000</option>
                                    <option value="10000">10000</option>
                                    <option value="15000">15000</option>
                                    <option value="20000">20000</option>
                                    <option value="30000">30000</option>
                                    <option value="50000">50000</option>
                                </select>
                                 到 
                                <select name="SchSalaryToAdv">
                                    <option value="">－不限－</option>
                                    <option value="1000">1000</option>
                                    <option value="1500">1500</option>
                                    <option value="2000">2000</option>
                                    <option value="3000">3000</option>
                                    <option value="4000">4000</option>
                                    <option value="5000">5000</option>
                                    <option value="6000">6000</option>
                                    <option value="8000">8000</option>
                                    <option value="10000">10000</option>
                                    <option value="15000">15000</option>
                                    <option value="20000">20000</option>
                                    <option value="30000">30000</option>
                                    <option value="50000">50000</option>
                                </select>
                                (人民币)
                            </div>
                            <div class="comptype">
                                <span>公司性质</span>
                                <input id="buttonSelComptype" type="button" title="不限" value="不限" name="buttonSelComptype">
                            </div>
                            <div class="compsize">
                                <span>公司规模</span>
                                <input id="buttonSelCompsize" type="button" title="不限" value="不限" name="buttonSelCompsize">
                            </div>
                            <div class="job-category">
                                <span>职位类型</span>
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
                        </div>
                        <div class="returnback">
                            <a id="reset" href="javascript:void(0)" onclick="formReset()">重置</a>
                        </div>
                        <div class="slideUp">
                            <a class='down' href="javascript:void(0)">更多搜索条件</a>
                            <!--a class='up' href="javascript:void(0)">收起</a-->
                        </div>
                        <div class="searchbtn">
                            <button class="doesSearch" onclick="return submitfrom();" type="submit"> </button>
                            <a href="#">地图搜索></a>
                        </div>
                        <dl class="clearFix"> </dl>
                    </form>
                </div>
            </div>
        </div>
        <div class="Search-boxbottom"></div>
    </div>
</div>


<!--start           footer部分            -->
<div id="footer">
    <div id="link"></div>
    <div id="copyright"></div>
</div>
<!--end         footer部分            -->
</body>
</html>
