<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>菜单管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>	
</head>

<body style="">
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	<#include "/common/include/power.ftl">
    </div>
		<div class="ui-datagrid-wrap">
			<!-- 搜索 -->
			<div class="search-wrap">
				<form  id="search-ff" class="ui-search-form" action="" >
					<ul class="search-list fn-clear">
						<li>
							<label class="name">mapId</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt intOnly" type="text" name="mapId" maxlength=9/>
							</span>
						</li>
						<li>
							<label class="name">DESCS</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="descs" value=""/></span>
						</li>
							<li>
							<label class="name">URLID</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="urlid" value=""/></span>
						</li>
							<li>
							<label class="name">URL</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="url" value=""/></span>
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
				<div class="ui-top-staticis">截止 ${currDate} 累计 
				共有：<font color="#FF0000"> ${total} 个 </font>。</div>
				<a href="/zwl/toAddMenu" class="dash-add-btn" ><i class="ui-icon ui-icon-add"></i>新增</a>
				<table id="dg-list" class="ebao-datagrid" style="margin-right:10px;">
				
				</table>
			</div>
			<!-- 列表end -->
		</div>
	</div>
		
	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'${base}/zwl/findMenuPage',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			idField:'mapId',
			sortName:'',
			sortOrder:'desc',
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{	field:'mapId',align:'center',width:"8%",title:'mapId'},
				{	field:'resourceId',align:'center',width:"8%",title:'resourceId'},
				{	field:'urlid',align:'center',width:"8%",title:'URLid'},
				{	field:'url',align:'center',width:"15%",title:'URL'},
				{	field:'name',align:'center',width:"8%",title:'菜单名'},
				{	field:'enabled',align:'center',width:"8%",title:'启用'},
				{	field:'action',title:'操作',width:50,align:'center',
					formatter:function(value,row,index){
 					var e = '<a href="/zwl/toAddMenu?resourceId='+row.resourceId+'" class="dash-add-btn" ><i class="ui-icon ui-icon-add"></i>编辑</a>'; 
 					
 					var d = '<a href="javascript:deleteConfirm('+row.resourceId+')" class="dash-add-btn" ><i class="ui-icon ui-icon-add"></i>删除</a>'; 
					return e+d;
					}
					}
			]], 
			
			queryParams: eb.form2Json("search-ff"),
		    loadFilter:function(data){
	            return eb.loadFilter(data);    //自定义过滤方法
	        },
	         onLoadSuccess:function(){
      			pageCls();
      			sortCell(['mapId']);//排序要显示箭头的，以数组形式传
      		 }
		});
		//分页
		pageAction();
		
   });
 
	function deleteConfirm(s){
		
		 if(confirm("确定要删除吗？")){
		 	location.href="/zwl/deleteMenu?resourceId="+s;
		 }else{
		 	return;
		 }
	};


   
	</script>

</body>
</html>