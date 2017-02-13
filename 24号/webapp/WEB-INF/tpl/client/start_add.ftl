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
    <form id="infoForm" method="post" action="${base}/client/addStartImg">
    <div class="ui-info-main">
        <ul class="ui-info-list">
         	<li class="ui-info-item no-topbor">
         		<label class="ui-info-lbl">系统类型</label>
         		<select class="ui-info-sel" name="resourceLabel" >
         			<option value="1">IOS客户端</option>
         			<option value="2">Android客户端</option>
         		</select>
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">标题</label>
         		<input type="text" name="resourceKeywords" value="" class="easyui-validatebox ui-info-input" data-options="required:true"/>
         	</li>
         	<li class="ui-info-item">
         	  <ul class="ui-start-img-wrap fn-clear">
	              <li>
	                <p class="ui-fw14">1242*1785</p>
	                <img src="${base}/resource/images/default.png" width="192" height="288"/>
	                <div class="ui-relative file-mode">
	                  <input type="hidden" class="" name="url" value="">
	                  <input type="button" class="ui-btn-blue ui-fileup" value="上传"/>
	                  <input type="file" name="insuranceTerms" class="file-wrap file-hid" id="file-wrap"
	                  	  onchange="uploadImg('file-wrap','${base}/product/fileUpload','startup');" style="left:0;width:60px;">
	                  <input type="hidden" name="resourcesMap[1].resourceValue" id="resourceValue1"/>
	                  <input type="hidden" name="resourcesMap[1].resourceWidth" id="res1" value="1242" />
	                  <input type="hidden" name="resourcesMap[1].resourceHeight" id="res1" value="2208" />
	                </div>
	              </li>
	              
	              <li>
	                <p class="ui-fw14">750*1078</p>
	                <img src="${base}/resource/images/default.png" width="192" height="288"/>
	                <div class="ui-relative file-mode">
	                  <input type="hidden" class="" name="url" value="">
	                  <input type="button" class="ui-btn-blue ui-fileup" value="上传"/>
	                  <input type="file" name="insuranceTerms" class="file-wrap file-hid" id="file-wrap1"
	                  	  onchange="uploadImg('file-wrap1','${base}/product/fileUpload','startup');" style="left:0;width:60px;">
	                  <input type="hidden" name="resourcesMap[2].resourceValue" id="resourceValue2"/>
	                  <input type="hidden" name="resourcesMap[2].resourceWidth" id="res2" value="750" />
	                  <input type="hidden" name="resourcesMap[2].resourceHeight" id="res1" value="1334" />
	                </div>
	              </li>
	              <li>
	                <p class="ui-fw14">640*920</p>
	                <img src="${base}/resource/images/default.png" width="192" height="288"/>
	                <div class="ui-relative file-mode">
	                  <input type="hidden" class="" name="url" value="">
	                  <input type="button" class="ui-btn-blue ui-fileup" value="上传"/>
	                  <input type="file" name="insuranceTerms" class="file-wrap file-hid" id="file-wrap2"
	                  	  onchange="uploadImg('file-wrap2','${base}/product/fileUpload','startup');" style="left:0;width:60px;">
	                  <input type="hidden" name="resourcesMap[3].resourceValue" id="resourceValue3"/>
	                  <input type="hidden" name="resourcesMap[3].resourceWidth" id="res3" value="640" />
	                  <input type="hidden" name="resourcesMap[3].resourceHeight" id="res1" value="1136" />
	                </div>
	              </li>
	              <li>
	                <p class="ui-fw14">640*775</p>
	                <img src="${base}/resource/images/default.png" width="192" height="288"/>
	                <div class="ui-relative file-mode">
	                  <input type="hidden" class="" name="url" value="">
	                  <input type="button" class="ui-btn-blue ui-fileup" value="上传"/>
	                  <input type="file" name="insuranceTerms" class="file-wrap file-hid" id="file-wrap3"
	                  	  onchange="uploadImg('file-wrap3','${base}/product/fileUpload','startup');" style="left:0;width:60px;">
	                  <input type="hidden" name="resourcesMap[4].resourceValue" id="resourceValue4"/>
	                  <input type="hidden" name="resourcesMap[4].resourceWidth" id="res4" value="640" />
	                  <input type="hidden" name="resourcesMap[4].resourceHeight" id="res1" value="960" />
	                </div>
	              </li>
	              <li class="fn-hide">
	                <p class="ui-fw14">320*387</p>
	                <img src="${base}/resource/images/default.png" width="192" height="288"/>
	                <div class="ui-relative file-mode">
	                  <input type="hidden" class="" name="url" value="">
	                  <input type="button" class="ui-btn-blue ui-fileup" value="上传"/>
	                  <input type="file" name="insuranceTerms" class="file-wrap file-hid" id="file-wrap4"
	                  	  onchange="uploadImg('file-wrap4','${base}/product/fileUpload','startup');" style="left:0;width:60px;">
	                  <input type="hidden" name="resourcesMap[5].resourceValue" id="resourceValue5"/>
	                  <input type="hidden" name="resourcesMap[5].resourceWidth" id="res5" value="320" />
	                  <input type="hidden" name="resourcesMap[5].resourceHeight" id="res1" value="480" />
	                </div>
	              </li>
            </ul>
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">有效期</label>
            <input id="startTime" name="effTimeStr" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#endTime']"/>
            <em>至</em>
            <input id="endTime" name="expTimeStr" class="easyui-datebox" data-options="editable:false" value="" validType="md['#startTime']"/>
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
    <h3 class="ui-dlg-tit" id="delStartTit1" >添加成功!</h3>
  </div>
  <div id="error" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="delStartTit2" >异常情况,添加失败!</h3>
  </div>
	<script>
   $(function(){
    validExtend();
   	richEdit();
   	getDpi();
	});
	
  
   function subForm(){
   		$.ajax({
	         url: '${base}/client/addStartImg',
	         type: 'post',
	         dataType: 'json',
	         data: $("#infoForm").serialize(),
	         success: function(result) {
	         	if(result.succ){
	         		showAlert('alt');
	         		window.setInterval( function () {
		         		location.href = "${base}/client/toStartView";
					}, 1000 );
	         	} else {
			    	showAlert('error',result.entity);
			    	return false;
	         	}
	         },
			error:function(data){
			   showAlert('error');
			}
	     });
    }
  
	</script>
</body>
</html>