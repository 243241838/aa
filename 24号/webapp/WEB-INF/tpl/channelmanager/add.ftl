<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>秘钥管理-新增</title>
   <link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
    <link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
    <script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${base}/resource/js/kindeditor/kindeditor.js"></script>
    <script type="text/javascript" src="${base}/resource/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="${base}/resource/js/control.js"></script>
    <script type="text/javascript" src="${base}/resource/js/base.js"></script>
    <script type="text/javascript" src="${base}/resource/js/jquery.form.js"></script>

</head>

<body>
 <div id="page-form" class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
         <#include "/common/include/power.ftl">
    </div>
  <div class="ui-info-content">
      <form id ="editMerch" method="post"  action="${action?if_exists}" >
            <div class="ui-info-main">
                <h3 class="ui-info-tit"> 渠道基本信息</h3>
                <div class="ui-infobg">
                    <table class="ui-center-tab">
                      <tbody>
                            <tr class="ui-info-item">
                            <td>
                              <input id="getRoleId" type="hidden" name="domainId" value="${domain?if_exists.domainId}"/>
                               <span class="ui-info-list">渠道ID：${domain?if_exists.domainId}</span>
                            </td>
                            <td></td>
                            <td></td>
                          </tr> 
                          <tr class="ui-info-item">
                            <td>
                              <input id="domainName" type="hidden" name="domainName" value="${domain?if_exists.domainName}"/>
                             <span class="ui-info-list">渠道名称：${domain?if_exists.domainName}</span>
                            </td>
                            <td></td>
                            <td></td>
                          </tr>
                          </tbody>
                    </table>
                </div>
                <h3 class="ui-info-tit"> 渠道密钥信息</h3>
                <div class="ui-infobg" id="setkeys">
                    <table class="ui-center-tab" >
                      <tbody>
                      <tr class="ui-info-item">
                            <td class="ui-info-lbl ui-info-small">生效日期：</td>
                            <td colspan="3">
                                <input  class="easyui-datebox"  name="effTimeStr" value="${domainInfo_session?if_exists.effTimeStr}"  validType="md['#endTime']"  id="startTime" data-options="editable:false" required="true" missingMessage="请输入生效时间">
                                 至<input  class="easyui-datebox"  name="expTimeStr" value="${domainInfo_session?if_exists.expTimeStr}"  validType="md['#startTime']"  id="endTime" data-options="editable:false" required="true" missingMessage="请输入失效时间">                                 
                            </td>                            
                          </tr>
                          
                          <tr class="ui-info-item">
                            <td class="ui-info-lbl ui-info-small">密钥类型：</td>
                            <td>
                                <label><input name="keyType" type="radio" <#if domainInfo_session?if_exists.keyType == 1>checked="checked"</#if> value="1" checked="checked"/>MD5 </label> 
                                <label><input name="keyType" type="radio" <#if domainInfo_session?if_exists.keyType == 10>checked="checked"</#if> value="10"/>RSA </label>
                                <label><input name="keyType" type="radio" <#if domainInfo_session?if_exists.keyType == 20>checked="checked"</#if> value="20"/>3DES </label>
                                <input type="button" value="自动生成" class="ui-btn-grey" onclick="createKey();"/>
                            </td>
                          </tr>
                          <tr class="ui-info-item">
                            <td class="ui-info-lbl ui-info-small">公钥：</td>
                            <td colspan="3">
                                <!--<input id="pKey" name="pkey" type="text" maxlength=1024  class="validate[required,custom[typeName]] ui-dinput" />-->
                                
                              <textarea  rows="3" cols="40" class="easyui-validatebox" name="publicKey" id="pKey" required="true" missingMessage="请输入公钥">${domainInfo_session?if_exists.publicKey}</textarea>
                           
                            </td>
                          </tr>
                          <tr class="ui-info-item">
                            <td class="ui-info-lbl ui-info-small">私钥：</td>
                            <td colspan="3">
                                <!--<input id="privateKey" name="privatekey" type="text" maxlength=1024  class="validate[required,custom[typeName]] ui-dinput" />-->
                                <textarea  rows="3" cols="40" class="easyui-validatebox" name="privateKey" id="privateKey" required="true" missingMessage="请输入私钥">${domainInfo_session?if_exists.privateKey}</textarea>
                            </td>
                          </tr>
                          </tbody>
                    </table>
                </div>
            </div>
          <div class="ui-btn-double">
          <a href="${base}/channelmanager/findDomainKey?domainId=${domain?if_exists.domainId}" class="ui-btn-grey">返回</a>
          <input type="button" value="下一步" class="ui-btn-blue " onclick="doSubmit(this);"/>
          
        </div>
        </form>
    </div>
</div>
</div>
<div id="page-result" style="display:none">
</div>

<script>
    $(function(){
       validExtend();
  
    var msg = "${errMsg}";
    if(msg.length > 0){
        alert(msg);
    }
   
});

function createKey(){
    var type = $("input[name='keyType']:checked").val();
    $.ajax({
            url : "/channelmanager/createKey?keyType="+type,
             type: 'post',
             datatype: 'json',
            success : function(data) {
              if(data.succ){
              $("#pKey").val(data.entity.publicKey);
              $("#privateKey").val(data.entity.privateKey);
              }else{
              alert("生成秘钥失败");
              }
            },error:function(){
                alert("系统错误，请重试！");
            }
        });
}
</script>
</body>
</html>