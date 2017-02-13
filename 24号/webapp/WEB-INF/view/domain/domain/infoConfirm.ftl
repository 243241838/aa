
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>渠道管理-编辑</title>
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
  	  			<h3 class="ui-info-tit">渠道账户信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <#if domain.domainId != null>
				    
				            	<input type="hidden" name="domainId" value="${domain?if_exists.domainId}"/>
				             
				        
				          </#if>
				         <tr class="platform-part">
				            <td class="ui-oddtd">账户类型：</td>
				            <td>
				             <#if domainAccount.acctType == 1>信用额度</#if>
				             <#if domainAccount.acctType == 2>预付款</#if>
				            </td>
				          </tr>
				          <#if domainAccount.acctType == 1> 
				          <tr class="platform-part">
				            <td class="ui-oddtd">信用额度：</td>
				            <td>
				              <input type="hidden" name="acctBalance" value="${domainAccount?if_exists.acctBalance}"/>
				                ${domainAccount.acctBalance}
				            </td>
				          </tr></#if>
				            <tr class="platform-part">
				            <td class="ui-oddtd">预警金额：</td>
				            <td>
				            	${domainAccount?if_exists.ewBalance}
				            </td>
				   
				                <tr class="platform-part">
				            <td class="ui-oddtd">渠道状态：</td>
				            <td>
				             <#if domain.domainSts == 10>正常</#if>
				             <#if domain.domainSts == -10>锁定</#if>
				              <#if domain.domainSts == -11>禁用</#if>
				              <#if domain.domainSts == 1>待审核</#if>
				             </td>
				          </tr>
				          </tbody>
		      		</table>
				</div>
				<h3 class="ui-info-tit">渠道基本信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <tr class="platform-part">
				            <td class="ui-oddtd">渠道名称：</td>
				            <td>
				            	${domain?if_exists.domainName}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">渠道类型：</td>
				            <td>
				            <#if domain.domainType == 10>银行</#if>
				            <#if domain.domainType == 11>第三方支付</#if>
				            <#if domain.domainType == 12>P2P</#if>
				            <#if domain.domainType == 20>电商</#if>
				            <#if domain.domainType == 1>其他 </#if>
				            </td>
				          </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">地址：</td>
				            <td>
				            	${domain?if_exists.domainAddress}
				            </td>
				         </tr>
				           <tr class="platform-part">
				            <td class="ui-oddtd">证件类型：</td>
				            <td>
				             <#if domainIdentitie.idenType == 10>身份证</#if>
				            <#if domainIdentitie.idenType == 20>组织机构代码证</#if>
				            <#if domainIdentitie.idenType == 21>营业执照</#if>
				            <#if domainIdentitie.idenType == 22>税务登记证</#if>
				            </td>
				            <td class="ui-oddtd">证件号码：</td>
				            <td>
				            	${domainIdentitie?if_exists.idenNo}
				            </td>
				          </tr>
 
		  <tr class="platform-part">
				            <td class="ui-oddtd">联系人姓名：</td>
				            <td>
				            	${domain?if_exists.domainContacts}
				            </td>
				                <td class="ui-oddtd">联系人电话：</td>
				            <td>
				            	${domain?if_exists.domainTel}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td>
				            	${domain.effTimeStr} 	至  ${domain.expTimeStr}
				            </td>
				          </tr>
				        
				          </tbody>
				        <input type="hidden" name="domainName" value="${domain?if_exists.domainName}"/>
				            <input type="hidden" name="domainType" value="<#if domain.domainType == 10>10</#if>
				            <#if domain.domainType == 11>11</#if>
				            <#if domain.domainType == 12>12</#if>
				            <#if domain.domainType == 20>20</#if> 
				            <#if domain.domainType == 1>1 </#if>"/>
				          <input type="hidden" name="domainSts" value="<#if domain.domainSts == 10>10</#if>
				            <#if domain.domainSts == 1>1</#if>
				            <#if domain.domainSts == -10>-10</#if>
				            <#if domain.domainSts == -11>-11</#if> "/>
				        <input type="hidden" name="domainAddress" value="${domain?if_exists.domainAddress}"/>
				        <input type="hidden" name="domainContacts" value="${domain?if_exists.domainContacts}"/>
				     <input type="hidden" name="domainTel" value="${domain?if_exists.domainTel}"/>
				        <input type="hidden" name="settType" value="${domain?if_exists.settType}"/>
				           <input type="hidden" name="domainIps" value="${domain?if_exists.domainIps}"/>
				              <input type="hidden" name="authSts" value="${domain?if_exists.authSts}"/>
				                    <input type="hidden" name="domainDesc" value="${domain?if_exists.domainDesc}"/>
				          <input type="hidden" name="effTimeStr" value="${domain?if_exists.effTimeStr}"/>
				           <input type="hidden" name="expTimeStr" value="${domain?if_exists.expTimeStr}"/>
				           
				              <input type="hidden" name="serviceId" value="${domainAccount?if_exists.serviceId}"/>
				             <input type="hidden" name="acctType" value="  <#if domainAccount.acctType == 1>1</#if>
				             <#if domainAccount.acctType == 2>2</#if>"/>
				             <input type="hidden" name="billingType" value="${domainAccount?if_exists.billingType}"/>
				                   <input type="hidden" name="acctFreezing" value="${domainAccount?if_exists.acctFreezing}"/>
				      
				                     <input type="hidden" name="ewBalance" value="${domainAccount?if_exists.ewBalance}"/>
				                        <input type="hidden" name="acctChecksum" value="${domainAccount?if_exists.acctChecksum}"/>
				                       <input type="hidden" name="idenNo" value="${domainIdentitie?if_exists.idenNo}"/>
				                    <input type="hidden" name="idenType" value="<#if domainIdentitie.idenType == 10>10</#if>
				             <#if domainIdentitie.idenType == 20>20</#if>
				              <#if domainIdentitie.idenType == 21>21</#if> <#if domainIdentitie.idenType ==22>22</#if>"/>
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
    <div class="ui-dlg-text"><#if domain.domainId !=0>编辑渠道成功！<#else>新增渠道成功！</#if></div>
    <a data-fn="backToList" href="/domain/findListView" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog"  data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text"><#if domain.domainId !=0>编辑渠道失败！<#else>新增渠道失败！</#if></div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>
</body>
</html>