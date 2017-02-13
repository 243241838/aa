<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>分销渠道统计</title>
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
						<li class="date">
							<label class="name ui-change-item-label">统计日期：</label>
							<input id="startTime" class="easyui-datebox" data-options="editable:false" vlaue="" validType="mdMonth['#endTime']" name="startDateTime">
							<em class="ui-channel-titcolor">至</em>
							<input id="endTime" class="easyui-datebox" data-options="editable:false" vlaue="" validType="mdMonth['#startTime']" name="endDateTime">
						</li>
						<li>
							<label class="name ui-change-item-label">分销商名称：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="20"/></span>
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
			url:'channel_produce.json',
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
			title: "标题",
			columns:[[
				{field:'agentAreaCity',align:'center',width:"26%",title:'统计日期'},
				{field:'agentAreaCityName',align:'center',width:"20%",title:'分销商名称'},
				{field:'truename',align:'center',width:"20%",title:'销售量(单)'},
				{field:'agentAreaCounty',align:'center',width:"30%",title:'销售额(元)'}
			]],
			queryParams: eb.form2Json("search-ff"),
	   loadFilter:function(data){
				var beginDate=$("#startTime").datebox('getValue'),
				    endDate=$("#endTime").datebox('getValue');
				var allBalance=!isNaN(Number(data.message))?(Number(data.message)/100).toFixed(2):"0.00";

				var titleHtml='<div  class="query-result-title">截止'+endDate+'，销售量总计：<em class="query-result-num">'+data.titleDetail.alluser+'</em>单<span class="query-result-span">销售额总计：<em class="query-result-num">'+data.titleDetail.newuser+'</em>元</span>统计日期'+beginDate+'至'+endDate+'，销售量：<em class="query-result-num">'+data.titleDetail.countuser+'</em>单；<span class="query-result-span">销售额：<em class="query-result-num">'+data.titleDetail.money+'</em>元</span></div>';
				$(".panel-title").html(titleHtml);
				$(".panel-title").show();
	            return eb.loadFilter(data);//自定义过滤方法

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