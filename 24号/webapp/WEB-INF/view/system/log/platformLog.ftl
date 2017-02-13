<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>日志管理</title>
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
<script type="text/javascript" src="/js/jquery.min.js"></script>
</head>
	
<body>
  <div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	 <#include "/common/include/power.ftl">
		<!-- <a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<span class="crumbs-tit">前台操作日志 </span> -->
	</div>
	<div class="ui-list-content">
		<!-- 搜索 -->
		<div class="search-item">
			<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
				<ul class="search-list fn-clear">
					<li>
						<span class="name" style="width:75px;">操作员账号：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="operatorLoginName" maxlength=120 value=""/></span>
					</li>
					<li>
						<span class="name">描述：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="describe" maxlength=120 value=""/></span>
					</li>
					<li class="btn-group">
						<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
			    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset">重 置</a>
					</li>
				</ul>
				<ul class="search-list fn-clear">
					<li class="date">
						<span class="name">操作时间：</span>
						<input id="startTime" name="createTimeBegin" class="easyui-datebox" value="" validType="md['#endTime']">
						<em>至</em>
						<input id="endTime" name="createTimeEnd" class="easyui-datebox" value="" validType="md['#startTime']">
					</li>
					
				</ul>
			</form>
			<input type="hidden" id="excel-data"/>			
		</div>
		<!-- 搜索end -->
		<!-- 列表 -->
		<div class="list-item fn-clear ui-relative">
		${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')}
			<!-- <a href="javascript:doExcel('/system/log/platformLogExcel');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a> -->
			<table id="platformLogList" class="easyui-tab"  width="100%">
			</table>
			<div class="ui-nodata fn-hide">
			  <img src="/images/nodata.png"/>
			  <span>暂无数据</span>
			</div>
		</div>
	<!-- 列表end -->
   </div>
  </div>
<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
<script type="text/javascript" src="/js/plugins.js"></script>
<script>
$(function(){
	$('#dlgOk2').siblings('.panel-header').find('.panel-tool-close:eq(0)').click(function(){
	  refresh();
	});
//用户类别管理
	$("#platformLogList").datagrid({
		url:'/system/log/platform',
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
			{field:'createTimeString',align:'center',width:"24%",title:'操作时间'},
			{field:'operatorLoginName',align:'center',width:"25%",title:'操作员账号'},
			{field:'ip',align:'center',width:"22%",title:'IP'},
			{field:'describe',align:'center',width:"28%",title:'描述'}
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         }
	});
	$("#platformLogList").datagrid("getPager").pagination({
	    pageSize:20,
	    displayMsg:"",
	    layout:['list','sep','prev','links','next','manual'],
	    showPageList:false
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
        var exdata=$("#"+id).serialize();
	    $('#excel-data').val(exdata);
        jsonStr = jsonStr.length>1?jsonStr.substring(0, (jsonStr.length - 1)):jsonStr;
         jsonStr += '}';
         //console.log(jsonStr)
        var json = $.parseJSON(jsonStr);
        return json
}
dateValid();
$("#submit_search").click(function () {
     if($("#searchform").form("validate")){
	     var listId=$('.easyui-tab').attr('id');
	     $("#"+listId).datagrid({ queryParams: form2Json("searchform") });   //点击搜索
     }
	
});
$("#submit_reset").click(function(){
    $(this).parents("form").get(0).reset();
})
});
</script>
</body>
</html>