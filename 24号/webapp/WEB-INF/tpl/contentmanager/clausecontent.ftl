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
            <form id="frm" action="${base}/content/addClause">
                <h4  class="ui-info-lbl">投保声明</h4>
                <div class="clause-cap">
                    <label class="ui-info-lbl clause-editor-label">投保条款标题：</label>
                    <span><input class="clause-input ui-client-content-label easyui-validatebox ui-cover" type="text" name="articleTitle" value="" 
                       data-options="required:true,validType:['numLetChina','maxlen[20]']" missingMessage="请输入保险名称" /></span>
                </div>
                <div class="clause-edtor custom-textarea ui-month-base">
                    <label class="ui-info-lbl clause-editor-label">投保条款内容：</label>

                    <textarea class="richEditor" id="clause-textarea" rows="20" ></textarea>
                  
                   <input type="hidden" id="articleContent" name="articleContent" />
                </div>
                
                <div class="ui-btn-double">
                      <input type="button" value="保存" class="ui-btn-blue ui-submit" id="clauseText"/>
                      <input type="button" value="取消"  class="ui-btn-grey ui-back"/>
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
        //点击保存得到数据
       $("#clauseText").click(function(event) {
            
            var clauseeditor = editor.html(),
                isflag = true;
               
          
            if(isflag){
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
            }
       });   
    });	
	</script>
</body>
</html>