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
	<#--
	<script type="text/javascript" src="${base}/resource/js/kindeditor/kindeditor.js"></script>
	-->
	<script type="text/javascript" src="${base}/resource/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
<body>
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
    <div class="ui-info-main">
         <div class="ui-informate">
         	<div class="ui-client-editorcontent">
         	<form id="frm" action="${base}/content/addSystemInfo" method="post">
         		<h4 class="ui-info-lbl">关于我们</h4>
         		<ul>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">E保logo：</label>
                        <span class="ui-relative">
                            <div class="ui-info-item ui-client-upload-item">
		         				<img src="${vo.systemLogo}" id="img" width="245" height="245"/>
                                <div class="ui-relative ui-clinet-upload file-mode">
                                  <input type="button" class="ui-btn-blue ui-fileup" value="上传">
                                  <input type="file" class="file-wrap file-hid" id="prodimg-file" name="insuranceTerms"
                                   onchange="uploadImg('prodimg-file','${base}/product/fileUpload','client');">
                                  <input type="hidden" id="systemLogo" name="systemLogo" value="${vo.systemLogo}"/>
                                </div>  
                            </div>
		                </span>
         				<input type="hidden" name="infoId" value="${vo.infoId}" />
         			</li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">客服电话：</label>
                        <span><input class="clause-input easyui-validatebox ui-cover" type="text" name="servicePhone"
                          data-options="required:true,validType:['unlineNum','length[12]']" missingMessage="请输入客服电话" value="${vo.servicePhone}"/></span>
         			</li>
         			<li class="ui-month-base">
         				<label for="" class="ui-info-lbl client-work-label clause-editor-label">E保简介：</label>
                        <span> <textarea class="richEditor" id="clientAreatext" rows="10" cols="80">${vo.systemDesc}</textarea></span>
                        <input type="hidden" id="systemDesc" name="systemDesc" value="" />
         			</li>
         			<li>
                        <label for="" class="ui-info-lbl client-work-label">公司名称：</label>
                        <span id="clientShowName">${vo.corpName}</span>
                        <input type="hidden" name="corpName" value="${vo.corpName}" />
                    </li>
                    <li>
                        <label for="" class="ui-info-lbl client-work-label">网址许可证：</label>
                        <span id="clientShowAddress">${vo.licenseNo}</span>
                        <input type="hidden" name="licenseNo" value="${vo.licenseNo}" />
                    </li>
                    <li>
                        <label for="" class="ui-info-lbl client-work-label">经营许可证：</label>
                        <span id="clientShowPermit">${vo.icpNo}</span>
                        <input type="hidden" name="icpNo" value="${vo.icpNo}" />
                    </li>
                    <li>
                        <label for="" class="ui-info-lbl client-work-label">成立时间：</label>
                        <span class="ui-clientmanager" id="clientShowTime">${vo.regTime1}</span>
                        <input type="hidden" name="regTime1" value="${vo.regTime1}" />
                    </li>
         			<li class="ui-btn-double">
				      <input type="button" value="完成" class="ui-btn-blue ui-submit" id="editorSave"/>
				      <input type="button" value="取消"  class="ui-btn-grey ui-back"/>
				    </li>
         		</ul>
         	</form>
			</div>
    	</div>
	</div>
	<#-- 弹框 -->
	<div id="alt" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    	<h3 class="ui-dlg-tit" id="delStartTit1" >添加成功!</h3>
   	</div>
   	<div id="error" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="delStartTit1" >异常情况,添加失败!</h3>
  	</div>
	<script>
	$(function(){

        validExtend();
      var editor;
      <#--
      KindEditor.ready(function(K) {
            editor = K.create('#clientAreatext',{
                width : 670
            })
            
            
        });
		-->
        var getsummary = $("#clientAreatext"),
           gettime = $("#clientSetTime");
       

        $("#editorSave").click(function(event) {
           <#-- editor.html() -->
           var clienteditor = $("#clientAreatext").val();
                target = $("#textareaMessage");

           //E保简介
            if(clienteditor == ""){
                $("#textareaMessage").show();
            }else{
                $("#textareaMessage").hide();
            }
            
            $("#systemDesc").attr("value",clienteditor);
			$.ajax( {
				url : "${base}/content/addSystemInfo",
				dataType : "json",
				type : "post",
				data: $("#frm").serialize(),
				// 成功后调用
				success : function(data) {
				    if(data.succ){
				    	showAlert('alt');
		         		window.setInterval( function () {
					    	window.location.href = "${base}"+data.entity;
						}, 1000 );
				    } else {
				    	$("#delStartTit1").text(data.entity);
				    	showAlert('alt');
				    	return false;
				    }
				},
				error:function(data){
				   showAlert('error');
				   return false;
				}
			});
        });
    })
	</script>
</body>
</html>