<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-红包管理-新增</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/kindeditor/kindeditor.js"></script>
	<script type="text/javascript" src="${base}/resource/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.form.js"></script>
  <style> 
    
  </style>
</head>
<body>
<div id="produce-add">
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
    <form id="infoForm" method="post" action="">

      <div class="ui-info-main">
         <ul class="ui-info-list">
           	<li class="ui-info-item">
           		<label class="ui-info-lbl redrule-item-label">优惠券名称:</label>
           		${cVo.couponName}
           		<input name="couponName" type="hidden" value="${cVo.couponName}" />
           		<input name="couponId" type="hidden" value="${cVo.couponId}" />
           	</li>
            <li class="ui-info-item ui-info-item-grey">
           		<label class="ui-info-lbl redrule-item-label">优惠方式:</label>
           		<#if cVo.couponType==1>折扣优惠      ${cVo.couponValuebfb}%</#if>
           		<#if cVo.couponType==2>金额优惠       ${cVo.couponValuestr}元</#if>
           		<input name="couponType" type="hidden" value="${cVo.couponType}" />
           			<input name="couponValuestr" type="hidden" value="${cVo.couponValuestr}" />
           				<input name="couponValuebfb" type="hidden" value="${cVo.couponValuebfb}" />
           	</li>
            <li class="ui-info-item">
                <label class="ui-info-lbl redrule-item-label">最大使用次数:</label>
                <#if cVo.maxQuantity==0>不限<#else>${cVo.maxQuantity}次</#if>
                <input name="maxQuantity" type="hidden" value="${cVo.maxQuantity}" />
            </li>
            <li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl redrule-item-label">单用户最大使用次数:</label>
                 <#if cVo.userQuantity==0>不限<#else>${cVo.userQuantity}次</#if>
                <input name="userQuantity" type="hidden" value="${cVo.userQuantity}" />
            </li>
            <li class="ui-info-item">
                <label class="ui-info-lbl redrule-item-label">允许单个用户领用次数:</label>
                
                <#if cVo.multiSts==0>不限<#else>${cVo.multiSts}次</#if>
                <input name="multiSts" type="hidden" value="${cVo.multiSts}" />
            </li>
            <li class="ui-info-item ui-info-item-grey">
            <label class="ui-info-lbl redrule-item-label">是否允许与其他优惠券叠加使用:</label>
            <#if cVo.overlapSts==0>不允许  </#if>
           		<#if cVo.overlapSts==1>允许</#if>
                <input name="overlapSts" type="hidden" value="${cVo.overlapSts}" />
            </li>
            <li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label">使用条件:</label>
              
               <#if cVo.offUptostr==0>不限<#else>订单满${cVo.offUptostr}元</#if>
                <input name="offUptostr" type="hidden" value="${cVo.offUptostr}" />
            </li>
            <li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label">兑换成功提示语:</label>
                ${cVo.couponPrompt}
              <input name="couponPrompt" type="hidden" value=" ${cVo.couponPrompt}"/>
            </li>
            <li class="ui-info-item ui-info-item-grey">
              <label class="ui-info-lbl redrule-item-label">活动地址:</label>
               ${cVo.couponUrl}
              <input name="couponUrl" type="hidden" value=" ${cVo.couponUrl}"/>
            </li>
           	
          </ul>
    	</div>
      <div class="ui-btn-double">
       <input type="button" value="保存" class="ui-btn-blue" id="concessSave"/>
        <input type="button" value="取消"  class="ui-btn-grey ui-back"/>
      </div>
      </form>
    </div>  
</div>
<!--保存并提交弹框-->
<div id="dlgSubmit" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
  <h3 class="ui-dlg-tit">确定提交该优惠券信息吗？</h3>
  <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确认" onclick="addcoupons()"/>
  <input type="button" class="ui-dlgCancel-btn" value="取消"/>
</div>

 <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">操作成功!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="确定"/>
  </div>
 <div id="produce-result" style="display:none"></div>
<script>

 $('#concessSave').click(function(){
        showAlert('dlgSubmit');
  })
function addcoupons(){
   $.ajax({
                 url: '${base}/coupons/doAddCoupons',
                 type: 'post',
                 datatype: 'text',
                 data: $('#infoForm').serialize(),
                 success: function (data) {
                     if (data.succ) {
                     showAlert("dlg");
                     }else{
						alert(data.entity);
					}
                 },
                 error:function(data){
                     alert('请求出错！')
                 }
             });

}

function tomain(){
   window.location.href="${base}/coupons/listView";
   }
</script>	

</body>
</html>