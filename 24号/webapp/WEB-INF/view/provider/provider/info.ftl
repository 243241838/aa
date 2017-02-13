<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>供应商管理-<#if provider.providerId != null>编辑<#else>新增</#if></title>
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

  <div class="ui-info-content">
	  <form id ="editMerch" method="post" action="" >
			<div class="ui-info-wrap">
			<h3 class="ui-info-tit"> 供应商账户信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr class="platform-part">
				            <td class="ui-oddtd">结算方式：</td>
				            <td>
				             <#if providerAccount.acctType == 1>信用额度</#if>
				             <#if providerAccount.acctType == 2>预付款</#if>
				            </td>
				          </tr>
				           
				            <tr class="platform-part">
				            <td class="ui-oddtd">预警金额：</td>
				            <td>
				            	${providerAccount?if_exists.ewBalance}
				            </td>
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
				            	${provider?if_exists.providerName}
				            </td>
				          </tr>
				           
				            <tr class="platform-part">
				            <td class="ui-oddtd">地址：</td>
				            <td>
				            	${provider?if_exists.providerAddress}
				            </td>
				           <tr class="platform-part">
				            <td class="ui-oddtd">证件类型：</td>
				            <td>
				             <#if identitieList.idenType == 10>身份证</#if>
				            <#if identitieList.idenType == 20>组织机构代码证</#if>
				            <#if identitieList.idenType == 21>营业执照</#if>
				            <#if identitieList.idenType == 22>税务登记证</#if>
				            </td>
				            <td class="three">证件号码：</td>
				            <td>
				            	${identitieList?if_exists.idenNo}
				            </td>
				          </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">联系人姓名：</td>
				            <td>
				            	${provider?if_exists.providerContacts}
				            </td>
				                <td class="three">联系人电话：</td>
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
 
</script>
</body>
</html>