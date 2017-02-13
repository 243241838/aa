<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>保险经纪管理平台</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/kindeditor/kindeditor.js"></script>
    <script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
<body>
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
    <div class="ui-info-main">
         <div class="ui-informate">
         	<div class="">
         	<form action="">
         		<ul>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">栏目名称：</label>
         				<span class="ui-client-content-label">${po.articleTitle}</span>
         			</li>
                    <li>
                        <label for="" class="ui-info-lbl client-work-label">分类名称：</label>
                        <span class="ui-client-content-label">${po.articleTitle1}</span>
                    </li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">文章标题：</label>
         				<span class="ui-client-content-label">${po.articleTitle2}</span>
         			</li>
         			<li class="clause-editor">
                        <label class="ui-info-lbl client-work-label clause-editor-label">文章内容：</label>
                       <span > <textarea class="ui-client-content-label" readonly="true" cols="100" rows="20" >${po.articleContent2}</textarea></span>
                    </li>
                    <li class="ui-btn-double">
                          <input type="button" value="返回"  class="ui-btn-grey ui-back" id="newEitorSave"/>
                    </li>
         		</ul>
         	</form>
			</div>
        
    	</div>
    	
	</div>
<script>
    $(function(){

        var editor;
      KindEditor.ready(function(K) {
            editor = K.create('#clause-textarea',{
                width : 670
            })
        });
    });

    
    </script>

</body>
</html>