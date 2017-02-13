<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>文章管理-查看</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
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
			 		    <#if cata.id == 1>
							<a class="ui-menu-item-name" href="/content/article/listView?pid=${cata.id}&type=s" title="${cata?if_exists.title}">${cata?if_exists.title}</a>
						<#else>
							<a class="ui-menu-item-name" href="/content/article/listView?pid=${cata.id}&type=p" title="${cata?if_exists.title}">${cata?if_exists.title}</a>
			 		    </#if>						<ul class="ui-submenu-list">
							<#if cata?if_exists.problemList?if_exists>
								<#list cata.problemList as proCata>
									<li class="ui-submenu-item <#if proCata_index == 0>ui-submenu-fir</#if>">
										<a class="ui-submenu-item-name" href="/content/article/listView?pid=${proCata.id}&type=p" title="${proCata?if_exists.title}">${proCata?if_exists.title}</a>
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
			<div class="ui-info-wrap ">
		  	<h3 class="ui-info-tit">文章详情</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <tr>
			            <td class="ui-oddtd">标题：</td>
			            <td>
			            	 ${content?if_exists.title?if_exists}
			            </td>
			          </tr>
			          <#if content?if_exists.cataId?if_exists&&content.cataId == 1>
	            		  <tr>
				            <td class="ui-oddtd">图片地址：</td>
				            <td>
				              ${content?if_exists.tdPicture?if_exists}
				            </td>
				          </tr>
				          <tr id="ui-view-tr" >
				            <td class="ui-oddtd">图片预览：</td>
				             <td>
				                <div class="img-view-wrap">
				            	  <img src="${content?if_exists.tdPicture}" id="imgview" />
				            	</div>
				            </td>
				          </tr>
	            	   </#if>
			          <tr>
			            <td class="ui-oddtd">所属栏目：</td>
			            <td>
			                  ${content?if_exists.columnName?if_exists}
			            </td>
			          </tr>
			          <tr>
			            <td class="ui-oddtd">所属类别：</td>
			            <td>
			            	${content?if_exists.cataName?if_exists}
			            </td>
			          </tr>
			          <tr>
			            <td class="ui-oddtd">排序：</td>
			            <td>
			            	${content?if_exists.sorts?if_exists}
			            </td>
			          </tr>
			           <#if content?if_exists.cataId?if_exists>
	            		 <#if content.cataId == 1>
	            		 <tr>
				            <td class="ui-oddtd">跳转地址：</td>
				            <td>
				               ${content?if_exists.tdContent?if_exists}
				            </td>
				          </tr>
	            		 <#elseif content.cataId == 2>
	            		 <tr>
				            <td class="ui-oddtd">内容：</td>
				            <td class="word-break">
				              ${content?if_exists.tdContent?if_exists}
				            </td>
				          </tr>
	            		 </#if>
			           </#if>
					</tbody>
				   </table>
				</div>
			</div>
			<div class="ui-submit-warp ui-submit-one">
		      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
		    </div>
		</div>
	</div>
</div>
<script type="text/javascript">
</script>
</body>
</html>