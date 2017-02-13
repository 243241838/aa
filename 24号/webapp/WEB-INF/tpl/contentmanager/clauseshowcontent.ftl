<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>投保条款</title>
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
            <div class="clause-editor">
            <form id="frm1" action="">
                <h4  class="ui-info-lbl">投保声明</h4>
                <div class="clause-cap">
                    <label class="ui-info-lbl clause-editor-label">投保条款标题：</label>
                    <span class="ui-client-content-label clause-editor-span">${po.articleTitle}</span>
                </div>
                <div class="clause-edtor">
                    <label class="ui-info-lbl clause-editor-label">投保条款内容：</label>
                    
                   <span>
                    	<div style="overflow:auto;" class="textarea-style" >${po.articleContent}</div>
                   </span>
				               
				</div>
                <div class="ui-btn-double">
                      <input type="button" value="编辑" class="ui-btn-blue ui-hidden"/>
                </div>
            </form>
    	<#-- 修改 -->
        <form id="frm" action="${base}/content/addClause" method="post" style="display:none">
            <h4  class="ui-info-lbl">投保条款</h4>
            <div class="clause-cap">
                <label class="ui-info-lbl clause-editor-label">投保条款标题：</label>
                <span><input class="clause-input ui-client-content-label easyui-validatebox ui-cover" type="text" name="articleTitle"
                   value="${po.articleTitle}" data-options="required:true,validType:['numLetChina','maxlen[20]']" missingMessage="请输入投保条款标题" /></span>
				<span class="showMessage"></span>	
            </div>
            <div class="clause-edtor custom-textarea ui-month-base">
                <label class="ui-info-lbl clause-editor-label">投保条款内容：</label>
                <textarea class="richEditor easyui-validatebox" id="clause-textarea" rows="20">${po.articleContent}</textarea>
                <div class="predent-textarea ctooltip-bottom" id="textareaMessage" v>
                    <span class="custom-textarea-tooltip">请输入投保条款内容</span>
                    <div class="ctooltip-arrow-outer" style=""></div>
                    <div class="ctooltip-arrow" style=""></div>
               </div>
               <input type="hidden" id="articleContent" name="articleContent" />
               <input type="hidden" id="articleId" name="articleId" value="${po.articleId}"/>
            </div>
            
            <div class="ui-btn-double">
                  <input type="button" value="保存" class="ui-btn-blue ui-submit" id="clauseText"/>
                  <input type="button" value="取消"  class="ui-btn-grey" onclick="back();"/>
            </div>
        </form>
       </div>
      </div>
	</div>

	<script>
	$(function(){
	validExtend();
        var editor;
        KindEditor.ready(function(K) {
            editor = K.create('#clause-textarea',{
                width : 670 
            })
        });
        var editortxt = $("#textareaMessage");
        //隐藏显示
	    $(".ui-hidden").click(function(event) {
	    	$("#frm1").css("display","none");
	    	$("#frm").css("display","block");
	    });
	  
	    
	      //点击保存得到数据
       $("#clauseText").click(function(event) {
            
            var clauseeditor = editor.html(),
                isflag = true,str='',form = $(this).parents("form");
               
          	if(clauseeditor == ''){
          		editortxt.show();
          		isflag = false;
          	}else{
          		editortxt.hide();
          	}
          	
            if(form.form('validate') && isflag){
          
                $("#articleContent").attr("value",clauseeditor);
                $.ajax( {
					url : "${base}/content/addClause",
					type : "post",
					data: $("#frm").serialize(),
					dataType : "json",
					// 成功后调用
					success : function(data) {
					    if(data.succ){
					    	alert(data.entity);
					    	window.location.href="${base}/content/toAddClause";
					    } else {
					    	alert(data.entity);
					    	return false;
					    }
					}
				});
            } else {
            	alert("false");
            }
       });   
    });	
    function back(){
    	window.location.href = "/content/toAddClause";
    }
	</script>
</body>
</html>