<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>分销商信息管理</title>
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
							<label class="name ui-change-item-label">产品ID：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="" value=""/></span>
						</li>
						<li>
							<label class="name ui-change-item-label">保险名称：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="" value=""/></span>
						</li>
						<li>
							<label class="name ui-change-item-label">承保公司：</label>
							<select class="ui-combobox" name="" id="transaceAmount">
								<option value="" selected ="selected">全部</option>
								<option value="">中国人保</option>
								<option value="">中国人寿</option>
								<option value="">中国平安</option>
							</select>	
						</li>
						<li>
							<label class="name ui-change-item-label">保费范围：</label>
							<select class="ui-combobox" name="" id="transaceAmount">
								<option value="" selected ="selected">全部</option>
								<option value="">0-1元</option>
								<option value="">1-10元</option>
								<option value="">10-50元</option>
								<option value="">50-100元</option>
								<option value="">100元以上</option>
								<option value="">自定义</option>
							</select>	
						</li>	
					</ul>
					<ul class="search-list fn-clear">
						<li>
							<label class="name ui-change-item-label">保险类别：</label>
							<select class="ui-combobox" name="" id="transaceAmount">
								<option value="" selected ="selected">全部</option>
								<option value="">意外险</option>
								<option value="">健康险</option>
								<option value="">家财险</option>
								<option value="">人身险</option>
							</select>	
						</li>	
						<li>
							<label class="name ui-change-item-label">来源类别：</label>
							<select class="ui-combobox" name="" id="transaceAmount">
								<option value="" selected ="selected">全部</option>
								<option value="">自研</option>
								<option value="">保险公司</option>
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
			<div class="ui-btn-double">
	            <a href="channelproduceeditor.html"><input type="button" value="确认添加" class="ui-btn-blue ui-submit" id="baseSaveInfor"/></a>
	            <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
	        </div>
		</div>
		
	</div>

	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'channel_infor.json',
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
				{field:'aa',align:'center',width:"10%",checkbox:true},
				{field:'agentAreaCity',align:'center',width:"10%",title:'产品ID',sortable:true,
						formatter:function(value,rec){
						
							return '<a class="detail-link" href="policydetail.html">'+value+'</a>';
						}
				},
				{field:'agentAreaCityName',align:'center',width:"10%",title:"保险名称"},
				{field:'truename',align:'center',width:"10%",title:'承保公司'},
				{field:'agentAreaCounty',align:'center',width:"10%",title:'产品总量'},
				{field:'agentId',align:'center',width:"10%",title:'保费金额(元)'},
				{field:'agentProduceName',align:'center',width:"10%",title:'保险类别'},
				{field:'agentProduceCount',align:'center',width:"10%",title:'来源类别'}
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