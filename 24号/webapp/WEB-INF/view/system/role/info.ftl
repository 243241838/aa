<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>角色管理-<#if role.roleId != null>编辑<#else>新增</#if></title>
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
	  <form id ="editMerch" method="post" action="${action?if_exists}" >
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
				            	<input id="getRoleId" type="hidden" name="roleId" value="${role?if_exists.roleId}"/>
				            </td>
				          </tr>
				          </#if>
				          <tr class="platform-part">
				            <td class="ui-oddtd">名称：</td>
				            <td>
				                <input id='roleName' dataId="${role?if_exists.roleId}" dataType="reqRole"  type="text" maxlength=40  class="validate[required,custom[typeName],ajax[ajaxRoleName]] ui-dinput" name="roleName" value="${role?if_exists.roleName}"/>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">描述：</td>
				            <td>
				                <input type="text" class="ui-dinput" name="descs" maxlength=100 value="${role?if_exists.descs}"/>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">状态：</td>
				            <td>
				                <select class="ui-dselect" name="enabled">
				                	<option value="1" <#if role.enabled>selected</#if>>正常</option>
				                	<option value="0" <#if !role.enabled>selected</#if>>禁用</option>
				                </select>
				            </td>
				          </tr>
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
 
</script>
</body>
</html>