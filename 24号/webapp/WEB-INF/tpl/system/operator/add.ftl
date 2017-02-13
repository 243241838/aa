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
     <form id="infoForm" method="post" action="${base}/operator/toAddConfirm" >
     
      <div class="ui-info-main">
        <h2 class="ui-info-tit">新增操作员</h2>
          <ul class="ui-info-list">
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">操作员帐号</label>
           		<input type="text" name="nickname" value="" class="easyui-validatebox ui-info-input"
               data-options="required:true,validType:['maxlen[20]','letter','ajaxoper']" missingMessage="请输入操作员帐号"/>  
           	</li>
           	<li class="ui-info-item ui-info-item-grey">
           		<label class="ui-info-lbl">姓名</label>
           		<input type="text" name="userName" value="" class="easyui-validatebox ui-info-input" 
           		data-options="required:true,validType:['length[1,20]','letchi']"/>
           	</li>
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">手机</label>
           		<input type="text" name="phone" value="" class="easyui-validatebox ui-info-input" 
           		data-options="required:true,validType:['phone','length[11]']"/>
           	</li>
           	<li class="ui-info-item  ui-info-item-grey">
           		<label class="ui-info-lbl">邮箱</label>
           		<input type="text" name="email" value="" class="easyui-validatebox ui-info-input"
                data-options="required:true,validType:'email'" missingMessage="请输入邮箱"/>
           	</li>
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">所属角色</label>
           		<select class="ui-info-sel"  name="roleId">
           			<#if roleList?exists>
						<#list roleList as role>
							<option value="${role?if_exists.roleId}" <#if user.userId != null&&user.roleId==role.roleId>selected</#if>>${role?if_exists.roleName}</option>
						</#list>
					</#if>
           		</select>
           	</li>
         
          </ul>
    	</div>
     
	    <div class="ui-btn-double">
	   
	       <input type="button" value="下一步" class="ui-btn-blue ui-submit" onclick="doSubmit(this);"/>
	       <input type="button" value="取消"  class="ui-btn-grey ui-back"/>
	    </div>
	  
    </form>
  </div>
  
 
</body>
</html>