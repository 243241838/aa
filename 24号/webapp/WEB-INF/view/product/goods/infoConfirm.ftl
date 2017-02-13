
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>货品管理-编辑</title>
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
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr class="platform-part">
				            <td class="ui-oddtd">货品编号：</td>
				            <td>
				            	${product?if_exists.productCode}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">货品名称：</td>
				            <td>
				            	${product?if_exists.productName}
				            </td>
				          </tr>
				         <tr class="platform-part">
				            <td class="ui-oddtd">面值：</td>
				            <td>
				            	${product?if_exists.productParvalue}
				            </td>
				           </tr>
				             <tr class="platform-part">
				            <td class="ui-oddtd">供应商：</td>
				            <td>
				             <#list providerList as item>
				             <#if product.providerId == "${item.providerId}">${item.providerName}</#if>
				             </#list>
				             </td>
				          </tr>
				             <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td>
				            	${product.effTimeStr} 	至  ${product.expTimeStr}
				            </td>
				          </tr>
				          </tbody>
				         <input type="hidden" name="productCode" value="${product?if_exists.productCode}"/>
				          <input type="hidden" name="productParvalue" value="${product?if_exists.productParvalue}"/>
				          <input type="hidden" name="productName" value="${product?if_exists.productName}"/>
				         <input type="hidden" name="providerId" value="${product?if_exists.providerId}"/>
				         <input type="hidden" name="effTimeStr" value="${product?if_exists.effTimeStr}"/>
				         <input type="hidden" name="expTimeStr" value="${product?if_exists.expTimeStr}"/>
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
    <div class="ui-dlg-text"><#if product.productCode !=0>编辑货品成功！<#else>新增货品成功！</#if></div>
    <a data-fn="backToList" href="/product/allListView" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog"  data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text"><#if product.productCode !=0>编辑货品失败！<#else>新增货品失败！</#if></div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>
</body>
</html>