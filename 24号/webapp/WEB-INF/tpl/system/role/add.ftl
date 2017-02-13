<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>角色管理-新增</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
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
		</div>
	    <form id="infoForm" method="post" action="${base}/role/toAddConfirm" >
			<div class="ui-info-main">
		      <h2 class="ui-info-tit">新增角色</h2>
			  <ul class="ui-info-list">
	           	<li class="ui-info-item">
	           		<label class="ui-info-lbl">角色名称</label>
	           		<input type="text" name="roleName" value="${role?if_exists.roleName}" class="easyui-validatebox ui-info-input"  
	           		data-options="required:true,validType:['numChina','maxlen[20]']" missingMessage="请输入角色名称"/>
	           	</li>
	           	<li class="ui-info-item ui-info-item-grey">
	           		<label class="ui-info-lbl">职责描述</label>
	           		<input type="text" name="descs" value="${role?if_exists.descs}" class="easyui-validatebox ui-info-input" 
	           		data-options="required:true,validType:['maxlen[40]']" missingMessage="请输入职责描述"/>
	           	</li>
	          
			  </ul>
			</div>
		    <div class="ui-btn-double">
		       <input type="button" value="下一步" class="ui-btn-blue ui-submit <#if role.roleId != null>fn-hide</#if>" onclick="doSubmit(this);"/>
		       <input type="button" value="编辑" class="ui-btn-blue ui-edit <#if role.roleId == null>fn-hide</#if>" onclick="operShowEdit();"/>   
		       <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
		    </div>
		</form>
	</div>

</body>
</html>