 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.job.person.personCertBean" %>
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

<style>

p,span,li,a{
	font-family:微软雅黑;
	font-size:12px;
	}
.form_text_div{
		font-family:微软雅黑;
	font-size:12px;
	width:100px;
	float:left;
	}
.form span{
	width:440px;
	}
.content{
	margin:0 auto;
	width:500px;
	}
.title{
	border-bottom:#135097 solid 2px;
	width:1-00px;
	height:30px;
	}
.title p{
	font-size:16px;
	font-weight:bold;
	}
.list{
	border:solid 1px;
	height:300px;
	width:500px;
	}
.list_title{
	background-image:url(../../images/title_bar_bg.png);
	line-height:30px;
	width:500px;
	height:27px;
}
.list_title p{
	width:130px;
	margin:0 auto;	
	}


.form{}

.form_submit_butont{
	line-height:25px;
	position:relative;
	left:333px;
	float:left;
	width:150px;
	
	}

.ins_text_area{
	width:300px;
	height:150px;
	
	}
.ins{

	width:500px;
	height:150px;}

</style>


<script language=javascript>
<!--
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
function check()
{
  if(checkspace(document.certi_form.instruction.value)) {
	document.certi_form.instruction.focus();
    alert("请输入说明");
	return false;
  }
 
	document.certi_form.submit();
  }
</script>


</head>

<%
    /**
     personCertBean pcb=(personCertBean)request.getAttribute("pcb");
     int argCount=pcb.getArgCount();
     String[] certName=pcb.getCertName();
     String[] certTime=pcb.getCertTime();
     String[] certExpl=pcb.getCertExpl();
     for (int i=0;i<argCount;i++)
       {
        out.println(certName[i]+"     "+certTime[i]+"     "+certExpl[i]);
        out.println("<br>");
       }
    */
%>

<body>

    <div class="content">
        <div class="title"><p>证书</p></div>
        <p>你可以在这里填写获得的各种证书，要修改或删除某证书，按“编辑”或“删除”</p>
        
        <div class="list">
            <div class="list_title"><p>证书名称</p></div>
            <div></div>
        </div>
        
        <br>
        
        <p>新增证书(*为必须填写)</p><br>
        <div class="form">
        <form name="certi_form" action="">
       <div class="form_text_div">证书选择 </div><select name="name"><option>全国计算机软件技术测评</option></select><br><br>
        <div class="form_text_div">获得时间</div> <select name="year"><option>2013</option></select>年
        				<select name="month"><option>2</option></select>月
                        <br><br>
        <div class="form_text_div">说明</div><input type="textara" name="instruction"  class="ins_text_area">
        
        <br><br>
        
        
        <div>
            <div class="form_submit_butont">
            <input type="submit" name="" onClick="return check();" value="保存并新增证书" />
            </div>
            
            <div class="form_submit_butont" style="width:100px;">
            <input type="submit" name="" onClick="return check();" value="保存" />
            </div>
            
            <div class="form_submit_butont"><a href="">返回<a></div>
            
         </div>
        </form>
        
        
        <br><br><br>
     
        </div>
        <div class="ins">
        	<p>证书说明撰写技巧</p>
                <ul>
                  <li>列举证书发行的机构，取得证书所用的学时，成绩及相关设计作品</li>
                  <li>列举获得该证书时相关实践经验，心得</li>
                  </ul>
        
        </div>
    </div>

</body>
</html>
