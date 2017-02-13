<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" content="text/html; charset=utf-8" >
	<title>启动页面管理-客户端管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>

	<script type="text/javascript" src="${base}/resource/js/kindeditor/kindeditor.js"></script>
	<script type="text/javascript" src="${base}/resource/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
<body>
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
    <form id="infoForm" method="post" action="${base}/client/updStartImg">
    <div class="ui-info-main">
        <ul class="ui-info-list">
         	<li class="ui-info-item no-topbor">
         		<label class="ui-info-lbl">系统类型</label>
         		<#if po.resourceLabel=="ios_startup_logo">
         			IOS
         		<#elseif po.resourceLabel=="android_startup_logo">
         			Android
       			<#else>
         			Other
				</#if>
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">标题</label>
         		<input type="text" name="resourceKeywords" value="${po.resourceKeywords}" class="easyui-validatebox ui-info-input" data-options="required:true"/>
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         	  <table class="ui-start-img-wrap fn-clear">
         	  <tr>
         	  <#list poList as item>
         	  	<td>
	              <li>
	                <div class="ui-fw14">${item.resourceWidth}*${item.resourceHeight}</div>
	                <img src="${item.resourceValue}" width="192" height="288"/>
	                <div class="ui-relative file-mode">
	                  <input type="hidden" class="" name="url" value="">
	                  <input type="button" class="ui-btn-blue ui-fileup" value="上传"/>
	                  <input type="file" name="insuranceTerms" class="file-wrap file-hid" id="file-wrap${item.resourceId}"
                  	  	onchange="uploadImg('file-wrap${item.resourceId}','${base}/product/fileUpload','startup');" style="left:0;width:60px;">
	                  <input type="hidden" name="resourcesMap[${item.resourceHeight}].resourceValue" id="resourceValue1" value="${item.resourceValue}"/>
	                  <input type="hidden" name="resourcesMap[${item.resourceHeight}].resourceId" value="${item.resourceId}" />
	                </div>
	              </li>
	              </td>
              </#list>
              </tr>
              </table>
            </li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">有效期</label>
            <input id="startTime" name="effTimeStr" class="easyui-datebox" data-options="editable:false" value="${po.effTimeStr}" validType="md['#startTime']"/>
            <em>至</em>
            <input id="endTime" name="expTimeStr" class="easyui-datebox" data-options="editable:false" value="${po.expTimeStr}" validType="md['#endTime']"/>
         	</li>
        </ul>
  	</div>
    <div class="ui-btn-double">
      <input type="button" value="保存" class="ui-btn-blue" onclick="subForm();"/>
      <input type="button" value="取消"  class="ui-btn-grey" onclick="formCancel('dlg');"/>
    </div>
   </form>
<!--弹框-->  
  <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit">您的操作尚未保存，确定要取消吗？</h3>
    <input type="button" class="ui-dlgOk-btn" value="确定"/>
    <input type="button" class="ui-dlgCancel-btn" value="取消"/>
  </div>
   <div id="alt" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="delStartTit2" >修改成功!</h3>
  </div>
  <div id="error" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="delStartTit1" >异常情况,修改失败!</h3>
  </div>
	<script>
   $(function(){
    validExtend();
   	richEdit();
	});
   function subForm(){
   		$.ajax({
	         url: '${base}/client/updStartImg',
	         type: 'post',
	         datatype: 'json',
	         data: $("#infoForm").serialize(),
	         success: function(result) {
	         	if(result.succ){
	         		showAlert('alt');
			    	window.setInterval( function () {
		         		location.href = "${base}/client/toStartView";
					}, 1000 );
	         	} else {
	         		$("#delStartTit1").text(result.entity);
			    	showAlert('error');
			    	return false;
	         	}
	         },
			error:function(data){
			   showAlert('error');
			   return false;
			}
	     });
    }
  
	</script>
</body>
</html>