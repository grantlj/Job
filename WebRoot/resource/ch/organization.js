//组织机构模块页面文字标签常量
var JGBM = "机构编码";
var JGMC = "机构名称";
var JGLB = "机构类别";
var SJJG = "上级机构";
var SFMJ = "是否末级机构";
var ORDERNO = "同级序号";
var LXR = "联系人";
var LXDH = "联系电话";
var FAXNO = "传真";
var POSTCODE = "邮编";
var ADDRESS = "地址";
var HTTPURL = "网址";
//用于装页签的数组。方便在新增、修改界面循环赋值
var orgs = [];
orgs.push(JGBM,JGMC,JGLB,SJJG,ORDERNO,LXR,LXDH,FAXNO,POSTCODE,ADDRESS,HTTPURL);

//用于装必填项页签
var mustOrgs = [];
mustOrgs.push(JGBM,JGMC,JGLB);

