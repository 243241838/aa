
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
				<form  id="search-ff" class="ui-search-form">
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
							<label class="name ui-label-wh">用户状态：</label>
							<select class="ui-combobox" name="status" id="status">
								<option value="" selected ="selected">全部</option>
								<option value="0">正常</option>
								<option value="-1">注销</option>
								<option value="-2">冻结</option>
							</select>
						</li>
						<li class="btn-group">
							<a href="javascript:void(0)" class="search-btn" onclick="submitForm()">搜索</a>
				    		<a href="javascript:void(0)" class="search-btn" onclick="clearForm()">重置</a>
						</li>
					</ul>
				<input type="hidden" name="channelCode" id="channelCodeId" value="${domainId}">
				</form>
			</div>
			<!-- 搜索end -->
			<!-- 列表 -->
			<div class="list-item fn-clear">
				<!--${fButton(list, 'ADD','<a href="@URL@" class="ui-trans-btn ui-add-pos fn-left">新增</a>')}    -->
				<a href="/domain/toAddDomainUserInfo?channelCode=${domainId}" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增</a>
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<a href="${base}/channelmanager/channelinformanager" class="ui-btn-grey">返回</a>
			<!-- 列表end -->
		</div>
	</div>
	<!--弹框-->  
		  <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
				<h3 class="ui-dlg-tit" id="delStartTit" >确定要删除吗？</h3>
				<input type="button" class="ui-dlgOk-btn" value="确定" id="confirmDel"/>
				<input type="button" class="ui-dlgCancel-btn" value="取消" id="cannelDel"/>
		  </div>
		  <div id="alt" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
				<h3 class="ui-dlg-tit" id="delStartTit2" >删除成功!</h3>
		  </div>
		  <div id="error" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
				<h3 class="ui-dlg-tit" id="delStartTit3" >异常情况,删除失败!</h3>
		  </div>
	<!--重置密码-->
			<div id="resetdlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;padding-bottom: 20px;">
    <h3 class="ui-dlg-tit">确定要禁用该用户吗？</h3>
    <input type="button" class="ui-dlgOk-btn" value="确定"  onclick="reseteb.resetPassword();"/>
    <input type="button" class="ui-dlgCancel-btn" value="取消"/>
  </div>
			<div id="resetOK" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
		 		<h3 class="ui-dlg-tit" id="msg"></h3>
		 		<input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" style="margin-top: -15px;" value="确定">
		  </div> 
	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'${base}/domain/domainUserView',
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
							return '<a href="${base}/domain/searchDomainUserInfos?userId='+rec.userId+'&domainId='+rec.channelCode+'">'+value+'</a>';
						}
					}
				},
				{field:'username',align:'center',width:"10%",title:'账号'},
				{field:'realName',align:'center',width:"10%",title:'姓名'},
				{field:'status',align:'center',width:"10%",title:'用户状态',
					formatter:function(value,rec){
						var str = "";
						if(rec.status == 0){
							str = "正常";
						}
						
						if(rec.status == -1){
							str = "注销";
						}
						if(rec.status == -2){
							str = "冻结";
						}
						return str;
					}
				},
				{field:'mobile',align:'center',width:"15%",title:'手机号码'},
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
				},
				{field:'name',align:'center',width:"15%",title:'操作',
				formatter:function(value,rec){
				var phtml=''; 
					phtml+='<a class="operation-link" href="javascript:reseteb.resetDlg('+rec.userId+',\'resetdlg\',\''+rec.username+'\');">[重置密码]</a>';
                    <!-- phtml +='<a class="operation-link" href="javascript:delRow(\''+rec.userId+'\');">[删除]</a>'; -->
                   return  phtml;
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
		reseteb.init();
		
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
		$("#channelCodeId").val(${domainId});
	}
	function delRow(userId){
	
		showAlert('dlg');
		$("#delStartTit").text("确定要删除吗？");
		$("#confirmDel").click(function(){
			$.ajax({
				url : '${base}/domain/deleteSalesmanInfos',
				type : 'post',
				dataType : 'json',
				data: {"userId": userId},
				success : function(data) {
				    if(data.succ){
				    	showAlert('alt');
				    	window.setInterval( function () {
					    	location.reload();
						}, 1000 );
				    }else{
				    	$("#delStartTit3").text(data.entity);
				    	showAlert('error');
				    	return false;
				    }
				},
				error:function(data){
				   showAlert('error');
				   return false;
				}		
			});
		})
	}
	
</script>
</body>
</html>