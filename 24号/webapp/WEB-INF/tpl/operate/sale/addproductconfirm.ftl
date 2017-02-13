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
    <div class="ui-crumbs" id="crumbs">
    	 <a href="javascript:history.go(-1);" class="search-btn">重新选择</a>
    </div>
    
     <!-- 表单一-->
    <div class="ui-info-main" id="frm1" style="display:block">
    <form id="infoForm" method="post" action="${base}/operate/findinfoProduct">
     <h2 class="ui-info-tit">产品信息</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">产品ID</label>
         		  ${product.productId}
         		  <input   name="productId" type="hidden" value="${product.productId}">
         	    <label class="ui-info-lbl">保险名称</label>         		 
         		  <a class="operation-link" href="${base}/product/toProductDetailMsgs?productId=${product.productId}"><font color="#00F">${product.productName}</font></a>
         		    <label class="ui-info-lbl">承保公司</label>         		 
         		        ${product.insurerName}
         	    <label class="ui-info-lbl">总库存</label>
         	       <#if product.maxQuantity==-1>
         		      不限
         		  <#else> ${product.maxQuantity}
         		  </#if>
                <label class="ui-info-lbl">当前库存</label>
                 <#if product.maxQuantity==-1>
         		      不限
         		  <#else>${product.shengyuQuantity}
         		  </#if>
         		 
         		  
         	</li>
        </ul>
      <h2 class="ui-info-tit">配置信息</h2>
        <ul class="ui-info-list">
        
        <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">限时抢购数量</label>
         		${special.productAmount}份
         		<input   type="hidden" readonly="true" name="productAmount" value="${special.productAmount}" class="easyui-validatebox ui-info-input">
         	</li>
        
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">每人最多购买份数</label>
         		 ${special.buyQuota}份
         		 <input    name="buyQuota" type="hidden" value="${special.buyQuota}"/> 
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">折扣度</label>
         		${special.discountRate}%
          <input   name="discountRate" type="hidden" value="${special.discountRate}"/> 
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">开始时间</label>
         		<input   name="effTimestr" type="hidden" value="${special.effTimestr}"/>
         		 ${special.effTimestr}
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         	 <input   name="expTimestr" type="hidden" value="${special.expTimestr}"/>
         		<label class="ui-info-lbl">结束时间</label>
         		 ${special.expTimestr}
         	</li>
  	        
        </ul>
	    <div class="ui-btn-double">
	      <input type="button" value="完成"  class="ui-btn-blue"  onclick="domainok()"/>
	      <input type="button" value="返回修改"  class="ui-btn-grey ui-back"/>
	    </div>
	    </form>
   	 </div>
  	</div>
    
    <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置成功!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="确定"/>
  </div>
  <div id="dlgm" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
    
	<script>
          function domainok(){
             $.ajax({
                 url: '${base}/operate/addSpecialFalshs',
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
   		window.location.href="${base}/operate/flashSaleView";
   }
	</script>
</body>
</html>