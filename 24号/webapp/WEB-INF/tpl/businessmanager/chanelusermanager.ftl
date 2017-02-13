<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>交易渠道使用记录</title>
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
							<label class="name">订单号</label>
							<span class="textbox"><input name="tradeId" class="textbox-text textbox-prompt" type="text" maxlength="20"/></span>
						</li>
						<li>
							<label class="name">保险名称</label>
							<span class="textbox"><input name="productName" class="textbox-text textbox-prompt" type="text" maxlength="40"/></span>
						</li>
						<li>
							<label class="name">用户ID</label>
							<span class="textbox"><input name="userId" class="textbox-text textbox-prompt" type="text" maxlength="9"/></span>
						</li>
						<li>
							<label class="name">支付渠道</label>
							<select class="ui-combobox" name="paymentId" id="transaceAmount">
								<option value="-10001" selected ="selected">全部</option>
								<#list paymentsPoList as paymentsPo>
									<option value="${paymentsPo.paymentId}">${paymentsPo.paymentName}</option>
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
			<div class="list-item list-noadd fn-clear">
				
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
			url:'${base}/businessmanager/getPayDomainsUsedList',
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
				{field:'tradeId',align:'center',width:"20%",title:'订单号',
					formatter:function(value,rec){
						return '<a class="detail-link" href="${base}/businessmanager/findTradeDetails?tradeId='+rec.tradeId+'">'+value+'</a>';
					}
				},
				{field:'productName',align:'center',width:"20%",title:'保险名称',
					formatter:function(value,rec){
						return '<a class="detail-link" href="${base}/product/toProductDetailMsg?productId='+rec.productId+'">'+value+'</a>';
					}
				},
				{field:'userId',align:'center',width:"10%",title:'用户ID',
					formatter:function(value,rec){
						return '<a class="detail-link" href="${base}/user/toAccountDetailMsg?userId='+value+'">'+value+'</a>';
					}
				},
				{field:'payTime',align:'center',width:"14%",title:'支付时间',
					formatter:function(value,rec){
					    return formatTimestamp(rec.payTime);
					}
				},
				{field:'payAmount',align:'center',width:"13%",title:'支付金额(元)',
					formatter:function(value,rec){
					    return eb.fenToThousands(rec.payAmount);
					}
				},
				{field:'paymentName',align:'center',width:"11%",title:'支付渠道'},
				{field:'payCommission',align:'center',width:"10%",title:'手续费(元)',
					formatter:function(value,rec){
					    return eb.fenToThousands(rec.payCommission);
					}
				}
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
	</script>
</body>
</html>