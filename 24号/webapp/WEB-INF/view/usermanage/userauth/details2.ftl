<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>用户管理-用户信息认证-详情</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script type="text/javascript" src="/js/placeholders.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
	<script>
    $(function(){
    	$('#auditForm').validationEngine({
				maxErrorsPerField: 1
			});
    	var str=pad2('${commonUserExtendMdl.userId}',6);
			$('td[data-str="str"]').text(str);
    	numOnly();
    });
     
	</script>
</head>
<body>
<!--企业-->
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
		<#include "/common/include/power.ftl">
	</div>
	<!--详细内容-->
	<div class="ui-info-content" >
	  <div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">基本信息</h3>
			<div class="ui-infobg">
				<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd">账户名：</td>
		      	<td>${commonUserExtendMdl.username}</td>
		      	<td class="ui-oddtd">实名：</td>
		      	<td>${commonUserExtendMdl.realName}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">法人姓名:</td><td>${usersEnterpriseExtendMdl.businessLegal}</td>
		      	<td class="ui-oddtd">电子邮箱：</td>
		      	<td>${commonUserExtendMdl.email}</td>
		      </tr>
		      <tr>
		      	<td class="ui-oddtd">注册时间:</td>
		      	<td>${commonUserExtendMdl.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
		      	<td class="ui-oddtd"></td>
		      	<td></td>
		      </tr>
				</table>
			</div>
		</div>
		<!--企业用户--> 
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">实名认证信息</h3>
			<div class="ui-infobg">
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
		      	 <!--<td class="ui-oddtd">联系人姓名：</td><td>${usersEnterpriseExtendMdl.businessLegal}</td>
		      	 <td class="ui-oddtd">认证状态：</td><td>${commonUserExtendMdl.realNameStatusName}</td>-->
		      </tr>
		        <tr>
		         <td class="ui-oddtd">企业法人姓名：</td><td>${usersEnterpriseExtendMdl.businessLegal}</td>
		          <td class="ui-oddtd">企业法人身份证号：</td><td>${usersEnterpriseExtendMdl.businessLegalCertificate}</td>
		      </tr>
		       <tr>
		        <td class="ui-oddtd">实名认证申请时间：</td><td>${submitTime}</td>
		        <td class="ui-oddtd">营业执照副本：</td><td></td>
		        
		      </tr>
		      <tr>	
		        <td class="ui-oddtd">企业法人身份证图片：</td>
		        <td class="ui-img-wrap" style="width:320px;">
		      		正面 <span class="ui-pos">反面</span><span class="ui-pos"></span>
		      	</td>
		         
		         <td class="ui-oddtd"></td>
      	         <td class="ui-img-wrap">
      	         	<a href="javascript:;" onclick="maxPic(this,'license');">
	      	        	<img src="${usersEnterpriseExtendMdl.businessScanCopy}" class="ui-info-card ui-one"/>
	      	        	<img src="${usersEnterpriseExtendMdl.businessScanCopy}" class="fn-hide pic-max"/>
		      	    </a>
      	         </td>
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
      	         <td></td>
		      </tr>
			</table>
			
			</div>
		</div>
		<#if commonUserExtendMdl.realNameStatus==2><!--已认证-->
		<div class="ui-info-wrap ui-dotted">
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
		<div class="ui-info-wrap ui-dotted">
		  	<h3 class="ui-info-tit">邮箱认证信息</h3>
				<div class="ui-infobg">
					<table class="ui-info-tab">
				      <tr>
				      	<td class="ui-oddtd">邮箱：</td><td>${commonUserExtendMdl.email}</td>
				      	<td class="ui-oddtd">认证状态:</td><td>${commonUserExtendMdl.emailStatusName}</td>
				      </tr>
				      <tr>
				      	 <td class="ui-oddtd">认证时间：</td><td>${commonUserExtendMdl.emailStatusTimeString}</td>
				      </tr> 
					</table>
				</div>
		</div>
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
			      <tr <#if mdl_index+1==PublicAuditLogsExtendMdl?size> class="ui-last"</#if> style="word-break:break-all;">
		            <td><#if mdl.currentState==10>
		                 初审
		                 <#elseif mdl.currentState==20>
		                 一审
		                 <#elseif mdl.currentState==30>
		                 二审
		                 </#if>
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
	
	<form id="auditForm" action="/userManage/userMessageAuth/enterpriseAuthReview/${reviewPhase}" method="post">
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
			<#if reviewPhase==2> 
			<div class="ui-pass ui-info-wrap">
				<div class="ui-infobg" style="margin:20px -20px;">
					<table class="ui-info-tab" width="45%">
				      <tr>
				      	<td class="ui-oddtd">企业对公账户：</td>
				      	<td>${institutionUserExtendMdl.cardNumber}</td>
				      </tr>
				      <tr>
				      	<td class="ui-oddtd">输入汇款金额：</td>
				      	<td><input type="text" name="stateMoneyYuan" dataType="reqRemit"  class="validate[required,custom[number],min[0.01],max[0.99]] ui-dinput numOnly"/> 元</td>
				      </tr>
				       <tr>
				      	<td class="ui-oddtd"></td>
				      	<td><p class="ui-tip">汇款金额必须在1元以下</p></td>
				      </tr>
					</table>
				</div>
			</div>
			</#if>
			<div class="ui-unpass fn-hide">
			   <textarea name="describe"  dataType="reqUnpass"  class="validate[required,maxSize[120]]" placeholder="请输入审核未通过原因"></textarea>
			</div>
		</div>
		<div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返回</a><!--onclick=ajaxSubmit('auditForm','dlg','dlgNo')-->
	      <a  href="javascript:doSubmit('auditForm','dlg','dlgNo')" class="ui-red-btn ui-pos3">
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
<!--身份证弹框-->
	<div id="dlgCard" class="ui-dialog card-dialog" data-options="iconCls:'icon-save'">
	<h3>身份证图片/正面</h3>
   <div class="ui-infobg">
     <img src="" class="ui-card-img"/>
   </div>
	</div>
<!--审核成功-->
    <div id="dlg" class="ui-dialog "  data-options="iconCls:'icon-save'">
	  <div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-icon ui-clearfix"></div>
       <div class="ui-dlg-text">认证审核已完成</div>
       <div class="ui-dlg-text2">返回
           <a data-fn="backToList"  
          <#if reviewPhase==0>
          href="/userManage/userMessageAuth/enterpriseAuthFirst"
          <#elseif reviewPhase==1>
          href="/userManage/userMessageAuth/enterpriseAuthOne"
          <#else>
          href="/userManage/userMessageAuth/enterpriseAuthTwo"
          </#if>
          >实名认证审核</a>
       </div>
      </div>
	</div>
<!--审核失败-->  
	<div id="dlgNo" class="ui-dialog" data-options="iconCls:'icon-save'">
		<div class="ui-dlg-content ui-relative">
	       <div class="ui-dlg-icon ui-dlg-no ui-clearfix"></div>
	       <div class="ui-dlg-text">认证审核失败</div>
	       <div class="ui-dlg-text2">返回
	         <a 
	          <#if reviewPhase==0>
	          href="/userManage/userMessageAuth/enterpriseAuthFirst"
	          <#elseif reviewPhase==1>
	          href="/userManage/userMessageAuth/enterpriseAuthOne"
	          <#else>
	          href="/userManage/userMessageAuth/enterpriseAuthTwo"
	          </#if>
	          >实名认证审核</a>
	       </div>
		</div>
	</div>
</body>
</html>