<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>操作员管理-新增</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/control.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
<body>
<div class="ui-info-box">
	<div class="ui-crumbs" id="crumbs">
	 <#include "/common/include/power.ftl">
	</div>
	
	<form id="infoForm" method="post" action="${base}/operator/doAdd" >
    <div class="ui-info-main">
      <h2 class="ui-info-tit">新增操作员</h2>
       <ul class="ui-info-list">
            <input type="hidden" name="userId" value="${user?if_exists.userId}" />
            <input type="hidden" name="nickname" value="${user?if_exists.nickname}"/>
       		<input type="hidden" name="userName" value="${user?if_exists.userName}"/>
       		<input type="hidden" name="phone" value="${user?if_exists.phone}"/>
       		<input type="hidden" name="email" value="${user?if_exists.email}"/>
       		<input type="hidden" name="roleId" value="${user?if_exists.roleId}"/>
           	<li class="ui-info-item  ui-info-item-grey">
           		<label class="ui-info-lbl">操作员帐号</label>
           		<span>${user?if_exists.nickname}</span>
           	</li>
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">姓名</label>
           		<span>${user?if_exists.userName}</span>
           	</li>
           	<li class="ui-info-item  ui-info-item-grey">
           		<label class="ui-info-lbl">手机</label>
           		<span>${user?if_exists.phone}</span>
           	</li>
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">邮箱</label>
           		<span>${user?if_exists.email}</span>
           	</li>
           	<li class="ui-info-item  ui-info-item-grey">
           		<label class="ui-info-lbl">所属角色</label>
           		<span>${user?if_exists.roleName}</span>
           	</li>
	  </ul>
	</div>
	<div class="ui-btn-double">
     <input type="button" value="完成" class="ui-btn-blue" onclick="doOperAdd(this,'${base}/operator/findListView');"/>
     <input type="button" value="返回修改"  class="ui-btn-grey ui-back"/>
    </div>
	</form>
</div>      
 <!--弹框-->  
  <div id="dlgYes" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
 	<h3 class="ui-dlg-tit" id="msg">新增操作员成功!</h3>
  </div>
  
  <div id="dlgNo" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
 	<h3 class="ui-dlg-tit" id="msg">新增操作员失败!</h3>
 	<input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定">
  </div>
</body>
</html>