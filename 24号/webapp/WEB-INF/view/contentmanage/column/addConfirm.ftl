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
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
  
</head>

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
	      <form id ="addMerchType" method="post" action="/content/column/add" >
	      	<input id="" name="id" value="${problemCata?if_exists.id?if_exists}" type="hidden"/>
	      	<input id="" name="title" value="${problemCata?if_exists.title?if_exists}" type="hidden"/>
	      	<input id="" name="sorts" value="${problemCata?if_exists.sorts?if_exists}" type="hidden"/>
	      	<input id="" name="parentId" value="${problemCata?if_exists.parentId?if_exists}" type="hidden"/>
			<div class="ui-info-wrap ">
		  	<h3 class="ui-info-tit">新增栏目</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <tr>
			            <td class="ui-oddtd">栏目名称：</td>
			            <td>
			            	${problemCata?if_exists.title?if_exists}
			            </td>
			          </tr>
			          <tr>
			            <td class="ui-oddtd">所属类别：</td>
			            <td>
			            	<#if problemCata?if_exists.parentId?if_exists == 1>自助服务</#if>
			            	<#if problemCata?if_exists.parentId?if_exists == 2>常见问题</#if>
			            </td>
			          </tr>
			          <tr>
			            <td class="ui-oddtd">排序：</td>
			            <td>
			            	${problemCata?if_exists.sorts?if_exists}
			            </td>
			          </tr>
					</tbody>
				   </table>
				</div>
			</div>
			<div class="ui-submit-warp">
		      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
		      <a href="javascript:ajaxSubmit('addMerchType','dlg','dlgNo')" class="ui-red-btn ui-pos3">下一步</a>
		    </div>
		  </form>
		</div>
	</div>
</div>
<!--审核成功-->
  <div id="dlg" class="ui-dialog">
    <div class="ui-dlg-content ui-relative">
     <div class="ui-dlg-icon ui-clearfix"></div>
     <div class="ui-dlg-text">栏目新增成功</div>
     <div class="ui-dlg-text2">返回
        <a data-fn="backToList" href="/content/column/listView">栏目管理</a>
     </div>
    </div>
	</div>
<!--审核失败-->  
	<div id="dlgNo" class="ui-dialog">
		<div class="ui-dlg-content ui-relative">
     <div class="ui-dlg-icon ui-dlg-no ui-clearfix"></div>
     <div class="ui-dlg-text">栏目新增失败</div>
     <div class="ui-dlg-text2">返回
       <a data-fn="backToList" href="/content/column/listView">栏目管理</a>
     </div>
		</div>
	</div>
</body>
</html>