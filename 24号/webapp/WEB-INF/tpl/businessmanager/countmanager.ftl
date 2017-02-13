<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>交易统计</title>
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
					<ul class="search-list fn-clear">
						<li class="date">
							<label class="name">统计日期</label>
								<input id="startTime" name="beginDate" value="${startTime?string('yyyy-MM-dd')}" class="easyui-datebox" data-options="editable:false"  validType="mdMonth['#countEndTime']">
							  <em class="ui-channel-titcolor">至</em>
							  <input id="countEndTime" name="endDate" value="${endTime?string('yyyy-MM-dd')}" class="easyui-datebox" data-options="editable:false"  validType="mdMonth['#startTime']" >
						</li>
						<li>
							<label class="name">来源类别</label>
							<select class="ui-combobox" name="productSource" id="productSource">
								<option value="0" selected ="selected">全部</option>
								<option value="1">E保自研</option>
							</select>
						</li>
						<li>
							<label class="name">承保公司</label>
							<select class="ui-combobox" name="insurerId" id="insurerId">
								<option value="0" selected ="selected">全部</option>
								<#list insurersPoList as insurersPo>
									<option value="${insurersPo.insurerId}">${insurersPo.insurerName}</option>
								</#list>
							</select>
						</li>
					</ul>
					<ul class="search-list fn-clear">
						<li>
							<label class="name">保险名称</label>
							<span class="textbox"><input name="productName" id="productName" class="textbox-text textbox-prompt" type="text" maxlength="40"/></span>
						</li>
						
						<li class="btn-group">
							<a href="javascript:void(0)" class="search-btn" onclick="submitForm()">统计</a>
				    		<a href="javascript:void(0)" class="search-btn" onclick="clearForm()">重置</a>
						</li>
					</ul>
				</form>
				<input id="search-time" type="hidden"/>
			</div>
			<!-- 搜索end -->
			<!-- 列表 -->
			<div class="list-item fn-clear">
				
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
			url:'${base}/businessmanager/getTradeCountRecords',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			idField:'tradeDate',//id字段
			sortName:'tradeDate',//当数据表格初始化时以哪一列来排序
			sortOrder:'desc',//'asc'/'desc'（正序/倒序）
			//remoteSort: false,//定义是否通过远程服务器对数据排序
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			title: "标题",
			columns:[[
				{field:'tradeDate',align:'center',width:"20%",title:'时间',sortable:true,
					formatter:function(value,rec){
					    return formatDate(rec.tradeDate);
					}
				},
				{field:'productName',align:'center',width:"20%",title:'保险名称',
					formatter:function(value,rec){
						return '<a class="detail-link" href="${base}/product/toProductDetailMsg?productId='+rec.productId+'">'+value+'</a>';
					}
				},
				{field:'productSource',align:'center',width:"16%",title:'来源分类',
					formatter:function(value,rec){
						if(rec.productSource == 1){
							return 'E保自研产品';
						}else{
					    	return '保险公司';
					    }
					}
				},
				{field:'insurerName',align:'center',width:"14%",title:'承保公司'},
				{field:'insureCount',align:'center',width:"14%",title:'销售量(单)',sortable:true,
						formatter:function(value,rec){
						    var beginDate = formatDate(rec.tradeDate);
							return '<a class="detail-link" href="${base}/businessmanager/salesamount?productId='+rec.productId+'&beginDate='+beginDate+'&endDate='+beginDate+'">'+value+'</a>';
						}
				},
				{field:'payAmount',align:'center',width:"14%",title:'销售金额(元)',sortable:true,
						formatter:function(value,rec){
							var beginDate = formatDate(rec.tradeDate);
							return '<a class="detail-link" href="${base}/businessmanager/salesmoney?productId='+rec.productId+'&beginDate='+beginDate+'&endDate='+beginDate+'">'+eb.fenToThousands(value)+'</a>';
						}
				}
			]],
			queryParams: eb.form2Json("search-ff"),
			loadFilter:function(data){
			       if(data.records.length!=0){
						var beginDate=$('input[name="beginDate"]').val(),
						    endDate=$('input[name="endDate"]').val();
						var titleHtml='<div class="query-result-title query-result-two"><span class="query-result-span">截至'+endDate
									+'</span><span class="query-result-span">累计销售量为：<em class="query-result-num">'+data.businessMap["tradeCountAdminPo"].insureCount+'</em> 笔，累计销售金额为：'
									+'<em class="query-result-num">'+eb.fenToThousands(data.businessMap["tradeCountAdminPo"].payAmount)+'</em>元</span>'
									+'<div class="query-result-span">统计时间'+beginDate+'至'+endDate+'</span>'
									+'<span class="query-result-span">总计销售量：<em class="query-result-num">'+data.businessMap["tradeCountAdminTimePo"].insureCount+'</em> 单,总计销售金额：'
									+'<em class="query-result-num">'+eb.fenToThousands(data.businessMap["tradeCountAdminTimePo"].payAmount)+'</em> 元</div></div>';
						$(".panel-title").html(titleHtml).show();
						
						$('#search-time').val(beginDate+'_'+endDate);
					}
		            return eb.loadFilter(data);//自定义过滤方法
		
		     },
		     onLoadSuccess:function(){
	           pageCls();
	           sortCell(['tradeDate','insureCount','payAmount']);//排序要显示箭头的，以数组形式传
	     	}
		});
		//分页
		pageAction();
		
   });
	
	</script>
</body>
</html>