<!DOCTYPE>
<html>
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
	
   <div class="ui-datagrid-wrap">
		<!-- 搜索 -->
		<div class="search-wrap searchlong-wrap">
			<form  id="search-ff" class="ui-search-form">
				<ul class="search-list fn-clear">
					<li>
						<label class="name">操作员ID</label>
						<span class="textbox"><input class="textbox-text textbox-prompt intOnly" maxlength=9 type="text" name="userId" value=""/></span>
					</li>
					<li>
						<label class="name">操作员帐号</label>
						<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=20 type="text" name="nickname" value=""/></span>
					</li>
					<li>
						<label class="name">操作员姓名</label>
						<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=20 type="text" name="userName" value=""/></span>
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
							<option value="0">禁用</option>
						</select>
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
			<a href="/operator/toAdd" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增</a>
			<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
			</table>
		</div>
		<!-- 列表end -->
	</div>
  </div>
  <!--弹框-->  
  <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;padding-bottom: 20px;">
    <h3 class="ui-dlg-tit">确定要禁用该用户吗？</h3>
    <input type="button" class="ui-dlgOk-btn" value="确定"/>
    <input type="button" class="ui-dlgCancel-btn" value="取消"/>
  </div>
 <div id="resetOK" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
 	<h3 class="ui-dlg-tit" id="msg"></h3>
 	<input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" style="margin-top: -15px;" value="确定">
  </div> 
<script>
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
				{field:'userId',align:'center',width:"10%",title:'操作员ID'},
				{field:'nickname',align:'center',width:"10%",title:'操作员帐号',
	           		formatter:function(value,rec){
						return '<a class="operation-link" href="/operator/toInfo?userId='+rec.userId+'">'+rec.nickname+'</a>';
					}
				},
				{field:'userName',align:'center',width:"10%",title:'姓名'},
				{field:'phone',align:'center',width:"14%",title:'手机号码'},
				{field:'email',align:'center',width:"14%",title:'邮箱'},
				{field:'roleName',align:'center',width:"12%",title:'所属角色'},
				{field:'enabledStr',align:'center',width:"8%",title:'状态'},
				{field:'opt',align:'center',width:"20%",title:'操作',
				    formatter:function(value,rec){
				        var html='';
					    if(rec.enabled){
					      html+='<a class="operation-link" href="javascript:showForibd('+rec.userId+',\'dlg\',1);">[禁用]</a>'
					    }else{
					      html+='<a class="operation-link" href="javascript:showForibd('+rec.userId+',\'dlg\',2);">[设为正常]</a>'
					    }
						html+='<a class="operation-link" href="javascript:showForibd('+rec.userId+',\'dlg\',3,\''+rec.nickname+'\');">[重置密码]</a>';
						html+='<a class="operation-link" href="${base}/operator/authRules?userId='+ rec.userId +'">[配置审核权限]</a>'; 
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