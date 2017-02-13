<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-营销策略管理-定价管理</title>
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
    <form id="infoForm" method="post" action="">
     <h2 class="ui-info-tit">产品信息</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">产品ID</label>
         		  ${product.productId}
         		    <input   name="productId" type="hidden" value=" ${product.productId}">
         	    <label class="ui-info-lbl">保险名称</label>
         		 
         		  <a class="operation-link" href="${base}/product/toProductDetailMsgs?productId= ${product.productId}"><font color="#00F">${product.productName}</font></a>
         	    <label class="ui-info-lbl">产品总量</label>
         		     <#if product.maxQuantity==-1>
         		      不限
         		  <#else> ${product.maxQuantity}
         		  </#if>
                <label class="ui-info-lbl">剩余数量</label>
         		   <#if product.maxQuantity==-1>
         		      不限
         		  <#else> ${product.shengyuQuantity}
         		  </#if>
         	</li>
        </ul>
         <#if priceList?if_exists>
         <h2 class="ui-info-tit">定价记录</h2>
          <ul class="ui-info-list">
           <#list priceList as dpitem>
         	<li class="ui-info-item ui-info-item-grey">
         	  <label class="ui-info-lbl">开始日期</label>
         		  ${dpitem.effTimestr}
         	   <label class="ui-info-lbl">结束日期</label>
         		  ${dpitem.expTimestr}
         	    <label class="ui-info-lbl">折扣度</label>
         		  ${dpitem.discountRate}%
         	</li> 
          </#list>
        </ul>
         <#else> <h2 class="ui-info-tit">定价记录:无</h2> </#if>
  
        
      <h2 class="ui-info-tit">配置信息</h2>
        <ul class="ui-info-list" id="ChildMenu1">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">折扣度</label>
         		 ${domainproduct.discountRate}%
         		  
         	</li>
         	 
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">开始日期</label>
         		 ${domainproduct.effTimestr}
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">结束日期</label>
         		 ${domainproduct.expTimestr}
         	</li>
  	        
  	        
        </ul>
        <ul class="ui-info-list" id="ChildMenu2" >
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">折扣度</label>
         		   <input id= "priceIdvalue" name="priceId" type="hidden" value="${domainproduct.priceId}">
         		 <input   name="discountRate" type="text"    onKeyUp="this.value=this.value.replace(/\D/g,'') " onafterpaste="this.value=this.value.replace(/\D/g,'')"  value="${domainproduct.discountRate}" class="easyui-validatebox ui-info-input" data-options="required:true,validType:'parcenty'" maxlength="2"/> %
         	</li>
         	 
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">开始日期</label>
         	  <input id="starteffTimestr" name="effTimestr" class="easyui-datetimebox  ui-info-input ui-datetimebox-value" data-options="editable:false" value="${domainproduct.effTime?string('yyyy-MM-dd HH:mm:ss')}" />
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">结束日期</label>
         		<input id="expTime1" name="expTimestr" class="easyui-datetimebox  ui-info-input ui-datetimebox-value" data-options="editable:false" value="${domainproduct.expTime?string('yyyy-MM-dd HH:mm:ss')}" validType="mdMs['#starteffTimestr']"/>
         	</li>
        </ul>
        <#if logPoList?if_exists>
             <h2 class="ui-info-tit">审核记录</h2>
          
           	 <#list logPoList as item>
           	 <ul class="ui-info-list"  >
          <li class="ui-info-item ui-info-item-grey">
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">提交时间</label>
              <span>
			                ${item.reqTime1}
		              </span> 
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">操作员</label>
             <span>
		                ${item.reqNickname}
		              </span> 
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">审核状态</label>
              <span>
		                <#if item.auditSts == 0>
		                	待审核
		                </#if>
		                <#if item.auditSts == 1>
		                	审核通过
		                </#if>
		                <#if item.auditSts == -1>
		                	审核不通过
		                </#if>
		              </span> 
            </div>
          </li>
           <#if item.auditSts != 0>
          <li class="ui-info-item   ui-info-item-grey" >
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">审核时间</label>
              <span>
			                ${item.auditTime1}
			                <input type="hidden" name="auditTime1" value="${item.auditTime2}" />
			              </span> 
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">审核员</label>
             <span>
			                ${item.auditNickname}
			              </span> 
            </div>
          </li></#if>	
         	 <#if item.auditSts == -1>
			        <li class="ui-info-item">
			              <label class="ui-info-lbl">审核不通过理由</label>
			              <span>
			                ${item.auditComment}
			              </span> 
			        </li>
		        </#if>
         	 </ul>
         	 </#list> 
           <#else>  <h2 class="ui-info-tit">审核记录:无</h2></#if>
	    <div id="dosome" class="ui-btn-double">
	    <#if domainproduct.sts==1 || domainproduct.sts==-1>
	      <input type="button" value="编辑" onclick="editpuduct()" class="ui-btn-blue" />
	      </#if>
	      <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
	    </div>
	     <div id="doproducteidt" class="ui-btn-double" style="display:none">
	      <input type="button" value="完成"   onclick="saveproduct()" class="ui-btn-blue" />
	      <input type="button" value="取消"  class="ui-btn-grey"/ onclick="godown()">
	    </div>
	    </form>
   	 </div>
  	</div>
     <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">您编辑产品定价的请求已提交审核!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="查看审核详情"/>
  </div>
  <div id="dlgm" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
  <div id="dlgnull" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">日期不能为空!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"  value="确定"/>
  </div>
  <div id="dlgjj" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">日期段有交集!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
   <div id="dlgtime" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">结束日期要大于开始日期!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
	<script>
	
	  $(document).ready(function(){
	   validExtend();
     $('#starteffTimestr').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
     $('#expTime1').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
     document.getElementById('ChildMenu2').style.display = "none";
 });
 
	function editpuduct(){
	  document.getElementById('ChildMenu1').style.display = "none";
	  document.getElementById('ChildMenu2').style.display = "block";
	  document.getElementById('doproducteidt').style.display = "";
	  document.getElementById('dosome').style.display = "none";
	
	}
	function godown(){
	   document.getElementById('ChildMenu1').style.display = "block";
	  document.getElementById('ChildMenu2').style.display = "none";
	  document.getElementById('doproducteidt').style.display = "none";
	  document.getElementById('dosome').style.display = "block";
	}
	<!--编辑产品信息-->
	function saveproduct(){
	  var f=$('#infoForm');
	      if(!f.form('validate')){
	       return false;
	      }
	 $.ajax({
	             url:'${base}/operate/updateMarkProduct',
                 type: 'post',
                 datatype: 'text',
                 data: $('#infoForm').serialize(),
                 success: function (result) {
                     if (result>0) {
                     showAlert("dlg");
                     }else if(result==-1){
                     showAlert("dlgjj");
                     }
                     else if(result==-2){
                     showAlert("dlgnull");
                     }
                      else if(result==-3){
                     showAlert("dlgtime");
                     }
                     else{
                       showAlert("dlgm");
                     }
                 }
             });
	}
	
	
	 function tomain(){
	 var valu=$('#priceIdvalue').val();
        window.location.href="${base}/operate/findMarkPriceInfo?priceId="+valu;
   }
	 
	</script>
</body>
</html>