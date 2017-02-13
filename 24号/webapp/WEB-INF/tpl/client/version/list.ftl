<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>IOS-版本管理-客户端管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
</head>

<body style="">
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>

		<div class="ui-datagrid-wrap">
			<!-- 搜索 -->
			<div class="search-wrap">
				<form  id="search-ff" class="ui-search-form">
					<input type="hidden" name="type" value="${type}"/>
					<ul class="search-list fn-clear">
						<li>
							<label class="name">发布类型</label>
							<select class="ui-combobox" name="versionState" id="deployTypeId">
                                <option value="" selected ="selected">全部</option>
								<#list deployTypeList as deployType>
                                    <option value="${deployType.code}">${deployType.desc}</option>
								</#list>
							</select>
						</li>
						<li>
							<label class="name">更新类型</label>
							<select class="ui-combobox" name="isOptional" id="updateTypeId">
                                <option value="" selected ="selected">全部</option>
								<#list updateTypeList as updateType>
                                    <option value="${updateType.code}">${updateType.desc}</option>
								</#list>
							</select>
						</li>
            <li class="date">
							<label class="name">提交时间</label>
								<input id="startTime" class="easyui-datebox" name="start" data-options="editable:false" vlaue="" validType="md['#endTime']" style="width:160px"/>
							   <em class="ui-channel-titcolor">至</em>
							  <input id="endTime" class="easyui-datebox" name="end" data-options="editable:false" vlaue="" validType="md['#startTime']" style="width:160px"/>
						</li>
					  <li class="btn-group">
							  <a href="javascript:void(0)" class="search-btn" onclick="submitForm()">搜索</a>
				    		<a href="javascript:void(0)" class="search-btn" onclick="clearForm()">重置</a>
						</li>
					</ul>
				</form>
			</div>
			<!-- 搜索end -->
			<!-- 列表 -->
			<div class="list-item fn-clear">
				<a href="/client/addVersionPage/${type}" class="dash-add-btn" ><i class="ui-icon ui-icon-add"></i>新增</a>
				<table id="dg-list" class="easyui-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
		</div>
	</div>

	

	<!--弹框2-->  
  <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit">您的操作尚未保存，确定要取消吗？</h3>
    <input type="button" class="ui-dlgOk-btn" value="确定"/>
    <input type="button" class="ui-dlgCancel-btn" value="取消"/>
  </div>

	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'/client/queryVersionList',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'currentVersion',align:'center',width:"25%",title:'版本号',
           formatter:function(value,rec){
						return '<a class="operation-link" href="/client/versionDetail?verId='+rec.verId+'">'+value+'</a>';
					}
			  },
				{field:'versionStateDesc',align:'center',width:"25%",title:'发布类型'},
				{field:'updateTypeDesc',align:'center',width:"25%",title:'更新类型',sortable:true},
				{field:'createTimeDesc',align:'center',width:"23%",title:'提交时间',sortable:true}
			]],
			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      },
      onLoadSuccess:pageCls
		});
		//分页
		pageAction();
		
   });
	
	
	</script>
</body>
</html>