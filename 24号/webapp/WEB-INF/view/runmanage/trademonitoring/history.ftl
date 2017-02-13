<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理->用户信息查询</title>
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
    <script src="/js/jquery.min.js"></script>
</head>

<body>
  <div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	 <#include "/common/include/power.ftl">
		<!-- <a class="crumbs-link" href="#">用户管理 <span>></span></a>
		<a class="crumbs-link" href="#">用户信息查询 <span>></span></a>
		<span class="crumbs-tit">用户信息查询</span> -->
	</div>
	<div class="ui-list-content">
	<!-- 搜索 -->
	<div class="search-item">
		<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
			<ul class="search-list fn-clear">
				<li class="date">
					<span class="name">用户ID：</span>${userId?if_exists}
					<span class="name">用户名：</span>${userName?if_exists}
				</li>
				<li class="date"></li>
				<li class="date">
					<span class="name">交易时间：</span>
					<input id="startTime" name="createTimeBeginStr" class="easyui-datebox" value="${amountMinuteBegin?if_exists}" validType="md['#endTime']">
					至
					<input id="endTime" name="createTimeEndStr" class="easyui-datebox" value="${amountMinuteEnd?if_exists}" validType="md['#startTime']">
				</li>
				
				<li class="btn-group">
					<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
		    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset">重 置</a>
				</li>
			</ul>
			<input type="hidden" name="userId" value="${userId}">
		</form>
		<input type="hidden" id="excel-data"/>
	</div>
	<!-- 搜索end -->
	<!-- 列表 -->
	<div class="list-item ui-relative fn-clear">
	${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')}
	    <!-- <a href="javascript:doExcel('/runManage/tradeMonitoring/historyTransExcel');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a> -->
		<table id="userList" class="easyui-tab" width="100%">
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
		$('#startTime').datebox("setValue","${amountMinuteBegin?if_exists}");
		$('#endTime').datebox("setValue","${amountMinuteEnd?if_exists}");
		dateType();
	//用户信息查询
	$("#userList").datagrid({
		url:'/runManage/tradeMonitoring/historyTrans?userId='+${userId},
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'userId',//id字段
		sortName:'userId',             //当数据表格初始化时以哪一列来排序
		sortOrder:'desc',             //'asc'/'desc'（正序/倒序）
		pageSize:20,
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pagePosition:top,
		columns:[[
			{field:'orderNo',align:'center',width:"17%",title:'交易流水号'},
			{field:'createTimeString',align:'center',width:"15%",title:'交易时间'},
			{field:'sellerName',align:'center',width:"13%",title:'商户名'},
			{field:'sellerId',align:'center',width:"11%",title:'商户ID'},
			{field:'transactionMoneyYuan',align:'center',width:"13%",title:'交易金额(元)'},
			{field:'transactionDesc',align:'center',width:"15%",title:'交易摘要'},
			{field:'askIp',align:'center',width:"13%",title:'支付请求IP地址'},
			{field:'paymentIp',align:'center',width:"12%",title:'支付提交IP地址'},
			{field:'ifSuspicious',align:'center',width:"12%",title:'是否为可疑交易'},
			{field:'stateName',align:'center',width:"8%",title:'交易状态'}
			
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         }
	});
    $("#userList").datagrid("getPager").pagination({
		    pageSize:20,
		    displayMsg:"",
		    layout:['list','sep','prev','links','next','manual'],
		    showPageList:false
		 });
		 
	dateValid();
	
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
        var exdata=$("#"+id).serialize();
	        $('#excel-data').val(exdata);
        var json = $.parseJSON(jsonStr);
        return json;
}

$("#submit_search").click(function () {
     if($("#searchform").form("validate")){
         dateType();
	     var listId=$('.easyui-tab').attr('id');
	     $("#"+listId).datagrid({ queryParams: form2Json("searchform") });   //点击搜索
     }
	
});
$("#submit_reset").click(function(){
    $(this).parents("form").get(0).reset();

  });

	});
	</script>
</body>
</html>