<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>角色管理-查看</title>
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
		</div>
	    <form id="infoForm" method="post" action="${base}/role/doEdit" >
			<div class="ui-info-main">
		      <h2 class="ui-info-tit">查看详情</h2>
			  <ul class="ui-info-list">
	           <li class="ui-info-item">
	           		<label class="ui-info-lbl">角色ID</label>
	           		<span>${role?if_exists.roleId}</span>
	           		<input type="hidden" name="roleId" value="${role?if_exists.roleId}"/>
	           	</li>
	           	<li class="ui-info-item  ui-info-item-grey">
	           		<label class="ui-info-lbl">角色名称</label>
	           		<input type="text" name="roleName" value="${role?if_exists.roleName}" class="easyui-validatebox ui-info-input"  
	           		data-options="required:true,validType:['numChina']" missingMessage="请输入角色名称" maxlength="20"/>
	           	</li>
	           	<li class="ui-info-item">
	           		<label class="ui-info-lbl">职责描述</label>
	           		<input type="text" name="descs" value="${role?if_exists.descs}" class="easyui-validatebox ui-info-input" 
	           		data-options="required:true" missingMessage="请输入职责描述" maxlength="40"/>
	           	</li>
			  </ul>
			</div>
		    <div class="ui-btn-double">
		       <a href="javascript:void(0);" class="ui-btn-blue"  onclick="doOperEdit(this,'${base}/role/toInfo?roleId=${role?if_exists.roleId}');">保存</a>
		       <a href="javascript:void(0);" class="ui-btn-grey ui-back" >取消</a>
		    </div>
		</form>
	</div>

</body>
</html>