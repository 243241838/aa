<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>操作员管理-编辑</title>
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
     <form id="infoForm" method="post" action="${base}/operator/doEdit" >
     
      <div class="ui-info-main">
        <h2 class="ui-info-tit">查看详情</h2>
          <ul class="ui-info-list">
           	<input type="hidden" name="userId" value="${user?if_exists.userId}" />
            <li class="ui-info-item">
           		<label class="ui-info-lbl">操作员ID</label>
           		<span>${user?if_exists.userId}</span>
           	</li>
           	 <li class="ui-info-item  ui-info-item-grey">
           		<label class="ui-info-lbl">操作员帐号</label>
           		<input type="text" name="nickname" value="${user?if_exists.nickname}" class="easyui-validatebox ui-info-input"
               data-options="required:true,validType:['length[1,20]','letter']" missingMessage="请输入操作员帐号"/>
               
           	</li>
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">姓名</label>
           		<input type="text" name="userName" value="${user?if_exists.userName}" class="easyui-validatebox ui-info-input" 
           		data-options="required:true,validType:['length[1,20]','letchi']"/>
           	</li>
           	<li class="ui-info-item  ui-info-item-grey">
           		<label class="ui-info-lbl">手机</label>
           		<input type="text" name="phone"  value="${user?if_exists.phone}" class="easyui-validatebox ui-info-input" 
           		data-options="required:true,validType:['phone','length[11]']"/>
           	</li>
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">邮箱</label>
           		<input type="text" name="email"  value="${user?if_exists.email}" class="easyui-validatebox ui-info-input"
                data-options="required:true,validType:'email'" missingMessage="请输入邮箱"/>
           	</li>
           	<li class="ui-info-item  ui-info-item-grey">
           		<label class="ui-info-lbl">所属角色</label>
           		<select class="ui-info-sel"  name="roleId">
           			<#if roleList?exists>
						<#list roleList as role>
							<option value="${role?if_exists.roleId}" <#if user.userId != null&&user.roleId==role.roleId>selected</#if>>${role?if_exists.roleName}</option>
						</#list>
					</#if>
           		</select>
           	</li>
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">状态</label>
           		<select class="ui-info-sel" name="enabled">
					<option value="1" <#if user.userId != null&&user.enabled==1>selected</#if> >正常</option>
					<option value="0" <#if user.userId != null&&user.enabled==0>selected</#if> >禁用</option>
           		</select>
           	</li>
          </ul>
    	</div>
     
	    <div class="ui-btn-double">
	   
	       <a href="javascript:void(0);" class="ui-btn-blue" onclick="doOperEdit(this,'${base}/operator/toInfo?userId=${user?if_exists.userId}');">保存</a>
	       <a href="javascript:void(0);" class="ui-btn-grey ui-back">取消</a>
	    </div>
	  
    </form>
  </div>
  
   <!--弹框-->  
  <div id="dlgYes" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
 	<h3 class="ui-dlg-tit" id="msg">编辑操作员成功!</h3>
 	<input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定">
  </div>
  
  <div id="dlgNo" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
 	<h3 class="ui-dlg-tit" id="msg">编辑操作员失败!</h3>
 	<input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定">
  </div>
 
</body>
</html>