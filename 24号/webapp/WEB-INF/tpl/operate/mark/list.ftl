
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>自研产品管理-产品信息管理-产品管理</title>
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
							<label class="name operate-item-label">定价策略ID</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="priceId" maxlength="9"  value=""/>
							</span>
						</li>
						<li>
							<label class="name">保险名称</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="40"  name="productName" value=""/></span>
						</li>
						<li>
							<label class="name">保费范围</label>
							<select class="ui-combobox" name="bettemoney" id="transaceAmount" >
								<option value="0">全部</option>
								<option value="1">0-1元</option>
								<option value="2">1-10元</option>
								<option value="3">10-50元</option>
								<option value="4">50-100元</option>
								<option value="5">100元及以上</option>
								<option value="6">自定义</option>
							</select>
							<span class="ui-hidden fn-hide" id="customToggle">
								<input name="minProducePrice" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo decimal-ptblur" maxlength="10"  data-options="validType:['customMoney']" id="moneyStart">
								<em class="ui-channel-titcolor">至</em>
								<input name="maxProducePrice" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo decimal-ptblur" maxlength="10" data-options="validType:['customMoney','moneycompare[\'#moneyStart\']']">
								<em class="ui-channel-titcolor">元</em>
							</span>
						</li>
						<li>
							<label class="name">折扣范围</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt easyui-validatebox" data-options="validType:['parcenty']" maxlength="2"  type="text" name="discountRate" value="" id="discountRate"/>
							</span>
							<em class="ui-channel-titcolor">至</em>
							<span class="textbox"><input class="textbox-text textbox-prompt easyui-validatebox" type="text" name="discountRatestr" data-options="validType:['parcenty','moneycompare[\'#discountRate\']']" maxlength="2"   value=""/>
							</span>%
						</li>
					</ul>
					<ul class="search-list fn-clear">
					<li>
							<label class="name">上架渠道</label>
							<select name="domainId" class="ui-combobox" id="domainId">
						<option value="">全部</option>
						  <#list dList as item>
                        <option value="${item.domainId}">${item.domainName}</option>
                        </#list>
                        </select>
						</li>
						<li>
							<label class="name">促销状态</label>
							<select class="ui-combobox" name="domainStatus" id="domainStatus">
							<option value="">全部</option>
							<option value="1" >促销未开始</option>
							<option value="2" selected ="selected">促销中</option>
							<option value="3" >促销已结束</option>
							</select>
						</li>
						<li class="date">
							<label class="name ui-change-item-label">促销时间：</label>
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
								<option value="3" selected ="selected">审核通过</option>
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
				<a href="${base}/operate/findMarkProduct" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增促销产品</a>
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
			url:'${base}/operate/findmarkView',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			idField:'productId',
			sortName:'maxPremium',
			sortOrder:'desc',
			columns:[[
				{field:'priceId',align:'center',width:"10%",title:'定价策略ID',
		          	 formatter:function(value,rec){
			          	 var url='${base}/operate/findMarkPriceInfo';
						return '<a class="operation-link" href="'+url+'?priceId='+rec.priceId+'">'+rec.priceId+'</a>';
					  }},
				{field:'productName',align:'center',width:"14%",title:'保险名称'},
				{field:'minPremium',align:'center',width:"10%",title:'保费金额(元)',sortable:true,
					formatter: function(value,rec){
					 if(rec.minPremium==rec.maxPremium){
					    return (rec.minPremium/100).toFixed(2);
					}
    	                return (rec.minPremium/100).toFixed(2)+"-"+(rec.maxPremium/100).toFixed(2);
               		}},
               		{field:'domainName',align:'center',width:"14%",title:'上架渠道'},
				{field:'discountRate',align:'center',width:"10%",title:'折扣比例(%)',sortable:true},
				{field:'domainStatus',align:'center',width:"10%",title:'促销状态',
				formatter:function(value,rec){
						 var str = "其他";
						if(rec.domainStatus == 1){
							str = "促销未开始";
						}if(rec.domainStatus == 2){
							str = "促销中";
						}if(rec.domainStatus == 3){
							str = "促销已结束";
						}
						return str;
					}},
					{field:'sts',align:'center',width:"10%",title:'定价状态',
				formatter:function(value,rec){
						 var str = "其他";
						if(rec.sts == 10){
							str = "有效";
						}else{
						  str = "无效";
						}
						return str;
					}},
					{field:'auditSts',align:'center',width:"10%",title:'审核状态',
				formatter:function(value,rec){
						 var str = "其他";
						if(rec.auditSts == 1){
							str = "审核通过";
						}if(rec.auditSts == 0){
							str = "待审核";
						}if(rec.auditSts == -1){
							str = "审核未通过";
						}
						return str;
					}},
				{field:'effTime',align:'center',width:"12%",title:'开始时间',sortable:true,
					formatter:function(value,rec){
					    return formatTimestamp(rec.effTime);
					}},
				{field:'expTime',align:'center',width:"12%",title:'结束时间',sortable:true,
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
      		sortCell(['maxPremium','discountRate','minPremium','effTime','expTime']);//排序要显示箭头的，以数组形式传
      	}
		});
		//分页
		pageAction();
		
		
   });
   
  
  
   
	</script>
</body>
</html>