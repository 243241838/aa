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
         	<form id="frm" name="frm" action="${base}/content/toSureArticles" method="post">
         		<h4 class="ui-info-lbl">关于我们</h4>
         		<ul>
         	
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">栏目名称：</label>
         				<span class="ui-client-content-label">${po.articleTitle1}</span>
         				<input type="hidden" name="articleTitle1" value="${po.articleTitle1}" />
         				<input type="hidden" name="urlStr" value="${url}" />
         			</li>
                    <li>
                        <label for="" class="ui-info-lbl client-work-label">分类名称：</label>
                        <span class="ui-client-content-label">${po.articleTitle}</span>
                        <input type="hidden" name="articleTitle2" value="${po.articleTitle}" />
                        <input type="hidden" name="parentId" value="${po.articleId}" />
                    </li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label clause-editor-label">文章标题：</label>
         				<span>
                            <input class="clause-input ui-client-content-label easyui-validatebox ui-cover" type="text" name="articleTitle" 
                            value="${po.articleTitle2}" data-options="required:true,validType:['numLetChina','maxlen[20]']" missingMessage="请输入文章标题"  id="newContentName"/>
                            <input type="hidden" name="articleId" value="${po.articleId2}" />
                        </span>
         			</li>
         			<li class="clause-editor ui-month-base">
                        <label class="ui-info-lbl client-work-label clause-editor-label">文章内容：</label>
                        <textarea id="clause-textarea" class="richEditor" rows="20" value="">${po.articleContent2}</textarea>
                        <input type="hidden" id="articleContent" name="articleContent" value="" />
                        
                    </li>
                    <li class="ui-btn-double">
                          <input type="button" value="下一步" class="ui-btn-blue ui-submit" id="clauseText"/>
                          <a href="${base}/content/toServiceGuide" class="ui-btn-grey">取消</a>
                    </li>
         		</ul>
         	</form>
    	</div>
        <!--文章标题同名 start-->
    	 <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
           <h3 class="ui-dlg-tit" id="deleteTit">文章内容不能为空,请补充完整!</h3>
         </div>
    	 <!--文章标题同名end-->
	</div>

	<script>
    $(function(){
         validExtend();
         var editor;
         //KindEditor.options.filterMode = true;
	      KindEditor.ready(function(K) {
	            editor = K.create('#clause-textarea',{
	                width : 670
	            })
        });
        //确认页面返回
        var back=window.location.search.indexOf('back');
        if(back!=-1){
	        if(localStorage['cont${po.articleId}']!=''){
	         $("#clause-textarea").html(localStorage['cont${po.articleId}']);
	        }
	        $('input[name="articleTitle"]').val(localStorage['tit${po.articleId}']);
        }
       
       //点击保存得到数据
       $("#clauseText").click(function(event) {
            
             var clauseeditor = editor.html(),
                isflag = true,
                name = $("#newContentName").val();
           
            
            if($('#frm').form('validate')&&isflag){
            	<#--
	                setTimeout(function(){
	                    location.href="${base}/content/toSureArticles"; 
	                },1000)
                var url = "${base}/content/toSureArticles?articleId='${po.articleId}'&parentId='${po.articleId}'&articleTitle1="+articleTitle1+"&articleTitle2="+articleTitle2+"&articleContent="+clauseeditor;
                -->
                $("#articleContent").attr("value",clauseeditor);
                
               localStorage['cont${po.articleId}'] =clauseeditor; 
               localStorage['tit${po.articleId}'] =name; 
	            $("#frm").submit();
				<#--                
	            var url = $("#frm");
	            url = url + "articleId='${po.articleId}'&parentId=/"${po.articleId}/"&articleTitle1=/"${po.articleTitle1}/"&articleTitle2=/"${po.articleTitle}/"&articleContent=/""+clauseeditor+"/"";
				$("#frm").submit();	            
                $.ajax( {
					url : "${base}/content/toSureArticles",
					type : "post",
					data: {"parentId":"${po.articleId}","articleTitle":name,"articleTitle1":"${po.articleTitle1}",
						"articleTitle2":"${po.articleTitle}","articleContent":clauseeditor},
					dataType : "json",
					// 成功后调用
					success : function(data) {
					    if(data.succ){
					    	var po = data.entity;
					    	window.location.href="${base}/content/newsavecontent?po="+po;
					    } else {
					    	alert(data.entity);
					    	return false;
					    }
					}
				});
            -->
            } else {
            	showAlert('dlg');
            }
         
       });   

    
    });

    
    </script>
</body>
</html>