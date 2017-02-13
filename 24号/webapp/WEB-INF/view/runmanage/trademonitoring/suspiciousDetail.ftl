<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-实时监控-可疑交易查询</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	    <#include "/common/include/power.ftl">
		<!-- <a class="crumbs-link" href="#">运营管理 <span>></span></a>
		<a class="crumbs-link" href="#">实时监控<span>></span></a>
		<span class="crumbs-tit">可疑交易查询</span> -->
	</div>
  <div class="ui-info-content">
		<div class="ui-info-wrap">
 	  		<h3 class="ui-info-tit">可疑交易详情</h3>
			<div class="ui-infobg">
				<table class="ui-center-tab">
					   <tr>
					    <td class="ui-oddtd">交易流水号：</td>
					    <td>${mdl.orderNo}</td>  
					   </tr>
					     <tr>
					    <td class="ui-oddtd">交易时间：</td>
					    <td>${mdl.createTimeString}</td>  
					   </tr>
					     <tr>
					    <td class="ui-oddtd">用户账户名：</td>
					    <td>
					    	${mdl.userName}
					    	<a class="ui-trans-btn ui-trans-logn-btn" href="/runManage/tradeMonitoring/history?userId=${mdl.userId}&&userName=${mdl.userName}">用户交易明细</a>
					    </td>  
					   </tr>
					     <tr>
					    <td class="ui-oddtd">用户ID：</td>
					    <td>${mdl.userId}</td>  
					   </tr>
					     <tr>
					    <td class="ui-oddtd">商户名：</td>
					    <td>${mdl.sellerName}</td>  
					   </tr>
					     <tr>
					    <td class="ui-oddtd">商户ID：</td>
					    <td>${mdl.sellerId}</td>  
					   </tr>
					     <tr>
					    <td class="ui-oddtd">交易类型：</td>
					    <td>${mdl.operTypeName}</td>  
					   </tr>
					     <tr>
					    <td class="ui-oddtd">交易金额：</td>
					    <td>${mdl.transactionMoneyYuan}元</td>  
					   </tr>
					     <tr>
					    <td class="ui-oddtd">交易摘要：</td>
					    <td>${mdl.transactionDesc}</td>  
					   </tr>
					     <tr>
					    <td class="ui-oddtd">可疑类型：</td>
					    <td>${mdl.suspiciousTypeName}</td>  
					   </tr>
					     <tr>
					    <td class="ui-oddtd">支付请求IP地址：</td>
					    <td>${mdl.askIp}</td>  
					   </tr>
					     <tr>
					    <td class="ui-oddtd">支付提交IP地址：</td>
					    <td>${mdl.paymentIp}</td>  
					   </tr>
					  <tr>
					    <td class="ui-oddtd">交易状态：</td>
					    <td>${mdl.transactionStateName}</td>  
					   </tr>
	      		</table>
			</div>
		</div>
		<div class="ui-submit-warp" style="width: 589px;">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      ${fButton(list,"USERSET","<a class='ui-red-btn' href='javascript:setSusDetail(0,\"${mdl.userName}\",${mdl.userId},\"@URL@\")'>禁用用户</a>")}
	      ${fButton(list,"ACCOUNTSET","<a class='ui-red-btn' href='javascript:setSusDetail(1,\"${mdl.userName}\",${mdl.userId},\"@URL@\")'>冻结用户</a>")}
	      ${fButton(list,"ADDBLACK","<a class='ui-red-btn' href='javascript:setSusDetail(2,\"${mdl.userName}\",${mdl.userId},\"@URL@\")'>加入黑名单</a>")}
		  <!-- <a class="ui-red-btn" href="javascript:setSusDetail(0,'${mdl.userName}',${mdl.userId});">禁用用户</a>
		  <a class="ui-red-btn" href="javascript:setSusDetail(1,'${mdl.userName}',${mdl.userId});">冻结用户</a>  
		  <a class="ui-red-btn" href="javascript:setSusDetail(2,'${mdl.userName}',${mdl.userId});">加入黑名单</a> -->
	    </div>
	</div>
</div>
<!--设置-->
<div id="dlgConfirm" class="ui-dialog warn-dialog confirm-dialog">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text">确定要将<span id="del-tip"></span>的用户状态<span id="del-text"></span>吗？</div>
       <input type="hidden" id="del-hideId"/>
       <input type="hidden" id="del-hideUrl"/>
	   <a href="javascript:ajaxSusDetail(${mdl.userId});" class="ui-red-btn">确 定</a>
	   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
	</div>
</div>
<!--设置成功-->
<div id="dlgOk" class="ui-dialog ok2-dialog ui-dlgOk">
	   <div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
       <div class="ui-dlg-text"><span class="dlg-text-suc"></span>成功！</div>
       <a href="javascript:;" class="ui-red-btn" onclick="refresh();">确 定</a>
	</div>
</div>
<!--设置失败-->
<div id="dlgWarn" class="ui-dialog warn-dialog">
	<div class="ui-dlg-content ui-relative">
      <div class="ui-dlg-text"><span class="dlg-text-suc"></span>失败！</div>
      <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" onclick="refresh();">确 定</a>
	</div>
</div>
</body>
</html>