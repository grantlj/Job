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
//用于解决textarea设置maxlength生效问题
$(function(){
	
	//隐藏显示查询条件区域
   	$('#openOrClose').on("click",function(){
   		$('#conditon').toggle(80);
   		setTimeout(domresize,100);//条件隐藏，改变表格高度
   	});	
   	
	//IE也能用textarea
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
});
//克隆方法
function clone(obj){
	var objClone;
	if (obj.constructor == Object){
		objClone = new obj.constructor();
	}else{
		objClone = new obj.constructor(obj.valueOf());
	}
	for(var key in obj){
		if ( objClone[key] != obj[key] ){
			if ( typeof(obj[key]) == 'object' ){
				objClone[key] = clone(obj[key]);
			}else{
				objClone[key] = obj[key];
			}
		}
	}
	objClone.toString = obj.toString;
	objClone.valueOf = obj.valueOf;
	return objClone;
}

//选择所属道路
function chooseRoad(){
  	$('body').append('<div id="choose_div"></div>');
	$('#choose_div').window({
       width:613,
       height:440,
       href:"views/chooseRoad.jsp",
       title:'选择道路',
       onBeforeClose: function(){
			$("#choose_div").parent().remove();
       }
	});	
}
//选择路口
function chooseCross(){
	$('body').append('<div id="choose_div"></div>');
	$('#choose_div').window({
	   width:613,
	   height:415,
	   href:"views/chooseCrossing.jsp",
	   title:'选择路口',
	   onBeforeClose: function(){
			$("#choose_div").parent().remove();
		}
	});	
}
  	
/*
 * 禁止Backspace键/F5默认事件
 * @author pj
 */
//页面加载完成
$(function(){
    //禁止退格键 作用于Firefox、Opera 
    //document.onkeypress = banBackSpace;
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
/*
 * 数字输入控制插件
 * 调用方法：$('#id').coorMask(3,6); //该输入值整数部分最大3位，小数部分最大6位
 * @author pj
 * @param {Object} $
 * @memberOf {TypeName} 
 * @return {TypeName} 
 */
;
(function($){
	$.fn.extend({
		coorMask: function(intpart,fractional) {
			var intpart = parseInt(intpart);
			var fractional = parseInt(fractional);
			return this.each(function() {
				var input = $(this);
				input.keydown(function(e){
					var value = input.val();
					var evs = e || window.event;//获取event对象 
					var kcode = evs.keyCode;
					//数字键
					if(kcode >= 48 && kcode <=57 || kcode >=96 && kcode <= 105) {
						//如果已有三位数字，自动添加小数点
						if((value.length == intpart&& value.indexOf(".") == -1) 
								|| (value == "0" )) {
							if(fractional!=0){//如果没有小数位 ，则不允许输入.
								value +=".";
								input.val(value);
							}
						}
					} else if(kcode == 110 || kcode == 190) {
						//按小数点，如果已存在一个小数点，则不可再输入
						if(value.indexOf(".") >= 0 || value.length == 0 ) {
							return false;
						}
					}else{
						if(kcode!=8&&kcode!=9){
							return false;
						}
					}
				});
				input.blur(function(e){
					var value = input.val();
					if(value.indexOf('.')!=-1){
						if(value[value.length-1]=='.'){
							value=value.substring(0,value.length-1);
							input.val(value);
						}else {
							if( input.val().substring(input.val().indexOf(".")).length > fractional ) {
								var vv = input.val().substring(0,input.val().indexOf(".")+fractional+1);
								input.val(vv);
							}
						}
					}
				});
			})
		}
	});
})(jQuery);
