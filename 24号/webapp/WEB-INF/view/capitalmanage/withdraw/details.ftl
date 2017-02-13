<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>提现信息查询->提现详情</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	
</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	    <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">提现管理 <span>></span></a>
		<a class="crumbs-link" href="#">提现信息查询 <span>></span></a>
		<span class="crumbs-tit">提现详情</span>-->
	</div>
	<!--详细内容-->
	<div class="ui-info-content" >
	  <div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">提现详情</h3>
			<div class="ui-infobg">
				<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">流水号：</td>
		      	<td>${orderWithdraw.orderNo}</td>
		      	<td class="ui-oddtd">账户名：</td>
		      	<td>${orderWithdraw.username}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">实名：</td>
		      	<td>${orderWithdraw.realname}</td>
		      	<td class="ui-oddtd"></td><td></td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">银行名称：</td>
		      	<td>${orderWithdraw.institutionName}</td>
		      	<td class="ui-oddtd">开户行所在地:</td>
		      	<td>${orderWithdraw.networksAddress} </td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">开户行：</td>
		      	<td>${orderWithdraw.networksName}</td>
		      	<td class="ui-oddtd">提现账号:</td>
		      	<td>${orderWithdraw.cardNumber} </td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">提现金额：</td>
		      	<td>${orderWithdraw.withdrawSumStr}</td>
		      	<td class="ui-oddtd">手续费:</td>
		      	<td>${orderWithdraw.withdrawHandingStr} </td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">实际支付金额：</td>
		      	<td>${orderWithdraw.withdrawFactStr}</td>
		      	<td class="ui-oddtd">提现申请时间:</td>
		      	<td>${orderWithdraw.createTimeString} </td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">状态：</td>
		      	<td>${orderWithdraw.stateStr}</td>
		      	<td class="ui-oddtd">提现成功时间:</td>
		      	<td>
		      	<#if orderWithdraw.successTime??>
		      	${orderWithdraw.successTime?string('yyyy-MM-dd HH:mm:ss' )}
		      	</#if> </td>
		      </tr>
				</table>
			</div>
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
			     <#if mdl.result!=''>
			      <tr <#if mdl_index+1==auditLogs?size>class="ui-last"</#if> style="word-break:break-all;">
		            <td>
		                 <#if mdl.currentState==10 || mdl.currentState== -10>
		                                                初审 
		                 <#elseif mdl.currentState==11 || mdl.currentState== -11>
		                                                  一审
		                 <#elseif mdl.currentState==12 || mdl.currentState== -12>
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

</body>
</html>