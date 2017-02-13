

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>保险经纪管理平台</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
    
</head>
<body>
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
    <div class="ui-info-main">
         <div class="ui-informate">
         	<div class="ui-informate-base">
         		<table class="ui-base-table">
         			<tr class="ui-base-rowborder">
         				<td colspan="4" class="ui-base-tit">
         					账号信息
         				</td>
         			</tr>
         			<tr class="ui-base-rowbg ui-base-rowborder">
         				<td class="ui-base-colsinfor">
         					<label class="ui-base-label">用户ID</label>
     						<span class="ui-base-data">${accountMsgList.userId}</span>
         				</td>
         				<td class="ui-base-colsinfor">
         					<label  class="ui-base-label">账号</label>
     						<span  class="ui-base-data">${accountMsgList.username}</span>
         				</td>
         				<td class="ui-base-colsinfor">
         					<label class="ui-base-label">注册方式</label>
     						<span  class="ui-base-data">
     						<#if accountMsgList.acctType == 10>
     							手机注册
     						<#elseif accountMsgList.acctType == 11>
     							Email账户
     						<#else>
     							其他账户
     						</#if>
     						</span>
     					</td>
         			</tr>
         			<tr class="ui-base-rowborder">
         				<td class="ui-base-colsinfor">
         					<label class="ui-base-label">用户来源</label>
     						<span  class="ui-base-data">
	     						${accountMsgList.domainName}
     						</span>
         				</td>
         				<td class="ui-base-colsinfor">
         					<label class="ui-base-label">注册时间</label>
     						<span  class="ui-base-data">
	     						<#if accountMsgList.createTime?? >
	     							${accountMsgList.createTime?string("yyyy-MM-dd HH:mm:ss")}
	     						<#else>
	     							无
	     						</#if>
     						</span>
         				</td>
         				<td class="ui-base-colsinfor">
         					<label class="ui-base-label">最后登录时间</label>
     						<span  class="ui-base-data">
     							<#if accountMsgList.lastLoginTime??>
	     							${accountMsgList.lastLoginTime?string("yyyy-MM-dd HH:mm:ss")}
	     						<#else>
	     							无
	     						</#if>
     						</span>
         				</td>
         			</tr>
         			<table>
         			<table class="ui-base-table">
         			<#--
         			<tr class="ui-base-rowborder ui-base-rowbg">
         				<td colspan="4" class="ui-base-tit">
         					账号信息
         				</td>
         			</tr>
         			<tr class="ui-base-rowborder">
         				<td class="ui-base-colsinfor ui-base-colwidth">
         					<label class="ui-base-label ui-base-currcol">账号余额</label>
     						<span class="ui-base-data">100.00</span>
         				</td>
         				<td class="ui-base-colsinfor ui-base-colwidth">
         					<label  class="ui-base-label">积分</label>
     						<span  class="ui-base-data">100</span>
         				</td>
         				<td class="ui-base-colsinfor ui-base-colwidth">
         					<label class="ui-base-label">优惠券</label>
     						<span  class="ui-base-data">2张</span>
         				</td>
         				<td class="ui-base-colsinfor ui-base-colwidth">
         					<label class="ui-base-label">红包</label>
     						<span  class="ui-base-data">2个</span>
         				</td>
         			</tr>
         		</table>
         		-->
     			<table class="ui-base-table">
         			<tr class="ui-base-rowborder">
         				<td colspan="4" class="ui-base-tit">
         					个人信息
         				</td>
         			</tr>
         			<tr class="ui-base-rowbg ui-base-rowborder">
         				<td class="ui-base-colsinfor">
         					<label class="ui-base-label">姓名</label>
     						<span class="ui-base-data">${accountMsgList.realName}</span>
         				</td>
         				<td class="ui-base-colsinfor">
         					<label  class="ui-base-label">证件类型</label>
     						<span  class="ui-base-data">
	     						<#if accountMsgList.idenType == 1>
	     							身份证
	     						<#elseif accountMsgList.idenType == 2>
	     							军官证
	     						<#elseif accountMsgList.idenType == 3>
	     							护照
	     						<#elseif accountMsgList.idenType == 4>
	     							驾驶证
	     						<#elseif accountMsgList.idenType == 5>
	     							港澳台通行证
	     						<#elseif accountMsgList.idenType == 6>
	     							回乡证
	     						<#else>
	     							
	     						</#if>
     						</span>
         				</td>
         				<td class="ui-base-colsinfor">
         					<label class="ui-base-label">证件号码</label>
     						<span  class="ui-base-data">${accountMsgList.idenNo}</span>
     					</td>
         			</tr>
         			<tr class="ui-base-rowborder">
         				<td class="ui-base-colsinfor">
         					<label class="ui-base-label">生日</label>
     						<span class="ui-base-data">
     							<#if accountMsgList.userBirthday?? >
	     							${accountMsgList.userBirthday?string("yyyy-MM-dd")}
	     						<#else>
	     							
	     						</#if>
     						</span>
         				</td>
         				<td class="ui-base-colsinfor">
         					<label  class="ui-base-label">性别</label>
     						<span  class="ui-base-data">
     							<#if accountMsgList.userGender == 1>
	     							男
	     						<#elseif accountMsgList.userGender == 2>
	     							女
	     						<#else>
	     							
	     						</#if>
     						</span>
         				</td>
         				<td class="ui-base-colsinfor">
         					<label class="ui-base-label">电子邮件</label>
     						<span  class="ui-base-data">${accountMsgList.email}</span>
     					</td>
         			</tr>
         			<tr class="ui-base-rowborder ui-base-rowbg">
         				<td colspan="4" class="ui-base-colsinfor ui-base-onway">
         					<label class="ui-base-label ui-base-onway-label">地址</label>
     						<span  class="ui-base-data ui-base-onway-data">${accountMsgList.userAddress}</span>
         				</td>
         				
         			</tr>
         			<table>
         			<!-- 列表 -->
					<div class="list-item fn-clear">
						<h4 class="ui-base-tit">交易信息</h4>
						<span class="ui-base-onway-label">共${count}条记录</span>
						<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
						</table>
					</div>
					<!-- 列表end -->
         	</div>
    	</div>
    	<div class="ui-infor-box-bottom">
    		<a href="javascript:history.back();" class="ui-a-return">返回</a>
    	</div>
    	
	</div>

	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'${base}/user/findTradeMsg?userId='+${accountMsgList.userId},
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			//idField:'userid',//id字段
			sortName:'tradeDate',//当数据表格初始化时以哪一列来排序
			sortOrder:'desc',//'asc'/'desc'（正序/倒序）
			//remoteSort: false,//定义是否通过远程服务器对数据排序
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'tradeDate',align:'center',width:"11%",title:'投保时间',sortable:true,
					formatter:function(value,rec){
						if(value == "" || value == null){
							return "";
						} else {
							return formatTimestamp(value);
						}
					}
				},
				{field:'tradeId',align:'center',width:"18%",title:'订单号',
					formatter:function(value,rec){
						if(value == null || value == ""){
							return "";
						} else {
							return '<a href="${base}/businessmanager/findTradeDetails?tradeId='+value+'">'+rec.tradeId+'</a>';
						}
					}
				},
				{field:'policyNo',align:'center',width:"10%",title:'保单号',
					formatter:function(value,rec){
						if(value == null || value == ""){
							return "";
						} else {
							return '<a href="${base}/businessmanager/findPolicyDetails?detailId='+rec.detailId+'">'+rec.policyNo+'</a>';
						}
					}
				},
				{field:'productName',align:'center',width:"22%",title:'产品名称'},
				{field:'payAmount',align:'center',width:"14%",title:'金额(元)',
					formatter:function(value,rec){
						if(value == null || value == ""){
							return "";
						} else {
							return value/100;
						}
					}
				},
				{field:'tradeStsStr',align:'center',width:"11%",title:'订单状态'},
				{field:'paymentName',align:'center',width:"12%",title:'支付方式'}
			]],
			queryParams: eb.form2Json("search-ff"),
		    loadFilter:function(data){
	            return eb.loadFilter(data);    //自定义过滤方法
		    },
	        onLoadSuccess:pageCls
		});
		//分页
		pageAction2();
		
   });
	function submitForm(){
		if($('#search-ff').form('validate')){
			    //eb.backToFstPage("#datagrid");
				$("#dg-list").datagrid({queryParams : eb.form2Json("search-ff")});
				 pageAction2();
			}
	}
	function clearForm(){
		$("#search-ff").form('clear');
	}
	
	</script>
</body>
</html>
