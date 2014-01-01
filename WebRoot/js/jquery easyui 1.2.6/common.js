//弹出对话框 实现模态的方法
function openDialog(id,title) {
	$("#" + id).css('display','block');
	var doc = window.parent;
	var dialog ;
	
	doc.$("#popup_div").html("").removeAttr("style").html($("#" + id).clone().wrap("<span>").parent().html());
	dialog = doc.$("#popup_div");
	//dialog.html($("#" + id).clone().wrap("<span>").parent().html() );
	dialog.window();
	dialog.window('open');
	dialog.closest(".window").find(".panel-title").text(title);
}
//为了是easy ui 的datebox和datetimebox上的英文转换为中文
if ($.fn.calendar){
	$.fn.calendar.defaults.weeks = ['日','一','二','三','四','五','六'];
	$.fn.calendar.defaults.months = ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'];
}
if ($.fn.datebox){
	$.fn.datebox.defaults.currentText = '今天';
	$.fn.datebox.defaults.closeText = '关闭';
	$.fn.datebox.defaults.okText = '确定';
	$.fn.datebox.defaults.missingMessage = '该输入项为必输项';
	$.fn.datebox.defaults.formatter = function(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
	};
	$.fn.datebox.defaults.parser = function(s){
		if (!s) return new Date();
		var ss = s.split('-');
		var y = parseInt(ss[0],10);
		var m = parseInt(ss[1],10);
		var d = parseInt(ss[2],10);
		if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
			return new Date(y,m-1,d);
		} else {
			return new Date();
		}
	};
}
if ($.fn.datetimebox && $.fn.datebox){
	$.extend($.fn.datetimebox.defaults,{
		currentText: $.fn.datebox.defaults.currentText,
		closeText: $.fn.datebox.defaults.closeText,
		okText: $.fn.datebox.defaults.okText,
		missingMessage: $.fn.datebox.defaults.missingMessage
	});
}
//为了是分页控件上的点击"GO"实现 页面跳转方法
  function jumpPage()
      {
	  //设置键盘事件 并将其设置为按下回车
	   var e=$.Event("keydown");
	   e.keyCode=13;
	   $("input.pagination-num:visible").trigger(e);//模拟页码框按下回车
   	  
      }
//设置检查s的字符长度的方法共验证长度时使用，区分字符、汉字(汉字为2位)。
 function len(s) {
	var l = 0;
	var a = s.split("");
	for (var i=0;i<a.length;i++) {
		 if (a[i].charCodeAt(0)<299) {
		  l++;
		 } else {
		  l+=2;
		 }
	}
	return l;
}

//判断一个元素obj是否在数组内。在返回true,不在返回false
Array.prototype.contains = function(obj) {  
    var i = this.length;  
    while (i--) {  
        if (this[i] === obj) {  
            return true;  
        }  
    }  
    return false;  
} 
/*
 * 扩展js数据基本操作，删除指定数组元素
 * @param {Object} val
 * @memberOf {TypeName} 
 * @return {TypeName} 
 */

Array.prototype.remove = function(obj) {
   for(var i =0;i <this.length;i++){  
        var temp = this[i];  
        if(!isNaN(obj)){  
            temp=i;  
        }  
        if(temp == obj){  
            for(var j = i;j <this.length;j++){  
                this[j]=this[j+1];  
            }  
            this.length = this.length-1;  
        }     
    }  
};

//为了实现datagrid做增删查改后刷新表格统一操作
function refresh(tableid,rs){
	var index = parseInt(rs.index);
	//加载datagrid数据
	$("#"+tableid).datagrid("loadData",rs);
	//选中新增行
	$("#"+tableid).datagrid("selectRow",index);
	//设置翻页
	var pp=$("#"+tableid).datagrid("getPager");
	var pagenumber=parseInt(rs.pageNumber);
	pp.pagination({
		pageNumber: pagenumber
	});
	//设置行号
	var rows=rs.rows.length;
	$("div.datagrid-cell-rownumber").each(function(i,n){
		$(this).html((pagenumber-1)*10+i+1);
	});
	//同步显示第几页
	$("#currentPage").text($(".pagination-num").val());
}

 /**
  * 互斥验证
  * 进行实际业务操作之前先验证是否可编辑
  * 先ajax到后台验证是否可编辑，如果可编辑，则执行后续方法，并将该数据加入互斥表中
  * 如果不可编辑，提示相应的信息
  * @param {Object} ywid 业务数据id
  * @param {Object} oper 操作类型, '修改', '删除'....
  * @param {Object} callback 验证通过后执行方法
  */
function isMutex(ywid, oper, callback) {
	$.post("mutexAction!isMutex",
		{
			ywid:ywid,
			operate:oper
		},
		function(data){
			if(data == "" ) {
				callback();
			}else {
				var msg=data.split(':');
				$parent.messager.alert('提示', "数据被锁定："+msg[0]+"正在对编号为'"+ywid+"'的数据进行"+msg[1]+"操作",'info');
			}
		});
}

/**
 * 移除互斥信息
 * 操作完成后执行些方法，可删除互斥信息。如果不删除，将不可再次编辑
 * @param {Object} ywid
 */
function removeMutex(ywid) {
	$.post("mutexAction!removeMutex", { ywid:ywid });
}

$(function(){
	
	//隐藏显示查询条件区域
   	$('#openOrClose').on("click",function(){
   		$('#conditon').toggle(80);
   		setTimeout(domresize,100);//条件隐藏，改变表格高度
   	});	
   	
   		$("textarea[maxlength]").keyup(function(){
		var area=$(this);
		var max=parseInt(area.attr("maxlength"),10); //获取maxlength的值
		if(max>0){
			if(area.val().length>max){ //textarea的文本长度大于maxlength
			area.val(area.val().substr(0,max)); //截断textarea的文本重新赋值
		}
		}
	});
	
	//复制的字符处理问题
	$("textarea[maxlength]").blur(function(){
		var area=$(this);
		var max=parseInt(area.attr("maxlength"),10); //获取maxlength的值
		if(max>0){
			if(area.val().length>max){ //textarea的文本长度大于maxlength
			area.val(area.val().substr(0,max)); //截断textarea的文本重新赋值
		}
		}
	});

//只读
$(".deletable,.Wdate").keyup(function(event){
		var input=$(this);
		if (event.keyCode == 9) {
	        return true;
	    }
	    if (event.keyCode == 46 || event.keyCode == 8) {
			input.val("");
	        return true;
	    } else {
	        event.returnValue = false;
	    }   
	});

    //禁止退格键 作用于IE、Chrome
    //document.onkeydown = banBackSpace;

    //禁止退格键与F5
	if($.browser.msie){
		document.onkeydown = banBackSpace;
	}else {
		document.onkeypress = banBackSpace;
	}
    //道路、路口选择框，可删除事件
    $(".clearable").keydown(function(e){
 		if(e.keyCode == 8 || e.keyCode == 46) {
 			$(this).val("");
 		}
 		return false;
 	});
});
//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外 
function banBackSpace(e){
    var ev = e || window.event;//获取event对象   
	//alert(ev.keyCode)
    //禁止F5刷新页面
    if(ev.keyCode == 116) {
    	ev.keyCode=0;
		ev.returnValue=false;
    	return false;
    }
	
    //Backspace键事件
    var obj = ev.target || ev.srcElement;//获取事件源     
    var t = obj.type || obj.getAttribute('type');//获取事件源类型     
    //获取作为判断条件的事件类型 
    var vReadOnly = obj.readOnly;
    var vDisabled = obj.disabled;
    //处理undefined值情况 
    vReadOnly = (vReadOnly == undefined) ? false : vReadOnly;
    vDisabled = (vDisabled == undefined) ? true : vDisabled;
    //当敲Backspace键时，事件源类型为密码或单行、多行文本的，  
    //并且readOnly属性为true或disabled属性为true的，则退格键失效  
    var flag1 = ev.keyCode == 8 && (t == "password" || t == "text" || t == "textarea") && (vReadOnly == true || vDisabled == true);
    //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效    
    var flag2 = ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea";
    //判断    
    //alert(flag2 || flag1);
    if (flag2 || flag1){ 
    	ev.returnValue=false;
        return false;//这里如果写 return false 无法实现效果
    }
}
