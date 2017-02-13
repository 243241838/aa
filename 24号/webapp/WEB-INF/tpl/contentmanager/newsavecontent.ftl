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
         	<form id="frm" name="frm" action="${base}/content/addArticles" method="post">
         		<h4 class="ui-info-lbl">关于我们</h4>
         		<ul>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">栏目名称：</label>
         				<span class="ui-client-content-label">${vo.articleTitle2}</span>
         				<input type="hidden" value="${vo.urlStr}" />
         			</li>
                    <li>
                        <label for="" class="ui-info-lbl client-work-label">分类名称：</label>
                        <span class="ui-client-content-label">${vo.articleTitle1}</span>
                    </li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">文章标题：</label>
         				<span class="ui-client-content-label">${vo.articleTitle}</span>
         			</li>
         			<li class="clause-editor">
                        <label class="ui-info-lbl client-work-label clause-editor-label">文章内容：</label>
                       <span >
                        <div style="width:720px; height:420px;border:1px solid;  border-color: rgb(169, 169, 169); overflow:auto;" id="articeInfor"  >${vo.articleContent}</div>
						</span>
                    </li>
                    <li class="ui-btn-double">
                          <input type="button" value="完成" class="ui-btn-blue ui-submit" id="newEitorSave"/>
                          <input type="button" value="返回修改"  class="ui-btn-grey" onclick="javascript:location.href='${vo.urlStr}&back';"/>
                    </li>
         		</ul>
         	</form>
			</div>
        
    	</div>
    	  <!--提示添加成功start-->
            <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
                <h3 class="ui-dlg-tit">编辑成功！</h3>
            </div>
        <!--提示添加成功end-->
    	
	</div>
<script>
    $(function(){

	var editortxt = $("#articeInfor").html();

    $("#newEitorSave").click(function(event) {
      
        $.ajax( {
			url : "${base}/content/addArticles",
			type : "post",
			data: {'articleId':'${vo.articleId}','parentId':'${vo.parentId}','articleTitle':'${vo.articleTitle}','articleTitle1':'${vo.articleTitle1}','articleTitle2':'${poarticleTitle}',
			'articleContent':editortxt},
			dataType : "json",
			// 成功后调用
			success : function(data) {
			    if(data.succ){
			    	showAlert("dlg");
			    	window.setInterval( function () {
				    	window.location.href="${base}/content/toServiceGuide";
					}, 1000 );
			    } else {
			    	alert(data.entity);
			    	return false;
			    }
			}
		});
    });
   });     
</script>

</body>
</html>