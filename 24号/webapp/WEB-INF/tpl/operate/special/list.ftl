
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>运营管理-营销策略管理-专题管理</title>
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
				<form  id="search-ff" class="ui-search-form">
					<ul class="search-list fn-clear">
						<li>
							<label class="name operate-item-label">专题策略ID</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="specialId" value="" maxlength=9/>
							</span>
						</li>
						<li>
							<label class="name">专题名称</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="40"  name="specialName" value=""/></span>
						</li>
						<li>
							<label class="name">专题状态</label>
							<select class="ui-combobox" name="domainStatus" id="domainStatus" >
								<option value="" >全部</option>
								<option value="1">未开始</option>
								<option value="2" selected ="selected">进行中</option>
								<option value="3">已结束</option>
							</select>
						</li>
					</ul>
					<ul class="search-list fn-clear">
					<li class="date">
							<label class="name ui-change-item-label">专题时间：</label>
								<input id="startTime" name="effTimestr" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#endTime']">
							 <em class="ui-channel-titcolor">至</em>
							  <input id="endTime" name="expTimestr" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#startTime']">
						</li>
						<li>
							<label class="name">审核状态</label>
							<select class="ui-combobox" name="exsts" id="exsts">
								<option value="">全部</option>
								<option value="1">待审核</option>
								<option value="2">审核未通过</option>
								<option value="3" >审核通过</option>
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
				<a href="${base}/operate/findSpecialProduct" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增专题</a>
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
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
			url:'${base}/operate/findSpecialView',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			idField:'specialId',
			sortName:'effTime',
			sortOrder:'desc',
			columns:[[
				{field:'specialId',align:'center',width:"10%",title:'专题策略ID',
		          	 formatter:function(value,rec){
			          	 var url='${base}/operate/findSpecialEditInfo';
						return '<a class="operation-link" href="'+url+'?specialId='+rec.specialId+'&domainsts='+rec.domainStatus+'">'+rec.specialId+'</a>';
					  }},
				{field:'specialName',align:'center',width:"20%",title:'专题名称'},
				{field:'domainStatus',align:'center',width:"12%",title:'专题状态',
				formatter:function(value,rec){
						 var str = "其他";
						if(rec.domainStatus == 1){
							str = "未开始";
						}if(rec.domainStatus == 2){
							str = "进行中";
						}if(rec.domainStatus == 3){
							str = "已结束";
						}
						return str;
					}},
					{field:'sts',align:'center',width:"12%",title:'专题状态',
				formatter:function(value,rec){
						 var str = "其他";
						if(rec.sts == 10){
							str = "有效";
						} else{
						  str = "无效";
						}
						return str;
					}},
					{field:'auditSts',align:'center',width:"12%",title:'审核状态',
				formatter:function(value,rec){
						 var str = "其他";
						if(rec.auditSts == 1){
							str = "审核通过";
						}if(rec.auditSts == -1){
							str = "审核未通过";
						}if(rec.auditSts == 0){
							str = "待审核";
						}
						return str;
					}},
				{field:'effTime',align:'center',width:"15%",title:'开始时间',sortable:true,
					formatter:function(value,rec){
					    return formatTimestamp(rec.effTime);
					}},
				{field:'expTime',align:'center',width:"15%",title:'结束时间',sortable:true,
					formatter:function(value,rec){
					    return formatTimestamp(rec.expTime);
					}}
			]],

			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      },
    onLoadSuccess:function(){
      		pageCls();
      		sortCell(['effTime','expTime']);//排序要显示箭头的，以数组形式传
      	}
		});
		//分页
		pageAction();
		
   });
     
	</script>
</body>
</html>