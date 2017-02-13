<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>分销商渠道统计</title>
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
			<div>
                           
               <a class="ui-btn-blue ui-channel-bottombtn" href="newchannel.html">新增分销商</a>
            </div>
		</div>
		
	</div>

	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'channel_amount.json',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			columns:[[
				{field:'agentAreaCity',align:'center',width:"18%",title:'新增分销商数',
						formatter:function(value,rec){
						
							return '<a class="detail-link" href="policydetail.html">'+value+'</a>';
						}
				},
				{field:'agentAreaCityName',align:'center',width:"20%",title:'占比'},
				{field:'truename',align:'center',width:"20%",title:'有效分销商数'},
				{field:'agentAreaCounty',align:'center',width:"20%",title:'占比'},
				{field:'agentId',align:'center',width:"20%",title:'总分销商数'}
			]],
			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      },
      onLoadSuccess:pageCls
		});
	
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