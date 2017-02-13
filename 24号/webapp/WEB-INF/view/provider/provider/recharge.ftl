<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>供应商管理-充值</title>
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
	 <form id ="editMerch" method="post"  action="${action?if_exists}" >
			<div class="ui-info-wrap">
			<h3 class="ui-info-tit"> 供应商账户信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <tr class="platform-part">
				            <td class="ui-oddtd">供应商ID：</td>
				            <td>
				            	${provider?if_exists.providerId}
				            </td>
				          </tr>
			          <tr class="platform-part">
				            <td class="ui-oddtd">供应商名称：</td>
				            <td>
				            	${provider?if_exists.providerName}
				            </td>
				          </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">账户类型：</td>
				            <td>
				             <#if providerAccount.acctType == 1>信用额度</#if>
				             <#if providerAccount.acctType == 2>预付款</#if>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">状态：</td>
				            <td>
				             <#if provider.providerSts == 10>正常</#if>
				             <#if provider.providerSts == -10>锁定</#if>
				              <#if provider.providerSts == -11>禁用</#if>
				              <#if provider.providerSts == 1>待审核</#if>
				              
				          </tr>
				          <#if providerAccount.acctType == 1> 
				          <tr class="platform-part">
				            <td class="ui-oddtd">信用额度：</td>
				            <td>
				                ${providerAccount?if_exists.acctBalance}
				            </td>
				          </tr></#if>
				     <#if providerAccount.acctType ==2> 
				          <tr class="platform-part">
				            <td class="ui-oddtd">账户余额：</td>
				            <td>
				                ${providerAccount?if_exists.acctBalance}
				            </td>
				          </tr></#if>
				             <tr class="platform-part">
				            <td class="ui-oddtd">充值金额：</td>
				            <td>
				              <input id='chargeAmount' 　  type="text" maxlength=40  class=" ui-dinput" name="chargeAmount"  />元
				            </td></tr>
				              <tr class="platform-part">
				            <td class="ui-oddtd">备注：</td>
				            <td>
				              <input id='chargeDesc' 　  type="text" maxlength=40  class=" ui-dinput" name="chargeDesc"  />
				            </td></tr>
				          <input type="hidden" name="providerId" value="${provider?if_exists.providerId}"/>
				           <input type="hidden" name="providerName" value="${provider?if_exists.providerName}"/>
				           
				             <input type="hidden" name="chargeAmount" value="${providerRecharge.chargeAmount}"/>
				           <input type="hidden" name="chargeDesc" value="${providerRecharge.chargeDesc}"/>
				             <input type="hidden" name="acctType" value="  <#if providerAccount.acctType == 1>1</#if>
				             <#if providerAccount.acctType == 2>2</#if>"/>
				                   <input type="hidden" name="acctBalance" value="${providerAccount?if_exists.acctBalance}"/>
				                       <input type="hidden" name="acctId" value="${providerAccount?if_exists.acctId}"/>
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
	       <input type="button" value="提交" onclick=downproduct($("#chargeAmount").val()); class="ui-red-btn ui-pos3"/>
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
     function downproduct(value){
     if(isNaN(value)){
      $.messager.alert('提示消息', '充值金额为数字！', 'warn');
        return;
     } 
      if (value.replace(/[ ]/g,"").length==0) {
       $.messager.alert('提示消息', '请输入充值金额！', 'warn');
       return;
     }
       $.messager.confirm('提示消息', '确定充值？充值金额'+value, function (r) {
             if (r) {
                 $.ajax({
                     url: '/provider/toreargeConfirm' ,
                     type: 'post',
                     datatype: 'text',
                     data: $('#editMerch').serialize(),
                     success: function (result) {
                         if (result>0) {
                            $.messager.alert("操作提示", "充值成功！", "info", function () {
                                 window.location.href="/provider/findprovidermoneyList";
                              });
                         }else{
                          $.messager.alert('提示消息', '充值失败！', 'warn');
                         }
                     }
                 });
             }
         });
         }
</script>
</body>
</html>