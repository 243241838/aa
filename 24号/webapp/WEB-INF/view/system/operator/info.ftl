<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>操作员管理-<#if user.userId != null>编辑<#else>新增</#if></title>
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
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
	<script>
	  $(document).ready(function(){
		$("#editMerch").validationEngine({
			maxErrorsPerField: 1
		});
	 });
	</script>
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
				            <#if user.userId != null>
				            	${user?if_exists.nickname}
				            	<input type="hidden" name="nickname" value="${user?if_exists.nickname}"/>
				            <#else>
				            	<input type="text"  dataType="reqUserName" class="validate[required,custom[name],custom[typeName],ajax[ajaxOpeName] ui-dinput" maxlength=40 name="nickname" value="${user?if_exists.nickname}"/>
				          	</#if>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">姓名：</td>
				            <td>
				                <input type="text" dataType="reqName" class="validate[required,custom[name],custom[typeName]] ui-dinput" name="userName" maxlength=40  value="${user?if_exists.userName}"/>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">身份证号：</td>
				            <td>
				                <input type="text"  dataType="reqID" class="validate[required,custom[idCard]] ui-dinput" maxlength=18 name="reserved02" value="${user?if_exists.reserved02}"/>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">手机：</td>
				            <td>
				                <input type="text"  dataType="reqMobile" class="validate[required,custom[mobile]] ui-dinput intOnly" maxlength=11 name="phone" value="${user?if_exists.phone}"/>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">邮箱：</td>
				            <td>
				                <input type="text"  dataType="reqEmail" class="validate[required,custom[email]] ui-dinput" name="email" maxlength=120 value="${user?if_exists.email}"/>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">所属角色：</td>
				            <td>
				                <select class="ui-dselect" name="roleId">
				                	<#if roleList?exists>
										<#list roleList as role>
											<option value="${role?if_exists.roleId}" <#if user.userId != null&&user.roleId==role.roleId>selected</#if>>${role?if_exists.roleName}</option>
										</#list>
									</#if>
				                </select>
				            </td>
				          </tr>
						  </tbody>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      <input type="submit" class="ui-red-btn ui-pos3" value="下一步" />
	    </div>
		</form>
	</div>
</div>
</body>
</html>