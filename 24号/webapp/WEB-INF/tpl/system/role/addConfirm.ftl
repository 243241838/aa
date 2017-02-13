<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>角色管理-编辑</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script type="text/javascript" src="${base}/resource/js/control.js"></script>

</head>
<body>
     <div class="ui-info-box">
		<div class="ui-crumbs" id="crumbs">
		 <#include "/common/include/power.ftl">
		</div>
	    <form id="infoForm" method="post" action="${base}/role/doAdd" >
	        <input type="hidden" name="roleName" value="${role?if_exists.roleName}"/>
	        <input type="hidden" name="descs" value="${role?if_exists.descs}"/>
			<div class="ui-info-main">
		      <h2 class="ui-info-tit">新增角色</h2>
			  <ul class="ui-info-list">
	           	<li class="ui-info-item">
	           		<label class="ui-info-lbl">角色名称</label>
	           		<span>${role?if_exists.roleName}</span>
	           	</li>
	           	<li class="ui-info-item ui-info-item-grey">
	           		<label class="ui-info-lbl">职责描述</label>
	           		<span>${role?if_exists.descs}</span>
	           	</li>
	          </ul>
	        </div>
		    <div class="ui-btn-double">
		       <input type="button" value="完成" class="ui-btn-blue ui-edit" onclick="doOperAdd(this,'${base}/role/findListView');"/>   
		       <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
		    </div>
		</form>
	</div>

<!--弹框-->  
  <div id="dlgYes" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
 	<h3 class="ui-dlg-tit" id="msg">新增角色成功!</h3>
  </div>
  
  <div id="dlgNo" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
 	<h3 class="ui-dlg-tit" id="msg">新增角色失败!</h3>
 	<input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定">
  </div>
</body>
</html>