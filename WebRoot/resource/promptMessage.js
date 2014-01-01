/**
 * 系统所有页面提示信息工具类
 * @author ghn
 * @time 20130823
 */

/**
 * 返回删除提示信息
 * @param mess 业务信息(如：电警设备ID为9527)
 */
function getDelTips(mess){
	//正式环境提示信息
	//var str = "是否删除该条记录!";
	
	//开发环境默认信息
	var str = "没有提示信息，请检查!";
	if(mess != "" || mess != null){
		//完整的提示信息格式如：是否删除电警设备ID为9527的记录!
		var str = "是否删除" + mess + "的记录!";
	}
	
	return str;
}

/**
 * 数据保存成功
 */
var SAVE_SUESS = "数据保存成功!";

/**
 * 数据修改成功
 */
var UPDATE_SUESS = "数据修改成功!";

/**
 * 数据删除成功
 */
var DEL_SUESS = "数据删除成功!";

