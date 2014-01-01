 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.job.person.personBasicInfoBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%
   personBasicInfoBean pbib=(personBasicInfoBean) request.getAttribute("pbib");
   String name,sex,
          birth_year,birth_mon,
          career_year,
          marriage,
          country,
          lisenceType,lisenceId,
          abroad,political,
          city_org,city_now,
          address,post,
          phone_work,phone_home,phone_mobi,
          email,
          page2;
          
        name=pbib.getName();
	    sex=pbib.getSex();
	    birth_year=pbib.getBirth_year();
	    birth_mon=pbib.getBirth_mon();
	    career_year=pbib.getCareer_year();
	    marriage=pbib.getMarriage();
	    country=pbib.getCountry();
	    lisenceType=pbib.getLisenceType();
	    lisenceId=pbib.getLisenceId();
	    abroad=pbib.getAbroad();
	    political=pbib.getPolitical();
	    city_org=pbib.getCity_org();
	    city_now=pbib.getCity_now();
	    address=pbib.getAddress();
	    post=pbib.getPost();
	    phone_work=pbib.getPhone_work();
	    phone_home=pbib.getPhone_home();
	    phone_mobi=pbib.getPhone_mobi();
	    email=pbib.getEmail();
	    page2=pbib.getPage();
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人基础资料</title>
<style>
#content{
	width:770px;
	font-size:15px
}
.sd{
	width:20%;
}
.ss{
	width:80%;
}
.ff div {
	float:left;
	
}

</style>
<script>
   function changeContact()
   {
     var i=document.getElementById("contact_selection").selectedIndex; 
     var type=document.getElementById("contact_selection").options[i].value; 
     if (type=="telephone")
     {
       document.getElementById("contact_number").setAttribute("value", <%=phone_mobi%>);
     }
     
     if (type=="home")
     {
      document.getElementById("contact_number").setAttribute("value", <%=phone_home%>);
     }
     
     if (type=="workspace")
     {
         document.getElementById("contact_number").setAttribute("value", <%=phone_work%>);
     }
   }
</script>
</head>


<body>
<h1 align="center">个人基础资料</h1>
<form name="frm" action="#" method="post">
    <div id="content">
    
    	<div class="ff">
        	<div class="sd">
        	<span style="color:#F00">*</span>
            <span>姓名：</span>
            </div>
            <div class="ss"><input type="text" name="realname" value=<%=name%> /></div>
        </div>
    	<div class="ff">
        	<div class="sd">
        	<span style="color:#F00">*</span>
            <span>性别：</span>
            </div>
            <input type="radio" name="gender" value="male" <% if (sex.equals("1")) out.print("checked");%>/>男
            <input type="radio" name="gender" value="female" <% if (sex.equals("2")) out.print("checked");%>/>女
        </div>
    	<div class="ff">
        	<div class="sd">
        	<span style="color:#F00">*</span>
            <span>出生日期：</span>
            </div>
            <input type="text" name="year" style="width:56px;" value=<%=birth_year%> />年
            <input type="text" name="month" style="width:56px;" value=<%=birth_mon%> />月
        </div>
        <div class="ff">
        	<div class="sd">
        	<span style="color:#F00">*</span>
            <span>参加工作年份：</span>
            </div>
            <input type="text" value=<%=career_year%> />
        </div>
        <div class="ff">
        	<div class="sd">
        	<span style="color:#F00">*</span>
            <span>婚姻状况：</span>
            </div>
            <input type="radio" name="marriage" value="singleton" <% if (marriage.equals("1")) out.print("checked");%> />未婚
            <input type="radio" name="marriage" value="married"   <% if (marriage.equals("2")) out.print("checked");%> />已婚
            <input type="radio" name="marriage" value="divorced"  <% if (marriage.equals("3")) out.print("checked");%> />离异
            <input type="radio" name="marriage" value="secret"    <% if (marriage.equals("4")) out.print("checked");%> />保密
        </div>
        <div class="ff">
        	<div class="sd">
            <span style="color:#F00">*</span>
            <span>国家或地区：</span>
            </div>
            <input type="text" value=<%=country%> />
        </div>
        <div class="ff">
        	<div class="sd">
        	<span style="color:#F00">*</span>
            <span>证件类型：</span>
            </div>
            <select name="idType">
            	<option value="1" <% if (lisenceType.equals("1")) out.print("selected=idCard"); %> >身份证</option>
            	<option value="2" <% if (lisenceType.equals("2")) out.print("selected=passport"); %> >护照</option>
            	<option value="3" <% if (lisenceType.equals("3")) out.print("selected=certificateOfOfficers"); %> >军官证</option>
            	<option value="4" <% if (lisenceType.equals("4")) out.print("selected=hkIdCard"); %> >香港身份证</option>
            	<option value="5" <% if (lisenceType.equals("5")) out.print("selected=macauIdCard"); %> >澳门身份证</option>
            	<option value="6" <% if (lisenceType.equals("6")) out.print("selected=hkAndMacauPass"); %> >港澳通行证</option>
            	<option value="7" <% if (lisenceType.equals("7")) out.print("selected=taiwanPass"); %> >台胞证</option>
            	<option value="8" <% if (lisenceType.equals("8")) out.print("selected=others"); %>  >其他</option>
            </select>
            <span style="color:#F00">*</span>
            <span>证件号码：</span>
            <input type="text" name="idNumber" value=<%=lisenceId%> />
        </div>
    	<div class="ff">
        	<div class="sd">
        	<span style="color:#F00">&nbsp;</span>
            <span>海外经历：</span>
            </div>
            <input type="radio" name="overseaExp" value="yes" <% if (abroad.equals("1")) out.print("checked");%> />有
            <input type="radio" name="overseaExp" value="no" <% if (abroad.equals("2")) out.print("checked");%> />无
        </div>
    	<div class="ff">
        	<div class="sd">
        	<span style="color:#F00">&nbsp;</span>
            <span>政治面貌：</span>
            </div>
            <input type="radio" name="politicsStatus" value="1" <% if (political.equals("1")) out.print("checked");%>/>中共党员(含预备党员)
            <input type="radio" name="politicsStatus" value="2" <% if (political.equals("2")) out.print("checked");%>/>团员
            <input type="radio" name="politicsStatus" value="3" <% if (political.equals("3")) out.print("checked");%>/>群众
            <input type="radio" name="politicsStatus" value="4" <% if (political.equals("4")) out.print("chekced");%>/>民主党派
            <input type="radio" name="politicsStatus" value="5" <% if (political.equals("5")) out.print("checked");%>/>无党派人士
            <input type="radio" name="politicsStatus" value="6" <% if (political.equals("6")) out.print("checked");%>/>无可奉告
        </div>
    	<div class="ff">
        	<div class="sd">
        	<span style="color:#F00">*</span>
            <span>户口所在地：</span>
            </div>
            <input type="text" value=<%=city_org%> />
        </div>
    	<div class="ff">
        	<div class="sd">
        	<span style="color:#F00">*</span>
            <span>现居住城市：</span>
            </div>
            <input type="text" value=<%=city_now%> />
        </div>
        <div class="ff">
        	<div class="sd">
        	<span style="color:#F00">&nbsp;</span>
            <span>通信地址：</span>
            </div>
            <input type="text" name="address" value=<%=address%> />
            </div>
        <div class="ff">
        	<div class="sd">
        	<span style="color:#F00">*</span>
            <span>邮政编码：</span>
            </div>
            <input type="text" name="postnumber" value=<%=post%> />
        </div>
        <div class="ff">
        	<div class="sd">
        	<span style="color:#F00">*</span>
            <span>首选联系方式：</span>
            </div>
        	<select id="contact_selection" onChange="changeContact()">
            	<option value="telephone" seletected>移动电话</option>
            	<option value="home">家用电话</option>
            	<option value="workspace">工作电话</option>
            </select>
            <input type="text" id="contact_number" value=<%=phone_mobi%> />
            <a href="#">添加其他联系方式</a>(最多三项)
        </div>
        <div class="ff">
        	<div class="sd">
        	<span style="color:#F00">*</span>
            <span>电子邮箱：</span>
            </div>
            <input type="text" name="email" value=<%=email%> />
        </div>
        <div class="ff">
        	<div class="sd">
        	<span style="color:#F00">&nbsp;</span>
            <span>个人主页/博客：</span>
            </div>
            <input type="text" name="blog" value=<%=page2%> />
        </div>
        
    	<div class="ff">
        	<div class="sd">&nbsp;
            </div>
        <a href="personMsg.jsp">返回个人中心</a>
        </div>
    </div>
    </form>
</body>

</html>
