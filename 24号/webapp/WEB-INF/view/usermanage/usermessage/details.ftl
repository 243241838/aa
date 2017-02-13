<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>用户管理-用户信息查询</title>
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
	  $(document).ready(function(){      
			var str=pad2('${commonUserExtendMdl.userId}',6);
			$('td[data-str="str"]').text(str);
			
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
	<!--个人用户-->
	<#if commonUserExtendMdl.userType==0> 
  <div class="ui-info-wrap ui-dotted">
  	<h3 class="ui-info-tit">基本信息</h3>
		<div class="ui-infobg">
			<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">用户ID：</td>
		      	<td data-str='str'>${commonUserExtendMdl.userId}</td>
		      	<td class="ui-oddtd">账户名：</td>
		      	<td>${commonUserExtendMdl.username}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">实名：</td>
		      	<td>${commonUserExtendMdl.realName}</td>
		      	<td class="ui-oddtd">手机号码:</td><td>${commonUserExtendMdl.mobile}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">邮箱：</td>
		      	<td>${commonUserExtendMdl.email}</td>
		      	<td class="ui-oddtd">注册时间:</td>
		      	<td>${commonUserExtendMdl.createTime?string("yyyy-MM-dd HH:mm:ss")} </td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">用户类型：</td>
		      	<td>${commonUserExtendMdl.userTypeName}</td>
		      	<td class="ui-oddtd">用户状态:</td>
		      	<td>${commonUserExtendMdl.statusName} </td>
		      </tr>
			</table>
		</div>
	</div>
	<div class="ui-info-wrap ui-dotted">
  	<h3 class="ui-info-tit">实名认证信息</h3>
		<div class="ui-infobg ui-padbt">
		<#if commonUserExtendMdl.realNameStatus==2><!--已认证-->
			<table class="ui-info-tab ui-img-tab">
		      <tr>
		      	<td class="ui-oddtd">实名：</td><td>${usersPersonalExtendMdl.userName}</td>
		      	<td class="ui-oddtd">身份证号码:</td><td>${usersPersonalExtendMdl.certificateNumber}</td>
		      </tr>
		      <tr>
		         <td class="ui-oddtd">认证状态：</td><td>${commonUserExtendMdl.realNameStatusName}</td>
		         <td class="ui-oddtd">认证时间：</td><td>${commonUserExtendMdl.realNameStatusTimeString}</td>
		      </tr> 
		      <tr>
		        <td class="ui-oddtd">身份证图片:</td>
		      	<td class="ui-img-wrap">
		      		正面 <span class="ui-pos">反面</span>
		      	</td>
		        <td class="ui-oddtd"></td><td></td>
		      </tr>
		      <tr>
			     <td class="ui-oddtd"></td>
		      	 <td rowspan='2' class="ui-img-wrap ui-img-two">
                  <a href="javascript:;" onclick="maxPic(this,1);">
		              <img src="${usersPersonalExtendMdl.certificatePicFront}" class="ui-info-card ui-one"/>
		              <img src="${usersPersonalExtendMdl.certificatePicFront}" class="fn-hide pic-max"/>
		          </a>
		          <a href="javascript:;" onclick="maxPic(this,2);">    
		              <img src="${usersPersonalExtendMdl.certificatePicBack}" class="ui-info-card ui-two"/>
		              <img src="${usersPersonalExtendMdl.certificatePicBack}" class="fn-hide pic-max"/>
		      	   </a>
		      	</td>
			    <td class="ui-oddtd"></td><td></td>
		      </tr>
			</table>
			<#else>
			 <table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">认证状态：</td><td>未认证</td>
		       </tr>
		     </table>
			</#if>
		</div>
	</div>
	<div class="ui-info-wrap ui-dotted">
  	<h3 class="ui-info-tit">手机认证信息</h3>
		<div class="ui-infobg">
		  <#if commonUserExtendMdl.mobileStatus==2>
			<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">手机号码：</td><td>${commonUserExtendMdl.mobile}</td>
		      	<td class="ui-oddtd">认证状态:</td><td>${commonUserExtendMdl.mobileStatusName}</td>
		      </tr>
		      <tr>
		      	 <td class="ui-oddtd">认证时间：</td>
		      	 <td><#if commonUserExtendMdl.mobileStatus!=0>${commonUserExtendMdl.mobileStatusTimeString}</#if></td>
		      </tr> 
			</table>
		  <#else>
		    <table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">认证状态:</td><td>未认证</td>
		      </tr>
			</table>
		  </#if>
		</div>
	</div>
	<div class="ui-info-wrap">
  	<h3 class="ui-info-tit">邮箱认证信息</h3>
		<div class="ui-infobg">
		<#if commonUserExtendMdl.emailStatus==2>
			<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">邮箱：</td><td>${commonUserExtendMdl.email}</td>
		      	<td class="ui-oddtd">认证状态:</td><td>${commonUserExtendMdl.emailStatusName}</td>
		      </tr>
		      <tr>
		      	 <td class="ui-oddtd">认证时间：</td>
		      	 <td><#if commonUserExtendMdl.emailStatus!=0>${commonUserExtendMdl.emailStatusTimeString}</#if></td>
		      </tr> 
			</table>
		 <#else>
		    <table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">认证状态:</td><td>未认证</td>
		      </tr>
			</table>
		  </#if>
		</div>
	</div>
	 </#if>
	<!--企业用户-->
	<#if commonUserExtendMdl.userType==1> 
	 <div class="ui-info-wrap ui-dotted">
  	<h3 class="ui-info-tit">基本信息</h3>
		<div class="ui-infobg">
			<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">用户ID：</td>
		      	<td data-str='str'>${commonUserExtendMdl.userId}</td>
		      	<td class="ui-oddtd">账户名：</td>
		      	<td>${commonUserExtendMdl.username}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">实名：</td>
		      	<td>${commonUserExtendMdl.realName}</td>
		      	<td class="ui-oddtd">法人姓名:</td><td>${usersEnterpriseExtendMdl.businessLegal}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">邮箱：</td>
		      	<td>${commonUserExtendMdl.email}</td>
		      	<td class="ui-oddtd">注册时间:</td>
		      	<td>${commonUserExtendMdl.createTimeString} </td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">用户类型：</td>
		      	<td>${commonUserExtendMdl.userTypeName}</td>
		      	<td class="ui-oddtd">用户状态:</td>
		      	<td>${commonUserExtendMdl.statusName} </td>
		      </tr>
			</table>
		</div>
	</div>
	<div class="ui-info-wrap <#if commonUserExtendMdl.realNameStatus==2>ui-dotted</#if>">
	<h3 class="ui-info-tit">实名认证信息</h3>
		<div class="ui-infobg">
		<#if commonUserExtendMdl.realNameStatus==2><!--已认证-->
		  <table class="ui-info-tab" style="margin-bottom:50px;">
	      <tr>
	      	<td class="ui-oddtd">实名：</td><td>${usersEnterpriseExtendMdl.enterpriseName}</td>
	      	<td class="ui-oddtd">企业经营地址:</td><td>${usersEnterpriseExtendMdl.enterpriseAddress}</td>
	      </tr>
	      <tr>
	         <td class="ui-oddtd">营业执照注册号：</td><td>${usersEnterpriseExtendMdl.businessLicense}</td>
	      	 <td class="ui-oddtd">电话号码：</td><td>${usersEnterpriseExtendMdl.enterprisePhone}</td>
	      </tr> 
	      <tr>
	         <td class="ui-oddtd">营业执照所在地：</td><td>${usersEnterpriseExtendMdl.businessAddr}</td>
	      	 <td class="ui-oddtd">传真号码：</td><td>${usersEnterpriseExtendMdl.fox}</td>
	      </tr>
	         <tr>
	         <td class="ui-oddtd">营业期限：</td><td><#if usersEnterpriseExtendMdl.timeLimit==0>长期<#else>${usersEnterpriseExtendMdl.timeLimit}</#if></td>
	      	 <!--<td class="ui-oddtd">联系人姓名：</td><td>${usersEnterpriseExtendMdl.businessLegal}</td>-->
	      	 <td class="ui-oddtd"></td><td></td>
	      </tr>
	        <tr>
	         <td class="ui-oddtd">企业法人姓名：</td><td>${usersEnterpriseExtendMdl.businessLegal}</td>
	         <td class="ui-oddtd">企业法人身份证号：</td><td>${usersEnterpriseExtendMdl.businessLegalCertificate}</td>
	         
	      </tr>
	      
	       <tr>
	        <td class="ui-oddtd">认证状态：</td><td>${commonUserExtendMdl.realNameStatusName}</td>
	        <td class="ui-oddtd">认证时间：</td><td>${commonUserExtendMdl.realNameStatusTimeString}</td>
	      </tr>
	      <tr>	
	      	 <td class="ui-oddtd">企业法人身份证图片：</td>
	         <td class="ui-img-wrap" style="width:413px;">
	      		正面 <span class="ui-pos">反面</span>
	      	</td>
	      	<td class="ui-oddtd">营业执照副本：</td>
	        <td></td>
	      </tr>
	      <tr>	
	      	 <td class="ui-oddtd"></td>
	         <td  class="ui-img-wrap">
		         <a href="javascript:;" onclick="maxPic(this,1);">
		           <img src="${usersEnterpriseExtendMdl.certificateFace}" class="ui-info-card ui-one"/>
		           <img src="${usersEnterpriseExtendMdl.certificateFace}" class="fn-hide pic-max">
		         </a>
		         <a href="javascript:;" onclick="maxPic(this,2);">
		           <img src="${usersEnterpriseExtendMdl.certificateEverse}"  class="ui-info-card ui-two"/>	
		           <img src="${usersEnterpriseExtendMdl.certificateEverse}" class="fn-hide pic-max">    
		         </a>
	      	</td>
	      	<td class="ui-oddtd"></td>
	        <td class="ui-img-wrap">
	          <a href="javascript:;" onclick="maxPic(this,'license');">
	        	<img src="${usersEnterpriseExtendMdl.businessScanCopy}" class="ui-info-card ui-one"/>
	        	<img src="${usersEnterpriseExtendMdl.businessScanCopy}" class="fn-hide pic-max"/>
	      	   </a>
	        </td>
	      </tr>
		</table>
		<#else>
		  <table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">认证状态：</td><td>未认证</td>
		      </tr>
		  </table>
	    </#if>
		</div>
	</div>
	<#if commonUserExtendMdl.realNameStatus==2><!--已认证-->
	<div class="ui-info-wrap">
	<h3 class="ui-info-tit">企业对公账户</h3>
		<div class="ui-infobg">
			<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">银行开户名：</td><td>${institutionUserExtendMdl.cardAccountHolder}</td>
		      	<td class="ui-oddtd">开户银行支行名称：</td><td>${institutionUserExtendMdl.networkName}</td>
		      </tr>
		      <tr>                                       
		      	<td class="ui-oddtd">开户银行：</td><td>${institutionUserExtendMdl.institutionName}</td>
		      	<td class="ui-oddtd">公司对公账户：</td><td>${institutionUserExtendMdl.cardNumber}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">开户行所在城市：</td><td>${institutionUserExtendMdl.bankCity}</td>
		      </tr>
			</table>
		</div>
	</div>
	</#if>
	</#if>
	<div class="ui-submit-warp ui-submit-one">
	  <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	</div>
  </div>	
	<div id="dlgCard" class="ui-dialog card-dialog" data-options="iconCls:'icon-save'">
		<h3>身份证图片/正面</h3>
	    <div class="ui-infobg">
	       <img src="" class="ui-card-img"/>
	    </div>
	</div>
</body>
</html>