<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>运营管理-计费管理-用户类别手续费-列表</title>
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
		<!-- <a class="crumbs-link" href="#">运营管理<span>></span></a>
		<a class="crumbs-link" href="#">计费管理<span>></span></a>
		<span class="crumbs-tit">用户类别手续费</span> -->
	</div>
	<div class="ui-list-content">
	<!-- 搜索 -->
	<div class="search-item">
		<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
			<ul class="search-list fn-clear">
			<li>
					<span class="name" style="width:79px;">用户类别ID：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt intOnly" maxlength=19 type="text" name="id" value=""/></span>
				</li>
				<li>
					<span class="name">类别名称：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength=120 name="levelName" value=""/></span>
				</li>
				
				<li class="btn-group">
					<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
		    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset">重 置</a>
				</li>
			</ul>
			<input type="hidden" name="sort" value="id"/>
			<input type="hidden" name="order" value="desc"/>
		</form>
		<input type="hidden" id="excel-data"/>
	</div>
	<!-- 搜索end -->
	<!-- 列表 -->
	<div class="list-item fn-clear ui-relative">
		${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')}
	    <!-- <a href="javascript:doExcel('/runManage/billingMagage/userTypeListExcel');"  class="ui-excel ui-add-pos">[导出EXCEL表格]</a> -->
		<table id="userTypeList" class="easyui-tab" width="100%">
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
	$("#userTypeList").datagrid({
		url:'/runManage/billingMagage/selectUserTypeList',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'id',//id字段
		sortName:'id',//当数据表格初始化时以哪一列来排序
		sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pageSize:20,
		pagePosition:top,
		columns:[[
            {field:'id',align:'center',width:"12%",title:'用户类别ID',sortable:true,
               formatter:function(value,rec){
				  return pad(rec.id, 6);
				}
            },
			{field:'levelName',align:'center',width:"18%",title:'用户类别',sortable:true},
			{field:'rechargeFee',align:'center',width:"35%",title:'充值手续费'},
		    {field:'withdrawFee',align:'center',width:"35%",title:'提现手续费'},
			{field:'transferFee',align:'center',width:"35%",title:'转账手续费'},
		    {field:'collectFee',align:'center',width:"35%",title:'收款手续费'},
		
			{field:'opt',align:'center',width:"15%",title:'操作',formatter:function(value,rec){
				var html=' ${fButton(list, 'EDIT','<a class="operation-link" href="@URL@?id=\'+rec.id+\'">[设置]</a>')}';
					/* '<a class="operation-link" href="/runManage/billingMagage/selectUserTypeById?id='+rec.id+'">[设置]</a>'; */
			        return html;
				
			 }
			}
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         }
	});
	$("#userTypeList").datagrid("getPager").pagination({
	    pageSize:20,
	    displayMsg:"",
	    layout:['list','sep','prev','links','next','manual'],
	    showPageList:false
	 });

function loadFilter(data) {
//console.log(data);
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
        return json
}

$("#submit_search").click(function () {
	 var listId=$('.easyui-tab').attr('id');
     $("#"+listId).datagrid({ queryParams: form2Json("searchform") });   //点击搜索
});
$("#submit_reset").click(function(){
    $(this).parents("form").get(0).reset();
})
});
</script>
</body>
</html>