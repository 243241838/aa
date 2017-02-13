<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>密码修改</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/control.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script>
	  $(function(){
	   validExtend();
	  });
	</script>
</head>
<body>
<div class="ui-info-box">
	<div class="ui-crumbs" id="crumbs">
	 <#include "/common/include/power.ftl">
		<!-- <a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<span class="crumbs-tit">密码修改</span>-->
	</div>
   <form id ="editMerch" method="post" action="/operator/doPasswordEdit" >
    <div class="ui-info-main">
	  <h2 class="ui-info-tit"></h2>
      <ul class="ui-info-list">
       	<li class="ui-info-item">
       		<label class="ui-info-lbl">操作员ID</label>
       		${user?if_exists.userId}
       	</li>
       	<li class="ui-info-item ui-info-item-grey">
       		<label class="ui-info-lbl">操作员帐号</label>
       		${user?if_exists.nickname}
       	</li>
       	<li class="ui-info-item">
       		<label class="ui-info-lbl">姓名</label>
       		${user?if_exists.userName}
       	</li>
       	<li class="ui-info-item  ui-info-item-grey">
       		<label class="ui-info-lbl">原密码</label>
       		<input type="password" value="" class="easyui-validatebox ui-info-input" name="password_old"
           data-options="required:true,validType:['length[8,16]','code']" missingMessage="请输入原密码" invalidMessage="密码错误，请重新输入"/>
       	</li>
       	<li class="ui-info-item">
       		<label class="ui-info-lbl">新密码</label>
       		<input type="password" value="" class="easyui-validatebox ui-info-input"  name="password" id="pwd"
           data-options="required:true,validType:['length[8,16]','code']" missingMessage="请输入新密码" invalidMessage="请输入8-16位的数字和字母组合"/>
       	</li>
       	<li class="ui-info-item ui-info-item-grey">
       		<label class="ui-info-lbl">确认密码</label>
       		<input type="password"  class="easyui-validatebox ui-info-input" name="password_new" id="rpwd"
            required="required" validType="equals['#pwd']" missingMessage="请输入确认密码" invalidMessage="两次输入密码不一致"/>
       	</li>
      </ul>
    </div>
    <div class="ui-btn-double">
       <input type="button" value="确定" class="ui-btn-blue" onclick="modPwd(this,'${base}/');"/>
    </div>
  </form>  
</div>
			

<!--成功提示-->	
  <div id="dlgYes" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">修改密码成功！</h3>
  </div>

<!--失败提示-->	
  <div id="dlgNo" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">>修改密码失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定"/>
  </div>
</body>
</html>