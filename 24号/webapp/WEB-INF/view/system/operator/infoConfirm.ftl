<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>操作员管理-信息</title>
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
		<!-- <a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">操作员管理 <span>></span></a>
		<span class="crumbs-tit">操作员信息</span> -->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerch" method="post" action="${action?if_exists}" >
			<div class="ui-info-wrap">
  	  			<h3 class="ui-info-tit"></h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          	<#if user.userId != null>
				          <tr>
				            <td class="ui-oddtd">操作员ID：</td>
				            <td>
				            	${user?if_exists.userId}
				            	<input type="hidden" name="userId" value="${user?if_exists.userId}"/>
				            </td>
				          </tr>
				          </#if>
				          <tr class="platform-part">
				            <td class="ui-oddtd">用户名：</td>
				            <td>
				            	${user?if_exists.nickname}
				               <input type="hidden" name="nickname" value="${user?if_exists.nickname}"/>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">姓名：</td>
				            <td>
				                ${user?if_exists.userName}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">身份证号：</td>
				            <td>
				                ${user?if_exists.reserved02}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">手机：</td>
				            <td>
				                ${user?if_exists.phone}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">邮箱：</td>
				            <td>
				                ${user?if_exists.email}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">所属角色：</td>
				            <td>
				                ${user?if_exists.roleName}
				            </td>
				          </tr>
						  </tbody>
						  <input type="hidden" name="userId" value="${user?if_exists.userId}"/>
						  <input type="hidden" name="userName" value="${user?if_exists.userName}"/>
						  <input type="hidden" name="reserved02" value="${user?if_exists.reserved02}"/>
						  <input type="hidden" name="phone" value="${user?if_exists.phone}"/>
						  <input type="hidden" name="email" value="${user?if_exists.email}"/>
						  <input type="hidden" name="roleId" value="${user?if_exists.roleId}"/>
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
    <div class="ui-dlg-text"><#if user.userId != null>编辑操作员成功！<#else>新增操作员成功！<p>您的密码为:<span id="operator-pwd"></span></p></#if></div>
    <a data-fn="backToList" href="/operator/findListView" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog"  data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text"><#if user.userId != null>编辑<#else>新增</#if>操作员失败！</div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>
</body>
</html>