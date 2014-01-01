
window.onload = function() {
    $('#loading-mask').fadeOut();
    
    //系统加载左边功能树
	$('#nav').tree( {
		checkbox : false,
		url : 'findAppfunc.action?username=admin&appid=app_001386300236033',
		animate : true,
		lines : true,
		onClick : function(node) {
			//判断该节点是否有子节点  如果有则不能加到tab上
			var hasChild = $(this).tree('isLeaf', node.target);
			if (hasChild) {
				var subtitle = node.text, //菜单名称
					url = node.attributes.url.toString(), //url
					icon = "", //图标
					menuid = node.id;//菜单ID
				addTab(subtitle, url, icon, menuid);
			}
		}
	});
}
var onlyOpenTitle="";//不允许关闭的标签的标题
var onlyOpenTitle1="";//不允许关闭的标签的标题
var lastTabs = new Array(); 

$(function() {
	//document.execCommand("BackgroundImageCache", false, true);
    tabClose();
    tabCloseEven();
	//用列表显示tabpanel上的所有tab 方法@author wxy
	listClick();
	
	//在tabpanel上添加选中tab面板触发事件 @author wxy
	$('#tabs').tabs({
        onSelect: function (subtitle) {
          //获取tab的title
		   // var subtitle = $(this).children(".tabs-closable").text();
			$('#nav span.nav').each(function(i,n) {
				//var menuName=$(this).text();//ie下加trim方法报错
				//获取每个菜单的名字
				var menuName=$.trim($(this).text());
				if (menuName==subtitle)
				{
					//移除所有菜单上的所有class
					$('.navlist li div').removeClass("selected");
					var panels = $('#nav').accordion('panels');
					//找到该子菜单所在的panel
					var title=$(n).closest('.accordion-body').siblings('.accordion-header').text();
					$.each(panels,function(i,n) {
						//如果找到此panel　则展开
						if (title==n.panel('options').title)
						{
							$('#nav').accordion('select', title);
							return;
						}
					});
					//并且将该菜单节点的父节点展开
					if( $(n).closest('li').parent().css('display')=='none')
					{
					$(n).closest('li').parent().slideDown();
					}
					//并对该节点加选中样式
					$(n).closest("div").addClass("selected");
					return;
				}
												});

											},
			onAdd:function(){
			//判断添加后 是否超出限制范围 如果显示了滚动条 则保证“首頁”在最前面
				if (isScroll())
				{
				excute();
				}	
			},
			onClose:function(title){
				  var tabs=$("#tabs").tabs("tabs");
				  var flag=0;//用來判斷是否還有隱藏的tab
				  $.each(tabs,function(i,n)
				   {
				  
				   var subtitle=n.panel('options').title;
				   //判断其中哪些tab是隐藏，哪些tab是显示的
					if( $('#tabs').tabs("getTab",subtitle).panel('options').tab.is(":hidden"))
					{
						flag=1;
					$('#tabs').tabs("getTab",subtitle).panel('options').tab.show();	
					if (isScroll())
					{
					excute();
					}
					return false;
					}
					
				   });
				  //如果沒有隱藏的tab
				//  if(flag==0)
				//	  {
					  if(!isShowRight())
						  {
						  	var header1 = $("#tabs").children("div.tabs-header");
		 					$(".tabs-scroller-right-itp", header1).remove();
						  }
					 // }
				  // $('#tabs').tabs("select",onlyOpenTitle);
			}
									
    });
    
})

//添加tab方法  @author wxy
function addTab(subtitle,url,icon,menuid) {
	//判断该tab是否存在 如果不存在则直接添加
    if (!$('#tabs').tabs('exists',subtitle)) {
        $('#tabs').tabs('add', {
			title:subtitle,
			content:createFrame(url,menuid),
			closable:true,
			icon:icon
        });
    } 
	//如果存在
	else {
		//判断是否隐藏 如果隐藏则显示show 并将该tab选中
        if ($('#tabs').tabs("getTab",subtitle).panel('options').tab.is(":hidden"))
        {     
            ($('#tabs').tabs("getTab",subtitle).panel('options').tab).show();

        }
        $('#tabs').tabs('select',subtitle);
        //判断添加后 是否超出限制范围 如果显示了滚动条 则保证“首頁”在最前面
        if (isScroll())
        {
		excute();
        }	
		$('#mm-tabupdate').click();
        
    }
		
    tabClose();
}

//绑定tab列表显示点击事件  @author wxy
function listClick()
{
 $('#list').menu( {
		onClick: function (item) {
		closeOrSelectTab(item.id);
				}
				});
		
}


//点击tab列表的选项 执行的方法  @author wxy
function closeOrSelectTab(tab) {
    var tabs=$('#tabs').tabs('tabs');
    var allTabtitle = [];
    $.each(tabs,function(i,n) {
        allTabtitle.push($(n).panel('options').title);
    })
    //选中的全部关闭
    if (tab=="closeall") {
        $.each(allTabtitle,function(i,n) {
            if (i!=0&&i!=1) {
                $("#tabs").tabs("close",n);
            }
        });
    }
    else
    {
        //判断我要点击的tab是否在tabpanel上隐藏
        if (	$("#tabs").tabs("getTab",tab).panel('options').tab.is(":hidden"))
        {
            //如果隐藏就显示
            ($("#tabs").tabs("getTab",tab).panel('options').tab).show();
            $("#tabs").tabs("select",tab);
				
        }
        else
        {
            //如果不是隐藏的则直接选中
            $("#tabs").tabs("select",tab);
        }
		//判断添加后 是否超出限制范围 如果显示了滚动条 则保证“欢迎使用”在最前面
			if (isScroll())
			{
			excute();
			}	

    }

}

function createFrame(url,menuid)
{
    var s = '<iframe name="'+menuid+'" id="'+menuid+'"  scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
    return s;
}
 
function tabClose()
{
    /*双击关闭TAB选项卡*/
    $(".tabs-inner").dblclick(function() {
        var subtitle = $(this).children(".tabs-closable").text();
        $('#tabs').tabs('close',subtitle);
    })
    /*为选项卡绑定右键*/
    $(".tabs-inner").bind('contextmenu',function(e) {
        $('#mm').menu('show', {
		left: e.pageX,
		top: e.pageY
        });

        var subtitle =$(this).children(".tabs-closable").text();

        $('#mm').data("currtab",subtitle);
        $('#tabs').tabs('select',subtitle);
        return false;
    });
}


//绑定右键菜单事件
function tabCloseEven() {

    $('#mm').menu( {
onClick: function (item) {
            closeTab(item.id);
        }
    });

    return false;
}

function closeTab(action)
{
    var alltabs = $('#tabs').tabs('tabs');
    var currentTab =$('#tabs').tabs('getSelected');
    var allTabtitle = [];
    $.each(alltabs,function(i,n) {
        allTabtitle.push($(n).panel('options').title);
    })


switch (action) {
case "refresh":
    var iframe = $(currentTab.panel('options').content);
    var src = iframe.attr('src');
    $('#tabs').tabs('update', {
	tab: currentTab,
	options: {
content:            createFrame(src)
        }
    })
    break;

case "close":
        var currtab_title = currentTab.panel('options').title;
		if(currtab_title!=onlyOpenTitle&& n != onlyOpenTitle1)
		{
        $('#tabs').tabs('close', currtab_title);
		}
		else
		{
		$.messager.alert('提示','该页面不能关闭！');
		}
        break;
    case "closeall":
        $.each(allTabtitle, function (i, n) {
              if (n != onlyOpenTitle&& n != onlyOpenTitle1) {
                $('#tabs').tabs('close', n);
            }
        });
        break;
    case "closeother":
        var currtab_title = currentTab.panel('options').title;
        $.each(allTabtitle, function (i, n) {
            if (n != currtab_title && n != onlyOpenTitle&& n != onlyOpenTitle1&&!$('#tabs').tabs("getTab",n).panel('options').tab.is(":hidden"))
            {
                $('#tabs').tabs('close', n);
            }
        });
        break;
    case "closeright":
        var tabIndex = $('#tabs').tabs('getTabIndex', currentTab);

        if (tabIndex == alltabs.length - 1) {
            return false;
        }
        $.each(allTabtitle, function (i, n) {
            if (i > tabIndex) {
                   if (n != onlyOpenTitle&&n != onlyOpenTitle1&&!$('#tabs').tabs("getTab",n).panel('options').tab.is(":hidden")) {
                    $('#tabs').tabs('close', n);
                }
            }
        });

        break;
    case "closeleft":
        var tabIndex = $('#tabs').tabs('getTabIndex', currentTab);
        if (tabIndex == 1) {
            return false;
        }
        $.each(allTabtitle, function (i, n) {
            if (i < tabIndex) {
                if (n != onlyOpenTitle&&n != onlyOpenTitle1&&!$('#tabs').tabs("getTab",n).panel('options').tab.is(":hidden")) {
                    $('#tabs').tabs('close', n);
                }
            }
        });

        break;
    case "exit":
        $('#closeMenu').menu('hide');
        break;
    }
}


//弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
function msgShow(title, msgString, msgType) {
    $.messager.alert(title, msgString, msgType);
}
	//获得滚轮的宽度 @author wxy
	function getMaxScrollWidth(jq) {
        var header = $(jq).children("div.tabs-header");
        var tabsWidth = 0;
        $("ul.tabs li", header).each(function() {
            tabsWidth += $(this).outerWidth(true);
        });
        var wrapWidth = header.children("div.tabs-wrap").width();
        var padding = parseInt(header.find("ul.tabs").css("padding-left"));
        return tabsWidth - wrapWidth + padding;
    };
    
	//判断是否超出限制范围(將顯示的ｔａｂ的寬度與實際面板的寬度做比較)author wxy
	function isScroll()
	{
		var opts = $("#tabs").tabs("options");
        var header = $("#tabs").children("div.tabs-header");
        var tool = header.children("div.tabs-tool");
        var height = ($.boxModel == true ? (header.outerHeight() - (tool.outerHeight() - tool
                .height()))
                : header.outerHeight());
        if (opts.plain) {
            height -= 2;
        }
        tool.height(height);
        var fullWidth = 0;
		//遍历tab面板上所有的li 如果该tab不是被隐藏 则将其宽度相加 得到所有在tab面板上的宽度和
        $("ul.tabs li", header).each(function(i,n) {
		if(!$('#tabs').tabs('getTab',$(n).find('span.tabs-title').text()).panel('options').tab.is(':hidden'))
		{
		  fullWidth += $(this).outerWidth(true);
		}
        });
		//得到tab面板的实际宽度
        var realWidth = header.width() - tool.outerWidth();
		if(fullWidth>realWidth)
			{
			return true;
			}
		else
			{
			return false;
			}
	}
	
	//判断是否該顯示點擊列表按鈕(將顯所有的ｔａｂ的寬度與實際面板的寬度做比較)author wxy
	function isShowRight()
	{
		var opts = $("#tabs").tabs("options");
        var header = $("#tabs").children("div.tabs-header");
        var tool = header.children("div.tabs-tool");
        var height = ($.boxModel == true ? (header.outerHeight() - (tool.outerHeight() - tool
                .height()))
                : header.outerHeight());
        if (opts.plain) {
            height -= 2;
        }
        tool.height(height);
        var fullWidth = 0;
		//遍历tab面板上所有的li 如果该tab不是被隐藏 则将其宽度相加 得到所有在tab面板上的宽度和
        $("ul.tabs li", header).each(function(i,n) {

		  fullWidth += $(this).outerWidth(true);
        });
		//得到tab面板的实际宽度
        var realWidth = header.width() - tool.outerWidth();
		if(fullWidth>realWidth)
			{
			return true;
			}
		else
			{
			return false;
			}
	}
	//隐藏tab的方法  @author wxy
	function hideTab(index)
	{
		var selectTab = $('#tabs').tabs('getSelected').panel('options'); 
		//通过index查找指定的tab  首先从不能关闭的tab的下一个tab开始查找 （调用的时候index初始值为1）
		var tab=$('#tabs').tabs('getTab',index).panel('options');
		//判断该tab是否隐藏 如果该tab隐藏 则找寻下一个
		if(tab.tab.is(":hidden"))
		{
		index++;
		//递归调用该方法
		hideTab(index);
		}
		else
		{
		//如果该tab没有隐藏 ，判断该tab是否是被选中 =如果被选中 则继续寻找下一个
		if(tab.title==selectTab.title)
			{
				index++;
				hideTab(index);
			}
		else
			{
			//如果不是 则隐藏该tab
			($('#tabs').tabs('getTab',index).panel('options').tab).hide();
			}
			
		}
	}
	//判断加了tab后是否超出范围 超出范围后 执行以下操作  @author wxy
	function excute()
	{
		//判断添加后 是否超出限制范围
        var tabs=$('#tabs').tabs("tabs");
		//获取class为tabs-header的div，此div即为tabs标签部分；
		var header1 = $("#tabs").children("div.tabs-header");
		 $(".tabs-scroller-left").remove();
		  $(".tabs-scroller-right").remove();
		  $("div.tabs-header").append("<div class='tabs-scroller-right-itp' style='display:block'></div>");
		  //再绑定click点击事件
		   $(".tabs-scroller-right-itp", header1).bind('click',function(e) {
		   //先移除列表所有的item 以防止重复添加
		   $("#list").empty();
		   $.each($('#list').children('div.menu-item'),function(i,item)
		   {
				$('#list').menu('removeItem',item);
		   });
				  var tabs=$("#tabs").tabs("tabs");
				  var hideTabs=[];//用来存放所有隐藏的tab的数组
				  var showTabs=[];//用来存放所有在面板上显示的数组
				  //遍历所有tab 将tab分类存放
				  $.each(tabs,function(i,n)
				   {
				   var subtitle=n.panel('options').title;
				   //判断其中哪些tab是隐藏，哪些tab是显示的
					if( $('#tabs').tabs("getTab",subtitle).panel('options').tab.is(":hidden"))
					{
					hideTabs.push(subtitle);
					}
					else
					{
				    showTabs.push(subtitle);
					}
				   });
				   
				   //在menu上添加item
				    $('#list').menu('appendItem',{id:'closeall',text:'关闭所有',iconCls:'icon-close'}); 
					$('#list').append("<div class=\"menu-sep\">&nbsp;</div>"); 
					if(hideTabs.length>0){
						for(var i=0;i<hideTabs.length;i++)
				   {
				        $('#list').menu('appendItem',{id:hideTabs[i],text:'<b>'+hideTabs[i]+'</b>'}); 
				   }
				   $('#list').append("<div class=\"menu-sep\">&nbsp;</div>"); 
					}
				   
				   
				    for(var i=0;i<showTabs.length;i++)
				   {
				 
				   if($('#tabs').tabs('getSelected').panel('options').title==showTabs[i])
				   {
				     $('#list').menu('appendItem',{id:showTabs[i],text:showTabs[i],iconCls:'icon-ok'}); 
				   }
				   else
				   {
				     $('#list').menu('appendItem',{id:showTabs[i],text:showTabs[i]}); 
				   }
				   //显示menu
				   }
				   $('#list').menu('show', {
					left: e.pageX,
					top: e.pageY
					});
                });	
			//隐藏tab
			hideTab(2);
			//alert("隐藏后："+isScroll());
			
			//自动将位置右移
			var header = $(".tabs-wrap", header1);
                    //scrollLeft 获取匹配元素相对滚动条左侧的偏移；
                    var pos = header.scrollLeft() - $('#tabs').tabs('options').scrollIncrement;
						//alert( "eader.scrollLeft()"+header.scrollLeft()+"   pos:"+pos );
                    header.animate( {
                        scrollLeft : 0
                    }, $('#tabs').tabs('options').scrollDuration);
			
			
        
	}

