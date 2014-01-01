
if ($.fn.pagination){
	$.fn.pagination.defaults.beforePageText="第 <span id='currentPage'>1</span> 页  转到",
	$.fn.pagination.defaults.afterPageText = "页&nbsp; <a style='border:0;text-decoration:none; font-size:15px;font-weight:bold;color:#8DB2E3' href='javascript:void(0);' onclick='jumpPage()'>GO</a>&nbsp; 共 {pages} 页";
	$.fn.pagination.defaults.displayMsg ="当前{from}-{to} 条  共{total}条记录";
}
if ($.fn.datagrid){
	$.fn.datagrid.defaults.loadMsg = '正在加载...';
}
//扩展      为datagrid加上up"↑"和down"↓"事件。新增人：汪小银；新增时间：2013-10-21
$.extend($.fn.datagrid.methods, {
	keyCtr : function(jq) {
		return jq.each(function() {
			var grid = $(this);
			grid.datagrid('getPanel').panel('panel').attr('tabindex', 1).bind('keydown', function(e) {
				switch (e.keyCode) {
					case 38 : // up
						var selected = grid.datagrid('getSelected');
						if (selected) {
							var index = grid.datagrid('getRowIndex', selected);
							grid.datagrid('selectRow', index - 1);
						} else {
							var rows = grid.datagrid('getRows');
							grid.datagrid('selectRow', rows.length - 1);
						}
						break;
					case 40 : // down
						var selected = grid.datagrid('getSelected');
						if (selected) {
							var index = grid.datagrid('getRowIndex', selected);
							grid.datagrid('selectRow', index + 1);
						} else {
							grid.datagrid('selectRow', 0);
						}
						break;
					case 36://home
						$("a[icon=pagination-first]").click();
						break;
					case 35://end
						$("a[icon=pagination-last]").click();
						break;
					case 33://pageup
						$("a[icon=pagination-prev]").click();
						break;
					case 34://pagedown
						$("a[icon=pagination-next]").click();
						break;
				}
			});
		});
	}
});

if ($.fn.treegrid && $.fn.datagrid){
	$.fn.treegrid.defaults.loadMsg = $.fn.datagrid.defaults.loadMsg;
}
if ($.messager){
	$.messager.defaults.ok = '确定';
	$.messager.defaults.cancel = '取消';
}
//扩展easyui 的表单验证
$.extend($.fn.validatebox.defaults.rules, {
    CHS: {
        validator: function (value, param) {
            return /^[\u0391-\uFFE5]+$/.test(value);
        },
        message: '请输入汉字'
    },
    ZIP: {
        validator: function (value, param) {
            return /^[1-9]\d{5}$/.test(value);
        },
        message: '邮政编码不存在'
    },
    QQ: {
        validator: function (value, param) {
            return /^[1-9]\d{4,10}$/.test(value);
        },
        message: 'QQ号码不正确'
    },
    mobile: {
        validator: function (value, param) {
            return /(^1[3|4|5|8]\d{9}$)|(^0\d{2}-\d{8}$)|(^0\d{3}-\d{7}$)|(^0\d{10}$)|(^\d{7}$)|(^\d{8}$)/.test(value);
        },
        message: '输入错误！格式支持(手机号、区号加直拨号、直拨号)'
    },
    loginName: {
        validator: function (value, param) {
            return /^[\u0391-\uFFE5\w]+$/.test(value);
        },
        message: '登录名称只允许汉字、英文字母、数字及下划线。'
    },
    safepass: {
        validator: function (value, param) {
            return safePassword(value);
        },
        message: '密码由字母和数字组成，至少6位'
    },
    equalTo: {
        validator: function (value, param) {
            return value == $(param[0]).val();
        },
        message: '两次输入的字符不一至'
    },
    number: {
        validator: function (value, param) {
            return /^\d+$/.test(value);
        },
        message: '请输入数字'
    },
    idcard: {
        validator: function (value, param) {
            return idCard(value);
        },
        message:'请输入正确的身份证号码'
    },
    length:{
		validator:function(value,param){
		var Len=len($.trim(value));
		return Len>=param[0]&&Len<=param[1];
		},
		message:"请输入长度范围为{0}和{1}之间的值."
	},
	customvalid:{//自定义验证方法,value 表示需要验证的值，regrule表示传入的正则表达式
		validator:function(value,regrule){
		var cust=$.trim(value);
		return eval(regrule+".test(cust)");
		},
		message:"数据项输入不合法！"
	},
	address: {
        validator: function (value, param) {
            return /^[a-zA-Z0-9\u4E00-\u9FA5\,\.\，\。\-\#\;\、\；\: ]{0,100}$/.test(value);
        },
        message: "请输入正确地址(符号仅支持逗号、句号、分号、冒号和#)！"
    },
    text: {
        validator: function (value, param) {
            return /^[a-zA-Z0-9\u4E00-\u9FA5\s\,\.\，\。\-\#\;\、\；\!\！\?\？\_\——\“\”\‘\’\'\"\(\)\:\ ]{0,1000}$/.test(value);
        },
        message: "只能输入中英文、数字、基本标点符号！"
    },
    lng_regex: {//经度验证
        validator: function (value, param) {
    		if(value>=0&&value<=180){
    			return true;
    		}else{
    			return false;
    		}
        },
        message: "只能输入0到180范围数字!"
    },
    lat_regex: {//维度验证
        validator: function (value, param) {
           if(value>=0&&value<=90){
    			return true;
    		}else{
    			return false;
    		}
        },
        message: "只能输入0到90范围数字!"
    },
    roadlen_regex: {//道路长度
        validator: function (value, param) {
            if(value>=0&&value<100000){
    			return true;
    		}else{
    			return false;
    		}
        },
        message: "只能输入0-99999.999范围数字!"
    },
    roadwid_regex: {//道路宽度验证
        validator: function (value, param) {
            if(value>=0&&value<1000){
    			return true;
    		}else{
    			return false;
    		}
        },
        message: "只能输入0-999.99范围数字!"
    },
    roadlane_regex: {//车道数验证
        validator: function (value, param) {
           if(value>=0&&value<100){
    			return true;
    		}else{
    			return false;
    		}
        },
        message: "只能输入0-99整数!"
    },
	repeat:{validator:function(value,param){
		var data={};
		data[param[1]]=$.trim(value);
		var _368=$.ajax({url:param[0],dataType:"text",data:data,async:false,cache:false,type:"post"}).responseText;
		return _368=="no";
		},message:"该值已存在."},
	min_max:{
		validator:function(value,param){
		return value>=param[0]&&value<=param[1]
		},
		message:""
	}
});

/* 密码由字母和数字组成，至少6位 */
var safePassword = function (value) {
    return !(/^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/.test(value));
}

var idCard = function (value) {
    if (value.length == 18 && 18 != value.length) return false;
    var number = value.toLowerCase();
    var d, sum = 0, v = '10x98765432', w = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2], a = '11,12,13,14,15,21,22,23,31,32,33,34,35,36,37,41,42,43,44,45,46,50,51,52,53,54,61,62,63,64,65,71,81,82,91';
    var re = number.match(/^(\d{2})\d{4}(((\d{2})(\d{2})(\d{2})(\d{3}))|((\d{4})(\d{2})(\d{2})(\d{3}[x\d])))$/);
    if (re == null || a.indexOf(re[1]) < 0) return false;
    if (re[2].length == 9) {
        number = number.substr(0, 6) + '19' + number.substr(6);
        d = ['19' + re[4], re[5], re[6]].join('-');
    } else d = [re[9], re[10], re[11]].join('-');
    if (!isDateTime.call(d, 'yyyy-MM-dd')) return false;
    for (var i = 0; i < 17; i++) sum += number.charAt(i) * w[i];
    return (re[2].length == 9 || number.charAt(17) == v.charAt(sum % 11));
}

var isDateTime = function (format, reObj) {
    format = format || 'yyyy-MM-dd';
    var input = this, o = {}, d = new Date();
    var f1 = format.split(/[^a-z]+/gi), f2 = input.split(/\D+/g), f3 = format.split(/[a-z]+/gi), f4 = input.split(/\d+/g);
    var len = f1.length, len1 = f3.length;
    if (len != f2.length || len1 != f4.length) return false;
    for (var i = 0; i < len1; i++) if (f3[i] != f4[i]) return false;
    for (var i = 0; i < len; i++) o[f1[i]] = f2[i];
    o.yyyy = s(o.yyyy, o.yy, d.getFullYear(), 9999, 4);
    o.MM = s(o.MM, o.M, d.getMonth() + 1, 12);
    o.dd = s(o.dd, o.d, d.getDate(), 31);
    o.hh = s(o.hh, o.h, d.getHours(), 24);
    o.mm = s(o.mm, o.m, d.getMinutes());
    o.ss = s(o.ss, o.s, d.getSeconds());
    o.ms = s(o.ms, o.ms, d.getMilliseconds(), 999, 3);
    if (o.yyyy + o.MM + o.dd + o.hh + o.mm + o.ss + o.ms < 0) return false;
    if (o.yyyy < 100) o.yyyy += (o.yyyy > 30 ? 1900 : 2000);
    d = new Date(o.yyyy, o.MM - 1, o.dd, o.hh, o.mm, o.ss, o.ms);
    var reVal = d.getFullYear() == o.yyyy && d.getMonth() + 1 == o.MM && d.getDate() == o.dd && d.getHours() == o.hh && d.getMinutes() == o.mm && d.getSeconds() == o.ss && d.getMilliseconds() == o.ms;
    return reVal && reObj ? d : reVal;
    function s(s1, s2, s3, s4, s5) {
        s4 = s4 || 60, s5 = s5 || 2;
        var reVal = s3;
        if (s1 != undefined && s1 != '' || !isNaN(s1)) reVal = s1 * 1;
        if (s2 != undefined && s2 != '' && !isNaN(s2)) reVal = s2 * 1;
        return (reVal == s1 && s1.length != s5 || reVal > s4) ? -10000 : reVal;
    }
};
if ($.fn.validatebox){
	$.fn.validatebox.defaults.missingMessage = '该输入项为必输项';
	$.fn.validatebox.defaults.rules.email.message = '请输入有效的电子邮件地址';
	$.fn.validatebox.defaults.rules.url.message = '请输入有效的URL地址';
	$.fn.validatebox.defaults.rules.lengt.message = '输入内容长度必须介于{0}和{1}之间';
	$.fn.validatebox.defaults.rules.remote.message = '请修正该字段';
}
if ($.fn.numberbox){
	$.fn.numberbox.defaults.missingMessage = '该输入项为必输项';
}
if ($.fn.combobox){
	$.fn.combobox.defaults.missingMessage = '该输入项为必输项';
}
if ($.fn.combotree){
	$.fn.combotree.defaults.missingMessage = '该输入项为必输项';
}
if ($.fn.combogrid){
	$.fn.combogrid.defaults.missingMessage = '该输入项为必输项';
}
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
//为window设置默认属性方便在页面中统一使用 修改时间：2013-10-29 修改人：汪小银
if($.fn.window){
	$.fn.window.defaults.resizable=false;
	$.fn.window.defaults.collapsible=false;
	$.fn.window.defaults.minimizable=false;
	$.fn.window.defaults.maximizable=false;
	$.fn.window.defaults.shadow=false;
	$.fn.window.defaults.modal=true;
	$.fn.window.defaults.loadingMessage = '正在加载...';
}

if($.fn.dialog){
	$.fn.dialog.defaults.resizable=false;
	$.fn.dialog.defaults.collapsible=false;
	$.fn.dialog.defaults.minimizable=false;
	$.fn.dialog.defaults.maximizable=false;
	$.fn.dialog.defaults.shadow=false;
	$.fn.dialog.defaults.modal=true;
	$.fn.dialog.defaults.loadingMessage = '正在加载...';
}
//扩展了form清除方法,exceptid是传入的不需要清除的id
$.extend($.fn.form.methods,{
	clearExcept:function(jq,exceptid){
			$("input,select,textarea",jq).each(function(i,n){
				if(($(n).attr("id")!="undefied"&&$(n).attr("id")!=exceptid)||$(n).attr("id")=="undefied"){
					var t=this.type,tag=this.tagName.toLowerCase();
					if(t=="text"||t=="hidden"||t=="password"||tag=="textarea"){
					this.value="";
					}else{
					if(t=="file"){
					var _1e=$(this);
					_1e.after(_1e.clone().val(""));
					_1e.remove();
					}else{
					if(t=="checkbox"||t=="radio"){
					this.checked=false;
					}else{
					if(tag=="select"){
					this.selectedIndex=-1;
					}
					}
					}
					}
				}
				});
				if($.fn.combo){
				$(".combo-f",jq).combo("clear");
				}
				if($.fn.combobox){
				$(".combobox-f",jq).combobox("clear");
				}
				if($.fn.combotree){
				$(".combotree-f",jq).combotree("clear");
				}
				if($.fn.combogrid){
				$(".combogrid-f",jq).combogrid("clear");
				}
		}
})
//combobox扩展默认选中下表为index的元素
$.extend($.fn.combobox.methods, {
    selectedIndex: function (jq, index) {
        if (!index)
            index = 0;
        var data = $(jq).combobox('options').data;
        var vf = $(jq).combobox('options').valueField;
        $(jq).combobox('setValue', eval('data[index].' + vf));
    }
});
