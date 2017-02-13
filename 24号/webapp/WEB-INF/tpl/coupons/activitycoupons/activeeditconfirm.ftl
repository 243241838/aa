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
    <h2 class="ui-info-tit">新增优惠劵活动</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">活动名称:</label>
         		${pVo.promotionName}
         		<input   name="promotionId" type="hidden" value="${pVo.promotionId}"/> 
         		 <input   name="promotionName" type="hidden" value="${pVo.promotionName}"/> 
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">活动介绍:</label>
         		${pVo.promotionIntro}
         		 <input   name="promotionIntro" type="hidden" value="${pVo.promotionIntro}"/> 
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">专题图片:</label>
				<img src="${base}${pVo.promotionLogo}" width=120 height=120/>
         		 <input   name="promotionLogo" type="hidden" value="${pVo.promotionLogo}"/> 
         		 
         	</li>
         	
         	 <li class="ui-info-item ui-info-item-grey">
         	 <label class="ui-info-lbl">活动适用渠道:</label>
         	  <input type="hidden" name="promotionChannels" value="${pVo.promotionChannels}" />
         		 <#list channelTemp as item>
                    <input type="checkbox" disabled  <#if item.domainsts==1>checked="checked"</#if> value="${item.code}" class="search-radioitem"/>${item.domainame}
                  </#list>
         	</li>
  	          <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">活动时间:</label>
         		<input   name="effTimestr" type="hidden" value="${pVo.effTimestr}"/>
         		<input   name="expTimestr" type="hidden" value="${pVo.expTimestr}"/>
         		 ${pVo.effTimestr}至 ${pVo.expTimestr}
         	</li>
        </ul>
     <h2 class="ui-info-tit">活动产品</h2>
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
        </ul>
          </#list>
          
          <h2 class="ui-info-tit">优惠劵</h2>
      <#list cList as item>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">优惠券编号</label>
         		   <a class="operation-link" href="${base}/coupons/toEditCoupons?couponId=${item.couponId}"><font color="#00F">${item.couponId}</font></a>
         		  <input   name="domainCoupondsMap['${item.couponId}'].couponId" type="hidden" value="${item.couponId}">
         	    <label class="ui-info-lbl">优惠券名称</label>
         		${item.couponName}
         	    <label class="ui-info-lbl">优惠券方式</label>
         			<#if item.couponType==1>折扣<#else>金额</#if>
         	    <label class="ui-info-lbl">优惠值</label>
         	    <#if item.couponType==1>${item.couponValue/100}%<#else>${item.couponValue/100}</#if>
         	</li>
         	         
        <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">优惠券领用时间:</label>
         		<input  name="domainCoupondsMap['${item.couponId}'].getEffDateStr"  type="hidden" value="${item.getEffDateStr}"/>
         		<input  name="domainCoupondsMap['${item.couponId}'].getExpDateStr" type="hidden" value="${item.getExpDateStr}"/>
         		 ${item.getEffDateStr}至 ${item.getExpDateStr}
         	</li>
         	
         	   <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">优惠券使用时间:</label>
         		<input  name="domainCoupondsMap['${item.couponId}'].periodType"   type="hidden" value="${item.periodType}"/>
         		<input  name="domainCoupondsMap['${item.couponId}'].periodValue"  type="hidden" value="${item.periodValue}"/>
         		<#if item.periodType==0>不限</#if>
         		<#if item.periodType==1>${item.periodValue}天</#if>
         		<#if item.periodType==2>${item.periodValue}周</#if>
         		<#if item.periodType==3>${item.periodValue}月</#if>
         		<#if item.periodType==4>${item.periodValue}年</#if>
         		<#if item.periodType==10>
         		<input  name="domainCoupondsMap['${item.couponId}'].effdateStr"  type="hidden" value="${item.effdateStr}"/>
         		<input   name="domainCoupondsMap['${item.couponId}'].expdateStr"  type="hidden" value="${item.expdateStr}"/>
         		 ${item.effdateStr}至 ${item.expdateStr}</#if>
         	</li>
        
                    
                      <li class="ui-info-item ui-info-item-grey">
                    	   该优惠券共 <a class="operation-link" href="${base}/coupons/findCouponDetail?couponId=${item.couponId}&promotionId=${pVo.promotionId}"><font color="#00F"> ${item.allcount}</font></a> 张，已被领取  <a class="operation-link" href="${base}/coupons/findCouponDetail?couponId=${item.couponId}&promotionId=${pVo.promotionId}"><font color="#00F"> ${item.rececount}</font></a> 张
                    	   ，已使用 <a class="operation-link" href="${base}/coupons/findCouponDetail?couponId=${item.couponId}&promotionId=${pVo.promotionId}"><font color="#00F"> ${item.usecount}</font></a> 张                         
                   新添加优惠券:<a class="operation-link"><font color="#00F"> ${item.addcount}</font></a>  张
                    <input  name="domainCoupondsMap['${item.couponId}'].couponcount"  type="hidden" value="${item.addcount}"/>
                    </li>
        </ul>
          </#list>
	    <div class="ui-btn-double ui-detail-btnposition">
	      <input type="button" value="确认"  class="ui-btn-blue ui-detail-bntwidth"  onclick="domainok()"/>
	      <input type="button" value="返回修改"  class="ui-btn-grey ui-back"/>
	    </div>
	    </form>
   	 </div>
  	</div>
    
    <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">编辑成功!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="确定"/>
  </div>
     <div id="dlgProduce" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">确定提交该活动信息吗？</h3>
	    <input type="button" class="ui-dlgOk-btn" onclick="addconfim()" value="确定"/>
	    <input type="button" class="ui-dlgCancel-btn" value="取消"/>
  </div>     
	<script>
	function domainok(){
		showAlert("dlgProduce");
	}
          function addconfim(){
             $.ajax({
                 url: '${base}/coupons/editpromotion',
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
   window.location.href="${base}/coupons/activitylistView";
   }
	</script>
</body>
</html>