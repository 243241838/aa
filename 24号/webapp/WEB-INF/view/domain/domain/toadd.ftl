<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>渠道管理-新增</title>
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
	<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
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
			<h3 class="ui-info-tit"> 渠道账户信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr class="platform-part">
				            <td class="ui-oddtd">账户类型：</td>
				            <td>
				 	                 <select class="ui-dselect" name="acctType"    onchange="changelist(this.value)">
				                	<option value="1" <#if domainAccount.acctType == 1>selected</#if>>信用额度</option>
				                	<option value="2" <#if domainAccount.acctType == 2>selected</#if>>预付款</option>
				                </select>
				            </td>
				          </tr>
		 
				          <tr class="platform-part"     id="styletype" >
				            <td class="ui-oddtd">信用额度：</td>
				            <td>
				                <input id='acctBalance' 　  type="text" maxlength=40   class="validate[required,custom[money]  ui-dinput"    name="acctBalance"   value="0"  />元
				            </td>
				          </tr> 
				           
				            <tr class="platform-part">
				            <td class="ui-oddtd">预警金额：</td>
				            <td>
				              <input id='ewBalance' 　  type="text" maxlength=40   class="validate[required,custom[money]  ui-dinput " name="ewBalance"  />元
				            </td>
				   
				           <tr class="platform-part">
				            <td class="ui-oddtd">渠道状态：</td>
				            <td>
				               <select class="ui-dselect" name="domainSts">
				                	<option value="1" <#if domain.domainSts==1>selected</#if>>待审核</option>
				                	<option value="10" <#if domain.domainSts==10>selected</#if>>正常</option>
				                	<option value="-10" <#if domain.domainSts==-10>selected</#if>>锁定</option>
				                	<option value="-11" <#if domain.domainSts==-11>selected</#if>>禁用</option>
				                </select>
				           </td>
				 </tr>
						  </tbody>
		      		</table>
				</div>
			
  	  			<h3 class="ui-info-tit"> 渠道基本信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr class="platform-part">
				            <td class="ui-oddtd">渠道名称：</td>
				            <td>
				              <input id="getRoleId" type="hidden" name="domainId" value="${domain?if_exists.domainId}"/>
				               <input id='domainName' 　dataId="${domain?if_exists.domainId}" dataType="reqDomain"   type="text" maxlength=40   class="validate[required,custom[typeName],ajax[ajaxDomainName]] ui-dinput"  name="domainName" value="${domain?if_exists.domainName}"/>
				            </td>
				            <td></td>
				            <td></td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">渠道类型：</td>
				            <td colspan="3">
				            
				              <select class="ui-dselect" name="domainType">
				                	<option value="10" <#if domain.domainType==10>selected</#if>>银行</option>
				                	<option value="11" <#if domain.domainType==11>selected</#if>>第三方支付</option>
				                	<option value="12" <#if domain.domainType==12>selected</#if>>P2P</option>
				                	<option value="20" <#if domain.domainType==20>selected</#if>>电商</option>
				                	<option value="1" <#if domain.domainType==1>selected</#if>>其他 </option>
				                </select>
				            </td>
				          </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">地址：</td>
				            <td>
				            	 <input id='domainAddress' 　  type="text" maxlength=40  class=" ui-dinput" name="domainAddress" value="${domain?if_exists.domainAddress}"/>
				            </td>
				           
				           <tr class="platform-part">
				            <td class="ui-oddtd">证件类型：</td>
				            <td>
				            
				              <select class="ui-dselect" name="idenType">
				                	<option value="10" <#if identitie.idenType==10>selected</#if>>身份证</option>
				                	<option value="20" <#if identitie.idenType==20>selected</#if>>组织机构代码证</option>
				                	<option value="21" <#if identitie.idenType==21>selected</#if>>营业执照</option>
				                	<option value="22" <#if identitie.idenType==22>selected</#if>>税务登记证</option>
				                </select>
				            </td>
				            <td  class="three">证件号码：</td>
				            <td>
				             <input id='idenNo' 　  type="text"  class="  ui-dinput" name="idenNo"    value="${identitie?if_exists.idenNo}"/>
				            </td>
				          </tr>
				 
				            <tr class="platform-part">
				            <td class="ui-oddtd">联系人姓名：</td>
				            <td>
				            <input id='domainContacts' 　  type="text" maxlength=40  class="validate[required,custom[typeName]] ui-dinput"  name="domainContacts" value="${domain?if_exists.domainContacts}"/>
				            </td>
				            <td class="three">联系人电话：</td>
				            <td>
				               <input id='domainTel' 　  type="text" maxlength=40  class="validate[required,custom[phone]] ui-dinput"  name="domainTel" value="${domain?if_exists.domainTel}"/>
				            </td>
				          </tr>
				        <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td colspan="3">
				            <input id="effTime" name="effTimeStr" class="easyui-datebox" value="${countDayBegin}" validType="mdM['#effTime']">
					<em>至</em>
					<input id="expTime" name="expTimeStr"   class="easyui-datebox" value="${countDayEnd}" validType="mdM['#expTime']">
				            </td>
				          </tr>
				            <input type="hidden" name="domainType" value="<#if domain.domainType == 10>10</#if>
				            <#if domain.domainType == 11>11</#if>
				            <#if domain.domainType == 12>12</#if>
				            <#if domain.domainType == 20>20</#if> 
				            <#if domain.domainType == 1>1</#if>"/>
				              <input type="hidden" name="domainSts" value="<#if domain.domainSts == 10>10</#if>
				            <#if domain.domainSts == 1>1</#if>
				            <#if domain.domainSts == -10>-10</#if>
				            <#if domain.domainSts == -11>-11</#if> "/>
				        <input type="hidden" name="settType" value="${domain?if_exists.settType}"/>
				           <input type="hidden" name="domainIps" value="${domain?if_exists.domainIps}"/>
				              <input type="hidden" name="authSts" value="${domain?if_exists.authSts}"/>
				                    <input type="hidden" name="domainDesc" value="${domain?if_exists.domainDesc}"/>
				              <input type="hidden" name="serviceId" value="${domainAccount?if_exists.serviceId}"/>
				             <input type="hidden" name="acctType" value="  <#if domainAccount.acctType == 1>1</#if>
				             <#if domainAccount.acctType == 2>2</#if>"/>
				             <input type="hidden" name="billingType" value="${domainAccount?if_exists.billingType}"/>
				            <input type="hidden" name="acctFreezing" value="${domainAccount?if_exists.acctFreezing}"/>
				                <input type="hidden" name="acctChecksum" value="${domainAccount?if_exists.acctChecksum}"/>
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
 if(value==1){   
   document.getElementById("styletype").style.display="";
 }else{
 document.getElementById("styletype").style.display="none";
 }
 }
</script>
</body>
</html>