<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>提现管理-提现审核</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script src="/js/placeholders.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
	<script>
      $(document).ready(function(){
		$("#auditForm").validationEngine({
				maxErrorsPerField: 1
			});
		});
    </script>
     
</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	<#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">提现管理 <span>></span></a>
		<a class="crumbs-link" href="#">提现审核 <span>></span></a>
		<span class="crumbs-tit">提现审核</span>-->
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
				</table>
			</div>
		</div>
		
	<#if auditLogs?exists && auditLogs?size &gt; 0 && orderWithdraw.state != 10> 
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
		            <td><#if mdl.currentState==10 || mdl.currentState== -10>
		                 初审
		                 <#elseif mdl.currentState==11 || mdl.currentState== -11>
		                 一审
		                 <#elseif mdl.currentState==12 || mdl.currentState== -12>
		                 二审
		                 </#if></td>
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
	
	<form id="auditForm" action="/capitalManage/withdrawManage/withdrawAuditReview/${reviewPhase}" method="post">
	  <input type="hidden" name="id" value="${orderWithdraw.id}"/> 
	  <input type="hidden" name="reviewPhase" value="${reviewPhase}"/>
	  <div class="ui-info-wrap">
	  	<h3 class="ui-info-tit">审核意见</h3>
			<div id="audit" class="ui-infobg ui-audit">
    		<span class="ui-rdo">
    			<input type="radio" name="result" value="0" id="rdo3" checked/>
    			<label for="rdo3">审核通过</label>
    		</span>
    		<span  class="ui-rdo">
    			<input type="radio" name="result" value="1" id="rdo4"/>
    			<label for="rdo4">审核不通过</label>
    		</span>               
			</div>
			<div class="ui-unpass fn-hide">
			   <textarea name="describe" dataType="reqUnpass" placeholder="请输入审核未通过原因" class="validate[required,maxSize[120]] "></textarea>
			</div>
		</div>
		<div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返回</a><!--onclick=ajaxSubmit('auditForm','dlg','dlgNo')-->
	      <a href="javascript:doSubmit('auditForm','dlg','dlgNo');"  class="ui-red-btn ui-pos3">
	        <#if reviewPhase==0>
		                                 提交一级复审
		          <#elseif reviewPhase==1>
		                                 提交二级复审
		          <#else>
		                                  提交
		          </#if>
	      </a>
		</div>
    </form>
 </div>

<!--审核成功-->
    <div id="dlg" class="ui-dialog "  data-options="iconCls:'icon-save'">
	  <div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-icon ui-clearfix"></div>
       <div class="ui-dlg-text">提现审核已完成</div>
       <div class="ui-dlg-text2">返回
          <a data-fn="backToList"  
          <#if reviewPhase==0>
          href="/capitalManage/withdrawManage/withdrawAuditFirst"
          <#elseif reviewPhase==1>
          href="/capitalManage/withdrawManage/withdrawAuditOne"
          <#else>
          href="/capitalManage/withdrawManage/withdrawAuditTwo"
          </#if>
          >提现审核</a>
       </div>
      </div>
	</div>
<!--审核失败-->  
	<div id="dlgNo" class="ui-dialog" data-options="iconCls:'icon-save'">
		<div class="ui-dlg-content ui-relative">
	       <div class="ui-dlg-icon ui-dlg-no ui-clearfix"></div>
	       <div class="ui-dlg-text">提现审核失败</div>
	       <div class="ui-dlg-text2">返回
	         <a 
	          <#if reviewPhase==0>
	          href="/capitalManage/withdrawManage/withdrawAuditFirst"
	          <#elseif reviewPhase==1>
	          href="/capitalManage/withdrawManage/withdrawAuditOne"
	          <#else>
	          href="/capitalManage/withdrawManage/withdrawAuditTwo"
	          </#if>
	          >提现审核</a>
	       </div>
		</div>
	</div>
</body>
</html>