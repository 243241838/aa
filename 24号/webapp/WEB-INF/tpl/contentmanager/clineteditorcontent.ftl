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
         	<div class="ui-client-editorcontent">
         	<form id="frm" action="${base}/content/toSystemInfoSure" method="post" >
         		<h4 class="ui-info-lbl">关于我们</h4>
         		<ul>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">E保logo：</label>
         				 <span class="ui-relative">
         				 	<img src="${base}${po.systemLogo}" width="245" height="245"/>
         				 </span>
         				 <input type="hidden" name="systemLogo" value="${po.systemLogo}" />
         				 <input type="hidden" name="infoId" value="${po.infoId}" />
         			</li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">客服电话：</label>
         				<span id="clientShowPhone">${po.servicePhone}</span>
         				<input type="hidden" name="servicePhone" value="${po.servicePhone}" />
         			</li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label clause-editor-label">E保简介：</label>
         				<span>
         					<div class="textarea-style">${po.systemDesc}</div>
         				</span>
         				<input type="hidden" name="systemDesc" value="${po.systemDesc}" />
         			</li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">公司名称：</label>
         				<span id="clientShowName">${po.corpName}</span>
         				<input type="hidden" name="corpName" value="${po.corpName}" />
         			</li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">网址许可证：</label>
         				<span id="clientShowAddress">${po.licenseNo}</span>
         				<input type="hidden" name="licenseNo" value="${po.licenseNo}" />
         			</li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">经营许可证：</label>
         				<span id="clientShowPermit">${po.icpNo}</span>
						<input type="hidden" name="icpNo" value="${po.icpNo}" />                      
         			</li>
         			<li>
         				<label for="" class="ui-info-lbl client-work-label">成立时间：</label>
         				<span class="ui-clientmanager" id="clientShowTime">${po.regTime1}</span>
         				<input type="hidden" name="regTime1" value="${po.regTime1}" />
         			</li>
         			<li class="ui-btn-double">
				      <input type="button" value="编辑" class="ui-btn-blue ui-submit" id="clientShowEditor" onclick="subFrm();"/>
				    </li>
         		</ul>
         	</form>
			</div>
        
    	</div>
    	
    	
	</div>

	<script>
	$(function(){

   
      var editor;
      <#--
      KindEditor.ready(function(K) {
            editor = K.create('#clientAreatext',{
                width : 670
            })
        });
        -->
    
    })
   function subFrm(){
   		$("#frm").submit();
   }
	
	</script>
</body>
</html>