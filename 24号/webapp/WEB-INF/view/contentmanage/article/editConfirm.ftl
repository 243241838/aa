<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>文章管理-编辑</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
    <script>
	  $(document).ready(function(){
			moneyThousands();
			richEdit();
			});
	</script>
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
			 		    <#assign ps = ""/>
			 		    <#if cata.id == 1>
			 		        <#assign ps = "/content/article/listView?type=s&pid="/>
						<#else>
						    <#assign ps = "/content/article/listView?type=p&pid="/>
			 		    </#if>
						<a class="ui-menu-item-name" href="${ps}${cata.id}" title="${cata?if_exists.title}">${cata?if_exists.title}</a>
						<ul class="ui-submenu-list">
							<#if cata?if_exists.problemList?if_exists>
								<#list cata.problemList as proCata>
									<li class="ui-submenu-item <#if proCata_index == 0>ui-submenu-fir</#if>">
										<a class="ui-submenu-item-name" href="${ps}${proCata.id}" title="${proCata?if_exists.title}">${proCata?if_exists.title}</a>
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
	      <form id ="addMerchType" method="post" action="/content/article/edit" >
	      	<input id="" name="id" value="${content?if_exists.id?if_exists}" type="hidden"/>
	      	<input id="" name="parentId" value="${content?if_exists.parentId?if_exists}" type="hidden"/>	      
	      	<input id="" name="title" value="${content?if_exists.title?if_exists}" type="hidden"/>
	      	<input id="" name="sorts" value="${content?if_exists.sorts?if_exists}" type="hidden"/>
	      	<#if content?if_exists.cataId?if_exists>
	        <#if content.cataId == 1>
			<input  name="tdPicture" value="${content?if_exists.tdPicture?if_exists}" type="hidden"/>
	      	<input  name="tdContent" value="${content?if_exists.tdContent?if_exists}" type="hidden"/>
      	    <#elseif content.cataId == 2>
      	     <textarea name="tdContent" class="fn-hide">${content?if_exists.tdContent?if_exists}</textarea>
      	    </#if>
      	    </#if>
			<div class="ui-info-wrap ">
		  	<h3 class="ui-info-tit">编辑确认</h3>
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
			<div class="ui-submit-warp">
		      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
		      <a href="javascript:ajaxSubmit('addMerchType','dlg','dlgNo');" class="ui-red-btn ui-pos3">下一步</a>
		    </div>
		  </form>
		</div>
	</div>
</div>
<!--审核成功-->
  <div id="dlg" class="ui-dialog ">
    <div class="ui-dlg-content ui-relative">
     <div class="ui-dlg-icon ui-clearfix"></div>
     <div class="ui-dlg-text">文章编辑成功</div>
     <div class="ui-dlg-text2">返回
        <a data-fn="backToList" href="/content/article/listView?type=s">文章管理</a>
     </div>
    </div>
	</div>
<!--审核失败-->  
	<div id="dlgNo" class="ui-dialog">
		<div class="ui-dlg-content ui-relative">
     <div class="ui-dlg-icon ui-dlg-no ui-clearfix"></div>
     <div class="ui-dlg-text">文章编辑失败</div>
     <div class="ui-dlg-text2">返回
       <a data-fn="backToList" href="/content/article/listView?type=s">文章管理</a>
     </div>
		</div>
	</div>
</body>
</html>