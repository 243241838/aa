<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-风控规则设置</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	
	<script type="text/javascript" src="/js/plugins.js"></script>

</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	   <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">运营管理<span>></span></a>
		<a class="crumbs-link" href="">风控管理 <span>></span></a>
		<span class="crumbs-tit">风控规则设置</span>-->
	</div>
     <div class="ui-info-content"> 
     	<form id="editUserTypeNext2" name="editUserTypeNext" method="post" action="/runManage/riskRule/set">
		<div class="ui-info-wrap ui-multi-wrap ui-info-two ui-dotted">
           	<h3 class="ui-info-tit">确认新的风控规则</h3>
		      <!--循环-->
		      <#if riskRuleList?if_exists>
		      	 <#list riskRuleList as riskRule>
				     <div class="ui-infobg <#if (riskRule_index+1)%2==0>ui-infobg2 no-bottbor</#if>">
						<table class="ui-info-tab ">
					      <tr>
					      	<td class="ui-oddtd">${riskRule?if_exists.operTypeName}控制：</td><td></td><td></td><td></td>
					      	<input type="hidden" value="${mdl.operType}" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].operType"/>
					      	<input type="hidden" value="${mdl.id}" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].id"/>
					      </tr>
					      <tr>
					      	 <#if riskRule?if_exists.childList?if_exists>
					      	 	<#list riskRule?if_exists.childList as limit>
							      	 <td class="ui-oddtd">${limit?if_exists.requirementTypeName?if_exists}限额：</td>
					      	 		 <#if riskRule?if_exists.operType == 0>
					      	 		 	<input id="" name="rechargeLimit" value="${limitSys?if_exists.rechargeLimit[limit_index * 2]?if_exists}" type="hidden"/>
					      	 		 	<input id="" name="rechargeLimit" value="${limitSys?if_exists.rechargeLimit[limit_index * 2 + 1]?if_exists}" type="hidden"/>
							      	 	<td>${limitSys?if_exists.rechargeLimit[limit_index * 2 + 1]?if_exists}元</td>
						      	 	 <#elseif riskRule?if_exists.operType == 1>
						      	 		 <input id="" name="withdrawLimit" value="${limitSys?if_exists.withdrawLimit[limit_index * 2]?if_exists}" type="hidden"/>
						      	 		 <input id="" name="withdrawLimit" value="${limitSys?if_exists.withdrawLimit[limit_index * 2 + 1]?if_exists}" type="hidden"/>
						      	 	 	<td>${limitSys?if_exists.withdrawLimit[limit_index * 2 + 1]?if_exists}元</td>
						      	 	 <#elseif riskRule?if_exists.operType == 2>
						      	 	 	<input id="" name="transferLimit" value="${limitSys?if_exists.transferLimit[limit_index * 2]?if_exists}" type="hidden"/>
						      	 	 	<input id="" name="transferLimit" value="${limitSys?if_exists.transferLimit[limit_index * 2 + 1]?if_exists}" type="hidden"/>
						      	 	 	<td>${limitSys?if_exists.transferLimit[limit_index * 2 + 1]?if_exists}元</td>
						      	 	 <#elseif riskRule?if_exists.operType == 3>
						      	 	 	<input id="" name="collectLimit" value="${limitSys?if_exists.collectLimit[limit_index * 2]?if_exists}" type="hidden"/>
						      	 	 	<input id="" name="collectLimit" value="${limitSys?if_exists.collectLimit[limit_index * 2 + 1]?if_exists}" type="hidden"/>
						      	 	 	<td>${limitSys?if_exists.collectLimit[limit_index * 2 + 1]?if_exists}元</td>
						      	 	 <#elseif riskRule?if_exists.operType == 4>
						      	 	 	<input id="" name="paymentLimit" value="${limitSys?if_exists.paymentLimit[limit_index * 2]?if_exists}" type="hidden"/>
						      	 	 	<input id="" name="paymentLimit" value="${limitSys?if_exists.paymentLimit[limit_index * 2 + 1]?if_exists}" type="hidden"/>
						      	 	 	<td>${limitSys?if_exists.paymentLimit[limit_index * 2 + 1]?if_exists}元</td>
						      	 	 </#if>
					      	 	</#list>
					      	 </#if>
					      </tr>
					      <#if riskRule?if_exists.operType == 1>
						      <tr>
						         <input id="" name="withdrawLimitCount" value="${limitSys?if_exists.withdrawLimitCount?if_exists}" type="hidden"/>
						      	 <td class="ui-oddtd">单日限次：</td><td>${limitSys?if_exists.withdrawLimitCount?if_exists}次</td>
						      	 <!-- 
						      	 <td class="ui-oddtd">信用卡充值资金：</td><td>xx日后才能提现、转账</td>
						      	  -->
						      </tr>
					      </#if>
						</table>
					</div>
		      	 </#list>
		      </#if>
			
			<!-- 
			<div class="ui-infobg2 no-bottbor" style="padding-bottom:5px;">
		      <table class="ui-info-tab ">
		      	<tr>
		        <td class="ui-oddtd">信用卡充值开关：</td><td></td>
		      </tr>
		      </table>
		      </div>
		       -->
		      <div class="ui-infobg ui-infobg2">	
				<table class="ui-info-tab ">
			      <tr>
			      	<td class="ui-oddtd">可疑交易控制：</td><td></td>
			      </tr>
			      <tr>
			      <input id="" name="suspiciousTrade" value="${limitSys?if_exists.suspiciousTrade?if_exists}" type="hidden"/>
			      	<td class="ui-oddtd">IP钓鱼：</td><td><#if limitSys?if_exists.suspiciousTrade?if_exists == 0>直接拒绝<#else>二次验证</#if></td>
			      </tr>
		      </table>
		      </div>
		      <div class="ui-submit-warp"> 
			      <a href="javascript:void(0);" id="back" class="ui-red-btn">返 回</a>
			      <a href="javascript:ajaxSubmit('editUserTypeNext2','dlgOk2','dlgWarn');" class="ui-red-btn ui-pos3">下一步</a>
		    </div>
		    </div>
		    </form>
		</div> 
	</div>
<!--成功提示-->	      
<div id="dlgOk2" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
    <div class="ui-dlg-text">风控规则设置成功！</div>
    <a data-fn="backToList" href="/runManage/riskRule/view" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog"  data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text">风控规则设置失败！</div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>
</body>
</html>