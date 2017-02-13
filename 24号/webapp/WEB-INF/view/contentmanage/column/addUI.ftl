<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>栏目管理</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
</head>
<script>
  $(document).ready(function(){
		$("#addMerchType").validationEngine({
		maxErrorsPerField: 1
	});
		moneyThousands();
		});
</script>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
		<#include "/common/include/power.ftl">
	</div>
	<div class="ui-menu-container">
		 <ul id="content-menu">
		 	<!-- 遍历树形 -->
			<#if cataList?if_exists>
				<#list cataList as cata>
					<li class="ui-menu-item ui-meun-item-open">
			 		    <i class="sm-ui-icon-arrow"></i>
			 		    <#assign va = ""/>
			 		    <#if cata?if_exists.id == 1 && pid == 1>
			 		    	<#assign va = "javascript:;"/>
			 		    <#elseif cata?if_exists.id == 2 && pid == 2>
			 		    	<#assign va = "javascript:;"/>
			 		    <#else>
			 		    	<#assign va = "/content/column/listView?pid=${cata?if_exists.id}"/>
			 		    </#if>
						<a class="ui-menu-item-name parent_search" href="${va?if_exists}" data-id="${cata?if_exists.id}" title="${cata?if_exists.title}">${cata?if_exists.title}</a>
						<ul class="ui-submenu-list">
							<#if cata?if_exists.problemList?if_exists>
								<#list cata.problemList as proCata>
									<li class="ui-submenu-item <#if proCata_index == 0>ui-submenu-fir</#if>">
										<a class="ui-submenu-item-name" href="/content/column/listView?pid=${cata.id}&id=${proCata.id}" title="${proCata?if_exists.title}">${proCata?if_exists.title}</a>
									</li>
								</#list>
							</#if>
						</ul>
					</li>
				</#list>
			</#if>
	    </ul>
	</div>
	<div  class="ui-info-container">
		<div class="ui-info-content">
	      <form id ="addMerchType" method="post" action="/content/column/addConfirm" >
			<div class="ui-info-wrap ">
		  	<h3 class="ui-info-tit">新增栏目</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <tr>
			            <td class="ui-oddtd">栏目名称：</td>
			            <td> 
				            <#if problem?if_exists.cataId?if_exists>
				              <input type="hidden"  data-unique="fieldId" value="${problem?if_exists.cataId}"/>
				            <#else>
				              <input type="hidden" data-unique="fieldId" id="chgeParent" value="1"/>
				            </#if>
			                <input type="hidden" data-first="${problem?if_exists.title}"/>
			            	<input type="text" name="title" id="title" dataType="reqCol" maxlength=40 value="" class="validate[required,custom[name],custom[typeName],ajax2[ajaxColumn],maxSize[40]] ui-dinput">
			            </td>
			          </tr>
			          <tr>
			            <td class="ui-oddtd">所属类别：</td>
			            <td>
			            	<#if problem?if_exists.cataId?if_exists>
				            	<#if problem?if_exists.cataId?if_exists == 1>自助服务</#if>
				            	<#if problem?if_exists.cataId?if_exists == 2>常见问题</#if>
				            	<input id="" name="parentId" value="${problem?if_exists.cataId?if_exists}" type="hidden"/>
			            	<#else>
				            	<select class="ui-dselect" name="parentId" onchange="chose_parent(this)">
				            		<option value="1">自助服务</option>
				            		<option value="2">常见问题</option>
				            	</select>
			            	</#if>
			            </td>
			          </tr>
			          <tr>
			            <td class="ui-oddtd">排序：</td>
			            <td>
			            	<input type="text" name="sorts"  dataType="reqColNum"  class="validate[required,custom[integer],min[0],max[9999999999]] ui-dinput"/>
			            </td>
			          </tr>
					</tbody>
				   </table>
				</div>
			</div>
			<div class="ui-submit-warp">
		      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
		       <input type="submit" class="ui-red-btn ui-pos3" value="下一步" />
		    </div>
		  </form>
		</div>
	</div>
</div>
</body>
</html>