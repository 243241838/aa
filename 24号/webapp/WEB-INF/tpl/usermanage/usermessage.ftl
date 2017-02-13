
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>无标题文档</title>
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

		<div class="ui-datagrid-wrap ui-datagrid-wrap-mgt">
			<!-- 搜索 -->
			<div class="search-wrap">
				<form  id="search-ff" class="ui-search-form" action="${base}/user/findUserMsg">
					<ul class="search-list fn-clear ui-usermanager">
						<li class="date">
							<label class="name ui-label-wh">注册时间：</label>
								<input id="startTime" class="easyui-datebox" data-options="editable:false" vlaue="" validType="mdMonth['#endTime']" name="createTimeStart">
							  <em class="ui-channel-titcolor">至</em>
							  <input id="endTime" class="easyui-datebox" data-options="editable:false" vlaue="" validType="mdMonth['#startTime']" name="createTimeEnd">
						</li>
						<li>
							<label class="name ui-label-wh">用户ID：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="userId" value="" maxLength="9"/></span>
						</li>
						<li>
							<label class="name ui-label-wh">账号：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="username" value=""/></span>
						</li>
					</ul>
					<ul class="search-list fn-clear">
						<li>
							<label class="name ui-label-wh">姓名：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="realName" value=""/></span>
						</li>
						<li>
							<label class="name ui-label-wh">手机号码：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="mobile" value=""/></span>
						</li>
						<li>
							<label class="name ui-label-wh">注册方式：</label>
							<select class="ui-combobox" name="acctType" id="acctType">
								<option value="" selected ="selected">全部</option>
								<option value="10">手机账户</option>
								<option value="11">Email账户</option>
							</select>
						</li>
						<li>
							<label class="name ui-label-wh">用户来源：</label>
							<select class="ui-combobox" name="domainId" id="domainId">
								<option value="" selected ="selected">全部</option>
								<#list domainList as item>
									<option value="${item.domainId}">${item.domainName}</option>
								</#list>
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
				
				<table id="dg-list" class="easyui-datagrid"  style="margin-right:10px;">	
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
			url:'${base}/user/findUserMsg',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			//idField:'userid',//id字段
			//sortName:'userid',//当数据表格初始化时以哪一列来排序
			//sortOrder:'desc',//'asc'/'desc'（正序/倒序）
			//remoteSort: false,//定义是否通过远程服务器对数据排序
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'userId',align:'center',width:"8%",title:'用户ID',
					formatter:function(value,rec){
						if(value == null || value == ""){
							return "";
						} else {
							return '<a href="${base}/user/toAccountDetailMsg?userId='+value+'">'+rec.userId+'</a>';
						}
					}
				},
				{field:'username',align:'center',width:"20%",title:'账号'},
				{field:'realName',align:'center',width:"10%",title:'姓名'},
				{field:'acctType',align:'center',width:"10%",title:'注册方式',
					formatter:function(value,rec){
						var str = "";
						if(rec.acctType == 10){
							str = "手机账户";
						}
						
						if(rec.acctType == 11){
							str = "Email账户";
						}
						return str;
					}
				},
				{field:'domainName',align:'center',width:"10%",title:'用户来源'},
				{field:'mobile',align:'center',width:"10%",title:'手机号码'},
				{field:'createTime',align:'center',width:"15%",title:'注册时间',sortable:true,
					formatter:function(value,rec){
						if(value == null || value == ""){
							return "";
						} else {
							return formatTimestamp(value);
						}
					}
				},
				{field:'lastLoginTime',align:'center',width:"15%",title:'最后登录时间',sortable:true,
					formatter:function(value,rec){
						if(value == null || value == ""){
							return "无";
						} else {
							return formatTimestamp(value);
						}
					}
				}
			]],
			queryParams: eb.form2Json("search-ff"),
	   		loadFilter:function(data){
	            return eb.loadFilter(data);//自定义过滤方法

		    },
		    onLoadSuccess:function(){
		    	pageCls();
		    	sortCell(['createTime','lastLoginTime']);//排序要显示箭头的，以数组形式传
		    }
		});
		//分页
		pageAction();
		
   });
	function submitForm(){
		if($('#search-ff').form('validate')){
			    //eb.backToFstPage("#datagrid");
				$("#dg-list").datagrid({queryParams : eb.form2Json("search-ff")});
				
				 pageAction();
			}
	}
	function clearForm(){
		$("#search-ff").form('clear');
	}
	
</script>
</body>
</html>