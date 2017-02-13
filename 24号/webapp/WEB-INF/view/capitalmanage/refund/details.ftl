<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>退款信息查询-退款详情</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	    <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">资金管理<span>></span></a>
		<a class="crumbs-link" href="#">退款管理 <span>></span></a>
		<span class="crumbs-tit">退款详情</span>-->
	</div>
	<!--详细内容-->
	<div class="ui-info-content" >
	  <div class="ui-info-wrap">
	  	<h3 class="ui-info-tit">退款详情</h3>
	  <#if orderRefund?if_exists && orderRefund?size &gt; 0>
	  <#list orderRefund as orderRefund> 
	  <#if orderRefund.refundType?if_exists && orderRefund.refundType=='1'>   	
			<div class="ui-infobg">
				<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">流水号：</td>
		      	<td>${orderRefund.orderNo}</td>
		      	<td class="ui-oddtd">账户名：</td>
		      	<td>${orderRefund.username}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">实名：</td>
		      	<td>${orderRefund.realname}</td>
		      	<td class="ui-oddtd"></td>
		      	<td></td>
		      </tr>
		       
		      <tr>
		      	<td class="ui-oddtd">退款金额：</td>
		      	<td>${orderRefund.refundSumStr}</td>
		      	<td class="ui-oddtd">退款申请时间:</td>
		      	<td>${orderRefund.createTimeString} </td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">状态：</td>
		      	<td>${orderRefund.stateStr}</td>
		      	<td class="ui-oddtd">退款成功时间:</td>
		      	<td>
		      	<#if orderRefund.successTime??>
		      	${orderRefund.successTime?string('yyyy-MM-dd HH:mm:ss' )}
		      	</#if> 
		      	</td>
		      </tr>
				</table>
		  </div>
		</#if>
		<#if orderRefund?if_exists && orderRefund.refundType?if_exists && orderRefund.refundType=='0'>
			<div class="ui-infobg">
				<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">流水号：</td>
		      	<td>${orderRefund.orderNo}</td>
		      	<td class="ui-oddtd">账户名：</td>
		      	<td>${orderRefund.username}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">实名：</td>
		      	<td>${orderRefund.realname}</td>
		      	<td class="ui-oddtd"></td>
		      	<td></td>
		      </tr>
		     
		      <tr>
		      	<td class="ui-oddtd">退款金额：</td>
		      	<td>${orderRefund.refundSumStr}</td>
		      	<td class="ui-oddtd">退款申请时间:</td>
		      	<td>${orderRefund.createTimeString} </td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">状态：</td>
		      	<td>${orderRefund.stateStr}</td>
		      	<td class="ui-oddtd">退款成功时间:</td>
		      	<td>
		      	<#if orderRefund.successTime??>
		      	${orderRefund.successTime?string('yyyy-MM-dd HH:mm:ss' )}
		      	</#if> </td>
		      </tr>
				</table>
			</div>
		</#if>
		</#list>
		</#if>
	</div>
		
	<#if auditLogs?if_exists> 
		<div class="ui-info-wrap ui-rec-wrap">
	  	<h3 class="ui-info-tit">审核记录</h3>
			<div class="ui-infobg">
				<table class="ui-info-rec" width='100%' >
			      <tr class="ui-first">
			      	<td width="15%">审核阶段</td>
			      	<td width="15%">审核结果</td>
			      	<td width="15%">审核人</td>
			      	<td width="20%">审核时间</td>
			      	<td width="35%">备注</td>
			      </tr>
			     <#list auditLogs as mdl>
			    <#if mdl.currentState?exists && mdl.nextState &gt; 10> 
			      <tr <#if mdl_index+1==auditLogs?size>class="ui-last"</#if> style="word-break:break-all;">
		            <td>
		                 <#if mdl.currentState==10 || mdl.currentState== -10>
		                                             初审
		                 <#elseif mdl.currentState==20 || mdl.currentState== -20>
		                                             一审
		                 <#elseif mdl.currentState==30 || mdl.currentState== -30>
		                                              二审
		                 </#if>
		            </td>
		            <td>${mdl.resultName}</td>
		            <td>${mdl.auditorName}</td>
		            <td>${mdl.auditTimeStr}</td>
		            <td>${mdl.describe}</td>
			      </tr>
			      </#if>
			      </#list>
				</table>
			</div>
		</div>
	</#if>
	
	<form  action="" method="post">
		<div class="ui-submit-warp ui-submit-one">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返回</a><!--onclick=ajaxSubmit('auditForm','dlg','dlgNo')-->
		</div>
    </form>
 </div>
</div>

</body>
</html>