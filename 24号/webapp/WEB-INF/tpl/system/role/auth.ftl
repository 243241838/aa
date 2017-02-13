<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>角色管理-授权</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/control.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script type="text/javascript" src="${base}/resource/js/checkTree.js"></script>
</head>
<body>
 <div class="ui-info-box">
	<div class="ui-crumbs" id="crumbs">
	<#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">角色管理 <span>></span></a>
		<span class="crumbs-tit">授权</span>-->
	</div>
	
	<form id ="editMerch" method="post" action="/role/grantAuth" >
      <div class="ui-info-main  ui-info-wrap-tree">
        <h2 class="ui-info-tit">角色信息</h2>
          <ul class="ui-info-list">
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">角色ID</label>
           		${role?if_exists.roleId}
				<input type="hidden" name="roleId" value="${role?if_exists.roleId}"/>
           	</li>
           	<li class="ui-info-item ui-info-item-grey">
           		<label class="ui-info-lbl">角色名称</label>
           		${role?if_exists.roleName}
				<input type="hidden" name="roleName" value="${role?if_exists.roleName}"/>
           	</li>
           	<li class="ui-info-item fn-clear" >
           		<label class="ui-info-lbl authorize-name fn-left">授权资源：</label>
           		<div class="authorize fn-left">
            		<ul class="authorize-list">
            			<!--第一级循环-->
            			<#if resourceList?has_content>
						<#list resourceList as list>
            			<li class="authorize-list-item fn-clear">
            				<div class="aut-fir aut-padding fn-left"><!--菜单一-->
            					<input name="resourceIds" type="checkbox" id="${list_index+1}_" <#if list.selected==1>checked</#if> class="aut-check" value="${(list.resourceId)?if_exists}">
            					<span class="aut-check-show"></span>${(list.name)?if_exists}<!-- 循环后id为1_、2_这种形式 -->
            				</div>
            				<div class="aut-box-fir fn-left">
            					<!--第二级循环-->
		            			<#if list.childList?has_content>
								<#list list.childList as listTwo>
            					<div class="aut-box-fir-item fn-clear">
	            					<div class="aut-sec aut-padding fn-left<#if !listTwo.childList?has_content> aut-bor-r</#if>"><!--菜单二-->
	            						<input name="resourceIds" type="checkbox" id="${list_index+1}_${listTwo_index+1}_" <#if listTwo.selected==1>checked</#if> class="aut-check" value="${(listTwo.resourceId)?if_exists}">
	            						<span class="aut-check-show"></span>${(listTwo.name)?if_exists}<!-- 循环后id为1_1_、1_2_这种形式 -->
	            					</div>
	            					<div class="aut-box-two fn-left">
	            						<!--第三级循环-->
	            						<#if listTwo.childList?has_content>
										<#list listTwo.childList as listThree>
		            					<div class="aut-box-two-item fn-clear">
		            						<div class="aut-third aut-padding fn-left<#if !listThree.childList?has_content> aut-bor-r</#if>"><!--菜单三 可无-->
			            						<#if listThree.menuImage4=="NONE">
			            							<input name="resourceIds" type="checkbox" class="aut-check aut-hide" id="${list_index+1}_${listTwo_index+1}_${listThree_index+1}_" <#if listThree.selected==1>checked</#if> value="${(listThree.resourceId)?if_exists}">
			            							<span class="aut-check-show aut-hide"></span><!-- 循环后id为这种形式 -->
			            						<#else>
			            							<input name="resourceIds" type="checkbox" class="aut-check" id="${list_index+1}_${listTwo_index+1}_${listThree_index+1}_" <#if listThree.selected==1>checked</#if> value="${(listThree.resourceId)?if_exists}">
			            							<span class="aut-check-show"></span>${(listThree.name)?if_exists}<!-- 循环后id为这种形式 -->
			            						</#if>
		            						</div>
		            						<!--第四级循环-->
			            					<div class="aut-fourth fn-left"><!--菜单四-->
			            						<!-- 无三级菜单时 加此class：aut-bor-r -->
			            						<#if listThree.childList?has_content>
												<#list listThree.childList as listFour>
			            						<div class="aut-fourth-item aut-padding">
			            							<input name="resourceIds" type="checkbox" class="aut-check aut-fourth-check" id="${list_index+1}_${listTwo_index+1}_${listThree_index+1}_${listFour_index+1}_" <#if listFour.selected==1>checked</#if> value="${(listFour.resourceId)?if_exists}" data-type="${(listFour.resourceType)?if_exists}">
			            							<span class="aut-check-show"></span>${(listFour.name)?if_exists}<!-- 循环后id为这种形式 -->
			            						</div>
				            					</#list>
					            				</#if>
			            					</div>
		            						<!--第四级循环end-->
		            					</div>
				            			</#list>
				            			</#if>
		            					<!--第三级循环end-->
		            				</div>
	            				</div>
		            			</#list>
		            			</#if>
            					<!--第二级循环end-->
            				</div>
            			</li>
            			</#list>
            			</#if>
            			<!--第一级循环end-->
            		</ul>
            	</div>
           	</li>
           </ul>
       </div>	
	   <div class="ui-btn-double">
	      <input type="button" onclick="authRole(this,'${base}/role/findListView');" class="ui-btn-blue" value="确定"/>
	      <input type="button" class="ui-btn-grey ui-back" value="返回"/>
	   </div>
	  </form>
  </div>
			
<!--成功提示-->	
  <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">角色授权成功！</h3>
  </div>

<!--失败提示-->	
  <div id="dlg2" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">失败！</h3>
    <input type="button" class="ui-dlgOk-btn" value="确定"/>
  </div>
<script>
	tree.init();
</script>
</body>
</html>