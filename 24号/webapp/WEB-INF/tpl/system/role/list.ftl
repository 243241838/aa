<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>角色管理</title>
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
		<a class="crumbs-link" href="#">角色管理 <span>></span></a>
		<span class="crumbs-tit">角色管理</span>-->
	</div>
	<div class="ui-datagrid-wrap">
		<!-- 搜索 -->
		<div class="search-wrap">
			<form  id="search-ff" class="ui-search-form">
				<ul class="search-list fn-clear">
					<li>
						<label class="name">角色ID：</label>
						<span class="textbox"><input class="textbox-text textbox-prompt intOnly" maxlength=9 type="text" name="roleId" value=""/></span>
					</li>
					<li>
						<label class="name" style="width:80px">角色名称：</label>
						<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="roleName" value=""/></span>
					</li>
					<li>
						<label class="name">关键字：</label>
						<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="descs" value="" placeholder="职责描述"/></span>
					</li>
					<li class="btn-group">
						<a href="javascript:void(0)" class="search-btn" onclick="submitForm()">搜 索</a>
			    		<a href="javascript:void(0)" class="search-btn" onclick="clearForm()">重 置</a>
			    		<!--
			    		<a href="javascript:void(0)" class="excel-btn" onclick="eb.doExcel()">导出EXCEL</a>
			    		-->
					</li>
				</ul>
				
			</form>
			<input type="hidden" id="excel-data"/>
		</div>
		<!-- 搜索end -->
		<!-- 列表 -->
		<div  class="list-item fn-clear">
		    <!--${fButton(list, 'ADD','<a href="@URL@" class="ui-trans-btn ui-add-pos fn-left">新增</a>')}    -->
			<a href="/role/toAdd" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增</a>
			<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
			</table>
			<div class="ui-nodata fn-hide">
			  <img src="${base}/resource/images/nodata.png"/>
			  <span>暂无数据</span>
			</div>
		</div>
	<!-- 列表end -->
   </div>
  </div>

<script>
$(function(){
	
	$("#dg-list").datagrid({
		url:'${base}/role/findList',
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
			{field:'roleId',align:'center',width:"13%",title:'角色ID'},
			{field:'roleName',align:'center',width:"14%",title:'角色名称',
				 formatter:function(value,rec){
				   return '<a class="operation-link" href="${base}/role/toInfo?roleId='+rec.roleId+'">'+rec.roleName+'</a>';
				 }
			 },
			{field:'descs',align:'center',width:"28%",title:'职责描述'},
			{field:'modifyUserName',align:'center',width:"14%",title:'修改人员'},
			{field:'modifyTimeStr',align:'center',width:"14%",title:'修改时间'},
			{field:'opt',align:'center',width:"15%",title:'操作',
			  formatter:function(value,rec){
				var html='<a class="operation-link" href="${base}/role/toGrantAuth?roleId='+rec.roleId+'">[授权资源]</a>'; 
				<#--var html='${fButton(list, 'EDIT','<a class="operation-link" href="${base}role/toInfo?roleId=\'+rec.roleId+\'">[编辑]</a>')}'
			            +'${fButton(list, 'GRANT','<a class="operation-link" href="@URL@?roleId=\'+rec.roleId+\'">[授权资源]</a>')}';-->
		        return html;
			 }
			}
		]],
		queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
	    },
	    onLoadSuccess:function(data){
	      sessionStorage.setItem('rolelist',data.currentPage);//当前页
	      pageCls();
	    }
	});
	pageAction();//分页
	
});
</script>
</body>
</html>