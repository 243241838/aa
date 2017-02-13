<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-产品上架管理-产品信息</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	
	
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
<body>
	<div class="ui-info-box">
    
     <!-- 表单一-->
    <div class="ui-info-main" id="frm1" style="display:block">
    <form id="infoForm" method="post" action="${base}/operate/findinfoProduct">
    <h2 class="ui-info-tit">新增专题</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">专题名称</label>
         		${specialvo.specialName}
         		 <input   name="specialName" type="hidden" value="${specialvo.specialName}"/> 
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">专题说明</label>
         		${specialvo.specialIntro}
         		 <input   name="specialIntro" type="hidden" value="${specialvo.specialIntro}"/> 
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">专题图片</label>
				<img src="${base}${specialvo.specialLogo3}" width=120 height=120/>
         		 <input   name="specialLogo3" type="hidden" value="${specialvo.specialLogo3}"/> 
         		 
         	</li>
         	
  	        
        </ul>
     <h2 class="ui-info-tit">关联产品</h2>
      <#list pList as item>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">产品ID</label>
         		  ${item.productId}
         		  <input   name="domainProductsMap['${item.productId}'].productId" type="hidden" value="${item.productId}">
         	    <label class="ui-info-lbl">保险名称</label>
         		  <a class="operation-link" href="${base}/product/toProductDetailMsgs?productId=${item.productId}"><font color="#00F">${item.productName}</font></a>
         	    <label class="ui-info-lbl">保险公司</label>
         		  ${item.insurerName}
         	    <label class="ui-info-lbl">产品总量</label>
         	     <#if item.maxQuantity==-1>
         		      不限
         		  <#else> ${item.maxQuantity}
         		  </#if>
                <label class="ui-info-lbl">保费金额(元)</label>
         		  ${item.minPremium/100}-${item.maxPremium/100}
         		  <label class="ui-info-lbl">保险类别</label>
         		  ${item.className}
         		  <label class="ui-info-lbl">来源</label>
         		  <#if item.productSource==1>自研<#else>保险公司</#if>
         		 
         		  
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">专题推荐语</label>
         		  ${item.productRecommend}
         		  <input   name="domainProductsMap['${item.productId}'].productRecommend" type="hidden" value="${item.productRecommend}">
       </li>
        </ul>
          </#list>
          <ul class="ui-info-list">
        <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">开始时间</label>
         		<input   name="effTimestr" type="hidden" value="${specialvo.effTimestr}"/>
         		 ${specialvo.effTimestr}
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         	 <input   name="expTimestr" type="hidden" value="${specialvo.expTimestr}"/>
         		<label class="ui-info-lbl">结束时间</label>
         		 ${specialvo.expTimestr}
         	</li>
        </ul>
	    <div class="ui-btn-double ui-detail-btnposition">
	      <input type="button" value="完成并提交审核"  class="ui-btn-blue ui-detail-bntwidth"  onclick="domainok()"/>
	      <input type="button" value="返回修改"  class="ui-btn-grey ui-back"/>
	    </div>
	    </form>
   	 </div>
  	</div>
    
    <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">您新增专题的请求已提交审核!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="确定"/>
  </div>
  <div id="dlgm" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
    
	<script>
          function domainok(){
             $.ajax({
                 url: '${base}/operate/addSpecialProduct',
                 type: 'post',
                 datatype: 'text',
                 data: $('#infoForm').serialize(),
                 success: function (result) {
                     if (result>0) {
                     showAlert("dlg");
                     }else{
                       showAlert("dlgm");
                     }
                 }
             });
   }
   
   function tomain(){
   window.location.href="${base}/operate/specialView";
   }
	</script>
</body>
</html>