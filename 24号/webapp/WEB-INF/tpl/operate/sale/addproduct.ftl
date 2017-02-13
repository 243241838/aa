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
        <ul class="ui-info-list">
        	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">限时抢购数量</label>
         		<input  name="productAmount" type="text" maxlength=10  onKeyUp="this.value=this.value.replace(/\D/g,'') "     onafterpaste="this.value=this.value.replace(/\D/g,'')" value="" class="easyui-validatebox ui-info-input" data-options="required:true,validType:['plusNum','limitNum(\'${product.shengyuQuantity}\')']"/> 份
         		<#if product.maxQuantity==-1>
         	*限时抢购数量不限
         	  <#else> 
              <font color="#FF0000">*限时抢购数量最多为${product.shengyuQuantity}份</font>
         		  </#if>
         	</li>
         	
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">每人最多购买份数</label>
         		<input class="easyui-validatebox ui-info-input"  type="text"  data-options="required:true,validType:'integer'" name="buyQuota" maxlength="10"  onKeyUp="this.value=this.value.replace(/\D/g,'') "     onafterpaste="this.value=this.value.replace(/\D/g,'')" value=""  /> 份
         	</li>
         	
         <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">折扣度</label>
         		<input  id="maxQuantityall" name="discountRate" type="text"    onKeyUp="this.value=this.value.replace(/\D/g,'') " onafterpaste="this.value=this.value.replace(/\D/g,'')" value="" class="easyui-validatebox ui-info-input" data-options="required:true,validType:'parcenty'" maxlength="2"/>%
         	</li>
         	 
            <li class="ui-info-item ui-info-item-grey ui-month-base">
         		<label class="ui-info-lbl">开始时间</label>
         		<input id="startime" name="effTimestr"    class="ui-info-input date-timestart" data-options="editable:false"  >
         		<span class="showMessage"></span>
         	</li>
         	 <li class="ui-info-item ui-info-item-grey ui-month-base">
         		<label class="ui-info-lbl">结束时间</label>
         		<input id="endtime" name="expTimestr"   class="ui-info-input date-timeend" data-options="editable:false"  validType="mdMs['#startime']"/>
         		<span class="showMessage"></span>
         	</li>

  	        
        </ul>
	    <div class="ui-btn-double">
	      <input type="button" value="下一步" onclick="checkTime()" class="ui-btn-blue" />
	      <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
	    </div>
	    </form>
   	 </div>
  	</div>
	<script>
	  $(function(){
	    validExtend();
	   
	    
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
    
    
});
	
	
    function checkTime(){
      var fr=$("#infoForm"),isflag = checkDate(fr);
	      if(fr.form('validate') && isflag){
	          $.ajax({        
	           	     url: '${base}/operate/checkFalshTime',
	                 type: 'post',
	                 datatype: 'text',
	                 data: $('#infoForm').serialize(),
	                 success: function (result) {
	                   if(result==2){
	                   alert("日期有交集");
	                   }
	                   if(result==0){
	                   alert("请输入日期");
	                   }
	                   if(result==1){
	                   alert("结束日期应大于开始日期");
	                   }
	                    if(result==3){
	                     $('#infoForm').submit();
	                   }
	                 }
	             });
	      }else{
	      	return false;
	      } 
    
    
    }
	</script>
</body>
</html>