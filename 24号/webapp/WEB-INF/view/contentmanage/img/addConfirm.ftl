<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>内容管理-图片管理-新增</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>
    <script type="text/javascript" src="/js/kindeditor/kindeditor.js"></script>
   <script>
  $(document).ready(function(){
		uploadFile('file');
		});
     </script>
</head>

<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	  <#include "/common/include/power.ftl">
	</div>
	<div class="ui-info-content">
      <form id ="addMerchType" method="post" action="/content/img/add" >
		<div class="ui-info-wrap ">
	  	<h3 class="ui-info-tit">图片新增</h3>
			<div class="ui-infobg">
				<table class="ui-center-tab">
		          <tbody>
		          <tr>
		            <td class="ui-oddtd">位置：</td>
		            <td>
	            	   ${pictureExtendMdl?if_exists.position}
		            </td>
		          </tr>
		          <tr>
		            <td class="ui-oddtd">名称：</td>
		            <td>
		            	${pictureExtendMdl?if_exists.title}
		            </td>
		          </tr>			          
		          <tr>
		            <td class="ui-oddtd">上传图片：</td>
		            <td>
		            	${pictureExtendMdl?if_exists.url}
		            </td>
		          </tr>

		          <tr>
		            <td class="ui-oddtd">图片预览：</td>
		            <td>
		                <div class="img-view-wrap">
		            	  <img src="${pictureExtendMdl?if_exists.url}" id="imgview" />
		            	</div>
		            </td>
		          </tr>
		           <tr>
		            <td class="ui-oddtd">跳转地址：</td>
		            <td>
		            	${pictureExtendMdl?if_exists.goUrl}
		            </td>
		          </tr>
				</tbody>
			   </table>
			</div>
		</div>
		<input type="hidden" name="position" value="${pictureExtendMdl?if_exists.position}">
		<input type="hidden" name="url"  value="${pictureExtendMdl?if_exists.url}">
		<input type="hidden" name="title"  value="${pictureExtendMdl?if_exists.title}">
		<input type="hidden" name="goUrl"  value="${pictureExtendMdl?if_exists.goUrl}">
		<div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      <a href="javascript:ajaxSubmit('addMerchType','dlgOk2','dlgWarn');" class="ui-red-btn ui-pos3">提 交</a>
	    </div>
	  </form>
	</div>
  </div>
  <!--成功提示-->	      
	<div id="dlgOk2" class="ui-dialog ok2-dialog">
		<div class="ui-dlg-content ui-relative">
	    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
	    <div class="ui-dlg-text">图片新增成功！</div>
	    <a data-fn="backToList" href="/content/img/listView" class="ui-red-btn ui-toList">确 定</a>
		</div>
	</div>
	<!--失败提示-->	
	
	<div id="dlgWarn" class="ui-dialog warn-dialog" >
		<div class="ui-dlg-content ui-relative">
     <div class="ui-dlg-text">图片新增失败</div>
     <a href="/content/img/listView" class="ui-red-btn ui-toClose">确 定</a>
		</div>
	</div>
</body>
</html>