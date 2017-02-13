<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->
	<title>订单管理</title>
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
							<label class="name">查询日期</label>
								<input id="startTime" name="beginDate" value="${startTime?string('yyyy-MM-dd')}" class="easyui-datebox" data-options="editable:false"  validType="md['#endTime']">
							   <em class="ui-channel-titcolor">至</em>
							  <input id="endTime" name="endDate" value="${endTime?string('yyyy-MM-dd')}" class="easyui-datebox" data-options="editable:false"  validType="md['#startTime']" >
						</li>
						<li>
							<label class="name">订单号</label>
							<span class="textbox"><input name="tradeId" class="textbox-text textbox-prompt" type="text" maxlength="20" value="${tradeId?if_exists}"/></span>
						</li>
						<li>
							<label class="name">交易金额</label>
							<select class="ui-combobox" name="selectAmount" id="transaceAmount">
								<option value="0" selected ="selected">全部</option>
								<option value="1">0-1元</option>
								<option value="2">1-10元</option>
								<option value="3">10-50元</option>
								<option value="4">50-100元</option>
								<option value="5">100元及以上</option>
								<option value="10">自定义</option>
							</select>
							<span class="ui-hidden fn-hide" id="customToggle">
								<input name="customAmountLow" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover" maxlength="10"  data-options="validType:['customMoney']" id="moneyStart">
								<em class="ui-channel-titcolor">至</em>
								<input name="customAmountHight" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover" maxlength="10" data-options="validType:['customMoney','moneycompare[\'#moneyStart\']']">
								<em class="ui-channel-titcolor">元</em>
							</span>
							
						</li>
						
					</ul>
					<ul class="search-list fn-clear">
						<!--<li>
							<label class="name">用户ID</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" name="userId" type="text"  maxlength="9" value="${userId?if_exists}"/></span>
						</li>-->
						<input class="textbox-text textbox-prompt" name="userId" type="hidden"  maxlength="9" value="${userId?if_exists}"/>
						<li>
							<label class="name">订单状态</label>
							<select class="ui-combobox" name="orderSts" id="">
								<option value="" selected ="selected">全部</option>
								<option value="10">待支付</option>
								<option value="18">已支付待激活</option>
								<option value="20">已支付待发货</option>
								<option value="25">已激活待审核</option>
								<option value="30">发货中</option>
								<option value="35">已发货</option>
								<option value="50">已退款</option>
								<option value="-11">已失效</option>
								<option value="-12">已关闭</option>
								<option value="-13">已删除</option>
							</select>
						</li>
						<li>
							<label class="name">分销渠道</label>
							
							<select class="ui-combobox" name="domainId" id="">
								<option value="" selected ="selected">全部</option>
								<#list domianList as domain>
								<option value="${domain.domainId}">${domain.domainName}</option>
								</#list>
							</select>
						</li>
						<li>
							<label class="name">保险名称</label>
							<span class="textbox"><input name="productName" class="textbox-text textbox-prompt" type="text" maxlength="40"/></span>
						</li>
					</ul>
					
					<ul class="search-list fn-clear">
							<li>
								<label class="name">用户姓名</label>
								<span class="textbox"><input name="policyholderName" class="textbox-text textbox-prompt" type="text" maxlength="10"/></span>
							</li>
							<li>
								<label class="name">用户手机</label>
								<span class="textbox"><input name="mobile" class="textbox-text textbox-prompt" type="text" maxlength="11"/></span>
							</li>
							<li>
								<label class="name">代理人</label>
								<span class="textbox"><input name="tradeAgent" class="textbox-text textbox-prompt" type="text" maxlength="10"/></span>
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
				
				<table id="dg-list" class="ebao-datagrid" >	
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
			url:'${base}/businessmanager/findOrderList',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			idField:'userid',//id字段
			sortName:'tradeDate',//当数据表格初始化时以哪一列来排序
			sortOrder:'desc',//'asc'/'desc'（正序/倒序）
			//remoteSort: false,//定义是否通过远程服务器对数据排序
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'tradeId',align:'center',width:"15%",title:'订单号',
						formatter:function(value,rec){
							return '<a class="detail-link" href="${base}/businessmanager/findTradeDetails?tradeId='+rec.tradeId+'">'+value+'</a>';
						}
				},
				{field:'productName',align:'center',width:"15%",title:'保险名称',
					formatter:function(value,rec){
						return '<a class="detail-link" href="${base}/product/toProductDetailMsg?productId='+rec.productId+'">'+value+'</a>';
					}
				},
				{field:'domainName',align:'center',width:"8%",title:'分销渠道'},
				{field:'tradeDate',align:'center',width:"15%",title:'投保时间',sortable:true,
					formatter:function(value,rec){
					    return formatTimestamp(rec.tradeDate);
					}
				},
				{field:'policyholderName',align:'center',width:"8%",title:'投保人姓名'},
				{field:'mobile',align:'center',width:"12%",title:'投保人手机号码'},
				{field:'payAmount',align:'center',width:"10%",title:'交易金额(元)',sortable:true,
				  formatter:function(value,rec){
					    return eb.fenToThousands(rec.payAmount);
					}
				},
				{field:'tradeSts',align:'center',width:"10%",title:'订单状态',
					formatter:function(value,rec){
						if(value == 10){
							return '<em class="ui-red">待支付</em>';
						}else if(value == 18){
							return '<em class="ui-green">已支付待激活</em>';
						}else if(value == 20){
							return '<em class="ui-green">已支付待发货</em>';
						}else if(value == 25){
							return '<em class="ui-green">已激活待审核</em>';
						}else if(value == 30){
							return '<em class="ui-green">发货中</em>';	
						}else if(value == 35){
							return '<em class="ui-green">已发货</em>';
						}else if(value == 50){
							return '<em class="ui-grey">已退款</em>';
						}else if(value == -11){
							return '<em class="ui-grey">已失效</em>';
						}else if(value == -12){
							return '<em class="ui-grey">已关闭</em>';
						}else if(value == -13){
							return '<em class="ui-grey">已删除</em>';
						}else if(value == -30){
							return '<em class="ui-grey">发货失败</em>';
						}
					}
				},
				{field:'tradeAgent',align:'center',width:"8%",title:'代理人',
					formatter:function(value,rec){
						if(value == null){
							return '无';
						}else{
							return value;
						}
					}
				}
			]],
			queryParams: eb.form2Json("search-ff"),
	        loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
        },
        onLoadSuccess:function(){
	           pageCls();
	           sortCell(['tradeDate','payAmount']);//排序要显示箭头的，以数组形式传
	     }
	});
		//分页
		pageAction();

   });
	
	</script>
</body>
</html>