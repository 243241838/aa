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
		<!-- <a class="crumbs-link" href="#">运营管理<span>></span></a>
		<a class="crumbs-link" href="">风控管理 <span>></span></a>
		<span class="crumbs-tit">风控规则设置</span> -->
	</div>
     <div class="ui-info-content"> 
     	<form id ="editUserTypeNext" method="post" action="${fButton(list, 'EDIT','@URL@')}" >       
		<div class="ui-info-wrap ui-multi-wrap ui-info-two ui-dotted">
           	<h3 class="ui-info-tit">平台当前风控规则</h3>
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
					      	<#assign countValue = ""/>
					      	 <#if riskRule?if_exists.childList?if_exists>
					      	 	<#list riskRule?if_exists.childList as limit>
					      	 		 <#if limit?if_exists.operType == 1 && limit?if_exists.requirementType == 0><#assign countValue = "${limit?if_exists.countValue?if_exists}"/></#if>
							      	 <td class="ui-oddtd">${limit?if_exists.requirementTypeName?if_exists}限额：</td><td>${limit?if_exists.feeValueStr?if_exists}元</td>
					      	 	</#list>
					      	 </#if>
					      </tr>
					      <#if riskRule?if_exists.operType == 1>
						      <tr>
						      	 <td class="ui-oddtd">单日限次：</td><td>${countValue?if_exists}次</td>
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
			      	<td class="ui-oddtd">IP钓鱼：</td><td><#if sysParam?if_exists.value?if_exists == 0>直接拒绝<#else>二次验证</#if></td>
			      </tr>
		      </table>
		      </div>
		      <div class="ui-submit-warp ui-submit-one"> 
		      ${fButton(list, 'EDIT','<input type="submit" class="ui-red-btn ui-pos3" value="设置" />')}
		       <!-- <input type="submit" class="ui-red-btn ui-pos3" value="设置" /> -->
		    </div>
		    </div>
		    </form>
		</div> 
	</div>
</body>
</html>