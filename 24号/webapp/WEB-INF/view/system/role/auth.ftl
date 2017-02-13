<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>角色管理-授权</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/use.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script type="text/javascript" src="/js/checkTree.js"></script>
</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	<#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">角色管理 <span>></span></a>
		<span class="crumbs-tit">授权</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerch" method="post" action="/role/grantAuth" >
			<div class="ui-info-wrap ui-info-wrap-tree">
  	  			<h3 class="ui-info-tit"></h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr>
				            <td class="ui-oddtd">角色ID：</td>
				            <td>
				            	${role?if_exists.roleId}
				            	<input type="hidden" name="roleId" value="${role?if_exists.roleId}"/>
				            </td>
				          </tr>
				          <tr>
				            <td class="ui-oddtd">名称：</td>
				            <td>
				            	${role?if_exists.roleName}
				            	<input type="hidden" name="roleName" value="${role?if_exists.roleName}"/>
				            </td>
				          </tr>
				          <tr>
				            <td class="ui-oddtd authorize-name">授权资源：</td>
				            <td>
				            	<div class="authorize">
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
				            </td>
				          </tr>
						  </tbody>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      <a href="javascript:ajaxSubmit('editMerch','dlgOk2','dlgWarn');" class="ui-red-btn ui-pos3">确定</a>
	    </div>
		</form>
	</div>
</div>
<!--成功提示-->	      
<div id="dlgOk2" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
    <div class="ui-dlg-text">角色授权成功！</div>
    <a data-fn="backToList" href="/role/findListView" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog"  data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text">角色授权失败！</div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>
<script>
	tree.init();
</script>
</body>
</html>