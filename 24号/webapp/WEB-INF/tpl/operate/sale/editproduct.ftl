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
    <form id="infoForm" method="post" action="${base}/operate/spricalFalshAddConfirm">
     <h2 class="ui-info-tit">产品信息</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">产品ID</label>
         		  ${product.productId}
         		  <input   name="productId" type="hidden" value="${product.productId}">
         		  <input   name="specialId" type="hidden" value="${specialsPo.specialId}">
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
         		  <#else>  ${product.shengyuQuantity}
         		  </#if>
         		  <input   id="${product.shengyuQuantity}" type="hidden" value=" ${product.shengyuQuantity}">
         	</li>
        </ul>
        
      <h2 class="ui-info-tit">配置信息</h2>
        <ul class="ui-info-list" id="ChildMenu1">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">限时抢购数量</label>
         		 ${specialproduct.productAmount}份
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">每人最多购买份数</label>
         		 ${specialproduct.buyQuota}份
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">折扣度</label>
         		 ${specialproduct.discountRate}%
         	</li>
         	 
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">开始时间</label>
         		 ${specialsPo.effTimestr}
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">结束时间</label>
         		 ${specialsPo.expTimestr}
         	</li>
  	        
  	        
        </ul>
      
      
        <ul class="ui-info-list" id="ChildMenu2">
        	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">限时抢购数量</label>
         		<input   name="productAmount" type="text"   value="${specialproduct.productAmount}"  onKeyUp="this.value=this.value.replace(/\D/g,'') "  onafterpaste="this.value=this.value.replace(/\D/g,'')"  maxlength=10  class="easyui-validatebox ui-info-input" data-options="required:true,validType:['plusNum','limitNum(\'${product.shengyuQuantity}\')']"/> 份
         		<#if product.maxQuantity==-1>
         	*限时抢购数量不限
         	  <#else> 
              <font color="#FF0000">*限时抢购数量最多为${product.shengyuQuantity}份</font>
         		  </#if>
         	</li>
         	
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">每人最多购买份数</label>
         		<input   name="buyQuota" type="text"   value="${specialproduct.buyQuota}"  onKeyUp="this.value=this.value.replace(/\D/g,'') "  onafterpaste="this.value=this.value.replace(/\D/g,'')"  maxlength=10  class="easyui-validatebox ui-info-input" data-options="required:true,validType:['plusNum','limitNum(\'\')']"/> 份
         	</li>
         	
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">折扣度</label>
         		 <input   name="discountRate" type="text"    onKeyUp="this.value=this.value.replace(/\D/g,'') " onafterpaste="this.value=this.value.replace(/\D/g,'')"  value="${specialproduct.discountRate}" class="easyui-validatebox ui-info-input" data-options="required:true,validType:'parcenty'" maxlength="2"/> %
         	</li>
            	<li class="ui-info-item ui-info-item-grey ui-month-base">
         		<label class="ui-info-lbl">开始时间</label>
         		<input id="startime" name="effTimestr"    class="easyui-datetimebox ui-info-input date-timestart" data-options="editable:false" value="${specialsPo.effTime?string('yyyy-MM-dd HH:mm:ss')}" >
         		<span class="showMessage"></span>
         	</li>
         	 <li class="ui-info-item ui-info-item-grey ui-month-base">
         		<label class="ui-info-lbl">结束时间</label>
         		<input id="endtime" name="expTimestr"   class="easyui-datetimebox ui-info-input date-timeend" value="${specialsPo.expTime?string('yyyy-MM-dd HH:mm:ss')}" data-options="editable:false"  validType="mdMs['#startime']">
         		<span class="showMessage"></span>
         	</li>
         	
         	</li>
  	        
        </ul>
	      <div id="dosome" class="ui-btn-double">
	      <input type="button" value="编辑" onclick="editpuduct()" class="ui-btn-blue" />
	      <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
	    </div>
	     <div id="doproducteidt" class="ui-btn-double" style="display:none">
	      <input type="button" value="完成"   onclick="saveproduct()" class="ui-btn-blue" />
	      <input type="button" value="取消"  class="ui-btn-grey"/ onclick="godown()">
	    </div>
	    </form>
   	 </div>
  	</div>
  	 <div id="dlg"  class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置成功!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="确定"/>
  </div>
  <div id="dlgm"    class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
  
	<script>
	  $(document).ready(function(){
	    validExtend();
	    document.getElementById('ChildMenu2').style.display = "none";
	$('#startime').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
      $('#endtime').datetimebox().datebox('calendar').calendar({
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
	function saveproduct(){
	  var f=$('#infoForm');
	      if(!f.form('validate')){
	       return false;
	      }
	 $.ajax({
                 url: '${base}/operate/updateFalshSpecial',
                 type: 'post',
                 datatype: 'text',
                 data: $('#infoForm').serialize(),
                 success: function (result) {
                     if (result>0) {
                       showAlert("dlg");
                     }else if (result==-1){
                      alert("日期有交集");
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