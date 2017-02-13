<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>操作员管理-查看</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	
</head>
<body>
  <div class="ui-info-box">
	<div class="ui-crumbs" id="crumbs">
	 <#include "/common/include/power.ftl">
	</div>
     
      <div class="ui-info-main">
        <h2 class="ui-info-tit">查看详情</h2>
          <ul class="ui-info-list">
           <!--查看-->
            <li class="ui-info-item">
           		<label class="ui-info-lbl">操作员ID</label>
           		<span>${user?if_exists.userId}</span>
               
           	</li>
           	 <li class="ui-info-item  ui-info-item-grey">
           		<label class="ui-info-lbl">操作员帐号</label>
           		<span>${user?if_exists.nickname}</span>
           		<input type="hidden" name="nickname" value="${user?if_exists.nickname}" class="easyui-validatebox ui-info-input"
               data-options="required:true,validType:['length[1,20]','letter']" missingMessage="请输入操作员帐号"/>
               
           	</li>
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">姓名</label>
           		<span>${user?if_exists.userName}</span>
           		<input type="hidden" name="userName" value="${user?if_exists.userName}" class="easyui-validatebox ui-info-input" 
           		data-options="required:true,validType:['length[1,20]','letchi']"/>
           	</li>
           	<li class="ui-info-item  ui-info-item-grey">
           		<label class="ui-info-lbl">手机</label>
           		<span>${user?if_exists.phone}</span>
           		<input type="hidden" name="phone"  value="${user?if_exists.phone}" class="easyui-validatebox ui-info-input" 
           		data-options="required:true,validType:['phone','length[11]']"/>
           	</li>
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">邮箱</label>
           		<span>${user?if_exists.email}</span>
           		<input type="hidden" name="email"  value="${user?if_exists.email}" class="easyui-validatebox ui-info-input"
                data-options="required:true,validType:'email'" missingMessage="请输入邮箱"/>
           	</li>
           	<li class="ui-info-item  ui-info-item-grey">
           		<label class="ui-info-lbl">所属角色</label>
           		<span>${user?if_exists.roleName}</span>
           		<select class="ui-info-sel fn-hide"  name="roleId">
           			<#if roleList?exists>
						<#list roleList as role>
							<option value="${role?if_exists.roleId}" <#if user.userId != null&&user.roleId==role.roleId>selected</#if>>${role?if_exists.roleName}</option>
						</#list>
					</#if>
           		</select>
           	</li>
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">状态</label>
           		<span>${user?if_exists.enabledStr}</span>
           		<select class="ui-info-sel fn-hide" name="enabled">
					<option value="1" <#if user.userId != null&&user.enabled==1>selected</#if> >正常</option>
					<option value="0" <#if user.userId != null&&user.enabled==0>selected</#if> >禁用</option>
           		</select>
           	</li>
           	<li class="ui-info-item noedit  ui-info-item-grey">
           		<label class="ui-info-lbl">最后修改人</label>
           		<span>${modifyUser?if_exists.nickname}</span>
           	</li>
           	<li class="ui-info-item noedit">
           		<label class="ui-info-lbl">最后修改时间</label>
           		<span>${user?if_exists.modifyTime?string('yyyy-MM-dd HH:mm:ss')}</span>
           	</li>
           	<#if pwd?has_content && pwd !='success'>
           		<li class="ui-info-item noedit">
           		<label class="ui-info-lbl">用户密码</label>
           		<span>${pwd}</span>
           	</li>
           	</#if>
          </ul>
    	</div>
     
	    <div class="ui-btn-double">
	       <a href="${base}/operator/toEdit?userId=${user?if_exists.userId}" class="ui-btn-blue">编辑</a>
	       <a href="${base}/operator/findListView" class="ui-btn-grey" >返回</a>
	    </div>
	
  </div>
 
</body>
</html>