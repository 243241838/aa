
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>密钥管理-设置</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>

</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	  <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">角色管理 <span>></span></a>
		<span class="crumbs-tit">新增角色</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerchs" method="post" action="${action?if_exists}" >
			<div class="ui-info-wrap">
  	  			<h3 class="ui-info-tit">平台信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <#if provider.providerId != null>
				            	<input type="hidden" name="providerId" value="${provider?if_exists.providerId}"/>
				          </#if>
				         <tr class="platform-part">
				            <td class="ui-oddtd">平台ID：</td>
				            <td>
				              ${provider?if_exists.providerId}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">平台名称：</td>
				            <td>
				              <input type="hidden" name="providerName" value="${provider?if_exists.providerName}"/>
				               ${provider?if_exists.providerName}
				            </td>
				          </tr> 
				          </tbody>
		      		</table>
				</div>
				<h3 class="ui-info-tit">平台密钥信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				           <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td colspan="3">
				            ${providerKey.effTimeStr} 	至  ${providerKey.expTimeStr}
				            </td>
				          </tr> 
				            
		                    <tr class="platform-part">
				            <td class="ui-oddtd">密钥：</td>
				            <td>
				            	${providerKey?if_exists.publicKey}
				            </td>
				          </tr>
				          </tbody>
				            <input type="hidden" name="aests" value="${provider?if_exists.aests}"/>
				           <input type="hidden" name="publicKey" value="${providerKey?if_exists.publicKey}"/>
				           <input type="hidden" name="effTimeStr" value="${providerKey?if_exists.effTimeStr}"/>
				           <input type="hidden" name="expTimeStr" value="${providerKey?if_exists.expTimeStr}"/>				          
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:void(0);" id="back" class="ui-red-btn">返 回</a>
	      <a href="javascript:ajaxSubmit('editMerchs','dlgOk2','dlgWarn');" class="ui-red-btn ui-pos3">保存</a>
	    </div>
		</form>
	</div>
</div>
<!--成功提示-->	      
<div id="dlgOk2" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
    <div class="ui-dlg-text"><#if provider.aests ==0>新增密钥成功！<#else>编辑密钥成功！</#if></div>
    <a data-fn="backToList" href="/provider/keyList" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog"  data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text"><#if provider.aests ==0>新增密钥失败！<#else>编辑密钥失败！</#if></div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>
</body>
</html>