<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户风控管理</title>
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
		<!-- <a class="crumbs-link" href="#">运营管理 <span>></span></a>
		<a class="crumbs-link" href="#">风控管理 <span>></span></a>
		<span class="crumbs-tit">用户风控管理</span> -->
	</div>
	<div class="ui-list-content">
		<!-- 搜索 -->
		<div class="search-item">
			<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
				<ul class="search-list fn-clear">
					<li>
						<span class="name">用户ID：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="userId" value=""  maxlength=19/></span>
					</li>
					<li>
						<span class="name">账户名：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="username" value=""/></span>
					</li>
					<li>
						<span class="name">实名：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt"maxlength=120  type="text" name="realName" value=""/></span>
					</li>
					<li class="btn-group">
						<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
			    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset">重 置</a>
					</li>
				</ul>
				<ul class="search-list fn-clear">
				    <li>
						<span class="name">用户状态：</span>
						<select class="seaway-combobox" name="status" >
							<option value="">全部</option>
							<#if userStatusList?has_content>
							<#list userStatusList as cl>
								<option value="${cl.key?if_exists}">${cl.value?if_exists}</option>
							</#list>
						</#if>
						</select>
					</li>
					<li>
						<span class="name">账户状态：</span>
						<select class="seaway-combobox" name="accountState" >
							<option value="">全部</option>
							<#if accountStateList?has_content>
							<#list accountStateList as cl>
								<option value="${cl.key?if_exists}">${cl.value?if_exists}</option>
							</#list>
						</#if>
						</select>
					</li>
					
				</ul>
				<input type="hidden" name="sort" value="userId"/>
			    <input type="hidden" name="order" value="desc"/>
			</form>
			<input type="hidden" id="excel-data"/>
		</div>
		<!-- 搜索end -->
		<!-- 列表 -->
		<div class="list-item fn-clear ui-relative">
			${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')}
			<!-- <a href="javascript:doExcel('/runManage/userRisk/export');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a> -->
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
<!--禁用 设正常/禁用-->
<div id="dlgConfirm1" class="ui-dialog warn-dialog confirm-dialog">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text">确定要将<span id="del-tip1"></span>的用户状态设为<span id="del-text1"></span>吗？</div>
       <input type="hidden" id="del-hideId1"/>
       <input type="hidden" id="use-flag1" value="" />
       ${fButton(list,"USERSET",'<a href="javascript:setUserUseConfirm(1,\'@URL@\');" class="ui-red-btn">确 定</a>')}
	   <!-- <a href="javascript:setUserUseConfirm(1);" class="ui-red-btn">确 定</a> -->
	   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
	</div>
</div>
<!--禁用 设正常/禁用成功-->
<div id="dlgOk1" class="ui-dialog ok2-dialog ui-dlgOk">
	   <div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
       <div class="ui-dlg-text">设置用户状态<span class="dlg-text-suc1"></span>成功！</div>
       <a href="javascript:;" class="ui-red-btn" onclick="refresh();">确 定</a>
	</div>
</div>
<!--禁用 设正常/禁用失败-->
<div id="dlgWarn1" class="ui-dialog warn-dialog">
	<div class="ui-dlg-content ui-relative">
      <div class="ui-dlg-text">设置用户状态<span class="dlg-text-suc1"></span>失败！</div>
      <a href="javascript:;" class="ui-red-btn ui-dlg-cancel">确 定</a>
	</div>
</div>
<!--禁止设置-->
<div id="dlgStopSet" class="ui-dialog warn-dialog">
	<div class="ui-dlg-content ui-relative">
      <div class="ui-dlg-text" id="stop-set-tip"></div>
      <a href="javascript:;" class="ui-red-btn ui-dlg-cancel">确 定</a>
	</div>
</div>
  <!--冻结 解冻-->
<div id="dlgConfirm2" class="ui-dialog warn-dialog confirm-dialog">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text">确定<span id="del-tip2"></span><span id="del-text2"></span>的资金账户吗？</div>
    <input type="hidden" id="del-hideId2"/>
       <input type="hidden" id="use-flag2" value="" />
       ${fButton(list,"ACCOUNTSET",'<a href="javascript:setUserUseConfirm(2,\'@URL@\');" class="ui-red-btn">确 定</a>')}
	   <!-- <a href="javascript:setUserUseConfirm(2);" class="ui-red-btn">确 定</a> -->
	   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
	</div>
</div>
<!--冻结 解冻成功-->
<div id="dlgOk2" class="ui-dialog ok2-dialog ui-dlgOk">
	   <div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
       <div class="ui-dlg-text"><span class="dlg-text-suc2"></span>用户资金账户成功！</div>
       <a href="javascript:;" class="ui-red-btn" onclick="refresh();">确 定</a>
	</div>
</div>
<!--冻结 解冻失败-->
<div id="dlgWarn2" class="ui-dialog warn-dialog">
	<div class="ui-dlg-content ui-relative">
      <div class="ui-dlg-text"><span class="dlg-text-suc2"></span>用户资金账户失败！</div>
      <a href="javascript:;" class="ui-red-btn ui-dlg-cancel">确 定</a>
	</div>
</div>
<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
<script type="text/javascript" src="/js/plugins.js"></script>
<script>
$(function(){
	$('.ui-dlgOk').siblings('.panel-header').find('.panel-tool-close:eq(0)').click(function(){
	  refresh();
	});
	
	$("#userTypeList").datagrid({
		url:'/runManage/userRisk/findList',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'roleId',//id字段
		remoteSort: true,//定义是否通过远程服务器对数据排序
		//sortName:'userId',             
		//sortOrder:'desc',   
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pageSize:20,
		pagePosition:top,
		columns:[[
			{field:'userId',align:'center',width:"16%",title:'用户ID',
				formatter:function(value,rec){
				  return pad(rec.userId, 6);
				}
			},
			{field:'username',align:'center',width:"18%",title:'账户名'},
			{field:'realName',align:'center',width:"16%",title:'实名'},
			{field:'statusName',align:'center',width:"16%",title:'用户状态'},
			{field:'accountStateName',align:'center',width:"17%",title:'账户状态'},
			{field:'opt',align:'center',width:"17%",title:'操作',formatter:function(value,rec){
				//status用户状态 ：0 是正常 显示设为禁用   1 是禁用 显示设为正常
				//accountState账户状态：0 是正常 显示设为冻结  1 是冻结 显示设为解冻(status为1时只有解冻)
				var real=rec.username;
				var name=rec.realName?(rec.realName+'('+real+')'):real;
				var tit=rec.status==0?"禁用":"正常";
				
				var titSet=rec.accountState==0?"冻结":"解冻";
				var html='<a class="operation-link" href="javascript:setUserUse('+rec.userId+',\''+name+'\',\''+tit+'\','+rec.status+',1);">[设为'+tit+']</a>'
			      +'<a class="operation-link" href="javascript:setUserUse('+rec.userId+',\''+titSet+'\',\''+name+'\','+rec.status+',2,'+rec.accountState+');">['+titSet+']</a>';
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
         var exdata=$("#"+id).serialize();
        $('#excel-data').val(exdata);
        var json = JSON.parse(jsonStr);
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