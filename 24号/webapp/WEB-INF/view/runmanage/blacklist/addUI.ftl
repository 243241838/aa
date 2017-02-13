<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>运营管理</title>
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
</head>	
<body>
  <div class="ui-main-container">
	<div class="ui-list-content">
		<!-- 搜索 -->
		<div class="search-item">
			<form name="searchform" method="get" action="" id ="searchform2" class="ui-search-form">
				<ul class="search-list fn-clear">
					<li>
						<span class="name">用户ID：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt intOnly" maxlength=19 type="text" name="userId"  maxlength=19 value="${commonUserQuery?if_exists.userId?if_exists}"/></span>
					</li>
					<li>
						<span class="name">账户名：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength=120 name="username" value="${commonUserQuery?if_exists.username?if_exists}"/></span>
					</li>
					<li>
						<span class="name">实名：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="realName" maxlength=120 value="${commonUserQuery?if_exists.realName?if_exists}"/></span>
					</li>
					<li class="btn-group">
						<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search2" >搜 索</a>
			    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset2">重 置</a>
					</li>
				</ul>
				
			</form>
		</div>
		<!-- 搜索end -->
		<!-- 列表 -->
		<div class="list-item fn-clear ui-relative">
			<table id="userTypeList2" class="easyui-tab" width="100%">
			</table>
			<div class="ui-nodata fn-hide">
			  <img src="/images/nodata.png"/>
			  <span>暂无数据</span>
			</div>
		</div>
	<!-- 列表end -->
   </div>
  </div>
<!--选择-->
<div id="dlgConfirm" class="ui-dialog warn-dialog confirm-dialog">
    <form class="black-add" id="editMerch" method="post">
		<div class="ui-info-wrap">
			<table class="ui-center-tab">
	          <tbody>
		          <tr>
		            <td class="ui-oddtd">账户名：</td>
		            <td>
		            	<span id="del-tip"></span>
		            	<input name="userId" type="hidden" id="del-hideId"/>
		            </td>
		          </tr>
		          <tr class="platform-part">
		            <td class="ui-oddtd td-top">拉黑原因：</td>
		            <td>
		                <textarea name="reason" dataType="reqReason" maxlength=120 class="validate[required,maxSize[120]] user-area"></textarea>
		            </td>
		          </tr>
				  </tbody>
      		</table>
		</div>
		<div class="ui-submit-warp">
	      <a href="javascript:window.parent.location.reload();" class="ui-red-btn panel-tool-close">返 回</a> 
	      <input type="submit" value="确 定" class="ui-red-btn ui-pos3"/>
	    </div>
	</form>
</div>
<!--成功提示-->	      
<div id="dlgOk2" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
    <div class="ui-dlg-text">拉黑名单成功！</div>
    <a data-fn="backToList" href="javascript:parent.location.reload();" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog"  data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text">拉黑名单失败！</div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
<script type="text/javascript" src="/js/plugins.js"></script>
<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
<script>
$(function(){
	$("#editMerch").validationEngine({
		ajaxFormValidation:true,
		ajaxFormValidationURL:"/runManage/blacklist/add",
		ajaxFormValidationMethod:"post",
		maxErrorsPerField: 1,
		onAjaxFormComplete:ajaxValidationCallback
	});

	$("#userTypeList2").datagrid({
		url:'/runManage/blacklist/addSearch',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'userId',//id字段
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pageSize:20,
		pagePosition:top,
		columns:[[
			{field:'userId',align:'center',width:"24%",title:'用户ID',
			formatter:function(value,rec){
				   return pad(rec.userId, 6);
		     }
		     },
			{field:'username',align:'center',width:"24%",title:'账户名'},
			{field:'realName',align:'center',width:"25%",title:'实名'},
			{field:'opt',align:'center',width:"25%",title:'操作',formatter:function(value,rec){
				var real=rec.username;
				var name=rec.realName?(rec.realName+'('+real+')'):real;
				var html='<a class="operation-link" href="javascript:delConfirm2('+rec.userId+',\'del-hideId\',\'dlgConfirm\',\''+name+'\');">[选择]</a>';
		        return html;
			 }
			}
		]],
	    queryParams: form2Json("searchform2"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         }
	});
	$("#userTypeList2").datagrid("getPager").pagination({
	    pageSize:20,
	    displayMsg:"",
	    layout:['list','sep','prev','links','next','manual'],
	    showPageList:false,
	 });

function loadFilter(data) {
	var value = {
		total: data.succ?data.entity.totalItems:0,
		rows: []
	};
	if(data.succ){
	for (var i = 0; i < data.entity.items.length; i++) {
		var o = {};
		_loadArray(data.entity.items[i], o, "");
		value.rows.push(o);
	}
	}
	if( data.entity.items.length==0){
		   $('.ui-nodata').removeClass('fn-hide');
		   $('.datagrid-pager').css('visibility','hidden');
		}else{
		   $('.ui-nodata').addClass('fn-hide');
		   $('.datagrid-pager').css('visibility','visible');
	}
	return value;
}

function _loadArray(data, o, pre) {
	if (pre)
		pre = pre + ".";
	for (var att in data) {
		var row = data[att];
		if (typeof(row) == "object") {
			_loadArray(row, o, pre + att);
		} else {
			o[pre + att] = row;
		}

	}
}
function form2Json(id) {
       var arr = $("#"+id).serializeArray()
       var jsonStr = "";
       jsonStr += '{';
        $.each(arr, function(i, field){
           if(field.value){
            jsonStr += '"' + field.name + '":"' + field.value + '",'
           }
        });
        jsonStr = jsonStr.length>1?jsonStr.substring(0, (jsonStr.length - 1)):jsonStr;
         jsonStr += '}';
         //console.log(jsonStr)
        var json = JSON.parse(jsonStr);
        return json
}

$("#submit_search2").click(function () {
	 var listId=$('.easyui-tab').attr('id');
     $("#"+listId).datagrid({ queryParams: form2Json("searchform2") });   //点击搜索
});
$("#submit_reset2").click(function(){
    $(this).parents("form").get(0).reset();
})
});
</script>
</body>
</html>