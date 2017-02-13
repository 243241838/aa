<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-风控管理</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script>
    $(function(){
    	var str=pad2('${usersSellerExtendMdl.userId}',6);
			$('td[data-str="str"]').text(str);
    });
	</script>
</head>
<body>
  <div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	<#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">运营管理 <span>></span></a>
		<a class="crumbs-link" href="/userManage/sellerManage/sellMessageView">风控管理 <span>></span></a>
		<span class="crumbs-tit">商户管理</span>-->
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
		      	<td data-str="str">${commonUserExtendMdl.userId}</td>
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
		      <td class="ui-oddtd">商户状态:</td><td>${usersSellerExtendMdl.stateName}</td>
		      <td class="ui-oddtd">商户开通时间:</td><td>${usersSellerExtendMdl.createTimeString}</td>
		      <td></td><td></td>
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
				<table class="ui-info-tab">
				<#list   usersSellerExtendMdl.feeSellerExtendMdl as mdl>
			      <tr>
			      	<td class="ui-oddtd"><#if  mdl.operType==7> 收银手续费：</#if><#if  mdl.operType==8>银行代付手续费：</#if></td><td></td>
			        <td></td><td></td>
			      </tr>
			      <tr>
			      	 <td class="ui-oddtd">手续费类型：</td><td>${mdl.calculationMethodName}</td>
			      	 <td></td><td></td>
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
		      	<td data-str="str">${commonUserExtendMdl.userId}</td>
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
		      <td class="ui-oddtd">商户状态:</td><td>${usersSellerExtendMdl.stateName}</td>
		      <td class="ui-oddtd">商户开通时间:</td><td>${usersSellerExtendMdl.createTimeString}</td>
		      <td></td><td></td>
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
				<table class="ui-info-tab">
				<#list   usersSellerExtendMdl.feeSellerExtendMdl as mdl>
			      <tr>
			      	<td class="ui-oddtd"><#if  mdl.operType==7> 收银手续费：</#if><#if  mdl.operType==8>银行代付手续费：</#if></td><td></td>
			        <td></td><td></td>
			      </tr>
			      <tr>
			      	 <td class="ui-oddtd">手续费类型：</td><td>${mdl.calculationMethodName}</td>
			      	 <td></td><td></td>
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
     </div>
	</div>
  </div>
</body>
</html>