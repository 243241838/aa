
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>供应商管理-编辑</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>

</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	  <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">角色管理 <span>></span></a>
		<span class="crumbs-tit">新增角色</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerchs" method="post" action="${action?if_exists}" >
			<div class="ui-info-wrap">
  	  			<h3 class="ui-info-tit">供应商账户信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <#if provider.providerId != null>
				            	<input type="hidden" name="providerId" value="${provider?if_exists.providerId}"/>
				          </#if>
				         <tr class="platform-part">
				            <td class="ui-oddtd">账户类型：</td>
				            <td>
				             <#if providerAccount.acctType == 1>信用额度</#if>
				             <#if providerAccount.acctType == 2>预付款</#if>
				            </td>
				          </tr>
				          <#if providerAccount.acctType == 1> 
				          <tr class="platform-part">
				            <td class="ui-oddtd">信用额度：</td>
				            <td>
				              <input type="hidden" name="acctBalance" value="${providerAccount?if_exists.acctBalance}"/>
				                ${providerAccount.acctBalance}
				            </td>
				          </tr></#if>
				            <tr class="platform-part">
				            <td class="ui-oddtd">预警金额：</td>
				            <td>
				            	${providerAccount?if_exists.ewBalance}
				            </td></tr>
				              <tr class="platform-part">
				            <td class="ui-oddtd">供应商状态：</td>
				            <td>
				             <#if provider.providerSts == 10>正常</#if>
				             <#if provider.providerSts == -10>锁定</#if>
				              <#if provider.providerSts == -11>禁用</#if>
				              <#if provider.providerSts == 1>待审核</#if>
				             </td>
				          </tr>
				          </tbody>
		      		</table>
				</div>
				<h3 class="ui-info-tit">供应商基本信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <tr class="platform-part">
				            <td class="ui-oddtd">供应商名称：</td>
				            <td>
				            	${provider?if_exists.providerName}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">供应商类型：</td>
				            <td>
				            <#if provider.providerType == 10>银行</#if>
				            <#if provider.providerType == 11>第三方支付</#if>
				            <#if provider.providerType == 12>P2P</#if>
				            <#if provider.providerType == 20>电商</#if>
				            <#if provider.providerType == 1>其他 </#if>
				            </td>
				          </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">地址：</td>
				            <td>
				            	${provider?if_exists.providerAddress}
				            </td>
				         </tr>
				           <tr class="platform-part">
				            <td class="ui-oddtd">证件类型：</td>
				            <td>
				             <#if providerIdentitie.idenType == 10>身份证</#if>
				            <#if providerIdentitie.idenType == 20>组织机构代码证</#if>
				            <#if providerIdentitie.idenType == 21>营业执照</#if>
				            <#if providerIdentitie.idenType == 22>税务登记证</#if>
				            </td>
				            <td class="ui-oddtd">证件号码：</td>
				            <td>
				            	${providerIdentitie?if_exists.idenNo}
				            </td>
				          </tr>
 
		  <tr class="platform-part">
				            <td class="ui-oddtd">联系人姓名：</td>
				            <td>
				            	${provider?if_exists.providerContacts}
				            </td>
				                <td class="ui-oddtd">联系人电话：</td>
				            <td>
				            	${provider?if_exists.providerTel}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td>
				            	${provider.effTimeStr} 	至  ${provider.expTimeStr}
				            </td>
				          </tr>
				        
				          </tbody>
				        <input type="hidden" name="providerName" value="${provider?if_exists.providerName}"/>
				            <input type="hidden" name="providerType" value="<#if provider.providerType == 10>10</#if>
				            <#if provider.providerType == 11>11</#if>
				            <#if provider.providerType == 12>12</#if>
				            <#if provider.providerType == 20>20</#if> 
				            <#if provider.providerType == 1>1 </#if>"/>
				         <input type="hidden" name="acctType" value="  <#if providerAccount.acctType == 1>1</#if>
				             <#if providerAccount.acctType == 2>2</#if>"/>
				             
				                       <input type="hidden" name="providerSts" value="<#if provider.providerSts == 10>10</#if>
				            <#if provider.providerSts == 1>1</#if>
				            <#if provider.providerSts == -10>-10</#if>
				            <#if provider.providerSts == -11>-11</#if> "/>
				             
				             
				        <input type="hidden" name="providerAddress" value="${provider?if_exists.providerAddress}"/>
				        <input type="hidden" name="providerContacts" value="${provider?if_exists.providerContacts}"/>
				     <input type="hidden" name="providerTel" value="${provider?if_exists.providerTel}"/>
				        <input type="hidden" name="settType" value="${provider?if_exists.settType}"/>
				           <input type="hidden" name="providerIps" value="${provider?if_exists.providerIps}"/>
				              <input type="hidden" name="authSts" value="${provider?if_exists.authSts}"/>
				                    <input type="hidden" name="providerDesc" value="${provider?if_exists.providerDesc}"/>
				          <input type="hidden" name="effTimeStr" value="${provider?if_exists.effTimeStr}"/>
				           <input type="hidden" name="expTimeStr" value="${provider?if_exists.expTimeStr}"/>
				           
				              <input type="hidden" name="serviceId" value="${providerAccount?if_exists.serviceId}"/>
				   
				             <input type="hidden" name="billingType" value="${providerAccount?if_exists.billingType}"/>
				                   <input type="hidden" name="acctFreezing" value="${providerAccount?if_exists.acctFreezing}"/>
 
				                     <input type="hidden" name="ewBalance" value="${providerAccount?if_exists.ewBalance}"/>
				                        <input type="hidden" name="acctChecksum" value="${providerAccount?if_exists.acctChecksum}"/>
				                       <input type="hidden" name="idenNo" value="${providerIdentitie?if_exists.idenNo}"/>
				                    <input type="hidden" name="idenType" value="<#if providerIdentitie.idenType == 10>10</#if>
				             <#if providerIdentitie.idenType == 20>20</#if>
				              <#if providerIdentitie.idenType == 21>21</#if> <#if providerIdentitie.idenType ==22>22</#if>"/>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:void(0);" id="back" class="ui-red-btn">返 回</a>
	      <a href="javascript:ajaxSubmit('editMerchs','dlgOk2','dlgWarn');" class="ui-red-btn ui-pos3">保存</a>
	    </div>
		</form>
	</div>
</div>
<!--成功提示-->	      
<div id="dlgOk2" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
    <div class="ui-dlg-text"><#if provider.providerId !=0>编辑供应商成功！<#else>新增供应商成功！</#if></div>
    <a data-fn="backToList" href="/provider/findproviderList" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog"  data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text"><#if provider.providerId !=0>编辑供应商失败！<#else>新增供应商失败！</#if></div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>
</body>
</html>