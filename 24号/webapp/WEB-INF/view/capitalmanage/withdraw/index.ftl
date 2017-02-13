<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>资金管理-提现管理</title>
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
		<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
</head>

<body>
  <div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	  <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">资金管理 <span>></span></a>
		<a class="crumbs-link" href="#">提现管理 <span>></span></a>
		<span class="crumbs-tit">提现查询</span>-->
	</div>
	<div class="ui-list-content">
	<!-- 搜索 -->
	<div class="search-item">
		<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
			<ul class="search-list fn-clear">
				<li>
					<span class="name">流水号：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="orderNo" value=""/></span>
				</li>
				<li>
					<span class="name">账户名：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="username" value=""/></span>
				</li>
				<li>
					<span class="name">实名：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="realname" value=""/></span>
				</li>
				
				<li class="btn-group">
					<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
		    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset">重 置</a>
				</li>
			</ul>
			<ul class="search-list fn-clear">
				<li>
					<span class="name">状态：</span>
					<select class="seaway-combobox" name="state" >
						<option value="">全部</option>
						<#if withdrawState?has_content>
							<#list withdrawState as cl>
							<#if cl.key?exists>
							<#if cl.key != '-100' && cl.key != '-20'>
								<option value="${cl.key?if_exists}">${cl.value?if_exists}</option>
								</#if>
								</#if>
							</#list>
						</#if>
						
					</select>
				</li>
				<li class="date">
					<span class="name" style="width:100px;">提现申请日期：</span>
					<input id="startTime" name="beginDate" class="easyui-datebox" value="${withdrawExtendQuery?if_exists.beginDate}" validType="md['#endTime']">
					<em>至</em>
					<input id="endTime" name="endDate" class="easyui-datebox" value="${withdrawExtendQuery?if_exists.endDate}" validType="md['#startTime']">
				</li>
			</ul>
			<input type="hidden" name="sort" value="userId"/>
			<input type="hidden" name="order" value="desc"/>
		</form>
		<input type="hidden" id="excel-data"/>
	</div>
	<!-- 搜索end -->
	<!-- 列表  -->
	<div class="list-item ui-relative fn-clear">
	 ${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')}  
	    <!--<a href="javascript:doExcel('/capitalManage/withdrawManage/outWithdraw');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>-->
		<table id="withdrawList" class="easyui-tab" width="100%">
		</table>
		<div class="ui-nodata fn-hide">
		  <img src="/images/nodata.png"/>
		  <span>暂无数据</span>
		</div>
	</div>
	<!-- 列表end -->
   </div>
 </div>

	<script>
	$(function(){
	//提现信息查询
	$("#withdrawList").datagrid({
		url:'/capitalManage/withdrawManage/selectWithdrawList',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'id',//id字段
		sortName:'orderNo',//当数据表格初始化时以哪一列来排序
		sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		pageSize:20,
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pagePosition:top,
		columns:[[
			{field:'orderNo',align:'center',width:"17%",title:'流水号',sortable:true},
			{field:'createTimeString',align:'center',width:"14%",title:'提现申请时间'},
			{field:'username',align:'center',width:"16%",title:'账户名'},
			{field:'realname',align:'center',width:"12%",title:'实名'},
			{field:'withdrawSumStr',align:'center',width:"12%",title:'提现金额(元)'},
			{field:'withdrawHandingStr',align:'center',width:"14%",title:'手续费(元)'},
			{field:'withdrawFactStr',align:'center',width:"13%",title:'实际支付金额(元)'},
			{field:'stateStr',align:'center',width:"8%",title:'状态'},
			{field:'opt',align:'center',width:"11%",title:'操作',
				formatter:function(value,rec){
				return ' ${fButton(list, 'VIEW','<a class="operation-link" href="@URL@?id=\'+rec.id+\'">[查看]</a>')}';
					
				}
			}
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         }
	});
    $("#withdrawList").datagrid("getPager").pagination({
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
        jsonStr = jsonStr.length>1?jsonStr.substring(0, (jsonStr.length - 1)):jsonStr;
         jsonStr += '}';
         //console.log(jsonStr)
          var exdata=$("#"+id).serialize();
	      $('#excel-data').val(exdata);
        var json = $.parseJSON(jsonStr);
        return json
}
dateValid();
$("#submit_search").click(function () {
	if($("#searchform").form("validate")){
	        // dateType();
			 var listId=$('.easyui-tab').attr('id');
		     $("#"+listId).datagrid({ queryParams: form2Json("searchform") });   //点击搜索
     }
});
$("#submit_reset").click(function(){
     var form=$(this).parents("form");
    resetForm(form);
  
})
	});
	</script>
</body>
</html>