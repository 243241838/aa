
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>操作员管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
	
<body>
  <div class="ui-info-box">
    <div class="ui-crumbs"  id="crumbs">
      <#include "/common/include/power.ftl">
	</div>
	<div class="ui-top-staticis">截止2015-04-23 累计 自研产品共有：56个。</div>
	
   <div class="ui-datagrid-wrap">
		<!-- 搜索 -->
		<div class="search-wrap searchlong-wrap">
			<form  id="search-ff" class="ui-search-form">
				<ul class="search-list fn-clear">
					<li>
						<label class="name">操作员ID</label>
						<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="userId" value=""/></span>
					</li>
					<li>
						<label class="name">操作员帐号</label>
						<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="nickname" value=""/></span>
					</li>
					<li id="main" style="display:none;">
						<input id="startTime" class="easyui-datebox" data-options="editable:false"  validType="md['#endTime']"/>
					    <em>至</em>
					    <input id="endTime" class="easyui-datebox" data-options="editable:false"  validType="md['#startTime']"/>
					</li>
				
				</ul>
				<ul class="search-list fn-clear">
					<li>
						<label class="name">所属角色</label>
						<select class="ui-combobox" name="roleId" id="">
							<option value="">全部</option>
							<#if roleList?exists>
								<#list roleList as role>
									<option value="${role?if_exists.roleId}">${role?if_exists.roleName}</option>
								</#list>
							</#if>
						</select>
					</li>
					<li>
						<label class="name">状态</label>
						<select class="ui-combobox" name="enabled" id="">
							<option value="">全部</option>
							<option value="1">正常</option>
							<option value="0">停用</option>
						</select>
					</li>
					
					<li class="btn-group">
						<a href="javascript:void(0)" class="search-btn" onclick="doyi()">搜索</a>
			    		<a href="javascript:void(0)" class="search-btn" onclick="clearForm()">重置</a>
					</li>
				</ul>
			</form>
		</div>
		<!-- 搜索end -->
		<!-- 列表 -->
		<div class="list-item fn-clear">
			<a href="product_add.html" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增</a>
			<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
			</table>
		</div>
		<!-- 列表end -->
	</div>
  </div>

<script>

function doyi(){

$('#main').show();
}
	$(function(){
		validExtend();
		
		$("#dg-list").datagrid({
		    url:'/operator/findList',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'userId',align:'center',width:"15%",title:'操作员ID'},
				{field:'nickname',align:'center',width:"15%",title:'操作员帐号',
	           		formatter:function(value,rec){
							return '<a class="operation-link" href="/operator/toInfo">'+rec.agentAreaCityName+'</a>';
							}
				     },
				{field:'userName',align:'center',width:"15%",title:'姓名'},
				{field:'phone',align:'center',width:"19%",title:'手机号码'},
				{field:'email',align:'center',width:"19%",title:'邮箱'},
				{field:'roleName',align:'center',width:"19%",title:'所属角色'},
				{field:'enabledStr',align:'center',width:"15%",title:'状态'},
				{field:'opt',align:'center',width:"15%",title:'操作',
				    formatter:function(value,rec){
					    var html='<a class="operation-link" href="javascript:delConfirm('+rec.userId+','+rec.userId+');">[停用]</a>'
							+'<a class="operation-link" href="/operator/toInfo?userId='+rec.userId+'">[编辑]</a>'
					        +'<a class="operation-link" href="javascript:delConfirm2('+rec.userId+',\'del-hideId2\',\'dlgConfirm2\');">[重置密码]</a>'; 
						return html;
						}
			     }
				]],
				queryParams: eb.form2Json("search-ff"),
			    loadFilter:function(data){
		            return eb.loadFilter(data);    //自定义过滤方法
			    },
			    onLoadSuccess:pageCls
			});
			pageAction();//分页
			
	   });
</script>
</body>
</html>