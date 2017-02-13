
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>密钥管理-编辑</title>

   <link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
    <link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
    <script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${base}/resource/js/base.js"></script>
    <script type="text/javascript" src="${base}/resource/js/control.js"></script>

</head>
<body>
<div class="ui-info-box">
     <div class="ui-crumbs" id="crumbs">
         <#include "/common/include/power.ftl">
    </div>
  <div class="ui-info-content">
      <form id ="editMerchs" method="post" action="${base}/channelmanager/doUpdateKey" >
            <div class="ui-info-main">
                <h3 class="ui-info-tit">渠道信息</h3>
                <div class="ui-infobg">
                    <table class="ui-center-tab">
                      <tbody>
                      <tr class="ui-info-item">
                            <td>
                              <input id="getRoleId" type="hidden" name="domainId" value="${keyInfo?if_exists.domainId}"/>
                               <span class="ui-info-list">渠道ID：${keyInfo?if_exists.domainId}</span>
                            </td>
                            <td></td>
                            <td></td>
                          </tr> 
                          <tr class="ui-info-item">
                            <td>
                              <input id="domainName" type="hidden" name="domainName" value="${keyInfo?if_exists.domainName}"/>
                             <span class="ui-info-list">渠道名称：${keyInfo?if_exists.domainName}</span>
                            </td>
                            <td></td>
                            <td></td>
                          </tr>
                          </tbody>
                    </table>
                </div>
                <h3 class="ui-info-tit">渠道密钥信息</h3>
                <div class="ui-infobg">
                <table class="ui-center-tab" >
                      <tbody>
                      
                      <tr class="ui-info-item">
                            <td class="ui-info-lbl ui-info-small">生效日期：</td>
                            <td colspan="3">
                             ${keyInfo.effTimeStr} 至 ${keyInfo.expTimeStr}
                            </td>
                          </tr>
                          
                          <tr class="ui-info-item">
                            <td class="ui-info-lbl ui-info-small">状态：</td>
                            <td colspan="3">
                                <#if keyInfo.keySts == 10>生效</#if>
                                <#if keyInfo.keySts == -10>失效</#if>
                            </td>
                          
                          <tr class="ui-info-item">
                            <td class="ui-info-lbl ui-info-small">密钥类型：</td>
                            <td>
                                <label><input name="keyType" type="radio"  <#if keyInfo.keyType == 1>checked="checked"</#if> value="1"/>MD5 </label> 
                                <label><input name="keyType" type="radio" <#if keyInfo.keyType == 10>checked="checked"</#if> value="10"/>RSA </label>
                                <label><input name="keyType" type="radio" <#if keyInfo.keyType == 20>checked="checked"</#if> value="20"/>3DES </label>
                            </td>
                          </tr>
                          <tr class="ui-info-item">
                            <td class="ui-info-lbl ui-info-small">公钥：</td>
                            <td colspan="3">
                                <!--<input id="publicKey" name="publicKey" type="text" maxlength=1024  class="validate[required,custom[typeName]] ui-dinput" />-->
                                <textarea  rows="3" cols="40" class="easyui-validatebox" name="publicKey" readonly="readonly">${keyInfo.publicKey}</textarea>
                            </td>
                          </tr>
                          <tr class="ui-info-item">
                            <td class="ui-info-lbl ui-info-small">私钥：</td>
                            <td colspan="3">
                                <!--<input id="privateKey" name="privatekey" type="text" maxlength=1024  class="validate[required,custom[typeName]] ui-dinput" />-->
                                <textarea  rows="3" cols="40" class="easyui-validatebox" name="privateKey" readonly="readonly">${keyInfo.privateKey}</textarea>
                            </td>
                          </tr>
                          </tbody>
                            
                           <input type="hidden" name="effTimeStr" value="${keyInfo?if_exists.effTimeStr}"/>
                           <input type="hidden" name="expTimeStr" value="${keyInfo?if_exists.expTimeStr}"/>
                           
                           <input type="hidden" name="keySts" value="${keyInfo?if_exists.keySts}"/>
                           <input type="hidden" name="keyId" value="${keyInfo?if_exists.keyId}"/>
                           <!--<input type="hidden" name="flag" value="${keyInfo?if_exists.flag}"/>-->
                    </table>
                    </br>
                </div>
            </div>
          <div class="ui-btn-double">
           <input type="button" value="返回"  class="ui-btn-grey" id="back" onclick="backTop();"/>
          <input type="button" value="保存" class="ui-btn-blue" onclick="doUpdateKey(this,'${base}/channelmanager/findDomainKey?domainId=${domain?if_exists.domainId}');"/>
    </div>
        </form>
    </div>
</div>
<!--成功提示-->       
  <div id="dlgYes" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit">编辑秘钥成功!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定"/>
  </div>
  
  <div id="dlgNo" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="msg">编辑密钥失败，请检查有效期是否重叠！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定">
  </div>
   <script>
    function backTop(){
           var data = $("#editMerchs").serialize();
            window.location.href="${base}/channelmanager/editKey?flag=1&"+data;
    }
</script>

</body>
</html>