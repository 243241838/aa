<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>日志管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
	
<body>

  <div class="ui-info-box">
	<div class="ui-crumbs" id="crumbs">
	    <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">日志管理 <span>></span></a>
		<span class="crumbs-tit">后台日志管理</span>-->
	</div>
	<div class="ui-datagrid-wrap">
		<!-- 搜索 -->
		<div class="search-wrap">
			<form name="searchform" method="get" action="" id ="search-ff" class="ui-search-form">
				<ul class="search-list fn-clear">
					<li>
						<label class="name" style="width:85px;">操作员账号：</label>
						<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="operatorLoginName" maxlength=20 value=""/></span>
					</li>
					<li>
						<label class="name">描述：</label>
						<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="describe" maxlength=20 value=""/></span>
					</li>
					<li class="btn-group">
						<a href="javascript:void(0)" class="easyui-linkbutton search-btn" onclick="submitForm()">搜 索</a>
			    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" onclick="clearForm()">重 置</a>
					</li>
				</ul>
				<ul class="search-list fn-clear">
					<li class="date">
						<label class="name" style="width:85px;">操作时间：</label>
						<input id="startTime" name="createTimeBegin" class="easyui-datebox" value="${startTime}" validType="md['#endTime']">
						 <em class="ui-channel-titcolor">至</em>
						<input id="endTime" name="createTimeEnd" class="easyui-datebox" value="${endTime}" validType="md['#startTime']">
					</li>
					
				</ul>
			</form>
			<input type="hidden" id="excel-data"/>			
		</div>
		<!-- 搜索end -->
		<!-- 列表 -->
		<div  class="list-item list-noadd fn-clear">
		    <!--${fButton(list, 'ADD','<a href="@URL@" class="ui-trans-btn ui-add-pos fn-left">新增</a>')}  
			<a href="/role/toAdd" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增</a>  -->
			<table id="dg-list" class="ebao-datagrid" >	
			</table>
		</div>
	<!-- 列表end -->
   </div>
  </div>

<script>
$(function(){
	
	$("#dg-list").datagrid({
		url:'/system/log/platform',
		method:'post',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'roleId',//id字段
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:'createTimeString',align:'center',width:"24%",title:'操作时间'},
			{field:'operatorLoginName',align:'center',width:"23%",title:'操作员账号'},
			{field:'ip',align:'center',width:"22%",title:'IP'},
			{field:'describe',align:'center',width:"28%",title:'描述'}
		]],
		queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
	    },
	    onLoadSuccess:pageCls
	});
	pageAction();//分页
	
	//$('.easyui-datebox').datebox('setValue',formatDate(new Date()));
});



</script>
</body>
</html>