
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>密钥管理-新增</title>
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
      <form id ="editMerchs" method="post" action="${base}/channelmanager/dosetKey" >
            <div class="ui-info-main">
                <h3 class="ui-info-tit">渠道信息</h3>
                <div class="ui-infobg">
                    <table class="ui-center-tab">
                      <tbody>
                      <#if domain.domainId != null>
                                <input type="hidden" name="domainId" value="${domain?if_exists.domainId}"/>
                          </#if>
                         <tr class="ui-info-item">
                            <td>
                              <span class="ui-info-list">渠道ID：${domain?if_exists.domainId}</span>
                            </td>
                          </tr>
                          <tr class="ui-info-item">
                            <td>
                              <span class="ui-info-list">渠道名称：${domain?if_exists.domainName}</span>
                            </td>
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
                             ${domainKey.effTimeStr} 至  ${domainKey.expTimeStr}
                            </td>
                          </tr>
                          
                          <tr class="ui-info-item">
                            <td colspan="3">
                                <span class="ui-info-list">渠道名称：生效</span>
                            </td>
                          </tr>
                           
                          <tr class="ui-info-item">
                            <td class="ui-info-lbl ui-info-small">密钥类型：</td>
                            <td>
                                <label><input name="keyType" type="radio"  <#if domainKey.keyType == 1>checked="checked"</#if> value="1"/>MD5 </label> 
                                <label><input name="keyType" type="radio" <#if domainKey.keyType == 10>checked="checked"</#if> value="10"/>RSA </label>
                                <label><input name="keyType" type="radio" <#if domainKey.keyType == 20>checked="checked"</#if> value="20"/>3DES </label>
                            </td>
                          </tr>
                          <tr class="ui-info-item">
                            <td class="ui-info-lbl ui-info-small">公钥：</td>
                            <td colspan="3">
                                <!--<input id="pKey" name="pkey" type="text" maxlength=1024  class="validate[required,custom[typeName]] ui-dinput" />-->
                                <textarea  rows="3" cols="40" class="easyui-validatebox" name="publicKey" id="pppk" readonly="readonly">${domainKey.publicKey}</textarea>
                            </td>
                          </tr>
                          <tr class="ui-info-item">
                            <td class="ui-info-lbl ui-info-small">私钥：</td>
                            <td colspan="3">
                                <!--<input id="privateKey" name="privatekey" type="text" maxlength=1024  class="validate[required,custom[typeName]] ui-dinput" />-->
                                <textarea  rows="3" cols="40" class="easyui-validatebox" name="privateKey" id="ppprk" readonly="readonly">${domainKey.privateKey}</textarea>
                            </td>
                          </tr>
                          </tbody>
                           <input type="hidden" name="effTimeStr" value="${domainKey?if_exists.effTimeStr}"/>
                           <input type="hidden" name="expTimeStr" value="${domainKey?if_exists.expTimeStr}"/>
                           <input type="hidden" name="keySts" value="10"/>
                    </table>
                                                      
                </div>
            </div>
        <div class="ui-btn-double">
     <input type="button" value="返回"  class="ui-btn-grey" id="ddback" onclick="backTopp();"/>
     <input type="button" value="保存" class="ui-btn-blue" onclick="doDomKeyAdd(this,'${base}/channelmanager/findDomainKey?domainId=${domain?if_exists.domainId}');"/>
    </div>
        </form>
    </div>
</div>
  <div id="dlgYes" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit">新增秘钥成功!</h3>
  </div>
  
  <div id="dlgNo" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="msg">新增密钥失败,请检查有效期是否重叠！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定">
  </div>

    <script>
    function backTopp(){
           var data = $("#editMerchs").serialize();
          <!-- flag用于标记，便于清除缓存-->
            window.location.href="${base}/channelmanager/toAddKey?flag=1&"+data;
    }
</script>

</body>
</html>