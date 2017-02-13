
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>系统参数管理-编辑</title>
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
		<a class="crumbs-link" href="#">系统参数管理<span>></span></a>
		<span class="crumbs-tit">编辑系统参数</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerch" method="post" action="/system/param/edit" >
	  	<input type="hidden" name="id" value="${systemParam?if_exists.id?if_exists}" />
	  	<input type="hidden" name="value" value="${value?if_exists}" />
			<div class="ui-info-wrap">
  	  			<h3 class="ui-info-tit"></h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr>
				            <td class="ui-oddtd">参数名称：</td>
				            <td>
				            	${systemParam?if_exists.title?if_exists}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">参数说明：</td>
				            <td>
				                ${systemParam?if_exists.describe?if_exists}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">参数值：</td>
				            <td>
				            	<#if systemParam?if_exists.ignoreRule?if_exists == 0>
				            		${value?if_exists}
				            	</#if>
				            	<#if systemParam?if_exists.ignoreRule?if_exists == 1>
				            		<#if value?if_exists == 0>开</#if>
				            		<#if value?if_exists == 1>关</#if>
				            	</#if>				            	 
				            </td>
				          </tr>
				          </tbody>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      <a href="javascript:ajaxSubmit('editMerch','dlgOk2','dlgWarn');" class="ui-red-btn ui-pos3">下一步</a>
	    </div>
		</form>
	</div>
</div>
<!--成功提示-->	      
<div id="dlgOk2" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
    <div class="ui-dlg-text">参数编辑成功！</div>
    <a data-fn="backToList" href="/system/param/listView" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text">参数编辑失败！</div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>
</body>
</html>