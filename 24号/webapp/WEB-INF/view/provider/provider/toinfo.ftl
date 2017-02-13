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
			<h3 class="ui-info-tit"> 供应商账户信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          	<#if provider.providerId != null>
				            	<input id="getproviderId" type="hidden" name="providerId" value="${provider?if_exists.providerId}"/>
			  </#if>
				          <tr class="platform-part">
				            <td class="ui-oddtd">账户类型：</td>
				            <td>
				                <#if providerAccount.acctType == 1>信用额度</#if>
				             <#if providerAccount.acctType == 2>预付款</#if>
				 	             
				            </td>
				          </tr>
				          	        
				          <#if providerAccount.acctType == 1&&provider.providerId != null> 
				          <tr class="platform-part">
				            <td class="ui-oddtd">信用额度：</td>
				            <td>
				                <input id='acctBalance' 　  type="text" maxlength=40  class="validate[required,custom[money]  ui-dinput" name="acctBalance" value="${providerAccount?if_exists.acctBalance}"/>元
				            </td>
				          </tr></#if> 
				            <tr class="platform-part">
				            <td class="ui-oddtd">预警金额：</td>
				            <td>
				              <input id='ewBalance' 　  type="text" maxlength=40  class="validate[required,custom[money]  ui-dinput" name="ewBalance" value="${providerAccount?if_exists.ewBalance}"/>元
				            </td>
				   
				           <tr class="platform-part">
				            <td class="ui-oddtd">供应商状态：</td>
				            <td>
				               <select class="ui-dselect" name="providerSts">
				                	  <option value="1" <#if provider.providerSts==1>selected</#if>>待审核</option>
				                	<option value="10" <#if provider.providerSts==10>selected</#if>>正常</option>
				                	<option value="-10" <#if provider.providerSts==-10>selected</#if>>锁定</option>
				                	<option value="-11" <#if provider.providerSts==-11>selected</#if>>禁用</option>
				                	
				                </select>
				           </td>
				            
				          </tr>
				          
						  </tbody>
		      		</table>
				</div>
			
  	  			<h3 class="ui-info-tit"> 供应商基本信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr class="platform-part">
				            <td class="ui-oddtd">供应商名称：</td>
				            <td>
				              <input id="getRoleId" type="hidden" name="providerId" value="${provider?if_exists.providerId}"/>
				                <input id='providerName' 　dataId="${provider?if_exists.providerId}" dataType="reqProvider"   type="text" maxlength=40   class="validate[required,custom[typeName],ajax[ajaxProviderName]] ui-dinput"  name="providerName" value="${provider?if_exists.providerName}"/>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">供应商类型：</td>
				             <td colspan="3">
				              <select class="ui-dselect" name="providerType">
				                	<option value="10" <#if provider.providerType==10>selected</#if>>银行</option>
				                	<option value="11" <#if provider.providerType==11>selected</#if>>第三方支付</option>
				                	<option value="12" <#if provider.providerType==12>selected</#if>>P2P</option>
				                	<option value="20" <#if provider.providerType==20>selected</#if>>电商</option>
				                	<option value="1" <#if provider.providerType==1>selected</#if>>其他 </option>
				                </select>
				            </td>
				          </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">地址：</td>
				            <td>
				            	 <input id='providerAddress' 　  type="text" maxlength=40  class=" ui-dinput" name="providerAddress" value="${provider?if_exists.providerAddress}"/>
				            </td>
		 
				           <tr class="platform-part">
				            <td class="ui-oddtd">证件类型：</td>
				            <td>
				            
				              <select class="ui-dselect" name="idenType">
				                	<option value="10" <#if providerIdentitie.idenType==10>selected</#if>>身份证</option>
				                	<option value="20" <#if providerIdentitie.idenType==20>selected</#if>>组织机构代码证</option>
				                	<option value="21" <#if providerIdentitie.idenType==21>selected</#if>>营业执照</option>
				                	<option value="22" <#if providerIdentitie.idenType==22>selected</#if>>税务登记证</option>
				                </select>
				            </td>
				            <td class="three">证件号码：</td>
				            <td>
				             <input id='idenNo' 　  type="text"  class="  ui-dinput" name="idenNo"    value="${providerIdentitie?if_exists.idenNo}"/>
				            </td>
				          </tr>
 
				            <tr class="platform-part">
				            <td class="ui-oddtd">联系人姓名：</td>
				            <td>
				            <input id='providerContacts' 　  type="text" maxlength=40  class="validate[required,custom[typeName]] ui-dinput" name="providerContacts" value="${provider?if_exists.providerContacts}"/>
				            </td>
				                <td class="three">联系人电话：</td>
				            <td>
				               <input id='providerTel' 　  type="text" maxlength=40  class="validate[required,custom[phone]] ui-dinput"  name="providerTel" value="${provider?if_exists.providerTel}"/>
				            </td>
				          </tr>
				     <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td colspan="3">
				            	   <input id="effTime" name="effTimeStr" class="easyui-datebox" value="${provider.effTime?string('yyyy-MM-dd')}" validType="mdM['#effTime']">
					<em>至</em>
					<input id="expTime" name="expTimeStr" class="easyui-datebox" value="${provider.expTime?string('yyyy-MM-dd')}" validType="mdM['#expTime']">
				            	
				            </td>
				                
				          </tr> 
				          
				            <input type="hidden" name="providerType" value="<#if provider.providerType == 10>10</#if>
				            <#if provider.providerType == 11>11</#if>
				            <#if provider.providerType == 12>12</#if>
				            <#if provider.providerType == 20>20</#if> 
				            <#if provider.providerType == 1>1 </#if>"/>
				        <input type="hidden" name="settType" value="${provider?if_exists.settType}"/>
				           <input type="hidden" name="providerIps" value="${provider?if_exists.providerIps}"/>
				              <input type="hidden" name="authSts" value="${provider?if_exists.authSts}"/>
				                    <input type="hidden" name="providerDesc" value="${provider?if_exists.providerDesc}"/>
				              <input type="hidden" name="serviceId" value="${providerAccount?if_exists.serviceId}"/>
				             <input type="hidden" name="acctType" value="  <#if providerAccount.acctType == 1>1</#if>
				             <#if providerAccount.acctType == 2>2</#if>"/>
				             <input type="hidden" name="billingType" value="${providerAccount?if_exists.billingType}"/>
				             <input type="hidden" name="acctBalance" value="${providerAccount?if_exists.acctBalance}"/>
				            <input type="hidden" name="acctFreezing" value="${providerAccount?if_exists.acctFreezing}"/>
				               <input type="hidden" name="ewBalance" value="${providerAccount?if_exists.ewBalance}"/>
				                <input type="hidden" name="acctChecksum" value="${providerAccount?if_exists.acctChecksum}"/>
				          	<input type="hidden" name="providerSts" value="<#if provider.providerSts == 10>10</#if>
				            <#if provider.providerSts == 1>1</#if>
				            <#if provider.providerSts == -10>-10</#if>
				            <#if provider.providerSts == -11>-11</#if> "/>
		
						  </tbody>
		      		</table>
				</div>
				
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      <input type="submit" value="下一步" class="ui-red-btn ui-pos3"/>
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
 alert("ssss");
   document.getElementById("providerTypeStyle").style.display="block";
 }else{
 document.getElementById("providerTypeStyle").style.display="none";
 }
 }
</script>
</body>
</html>