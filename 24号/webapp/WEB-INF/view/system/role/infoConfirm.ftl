
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>角色管理-编辑</title>
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
  	  			<h3 class="ui-info-tit"></h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <#if role.roleId != null>
				          <tr>
				            <td class="ui-oddtd">角色ID：</td>
				            <td>
				            	${role?if_exists.roleId}
				            	<input type="hidden" name="roleId" value="${role?if_exists.roleId}"/>
				            </td>
				          </tr>
				          </#if>
				          <tr class="platform-part">
				            <td class="ui-oddtd">名称：</td>
				            <td>
				            	${role?if_exists.roleName}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">描述：</td>
				            <td>
				            	${role?if_exists.descs}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">状态：</td>
				            <td>
				            	<#if role.enabled>正常<#else>禁用</#if> 
				            </td>
				          </tr>
				          </tbody>
				          <input type="hidden" name="roleName" value="${role?if_exists.roleName}"/>
				          <input type="hidden" name="descs" value="${role?if_exists.descs}"/>
				          <input type="hidden" name="enabled" value="<#if role.enabled == true>true<#else>false</#if>"/>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:void(0);" id="back" class="ui-red-btn">返 回</a>
	      <a href="javascript:ajaxSubmit('editMerchs','dlgOk2','dlgWarn');" class="ui-red-btn ui-pos3">下一步</a>
	    </div>
		</form>
	</div>
</div>
<!--成功提示-->	      
<div id="dlgOk2" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
    <div class="ui-dlg-text"><#if role.roleId != null>编辑角色成功！<#else>新增角色成功！</#if></div>
    <a data-fn="backToList" href="/role/findListView" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog"  data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text"><#if role.roleId != null>编辑角色失败！<#else>新增角色失败！</#if></div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>
</body>
</html>