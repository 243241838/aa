<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" content="text/html; charset=utf-8" >
	<title>版本管理-客户端管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
</head>
<body>
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
    <form id="infoForm" method="post" action="/client/addVersion" enctype="multipart/form-data">
        <input type="hidden" name="type" value="${type}" />
    <div class="ui-info-main ui-andAdd-main">
        <h2 class="ui-info-tit">新增版本</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item no-topbor">
         		<label class="ui-info-lbl">版本号</label>
            <input type="text" value="" name="currentVersion" class="easyui-validatebox ui-info-input"
                   data-options="required:true,validType:['verNo']" missingMessage="请输入版本号"/>
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">适配系统</label>
         		<input type="text" value="" name="systemVersion" class="easyui-validatebox ui-info-input"
                   data-options="required:true" missingMessage="请输入适配系统"/> 
         	</li>
         	<li class="ui-info-item">
         		<label class="ui-info-lbl">发布类型</label>
            <select class="easyui-validatebox ui-info-sel" name="versionState" data-options="required:true,validType:['selectNotEmpty']" missingMessage="请选择!">
              <option value=''>请选择</option>
                <#list deployTypeList as deployType>
                        <option value=${deployType.code}>${deployType.desc}</option>
                </#list>
            </select>
         	</li>
          <li class="ui-info-item ui-info-item-grey ui-padb ui-andSource-wrap">
            <label class="ui-info-lbl">发布渠道</label>
            <div class="ui-resureLimit-inner ui-resureLimit-fir">
                <select class="easyui-validatebox ui-info-sel" name="channels" data-options="required:true,validType:['selectNotEmpty']" missingMessage="请选择!">
                    <option value=''>请选择</option>
                <#list deployChannels as deployChannel>
                    <#if deployChannel_index == 0 && type == "IOS">
                        <option value=${deployChannel.dictKey} selected="selected">${deployChannel.dictValue}</option>
                    <#else>
                        <option value=${deployChannel.dictKey}>${deployChannel.dictValue}</option>
                    </#if>
                </#list>
                </select>
              <label class="ui-info-lbl">上传安装包</label>
              <input type="button" class="ui-btn-blue ui-fileup" value="上传">
              <input type="file" class="easyui-validatebox file-wrap file-hid" id="" name="appFiles"
                     data-options="required:true,validType:['apk']" missingMessage="请上传安装包" style="left: 421px">
              <#if type == "Android"><a class="ui-guarant-addfir" href="javascript:;"></a></#if>
            </div>
          </li>
          <li class="ui-info-item">
            <label class="ui-info-lbl">更新类型</label>
            <select class="easyui-validatebox  ui-info-sel" name="isOptional"  data-options="required:true,validType:['selectNotEmpty']" missingMessage="请选择!">
              <option value=''>请选择</option>
              <#list updateTypeList as updateType>
                  <option value=${updateType.code}>${updateType.desc}</option>
              </#list>
            </select>
          </li>
          <li class="ui-info-item  ui-info-item-grey">
            <label class="ui-info-lbl">更新信息</label>
            <textarea class="easyui-validatebox ui-info-txta" name="verDec"
                      data-options="required:true" missingMessage="请输入更新信息"></textarea>
          </li>
          <!--<li class="ui-info-item">
            <label class="ui-info-lbl">客户端下载地址</label>
            <input type="text" value="" class="easyui-validatebox ui-info-input" 
                   data-options="required:true,validType:['downloadurl']" missingMessage="请输入客户端下载地址"/> 
          </li> -->
        </ul>
  	</div>
    <div class="ui-btn-double">
      <input type="button" value="保存" class="ui-btn-blue" onclick="doSubmit(this);"/>
      <input type="button" value="取消"  class="ui-btn-grey" onclick="formCancel('dlg');"/>
    </div>
   </form>
<!--弹框-->  
  <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit">您的操作尚未保存，确定要取消吗？</h3>
    <input type="button" class="ui-dlgOk-btn" value="确定"/>
    <input type="button" class="ui-dlgCancel-btn" value="取消"/>
  </div>

	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/kindeditor/kindeditor.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script>
   $(function(){
    validExtend();
    moreLine($('.ui-andSource-wrap'));
	});
   
  
	</script>
</body>
</html>