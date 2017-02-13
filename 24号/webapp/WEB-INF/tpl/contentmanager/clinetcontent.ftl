<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>客户业务类</title>
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
         	<form id="clientForm" action="${base}/content/toEditSystemInfo" method="post" >
         		<h4 class="ui-info-lbl">关于我们</h4>
         		<ul>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">E保logo：</label>
         				 <span class="ui-relative">
                            <div class="ui-info-item ui-client-upload-item">
                                <img id="logo" src="" width="245" height="245"/>
                                <div class="ui-relative ui-clinet-upload file-mode">
                                  <input type="button" class="ui-btn-blue ui-fileup" value="上传">
                                  <input type="file" class="file-wrap file-hid" id="prodimg-file" name="insuranceTerms" onchange="uploadImg('prodimg-file','${base}/product/fileUpload','client');">
                                  <input type="hidden" id="systemLogo" name="systemLogo" onchange="showLogo(this);"/>
                                </div>  
                            </div>
		                </span>
         			</li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">客服电话：</label>
         				<span><input class="clause-input easyui-validatebox ui-cover" type="text" name="servicePhone"  data-options="required:true,validType:['unlineNum']" missingMessage="请输入客服电话"  maxlength="12"/></span>
         			</li>
         			<li class="ui-month-base">
         				<input type="hidden" id="systemDesc" name="systemDesc"/>
         				<label for="" class="ui-info-lbl client-work-label clause-editor-label">E保简介：</label>
         				<span> <textarea class="richEditor" id="clientAreatext" rows="10" cols="80" ></textarea></span>
                        <span class="showMessage editorcheck" style="display:none">请输入投保条款内容</span> 
                        <input type="hidden" name="systemDesc" value="${vo.systemDesc}"/>
         			</li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">公司名称：</label>
         				<span><input class="clause-input easyui-validatebox ui-cover" type="text" name="corpName"
         				 data-options="required:true,validType:['numLetChina']" missingMessage="请输入公司名称" maxlength="20"/></span>
         			</li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">网站许可证：</label>
         				<span><input class="clause-input easyui-validatebox ui-cover" type="text" name="licenseNo" 
         				 data-options="required:true,validType:['numLetChina']" missingMessage="请输入网站许可证" maxlength="20"/></span>
         			</li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">经营许可证：</label>
         				<span class="clause-editor"><input class="clause-input easyui-validatebox ui-cover" 
         					type="text" name="icpNo" data-options="required:true,validType:['numLetChina']" missingMessage="请输入经营许可证" maxlength="20"/></span>
         			</li>
         			<li class="ui-month-base">
         				<label for="" class="ui-info-lbl client-work-label">成立时间：</label>
         				<span class="ui-clientmanager"><input  class="easyui-datebox clause-input" id="clientSetTime" name="regTime1" vlaue=""/> </span>  
         			</li>
         			<li class="ui-btn-double">
				      <input type="button" value="保存" class="ui-btn-blue ui-submit" id="clientNext"/>
				      <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
				    </li>
         		</ul>
         	</form>
			</div>
    	</div>
    	
    	
	</div>
	<!--提示信息-->
	    <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
	        <h3 class="ui-dlg-tit">内容为空,请补充完整!</h3>
	    </div>
    <!--提示添加成功end-->
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
       
   
        $("#clientNext").click(function(event) {
           <#-- editor.html() -->
            var clienteditor = $("#clientAreatext").val();
                clientdate = gettime.datebox('getValue'),
                target = $("#textareaMessage"),
                iseditor = true,istime = true;
                
                if(clienteditor == ''){
                	$(".editorcheck").show();
					iseditor = false;
                }else{
                	$(".editorcheck").hide();
                	iseditor = true;
                }
           
		
             //时间控件验证是否为空
            if(clientdate == ""){
                 $("#clientTimeTool").show();
                 istime = false;
            }else{
                 $("#clientTimeTool").hide();
                 istime = true;
            }

            if(iseditor && istime){
            	$("#systemDesc").attr("value",clienteditor);
				$("#clientForm").action = "${base}/content/toEditSystemInfo";         	
                $("#clientForm").submit();
            } else {
            	showAlert("dlg");
            }
        });
        $("#systemLogo").onchange(function(obj){
        	var url = obj.value();
	    	alert(url);
	    	$("#logo").attr("src","${base}"+url);	
        });
    })
	
	</script>
</body>
</html>