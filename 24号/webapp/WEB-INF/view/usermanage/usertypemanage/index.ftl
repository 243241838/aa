<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户类别管理-列表</title>
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
</head>
	
<body>
  <div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	    <#include "/common/include/power.ftl">
		<#--<a class="crumbs-link" href="#">用户管理 <span>></span></a>
		<a class="crumbs-link" href="#">用户类别管理 <span>></span></a>
		<span class="crumbs-tit">用户类别管理</span>-->
	</div>
	<div class="ui-list-content">
	<!-- 搜索 -->
	<div class="search-item">
		<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
			<ul class="search-list fn-clear">
				<li>
					<span class="name">类别名称：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="levelName" value=""/></span>
				</li>
				
				<li class="btn-group">
					<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
		    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset">重 置</a>
				</li>
			</ul>
			
		</form>
	</div>
	<!-- 搜索end -->
	<!-- 列表 -->
	<div class="list-item fn-clear ui-relative">
	    ${fButton(list, 'ADD','<a href="@URL@" class="ui-trans-btn ui-add-pos">新增</a>')}  
		<#--<a href="/userManage/userTypeManage/addUserTypeView" class="ui-trans-btn ui-add-pos">新增</a>-->
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
<!--删除-->
<div id="dlgConfirm" class="ui-dialog warn-dialog confirm-dialog">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text">确定删除<span id="del-tip">此用户类别</span>吗？</div>
    <input type="hidden" id="del-hideId"/>
	  <#-- <a href="javascript:delNext('/userManage/userTypeManage/deleteUserTypeById','id');" class="ui-red-btn">确 定</a>-->
	   ${fButton(list, 'DELETE','<a  href="javascript:delNext(\'@URL@\',\'id\');" class="ui-red-btn">确 定</a>')}
	   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
	</div>
</div>
<!--删除成功-->
<div id="dlgOk2" class="ui-dialog ok2-dialog">
	   <div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
       <div class="ui-dlg-text">删除成功！</div>
       <a href="javascript:;" class="ui-red-btn" onclick="refresh();">确 定</a>
	</div>
</div>
<!--删除失败-->
<div id="dlgWarn" class="ui-dialog warn-dialog">
		<div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-text"></div>
       <a href="javascript:;" class="ui-red-btn ui-dlg-cancel">确 定</a>
		</div>
	</div>
<script>
$(function(){
	$('#dlgOk2').siblings('.panel-header').find('.panel-tool-close:eq(0)').click(function(){
	  refresh();
	});
//用户类别管理
	$("#userTypeList").datagrid({
		url:'/userManage/userTypeManage/selectUserTypeList',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'userId',//id字段
		sortName:'levelName',//当数据表格初始化时以哪一列来排序
		sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pageSize:20,
		pagePosition:top,
		columns:[[

			{field:'levelName',align:'center',width:"15%",title:'用户类别',sortable:true},
		    {field:'rechargeFee',align:'center',width:"15%",title:'充值手续费'},
		    {field:'withdrawFee',align:'center',width:"16%",title:'提现手续费'},
			{field:'transferFee',align:'center',width:"16%",title:'转账手续费'},
	    	{field:'collectFee',align:'center',width:"16%",title:'收款手续费'},
			{field:'opt',align:'center',width:"21%",title:'操作',formatter:function(value,rec){
			
				<#--var html='<a class="operation-link" href="/userManage/userTypeManage/selectUserTypeUserListView?levelId='+rec.id+'">[管理用户]</a>';
				if(rec.protectedType==1){
					html='<a class="operation-link" href="/userManage/userTypeManage/selectUserTypeById?id='+rec.id+'">[编辑]</a>'
				      +'<a class="operation-link" href="javascript:delConfirm('+rec.id+',\'此用户类别\');">[删除]</a>'
				      +html;
				}
			        return html;
				
			 }-->
			 var html='${fButton(list, 'MANAGEUSER','<a class="operation-link" href="@URL@?levelId=\'+rec.id+\'">[管理用户]</a>')}';
			 if(rec.protectedType==1){
				 html='${fButton(list, 'EDIT','<a class="operation-link" href="@URL@?id=\'+rec.id+\'">[编辑]</a>')}'
				      +'${fButton(list, "DELETE","<a class=\"operation-link\" href=\"javascript:delConfirm('+rec.id+','+'\\'此用户类别\\''+');\">[删除]</a>")}'
				      +html;
				}
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
         //console.log(jsonStr)
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