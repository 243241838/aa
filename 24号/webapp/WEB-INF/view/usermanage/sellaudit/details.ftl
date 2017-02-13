<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>商户审核-详情</title>
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
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>
	<script type="text/javascript" src="/js/placeholders.js"></script>
	<script>
    $(function(){
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
	</div>
	<!--详细内容-->
	<div class="ui-info-content">
	<!-- 普通商户-->
		<#if usersSellerExtendMdl.sellerType==0> 
	  <div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">基本信息</h3>
			<div class="ui-infobg">
				<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">用户ID：</td>
		      	<td>${commonUserExtendMdl.userId}</td>
		      	<td class="ui-oddtd">账户名：</td>
		      	<td>${commonUserExtendMdl.username}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">用户类型:</td><td>${commonUserExtendMdl.userTypeName}</td>
		      	<td class="ui-oddtd">实名：</td>
		      	<td>${commonUserExtendMdl.realName}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">注册时间:</td>
		      	<td>${commonUserExtendMdl.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
		      	<#if commonUserExtendMdl.userType==0><!--0个人1企业-->
			      	<td class="ui-oddtd">身份证号：</td>
			      	<td>${usersPersonalExtendMdl.certificateNumber}</td>
		      	<#else>
			      	<td class="ui-oddtd">营业执照注册号：</td>
			      	<td>${usersEnterpriseExtendMdl.businessLicense}</td>
		      	</#if>
		      </tr>
				</table>
			</div>
		</div>
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">商户信息</h3>
			<div class="ui-infobg">
				<table class="ui-info-tab">
			      <tr>
			        <td class="ui-oddtd">商户类型：</td><td>${usersSellerExtendMdl.sellerTypeName}</td>
			        <td class="ui-oddtd">商户类别:</td><td>${usersSellerExtendMdl.userLevelExtendMdl.levelName}</td>
			      </tr>
			     <#-- <tr>
				     <td class="ui-oddtd">商户状态:</td><td>${usersSellerExtendMdl.stateName}</td>
				     <td class="ui-oddtd">商户开通时间:</td><td>${usersSellerExtendMdl.createTimeString}</td>
			      </tr>-->
			      <tr>
				    <td class="ui-oddtd">商户申请时间:</td><td>${usersSellerExtendMdl.createTimeString}</td>
				    <td class="ui-oddtd"></td><td></td>
			      </tr>
				</table>
			</div>
		</div>
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">收银限额</h3>
			<div class="ui-infobg">
				<table class="ui-info-tab">
			      <tr>
			      	<td class="ui-oddtd">日收银限额：</td><td>${usersSellerExtendMdl.userLevelExtendMdl.dayMoneyYuan}元</td>
			      	<td class="ui-oddtd">月收银限额:</td><td>${usersSellerExtendMdl.userLevelExtendMdl.monthMoneyYuan}元</td>
			      </tr>
				</table>
			</div>
		</div>
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">手续费</h3>
			<div class="ui-infobg">
				<table class="ui-info-tab ui-fee-tab" width='800'>
				<#list   usersSellerExtendMdl.feeSellerExtendMdl as mdl>
			      <tr>
			      	<td class="ui-oddtd"><#if  mdl.operType==7> 收银手续费：</#if><#if  mdl.operType==8>银行代付手续费：</#if></td>
			      	<td></td><td class="ui-oddtd"></td><td></td>
			      </tr>
			      <tr>
			      	 <td class="ui-oddtd">手续费类型：</td><td>${mdl.calculationMethodName}</td>
			      	 <td class="ui-oddtd"></td><td></td>
			      </tr>  
			      <tr>
			        <td class="ui-oddtd">手续费值：</td>
			        <td  colspan="3" class="ui-eventd fn-fee">
			      	<#if mdl.calculationMethod==0><!--百分比-->
			      	   ${mdl.scale} %
			      	   <label class="ui-pos3">上限：</label> ${mdl.maximumYuan} 元
			      	   <label class="ui-pos3">下限：</label> ${mdl.minimumYuan} 元
			      	<#else>
			      	    ${mdl.fixedYuan} 元
			      	
			      	</#if>
			      	</td>
			      </tr> 
		      	</#list>
				</table>
			</div>
		</div>
		 </#if>
		<!--平台商户-->
		<#if usersSellerExtendMdl.sellerType==1> 
	  <div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">基本信息</h3>
			<div class="ui-infobg">
				<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">用户ID：</td>
		      	<td>${commonUserExtendMdl.userId}</td>
		      	<td class="ui-oddtd">账户名：</td>
		      	<td>${commonUserExtendMdl.username}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">用户类型:</td><td>${commonUserExtendMdl.userTypeName}</td>
		      	<td class="ui-oddtd">实名：</td>
		      	<td>${commonUserExtendMdl.realName}</td>
		      
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">注册时间:</td>
		      	<td>${commonUserExtendMdl.createTimeString} </td>
		      	<#if commonUserExtendMdl.userType==0><!--0个人1企业-->
			      	<td class="ui-oddtd">身份证号：</td>
			      	<td>${usersPersonalExtendMdl.certificateNumber}</td>
		      	<#else>
			      	<td class="ui-oddtd">营业执照注册号：</td>
			      	<td>${usersEnterpriseExtendMdl.businessLicense}</td>
		      	</#if>
		      </tr>
		     
				</table>
			</div>
		</div>
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">商户信息</h3>
			<div class="ui-infobg">
				<table class="ui-info-tab">
			      <tr>
			       <td class="ui-oddtd">商户类型：</td><td>${usersSellerExtendMdl.sellerTypeName}</td>
			        <td class="ui-oddtd">商户类别:</td><td>${usersSellerExtendMdl.userLevelExtendMdl.levelName}</td>
			      </tr>
			      <tr>
				    <td class="ui-oddtd">商户申请时间:</td><td>${usersSellerExtendMdl.createTimeString}</td>
				    <td class="ui-oddtd">平台IP地址:</td><td>${usersSellerExtendMdl.sellerIps}</td>
			      </tr>
			       <tr>
				    <td class="ui-oddtd">平台域名:</td><td>${usersSellerExtendMdl.sellerDomain}</td>
				    <td class="ui-oddtd"></td><td></td>
			      </tr>
		     
				</table>
			</div>
		</div>
		
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">收银限额</h3>
			<div class="ui-infobg">
				<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">日收银限额：</td><td>${usersSellerExtendMdl.userLevelExtendMdl.dayMoneyYuan}元</td>
		      	<td class="ui-oddtd">月收银限额:</td><td>${usersSellerExtendMdl.userLevelExtendMdl.monthMoneyYuan}元</td>
		      </tr>
				</table>
			</div>
		</div>
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">手续费</h3>
	  	<#list   usersSellerExtendMdl.feeSellerExtendMdl as mdl>
				    <div <#if mdl_index%2!=0>
			     	class="ui-infobg2"
			     	<#elseif mdl_index+1!=usersSellerExtendMdl.feeSellerExtendMdl?size>
			     	class="ui-infobg"
			     	<#else>
			     	class="ui-infobg   no-bottbor"
			     	</#if>>
			     	
				<table class="ui-info-tab ui-fee-tab" width="800">
			      <tr>
			      	<td class="ui-oddtd"><#if  mdl.operType==7> 收银手续费：</#if><#if  mdl.operType==8>银行代付手续费：</#if></td><td></td>
			      </tr>
			      <tr>
			      	 <td class="ui-oddtd">手续费类型：</td><td>${mdl.calculationMethodName}</td>
			      </tr> 
			      <#if mdl.calculationMethod==0>
			      <tr>
			      	 <td class="ui-oddtd">手续费值：</td><td>${mdl.scale} %</td>
			      	 <td class="ui-oddtd">上限：</td><td>${mdl.maximumYuan} 元</td>
			      	 <td class="ui-oddtd">下限：</td><td>${mdl.minimumYuan} 元</td>
			      </tr> 
			      <#elseif mdl.calculationMethod==1>
			      <tr>
			      	 <td class="ui-oddtd">手续费值：</td><td>${mdl.fixedYuan} 元</td>
			      </tr> 
			      </#if>
			     
				</table>
			</div>
			 </#list>
		</div>
		 </#if>  
  <#if PublicAuditLogsExtendMdl?if_exists> 
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
			     <#list PublicAuditLogsExtendMdl as mdl>
			      <tr class="ui-last" style="word-break:break-all;">
		           
		            <td><#if mdl.currentState==10>
		                 初审
		                 <#elseif mdl.currentState==20>
		                 一审
		                 <#elseif mdl.currentState==30>
		                 二审
		                 </#if>
		             </td>
		            </td>
		            <td>${mdl.resultName}</td>
		            <td>${mdl.auditorName}</td>
		            <td>${mdl.auditTimeString}</td>
		            <td>${mdl.describe}</td>
			      </tr>
			      </#list>
				</table>
				
			</div>
		</div>
	</#if>
		<!--审核-->
		<form id="auditForm" action="/userManage/sellerAudit/sellerAuthReview/${reviewPhase}" method="post">
		  <input type="hidden" name="id" value="${commonUserExtendMdl.userId}"/> 
		 
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
				   <textarea name="describe" placeholder="请输入审核未通过原因" dataType="reqUnpass" class="validate[required,maxSize[120]] "></textarea>
				</div>
			</div>
			<div class="ui-submit-warp">
		      <a href="javascript:history.go(-1);" class="ui-red-btn">返回</a>
		      <a href="javascript:doSubmit('auditForm','dlg','dlgNo');"  class="ui-red-btn ui-pos3" >
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
  </div>
<!--审核成功-->
  <div id="dlg" class="ui-dialog "  data-options="iconCls:'icon-save'">
    <div class="ui-dlg-content ui-relative">
     <div class="ui-dlg-icon ui-clearfix"></div>
     <div class="ui-dlg-text">审核已完成</div>
     <div class="ui-dlg-text2">返回
       
         <a data-fn="backToList" 
	          <#if reviewPhase==0>
	          href="/userManage/sellerAudit/authFirst"
	          <#elseif reviewPhase==1>
	          href="/userManage/sellerAudit/authOne"
	          <#else>
	          href="/userManage/sellerAudit/authTwo"
	          </#if>
        >商户审核</a>
     </div>
    </div>
	</div>
<!--审核失败-->  
	<div id="dlgNo" class="ui-dialog" data-options="iconCls:'icon-save'">
		<div class="ui-dlg-content ui-relative">
     <div class="ui-dlg-icon ui-dlg-no ui-clearfix"></div>
     <div class="ui-dlg-text">审核失败</div>
     <div class="ui-dlg-text2">返回
        <a 
	          <#if reviewPhase==0>
	          href="/userManage/sellerAudit/authFirst"
	          <#elseif reviewPhase==1>
	          href="/userManage/sellerAudit/authOne"
	          <#else>
	          href="/userManage/sellerAudit/authTwo"
	          </#if>
      
      >商户审核</a>
     </div>
		</div>
	</div>
</body>
</html>