<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>系统管理-审核管理</title>
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
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>
</head>
<body>
<div id="page-form">
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
       <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">角色管理 <span>></span></a>
		<span class="crumbs-tit">新增角色</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerch" method="post"  action="${action?if_exists}" >
			<div class="ui-info-wrap">
			<h3 class="ui-info-tit"> 操作基本信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			           <tr class="platform-part">
				             <td class="ui-oddtd">交易流水号：</td>
				             <td class="ui-oddtd">提交时间：</td>
				             <td class="ui-oddtd">操作类型：</td>
				             <td class="ui-oddtd">操作员：</td>
				             <td class="ui-oddtd">审核状态：</td>
				             <td class="ui-oddtd">审核时间：</td>
				             <td class="ui-oddtd">审核员：</td>
				             <td class="ui-oddtd">审核意见：</td>
				            </tr>
				             <#list domainChargeList  as domainitem> 
                              <#if domainitem.chargeId != null>
				             <tr class="platform-part">
				             <td class="ui-oddtd">${domainitem.chargeId}</td>
				             <td class="ui-oddtd">${domainitem.charge_timestr}</td>
				             <td class="ui-oddtd">渠道账户充值</td>
				             <td class="ui-oddtd">${domainitem.chargeUser}</td>
				             <td class="ui-oddtd">
				               <#if domainitem.chargeSts =='10'>待审核</#if>
				               <#if domainitem.chargeSts =='20'>审核通过</#if>
				               <#if domainitem.chargeSts =='-20'>审核失败</#if>
				               <#if domainitem.chargeSts =='30'>到账成功</#if>
				               <#if domainitem.chargeSts =='-30'>到账失败</#if>
				
				             </td>
				             <td class="ui-oddtd">${domainitem.approval_timestr}</td>
				             <td class="ui-oddtd">${domainitem.approvalUser}</td>
				             <td class="ui-oddtd">${domainitem.chargeDesc}</td>
				              <input type="hidden" name="chargeId" value="${domainitem?if_exists.chargeId}"/>
				                <input type="hidden" name="chargeAmount" value="${domainitem.chargeAmount}"/>
				            </tr>
			          </#if>
                            </#list>
                             <#list providerChargeList  as  provideritem> 
                              <#if provideritem.chargeId != null>
				             <tr class="platform-part">
				             <td class="ui-oddtd">${provideritem.chargeId}</td>
				             <td class="ui-oddtd">${provideritem.charge_timestr}</td>
				             <td class="ui-oddtd">供应商账户充值</td>
				             <td class="ui-oddtd">${provideritem.chargeUser}</td>
				             <td class="ui-oddtd">
				               <#if provideritem.chargeSts =='10'>待审核</#if>
				               <#if provideritem.chargeSts =='20'>审核通过</#if>
				               <#if provideritem.chargeSts =='-20'>审核失败</#if>
				               <#if provideritem.chargeSts =='30'>到账成功</#if>
				               <#if provideritem.chargeSts =='-30'>到账失败</#if>
				             </td>
				               <input type="hidden" name="chargeId" value="${provideritem?if_exists.chargeId}"/>
				                <input type="hidden" name="chargeAmount" value="${provideritem.chargeAmount}"/>
				             <td class="ui-oddtd">${provideritem.approval_timestr}</td>
				             <td class="ui-oddtd">${provideritem.approvalUser}</td>
				             <td class="ui-oddtd">${provideritem.chargeDesc}</td>
				            </tr>
			               </#if>
                            </#list>
						  </tbody>
		      		</table>
				</div>
  	  			<h3 class="ui-info-tit"> 操作内容</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <#if domain.domainId != null>
				          <tr class="platform-part">
				            <td class="ui-oddtd">渠道：</td>
				            <td>
				              ${domain?if_exists.domainName}
				            </td>
				          </tr>
				          </#if>
				             <#if provider.providerId != null>
				          <tr class="platform-part">
				            <td class="ui-oddtd">供应商：</td>
				            <td>
				              ${provider?if_exists.providerName}
				            </td>
				          </tr>
				          </#if>
				          
				            <#if domainAccount.domainId != null>
				          <tr class="platform-part">
				            <td class="ui-oddtd">结算方式：</td>
				            	<td>
				             <#if domainAccount.acctType == 1>信用额度</#if>
			                 <#if domainAccount.acctType == 2>预付款</#if>
			                 <input type="hidden" name="domainId" value="${domainAccount?if_exists.domainId}"/>
			                 <input type="hidden" name="acctBalance" value="${domainAccount?if_exists.acctBalance}"/>
				            </td>
				          </tr>
				          </#if>
				          
				           <#if providerAccount.providerId != null>
				          <tr class="platform-part">
				            <td class="ui-oddtd">结算方式：</td>
				            <td>
				             <#if providerAccount.acctType == 1>信用额度</#if>
			                 <#if providerAccount.acctType == 2>预付款</#if>
			                   <input type="hidden" name="providerId" value="${providerAccount?if_exists.providerId}"/>
			                   <input type="hidden" name="acctBalance" value="${providerAccount?if_exists.acctBalance}"/>
				            </td>
				          </tr>
				          </#if>
				             <#if domain.domainId != null>
				           <tr class="platform-part">
				            <td class="ui-oddtd">状态：</td>
				            <td> 
				             <#if domain.domainSts == 10>正常</#if>
			                 <#if domain.domainSts == -10>锁定</#if>
                             <#if domain.domainSts == 1>待审核</#if>
				             <#if domain.domainSts == -11>禁用</#if>
				             </td>
				                 </tr>
				               </#if>
				               <#if provider.providerId != null>
				           <tr class="platform-part">
				            <td class="ui-oddtd">状态：</td>
				            <td> 
				             <#if provider.providerSts == 10>正常</#if>
			                 <#if provider.providerSts == -10>锁定</#if>
                             <#if provider.providerSts == 1>待审核</#if>
				             <#if provider.providerSts == -11>禁用</#if>
				             </td>
				                 </tr>
				               </#if>
				               
				             <#list domainChargeList  as domainitem> 
                              <#if domainitem.chargeId != null>
				            <tr>
				            <td class="ui-oddtd">充值金额：</td>
				            <td>
				             ${domainitem?if_exists.chargeAmount}
				            </td>
				          </tr>
 
				            <tr class="platform-part">
				            <td class="ui-oddtd">备注：</td>
				            <td>
				            ${domainitem?if_exists.chargeDesc}
				          </tr>
		                     </#if>
                            </#list>
                        <#list providerChargeList  as provideritem> 
                         <#if provideritem.chargeId != null>
				            <tr>
				            <td class="ui-oddtd">充值金额：</td>
				            <td>
				            ${provideritem?if_exists.chargeAmount}
				            </td>
				            </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">备注：</td>
				            <td>
				            ${provideritem?if_exists.chargeDesc}
				          </tr>
		                   </#if>
                         </#list>
						  </tbody>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	    </div>
		</form>
	</div>
</div>
</div>
<div id="page-result" style="display:none"></div>
<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
<script>
  $(document).ready(function(){
     
	 $("#editMerch").validationEngine({
		maxErrorsPerField: 1
	});
	
	 $("body").delegate('#back', 'click', function(event) {
            $("#page-form").show();
            $("#page-result").hide().empty();
      });
    $('#editMerch').ajaxForm({
        target: '#page-result',
        success: function() {
            $("#page-form").hide();
            $('#page-result').show();
        }
    });
 });
 
 function changelist(value){
 alert(value);
 if(value==1){   
   document.getElementById("domainTypeStyle").style.display="block";
 }else{
 document.getElementById("domainTypeStyle").style.display="none";
 }
 }
</script>
</body>
</html>