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
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script type="text/javascript" src="/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
    <script type="text/javascript" src="/js/kindeditor/kindeditor.js"></script>
</head>
<script>
  $(document).ready(function(){
		$("#addMerchType").validationEngine({
			maxErrorsPerField: 1
		});
		//uploadFile('fileName','/upload/picture');
		});
</script>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	   <#include "/common/include/power.ftl">
	</div>
	<div class="ui-info-content">
     
		<div class="ui-info-wrap ">
	  	<h3 class="ui-info-tit">图片新增</h3>
			<div class="ui-infobg ui-relative">
			 <form id ="addMerchType" method="post" action="/content/img/addConfirm" >
				<table class="ui-center-tab" width="100%">
		          <tbody>
		          <tr>
		            <td class="ui-oddtd">位置：</td>
		            <td>
	            	   <select class="ui-dselect" name="position">
							<#if picturePosList?if_exists>
								<#list picturePosList as pos>
									<option value="${pos?if_exists.id}">${pos?if_exists.title?if_exists}</option>
								</#list>
							</#if>
		            	</select>
		            </td>
		          </tr>
		          <tr>
		            <td class="ui-oddtd">名称：</td>
		            <td>
		            	<input type="text" name="title" dataType="reqPic" maxlength=40 class="validate[required,custom[name],custom[typeName],maxSize[40]] ui-dinput">
		            </td>
		          </tr>			          
		          <tr>
		            <td class="ui-oddtd">上传图片：</td>
		            <td class="ui-relative ui-file-box fn-left">
		                <!--<input class="easyui-filebox"  name="url2" data-options="prompt:'${url}'" style="width:120%">
		            	<input type="hidden" name="url" id="url"/>-->
		            	<input type="input"  dataType="reqPicup" class="validate[required] ui-dinput file-val" name="url"/>
    					<input type="button" class="ui-trans-btn file-btn"  value="上传" />
    					<input type="file" class="file-wrap" id="file-wrap" name="file1" onchange="uploadFile(this,'/upload/picture');" />
		            </td>
		          </tr>
                  <tr class="ui-pictip">
		            <td class="ui-oddtd"></td>
		            <td style="height:20px;">
		             <div class="ui-inner-pictip">图片大小：1440*434，格式：JPG、BMP、PNG</div>
		            </td>
		          </tr>
		          <tr id="ui-view-tr" class="fn-hide">
		            <td class="ui-oddtd">图片预览：</td>
		            <td>
		                <div class="img-view-wrap">
		            	  <img src="" id="imgview" />
		            	</div>
		            </td>
		          </tr>
		           <tr>
		            <td class="ui-oddtd">跳转地址：</td>
		            <td>
		            	<input type="text" name="goUrl" dataType="reqUrl" value="" class="validate[required,custom[url]] ui-dinput">
		            </td>
		          </tr>
				</tbody>
			   </table>
			  
				<!--<form id="fileForm" class="file-form" action="/upload/picture" method="post" enctype="multipart/form-data">
				 <input class="easyui-filebox" name="fileName" data-options="prompt:''" style="width:120%">
				 </form>-->
			</div>
		</div>
		<div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	       <input type="submit" class="ui-red-btn ui-pos3" value="下一步" />
	    </div>
	  </form>
	</div>
</div>
</body>
</html>