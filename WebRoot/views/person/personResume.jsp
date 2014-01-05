<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.job.person.personResumeBean" %>
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
<title>修改简历</title>
<link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../../css/base.css"/>
<link rel="stylesheet" type="text/css" href="../../css/layout.css"/>
<script type="text/javascript" src="../../js/jquery-1.4.4.min.js"></script>
<style type="text/css">
.iframepage h1,.iframepage h2{
	font-weight:bold;
	height:30px;
	line-height:30px;
}
.salary select {
	margin-left:60px;
}
.type select {
        margin-left:60px;
}
.record ul,.skill_title ul,.experience ul {
	margin-left:60px;
	overflow:hidden;
}
.record ul li,.skill_title ul li,.experience_work_sel ul li{
	float:left;
	width:137px;
	height:30px;
	line-height:30px;
}
.record ul li input,.skill_title ul li input,.experience_work_sel ul li input {
	margin-right:5px;
}
.skill_title {
	padding-left:60px;
}
.experience_work_con li {
	overflow:hidden;
	margin:10px 0;
}
.experience_work_con input,.experience_work_con span{
	display:block;
	float:left;
	height:20px;
	line-height:20px;
	width:100px;
	margin-left:10px;
}
.experience_work_con span{
	width:104px;
}

.submit input {
	background:#FFFFFF;
	border:#999999 1px solid;
	margin-right:15px;
	width:70px;
	height:24px;
	position:relative;
	left:475px;
}
</style>


</head>

<%
    	personResumeBean prb=(personResumeBean) request.getAttribute("prb");
    	String type,abilityClass,creditClass,salaryClass,
        eduClass,worktimeClass,projClass,generalSkill,
        artSkill,progSkill_fore,progSkill_back,dbSkill,
        mgrSkill;
        
        type=prb.getType();abilityClass=prb.getAbilityClass();creditClass=prb.getCreditClass();
        salaryClass=prb.getSalaryClass();eduClass=prb.getEduClass();worktimeClass=prb.getWorktimeClass();
        projClass=prb.getProjClass();generalSkill=prb.getGeneralSkill();artSkill=prb.getArtSkill();
        progSkill_fore=prb.getProgSkill_fore();progSkill_back=prb.getProgSkill_back();dbSkill=prb.getDbSkill();
        mgrSkill=prb.getMgrSkill();
        
        int p;
        String tmpstr;
%>


<body>
<div class="iframepage">
<form action="personResumeRefreshDo" method="post">
    <div class="salary">
    	<h1>薪资要求</h1>
    	<select name="salary">
            <option value="1"   <% if (salaryClass.equals("1")) out.print("selected");%> >0-2000</option>
            <option value="2"   <% if (salaryClass.equals("2")) out.print("selected");%> >2000-3000</option>
            <option value="3"   <% if (salaryClass.equals("3")) out.print("selected");%> >3000-4000</option>
            <option value="4"   <% if (salaryClass.equals("4")) out.print("selected");%> >4000-6000</option>
            <option value="5"   <% if (salaryClass.equals("5")) out.print("selected");%> >6000以上</option>
        </select>
    </div>
    
    <div class="type">
        <h1>求职类型</h1>
        <select name="type">
            <option value="1" <% if (type.equals("1")) out.print("selected"); %> >咨询顾问</option>
            <option value="2" <% if (type.equals("2")) out.print("selected"); %> >UI工程师</option>
            <option value="3" <% if (type.equals("3")) out.print("selected"); %> >架构师</option>
            <option value="4" <% if (type.equals("4")) out.print("selected"); %> >研发工程师</option>
            <option value="5" <% if (type.equals("5")) out.print("selected"); %> >实施工程师</option>
            <option value="6" <% if (type.equals("6")) out.print("selected"); %> >测试</option> 
            <option value="7" <% if (type.equals("7")) out.print("selected"); %> >技术支持</option>
        </select>
    </div>

    <hr style="height:4px; border:none; border-top:#135097 4px solid;" />
    <div class="record">
    	<h1>学历</h1>
        <ul>
            <li><input type="radio" name="record" value="1" <% if (eduClass.equals("1")) out.print("checked"); %> />中专</li>
            <li><input type="radio" name="record" value="2" <% if (eduClass.equals("2")) out.print("checked"); %> />大专</li>
            <li><input type="radio" name="record" value="3" <% if (eduClass.equals("3")) out.print("checked"); %> />本科</li>
            <li><input type="radio" name="record" value="4" <% if (eduClass.equals("4")) out.print("checked"); %> />研究生</li>
            <li><input type="radio" name="record" value="5" <% if (eduClass.equals("5")) out.print("checked"); %> />博士及以上</li>
        </ul>
    </div>
    <hr style="height:4px; border:none; border-top:#135097 4px solid;" />
    <div class="skill">
    	<h1>技能掌握</h1>
        <div class="skill_title">
        	<h2>通用技能</h2>
            <div class="skill_select">
                <ul>
                    
                    <% tmpstr=generalSkill;
                       p=tmpstr.length()-1; %>
                   
                    <li><input type="checkbox" name="common" value="1" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />MS Word</li>
                    <li><input type="checkbox" name="common" value="2" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />MS Excel</li>
                    <li><input type="checkbox" name="common" value="3" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />MS Powerpoint</li>
                    <li><input type="checkbox" name="common" value="4" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />MS Visio</li>
                    <li><input type="checkbox" name="common" value="5" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />Wps</li>
                </ul>
            </div>
        </div>
        <div class="skill_title">
        	<h2>美工技术</h2>
            <div class="skill_select">
                <ul>
                
                  <% tmpstr=artSkill;
                       p=tmpstr.length()-1; %>
                       
                    <li><input type="checkbox" name="art" value="1" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />Photoshop</li>
                    <li><input type="checkbox" name="art" value="2" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />Allustrutor</li>
                    <li><input type="checkbox" name="art" value="3" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />CorelDRAW</li>
                    <li><input type="checkbox" name="art" value="4" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />Draw</li>
                </ul>
            </div>
        </div>
        <div class="skill_title">
        	<h2>编程技能</h2>
            <div class="skill_select">
                <div class="skill_title">
                    <h2>前端</h2>
                    <div class="skill_select">
                        <ul>
                             <% tmpstr=progSkill_fore;
                       p=tmpstr.length()-1; %>
                            
                            <li><input type="checkbox" name="Reception" value="1" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />Asp/.net</li>
                            <li><input type="checkbox" name="Reception" value="2" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />Html</li>
                            <li><input type="checkbox" name="Reception" value="3" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />Javascript</li>
                            <li><input type="checkbox" name="Reception" value="4" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />Html5</li>
                        </ul>
                    </div>
                </div>
                <div class="skill_title">
                <h2>后台</h2>
                    <div class="skill_select">
                        <ul>
                             <% tmpstr=progSkill_back;
                       p=tmpstr.length()-1; %>
                            
                            
                            <li><input type="checkbox" name="Background" value="1" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />Java</li>
                            <li><input type="checkbox" name="Background" value="2" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />C++</li>
                            <li><input type="checkbox" name="Background" value="3" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />C#</li>
                            <li><input type="checkbox" name="Background" value="4" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />ADO.net</li>
                            <li><input type="checkbox" name="Background" value="5" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />Basic</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="skill_title">
        	<h2>数据库</h2>
            <div class="skill_select">
            	<ul>
            	
            	   <% tmpstr=dbSkill;
                       p=tmpstr.length()-1; %>
                       
                       
                	<li><input type="checkbox" name="database" value="1" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />Access</li>
                    <li><input type="checkbox" name="database" value="2" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %>/>SQL sever</li>
                    <li><input type="checkbox" name="database" value="3" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %>/>Oracle</li>
                    <li><input type="checkbox" name="database" value="4" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %>/>DB2</li>
                </ul>
            </div>
        </div>
        <div class="skill_title">
        	<h2>项目管理</h2>
            <div class="skill_select">
                <ul>
                
                    <% tmpstr=mgrSkill;
                       p=tmpstr.length()-1; %>
                       
                    <li><input type="checkbox" name="project" value="1" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %> />MS Project</li>
                    <li><input type="checkbox" name="project" value="2" <% if (tmpstr.charAt(p)=='1') out.print("checked"); p--; %>  />MS Sharepoint</li>
                </ul>
            </div>
        </div>
    </div>
    <hr style="height:4px; border:none; border-top:#135097 4px solid;" />
   

 <div class="experience">
    	<div class="experience_work">
        	<h2>工作经验</h2>
                 <select name="work_years"> 
                    <option value="1" <% if (worktimeClass.equals("1")) out.print("selected"); %> >小于3年</option>
                    <option value="2" <% if (worktimeClass.equals("2")) out.print("selected"); %> >3~5年</option>
                    <option value="3" <% if (worktimeClass.equals("3")) out.print("selected"); %> >5年以上</option>
                 </select>
           
        </div>

        <hr style="height:4px; border:none; border-top:#135097 4px solid;" />

        <div class="experience_work">
        	<h2>项目经验</h2>
                 <select name="proj_count">
                     <option value="1" <% if (projClass.equals("1")) out.print("selected"); %> >小于3个</option>
                     <option value="2" <% if (projClass.equals("2")) out.print("selected"); %> >3~5个</option>
                     <option value="3" <% if (projClass.equals("3")) out.print("selected"); %> >5个以上</option>
                 </select>
           
        </div>
    
</div>

    <hr style="height:4px; border:none; border-top:#135097 4px solid;" />
    <div class="submit">
    	<input type="submit" value="提交" /><input type="button" value="撤销修改" />
    </div>
</form>
</div>


</body>
</html>
