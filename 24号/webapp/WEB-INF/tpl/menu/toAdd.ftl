<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>自研产品管理-产品信息管理-产品管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>	
</head>

<body style="">
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	<#include "/common/include/power.ftl">
    </div>
   
		<div class="ui-datagrid-wrap">
			<!-- 搜索 -->
			<div class="search-wrap">
			<#if update??>
				<form  id="search" class="ui-search-form" action="/zwl/updateMenu" method="post">
				
					<ul class="search-list fn-clear">
							<label class="name">mapId</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt intOnly" type="text" name="mapId" value="${menuPo.mapId}" maxlength=9/>
							</span>
							<br>
							<label class="name">resourceId</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt intOnly" type="text" name="resourceId" value="${menuPo.resourceId}" maxlength=9 readonly="readonly"/>
							</span>
							<br>
							<label class="name">UrlId</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt intOnly" type="text" name="urlid" value="${menuPo.urlid}" maxlength=9/>
							</span>
							<br>
							<label class="name">resourceType</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt" type="text" name="resourceType" value="${menuPo.resourceType}"/>
							(MENU  or MENU_URL)
							</span>
							<br>
							<label class="name">菜单名</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt" type="text" name="name" value="${menuPo.name}"/>
							</span>
							<br>
							<label class="name">descs</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt" type="text" name="descs" value="${menuPo.descs}"/>
							</span>
							<br>
							<label class="name">priority</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt" type="text" name="priority" value="${menuPo.priority}"/>
							 (排序位置)
							</span>
							<br>
							<label class="name">parentId</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt" type="text" name="parentId" value="${menuPo.parentId}"/>
							</span>
							<br>
							<label class="name">url</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt" type="text" name="url" value="${menuPo.url}"/>
							 (排序位置)
							</span>
							<br>
							<label class="name">显示</label>
							<input  type="radio" name="enabled" value="1"  <#if ('${menuPo.enabled}'=='1')>checked</#if> />显示
							<input  type="radio" name="enabled" value="0"  <#if ('${menuPo.enabled}'=='0')>checked</#if>/>隐藏
							<br>
						<li class="btn-group">
							<a id="submit" href="javascript:void(0)" class="search-btn" onclick="submitForm()">更新</a>
						</li>
					</ul>
					
				</form>
				<#else>
				<form  id="search" class="ui-search-form" action="/zwl/toAddMenu" method="post">
					<ul class="search-list fn-clear">
							<label class="name">mapId</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt intOnly" type="text" name="mapId" maxlength=9/>
							</span>
							<br>
							<label class="name">resourceId</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt intOnly" type="text" name="resourceId" maxlength=9/>
							</span>
							<br>
							<label class="name">UrlId</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt intOnly" type="text" name="urlid" maxlength=9/>
							</span>
							<br>
							<label class="name">resourceType</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt" type="text" name="resourceType" value=""/>
							(MENU  or MENU_URL)
							</span>
							<br>
							<label class="name">菜单名</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt" type="text" name="name" value=""/>
							</span>
							<br>
							<label class="name">descs</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt" type="text" name="descs" value=""/>
							</span>
							<br>
							<label class="name">priority</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt" type="text" name="priority" value=""/>
							 (排序位置)
							</span>
							<br>
							<label class="name">parentId</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt" type="text" name="parentId" value=""/>
							</span>
							<br>
							<label class="name">url</label>
							<span class="textbox">
							<input class="textbox-text textbox-prompt" type="text" name="url" value=""/>
							 (排序位置)
							</span>
							<br>
							<label class="name">显示</label>
							<input  type="radio" name="enabled" value="1"/>显示
							<input  type="radio" name="enabled" value="0"/>隐藏
							<br>
							<label class="name">授权</label>
							<select id="" name="roleId">
								          <option>---请选择---</option>
								          <#list roleList as r>
								              <option value="${r.roleId}">${r.roleName}</option>
								          </#list>
							</select>
  							<br>
						<li class="btn-group">
							<a id="submit" href="javascript:void(0)" class="search-btn" onclick="submitForm()">保存</a>
						</li>
					</ul>
					
				</form>
				</#if>
				
			</div>
		</div>
	</div>
	
	<script>
	  function submitForm(){
	   $("#search").submit();
	   }
		
	</script>

</body>
</html>