<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>密码修改</title>
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
		$("#editMerch").validationEngine('attach', {
			onValidationComplete: function(form, status){
				status&&ajaxSubmit('editMerch','dlgOk2','dlgWarn');
			},
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
		<span class="crumbs-tit">密码修改</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerch" method="post" action="/operator/doPasswordEdit" >
			<div class="ui-info-wrap">
  	  			<h3 class="ui-info-tit"></h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr>
				            <td class="ui-oddtd">操作员ID：</td>
				            <td>
				            	${user?if_exists.userId}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">用户名：</td>
				            <td>
				                ${user?if_exists.nickname}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">原密码：</td>
				            <td>
				                <input type="password" dataType="reqOldPwd" class="validate[required,custom[pwdLen],ajax[ajaxUserPwd]]  ui-dinput" maxlength=16 id="password_old" name="password_old"/>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">新密码：</td>
				            <td>
				                <input type="password" dataType="reqNewPwd" class="validate[required,custom[pwdLen],funcCall[pwdFunc]] ui-dinput" maxlength=16 id="password" name="password"/>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">确认密码：</td>
				            <td>
				                <input type="password" dataType="reqNewPwd" class="validate[required,equals[password]] ui-dinput" maxlength=16 name="password_new"/>
				            </td>
				          </tr>
						  </tbody>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp ui-submit-one">
		      <input type="submit" class="ui-red-btn ui-pos3" value="下一步" />
		    </div>
		</form>
	</div>
</div>
<!--成功提示-->	      
<div id="dlgOk2" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
    <div class="ui-dlg-text">修改密码成功！</div>
    <a data-fn="backToList" href="#" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog"  data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text">修改密码失败！</div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>
</body>
</html>