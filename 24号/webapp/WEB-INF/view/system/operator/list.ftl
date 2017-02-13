<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>操作员管理</title>
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
		<a class="crumbs-link" href="#">操作员管理 <span>></span></a>
		<span class="crumbs-tit">操作员管理</span> -->
	</div>
	<div class="ui-list-content">
		<!-- 搜索 -->
		<div class="search-item">
			<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
				<ul class="search-list fn-clear">
					<li>
						<span class="name">操作员ID：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt intOnly" maxlength=19 type="text" name="userId" value=""/></span>
					</li>
					<li>
						<span class="name">用户名：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="nickname" value=""/></span>
					</li>
					<li>
						<span class="name">姓名：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="userName" value=""/></span>
					</li>
					<li>
						<span class="name" style="width:72px;">身份证号码：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=18 type="text" name="reserved02" value=""/></span>
					</li>
					<li class="btn-group">
						<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
			    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset">重 置</a>
					</li>
				</ul>
				<ul class="search-list fn-clear">
				    <li>
						<span class="name">手机：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt intOnly" maxlength=11 type="text" name="phone" value=""/></span>
					</li>
					<li>
						<span class="name">邮箱：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="email" value=""/></span>
					</li>
					<li>
						<span class="name">所属角色：</span>
						<select class="seaway-combobox" name="roleId" >
							<option value="">全部</option>
							<#if roleList?exists>
								<#list roleList as role>
									<option value="${role?if_exists.roleId}">${role?if_exists.roleName}</option>
								</#list>
							</#if>
						</select>
					</li>
					<li>
						<span class="name">状态：</span>
						<select class="seaway-combobox" name="enabled" >
							<option value="">全部</option>
							<option value="1">正常</option>
							<option value="0">停用</option>
						</select>
					</li>
					
				</ul>
				
			</form>
			<input type="hidden" id="excel-data"/>
		</div>
		<!-- 搜索end -->
		<!-- 列表 -->
		<div class="list-item fn-clear ui-relative">
		    ${fButton(list, 'ADD','<a href="@URL@" class="ui-trans-btn ui-add-pos fn-left">新增</a>')}  
		    ${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel fn-left ui-add3-pos">[导出EXCEL表格]</a>')}  
			<!-- <a href="/operator/toAdd" class="ui-trans-btn ui-add-pos fn-left">新增</a>
			<a href="javascript:doExcel('/operator/export');" class="ui-excel fn-left ui-add3-pos">[导出EXCEL表格]</a> -->
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
    <div class="ui-dlg-text">确定要将该操作员（操作员ID:<span id="del-tip"></span>）状态设置为停用吗？</div>
    <input type="hidden" id="del-hideId"/>
   		${fButton(list, 'SET','<a href="javascript:delNext(\'@URL@\',\'stop\');" class="ui-red-btn">确 定</a>')}
	   <!-- <a href="javascript:delNext('/operator/doUserDelete');" class="ui-red-btn">确 定</a> -->
	   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
	</div>
</div>
<!--删除成功-->
<div id="dlgOk2" class="ui-dialog ok2-dialog">
	   <div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
       <div class="ui-dlg-text">停用成功！</div>
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
<!--重设密码-->
<div id="dlgConfirm2" class="ui-dialog warn-dialog confirm-dialog">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text">确定要重置密码吗？</div>
       <input type="hidden" id="del-hideId2" name="userId" />
       ${fButton(list,"RESET","<a class='ui-red-btn' href='javascript:delNext2(\"@URL@\",\"del-hideId2\",\"dlgConfirm2\",\"dlgOk3\",\"dlgWarn2\",\"newPwd\")'>确 定</a>")}
	  <!--  <a href="javascript:delNext2('/operator/doResetPassword','del-hideId2','dlgConfirm2','dlgOk3','dlgWarn2','newPwd');" class="ui-red-btn">确 定</a> -->
	   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
	</div>
</div>
<!--重设密码成功-->
<div id="dlgOk3" class="ui-dialog ok2-dialog">
	   <div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
       <div class="ui-dlg-text">重置密码成功！新密码：<span id="newPwd"></span></div>
       <a href="javascript:;" class="ui-red-btn" onclick="refresh();">确 定</a>
	</div>
</div>
<!--重设密码失败-->
<div id="dlgWarn2" class="ui-dialog warn-dialog">
	<div class="ui-dlg-content ui-relative">
      <div class="ui-dlg-text">重置密码失败</div>
      <a href="javascript:;" class="ui-red-btn ui-dlg-cancel">确 定</a>
	</div>
</div>
<!--设为正常-->
<div id="dlgConfirm3" class="ui-dialog warn-dialog confirm-dialog">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text">确定要设为正常吗？</div>
       <input type="hidden" id="del-hideId3" name="userId" />
       ${fButton(list,"SET","<a class='ui-red-btn' href='javascript:delNext2(\"@URL@\",\"del-hideId3\",\"dlgConfirm3\",\"dlgOk4\",\"dlgWarn3\",\"\",1)'>确 定</a>")}
	   <!-- <a href="javascript:delNext2('/operator/doUserNormal','del-hideId3','dlgConfirm3','dlgOk4','dlgWarn3');" class="ui-red-btn">确 定</a> -->
	   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
	</div>
</div>
<!--设为正常成功-->
<div id="dlgOk4" class="ui-dialog ok2-dialog">
	   <div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
       <div class="ui-dlg-text">已设置为正常！</div>
       <a href="javascript:;" class="ui-red-btn" onclick="refresh();">确 定</a>
	</div>
</div>
<!--设为正常失败-->
<div id="dlgWarn5" class="ui-dialog warn-dialog">
	<div class="ui-dlg-content ui-relative">
      <div class="ui-dlg-text">设置失败</div>
      <a href="javascript:;" class="ui-red-btn ui-dlg-cancel">确 定</a>
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
	
	$("#userTypeList").datagrid({
		url:'/operator/findList',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'roleId',//id字段
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pageSize:20,
		pagePosition:top,
		columns:[[
			{field:'userId',align:'center',width:"7%",title:'操作员ID'},
			{field:'nickname',align:'center',width:"9%",title:'用户名'},
			{field:'userName',align:'center',width:"9%",title:'姓名'},
			{field:'reserved02',align:'center',width:"13%",title:'身份证号码'},
			{field:'phone',align:'center',width:"10%",title:'手机'},
			{field:'email',align:'center',width:"13%",title:'邮箱'},
			{field:'roleName',align:'center',width:"9%",title:'所属角色'},
			{field:'enabledStr',align:'center',width:"7%",title:'状态'},
			{field:'modifyUserName',align:'center',width:"6%",title:'修改人员'},
			{field:'modifyTimeStr',align:'center',width:"12%",title:'修改时间'},
			{field:'opt',align:'center',width:"20%",title:'操作',formatter:function(value,rec){
				var html="";
				if(!rec.enabled){
					/* '<a class="operation-link" href="javascript:delConfirm2('+rec.userId+',\'del-hideId3\',\'dlgConfirm3\');">[设为正常]</a>' */
					html='${fButton(list,"SET","<a class=\"operation-link\" href=\"javascript:delConfirm2('+rec.userId+','+'\\'del-hideId3\\''+','+'\\'dlgConfirm3\\''+')\">[设为正常]</a>")}'
					+'<span class="operation-span">[编辑]</span>'
				      +'<span class="operation-span">[重置密码]</span>';
				}else{
					
					html='${fButton(list,"SET","<a class=\"operation-link\" href=\"javascript:delConfirm('+rec.userId+','+rec.userId+')\">[停用]</a>")}'
					+' ${fButton(list, 'EDIT','<a class="operation-link" href="@URL@?userId=\'+rec.userId+\'">[编辑]</a>')}'
					+'${fButton(list,"RESET","<a class=\"operation-link\" href=\"javascript:delConfirm2('+rec.userId+','+'\\'del-hideId2\\''+','+'\\'dlgConfirm2\\''+')\">[重置密码]</a>")}';
					/* html='<a class="operation-link" href="javascript:delConfirm('+rec.userId+','+rec.userId+');">[停用]</a>'
						+'<a class="operation-link" href="/operator/toInfo?userId='+rec.userId+'">[编辑]</a>'
				      +'<a class="operation-link" href="javascript:delConfirm2('+rec.userId+',\'del-hideId2\',\'dlgConfirm2\');">[重置密码]</a>'; */
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