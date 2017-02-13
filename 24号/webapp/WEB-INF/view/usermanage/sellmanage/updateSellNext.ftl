<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>用户管理-商户管理-编辑</title>
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
	</div>
  <div class="ui-info-content">
  <form id ="editMerchNext" method="post" action="/userManage/sellerManage/updateSellOk" >
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">商户基本信息</h3>
			<div class="ui-infobg">
				<table class="ui-center-tab">
          <tbody>
	          <tr>
	            <td class="ui-oddtd">商户ID：</td>
	            <td data-str="str">
	            	${usersSellerExtendMdl.userId}
	            </td>
	          </tr>
	          <tr>
	            <td class="ui-oddtd">账户名：</td>
	            <td>
	                ${usersSellerExtendMdl.username}
	            </td>
	          </tr>
	          <tr>
	            <td class="ui-oddtd">实名：</td>
	            <td>
	               ${usersSellerExtendMdl.sellerName}
	            </td>
	          </tr>
	          <tr>
	            <td class="ui-oddtd">商户类型：</td>
	            <td>
	                ${usersSellerExtendMdl.sellerTypeName}
	            </td>
	          </tr>
	          <!--商户类型为平台 才显示-->
		       <#-- <#if usersSellerExtendMdl.sellerType==1>-->
	           <tr class="platform-part">
	            <td class="ui-oddtd">平台IP地址：</td>
	            <td>
	                ${usersSellerExtendMdl.sellerIps}
	            </td>
	          </tr>
	           <tr  class="platform-part">
	            <td class="ui-oddtd">平台域名：</td>
	            <td>
	                ${usersSellerExtendMdl.sellerDomain}
	            </td>
	          </tr>
	         <#-- </#if>-->
	          <tr>
	            <td class="ui-oddtd">商户类别：</td>
	            <td>
	                ${usersSellerExtendMdl.userLevelExtendMdl.levelName}
	            </td>
	          </tr>
	          <input type="hidden"  name="userId" value="${usersSellerExtendMdl.userId}" />
	          <input type="hidden"  name="sellerIps" value="${usersSellerExtendMdl.sellerIps}" />
	          <input type="hidden"  name="sellerDomain" value="${usersSellerExtendMdl.sellerDomain}" />
			    </tbody>
	      </table>
			</div>
		</div>
		
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">收银限额</h3>
			<div class="ui-infobg ui-infobg-line">
			  <table class="ui-info-tab" >
			    <tr>
			      <td class="ui-oddtd">日收银限额：</td>
            <td>
              ${usersSellerExtendMdl.userLevelExtendMdl.dayMoneyYuan} 元
            </td>
             <td class="ui-oddtd">月收银限额：</td>
            <td>
              ${usersSellerExtendMdl.userLevelExtendMdl.monthMoneyYuan} 元
            </td>
          </tr>
			  </table>
			</div>
		</div>
				
		<div class="ui-info-wrap ui-multi-wrap ui-info-two" 
		     <#if usersSellerExtendMdl.sellerType!=1>style="margin-bottom:20px;"</#if>>
            <h3 class="ui-info-tit">手续费</h3>
			<div class="ui-infobg">
				<table class="ui-info-tab" width="900">
		      <tr>
		      	<td class="ui-firtd ui-oddtd" >收银手续费：
		      	<input type="hidden"  name="feeSellerExtendMdl[0].operType" value="${usersSellerExtendMdl.feeSellerExtendMdl[0].operType}" />
		      	</td>
		      	<td colspan='3'></td>
		      </tr>
		      <tr class="radio-wrap">
		      	<td class="ui-oddtd">手续费类型：</td>
		      	<td colspan='3' class="ui-eventd "> 
		      		${usersSellerExtendMdl.feeSellerExtendMdl[0].calculationMethodName} 
		      	</td>
		      </tr>
		      <tr class="ui-lastr">
		      	<td class="ui-oddtd">手续费值：</td>
		      	<#if usersSellerExtendMdl.feeSellerExtendMdl[0].calculationMethod==0><!--百分比-->
		      	<td colspan='3' class="ui-eventd fn-fee">
		      	    ${usersSellerExtendMdl.feeSellerExtendMdl[0].scale} %
		      		<label class="ui-pos3">下限：</label>
		      		${usersSellerExtendMdl.feeSellerExtendMdl[0].minimumYuan} 元
		      		<label  class="ui-pos3">上限：</label>
		      		${usersSellerExtendMdl.feeSellerExtendMdl[0].maximumYuan} 元
		      	</td>
		      	<#else>
		      	<td colspan='3' class="ui-eventd fn-fee">
		      	    ${usersSellerExtendMdl.feeSellerExtendMdl[0].fixedYuan} 元
		      	</td>
		      	</#if>
		      </tr>
				</table>
			</div>
			<!--商户类型为平台 显示内容-->
			<#if usersSellerExtendMdl.sellerType==1>
			<div class="ui-infobg2 platform-part">
				<table class="ui-info-tab" width="900">
		      <tr>
		      	<td class="ui-firtd ui-oddtd">银行代付手续费：
		      	</td>
		      	<td colspan='3'></td>
		      </tr>
		      <tr class="radio-wrap">
		      	<td class="ui-oddtd">手续费类型：</td>
		      	<td colspan='3' class="ui-eventd"> 
		      		${usersSellerExtendMdl.feeSellerExtendMdl[1].calculationMethodName} 
		      	</td>
		      </tr>
		      <tr class="ui-lastr">
		      	<td class="ui-oddtd">手续费值：</td>
		      	<#if usersSellerExtendMdl.feeSellerExtendMdl[1].calculationMethod==0><!--百分比-->
		      	<td colspan='3' class="ui-eventd fn-fee">${usersSellerExtendMdl.feeSellerExtendMdl[1].scale} %
		      		<label class="ui-pos3">下限：</label>
		      		${usersSellerExtendMdl.feeSellerExtendMdl[1].minimumYuan} 元
		      		<label  class="ui-pos3">上限：</label>
		      		${usersSellerExtendMdl.feeSellerExtendMdl[1].maximumYuan} 元
		      	</td>
		      	<#else>
		      	<td colspan='3' class="ui-eventd fn-fee"> 
		      	    ${usersSellerExtendMdl.feeSellerExtendMdl[1].fixedYuan} 元
		      	</td>
		      	</#if>
		      </tr>
				</table>
			</div>
			</#if>
		</div>
		
	  <div class="ui-submit-warp">
      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
      <a href="javascript:ajaxSubmit('editMerchNext','dlgOk2','dlgWarn');" class="ui-red-btn ui-pos3">提 交</a>
    </div>
	</form>
	</div>
</div>
  <!--成功提示-->	      
	<div id="dlgOk2" class="ui-dialog ok2-dialog">
		<div class="ui-dlg-content ui-relative">
	    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
	    <div class="ui-dlg-text">商户编辑成功！</div>
	    <a data-fn="backToList" href="/userManage/sellerManage/sellMessage" class="ui-red-btn ui-toList">确 定</a>
		</div>
	</div>
	<!--失败提示-->	
	<div id="dlgWarn" class="ui-dialog warn-dialog" >
		<div class="ui-dlg-content ui-relative">
     <div class="ui-dlg-text">商户编辑失败！</div>
     <a href="#" class="ui-red-btn ui-toClose">确 定</a>
		</div>
	</div>
</body>
</html>