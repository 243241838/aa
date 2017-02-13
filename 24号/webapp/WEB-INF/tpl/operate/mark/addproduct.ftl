<!DOCTYPE html>
<html>
<head>  
	<meta charset="UTF-8">
	<title>运营管理-营销策略管理-产品信息</title>
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
    	 <input type="radio" name="sex" value="0" class="ui-page-select" data-switch="0" /> <font color="#FF0000">启用统一定价</font>
	     <input type="radio" name="sex" value="1" class="ui-page-select" checked data-switch="1"/> <font color="#FF0000">启用自定义定价</font>
    </div>
    
     <!-- 表单一-->
    <div class="ui-info-main" id="frm1" style="display:block">
	<form id="infoForm1" method="post" action="${base}/operate/findMarkProductInfo" >
	
	 <#list pList as item>
  
     <h2 class="ui-info-tit">产品${item_index +1}</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">产品ID</label>
         		  ${item.productId}
         	    <label class="ui-info-lbl">保险名称</label>
         		 
         		  <a class="operation-link" href="${base}/product/toProductDetailMsgs?productId=${item.productId}"><font color="#00F">${item.productName}</font></a>
         	      <label class="ui-info-lbl">上架渠道</label>
         		   ${item.domainName}
         	    <label class="ui-info-lbl">产品总量</label>
         	    <#if item.maxQuantity==-1>
         		      不限
         		  <#else> ${item.maxQuantity}
         		  </#if>
                <label class="ui-info-lbl">剩余数量</label>
         		   <#if item.maxQuantity==-1>
         		      不限
         		  <#else> ${item.shengyuQuantity}
         		  </#if>
         		  <input   id="checknumber${item.shengyuQuantity}" type="hidden" value=" ${item.shengyuQuantity}">
         	</li>
        </ul></#list>
   		<h2 class="ui-info-tit">统一定价信息 </h2> 
        <ul class="ui-info-list" >
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">折扣度</label>
         		<input type="hidden" name="selectype" value="0"/>
         		<input  id="maxQuantityall" name="discountRate" type="text"    onKeyUp="this.value=this.value.replace(/\D/g,'') " onafterpaste="this.value=this.value.replace(/\D/g,'')" value="" class="easyui-validatebox ui-info-input" data-options="required:true,validType:'parcenty'" maxlength="2"/>%
         	</li>
         	  <#list pList as item>
         	    <input   name="domainProductsMap['${item.productId}${item_index}'].domainId" type="hidden" value="${item.domainId}">
         	   <input   name="domainProductsMap['${item.productId}${item_index}'].productId" type="hidden" value="${item.productId}">
         	  </#list>
         	<li class="ui-info-item ui-info-item-grey ui-month-base">
         		<label class="ui-info-lbl">开始日期</label>
				<input id="starteffTimestr" name="effTimestr"  class="easyui-datetimebox ui-info-input date-timestart" data-options="editable:false" >
				<span class="showMessage"></span>
         	</li>
         	 <li class="ui-info-item ui-info-item-grey  ui-month-base ">
         		<label class="ui-info-lbl">结束日期</label>
         		<input id="effTimestr2" name="expTimestr" class="easyui-datetimebue ui-info-input date-timeend" data-options="editable:false"  validType="mdMs['#starteffTimestr']">
         		<span class="showMessage"></span>
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<font color="#FF0000">*请仔细查看定价列表,时间段应和列表时间无交集！开始日期应选择后一天的日期,结束日期大于开始日期！</font>
         	
         	</li>  
        </ul>
     </form>  
	<form id="infoForm2" method="post" action="${base}/operate/findMarkProductInfo">

    <#list pList as item>
  
     <h2 class="ui-info-tit">产品${item_index +1}</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">产品ID</label>
         		  ${item.productId}
         		
         		  <input   name="domainProductsMap['${item.productId}${item_index}'].productId" type="hidden" value="${item.productId}">
         		  <input   name="domainProductsMap['${item.productId}${item_index}'].domainId" type="hidden" value="${item.domainId}">
         	    <label class="ui-info-lbl">保险名称</label>
         		 
         		  <a class="operation-link" href="${base}/product/toProductDetailMsgs?productId=${item.productId}"><font color="#00F">${item.productName}</font></a>
         	      <label class="ui-info-lbl">上架渠道</label>
         		   ${item.domainName}
         	    <label class="ui-info-lbl">产品总量</label>
         	    <#if item.maxQuantity==-1>
         		      不限
         		  <#else> ${item.maxQuantity}
         		  </#if>
                <label class="ui-info-lbl">剩余数量</label>
         		   <#if item.maxQuantity==-1>
         		      不限
         		  <#else> ${item.shengyuQuantity}
         		  </#if>
         		  <input   id="checknumber${item.shengyuQuantity}" type="hidden" value=" ${item.shengyuQuantity}">
         	</li>
        </ul>
         <#if item.dppList?if_exists>
         <h2 class="ui-info-tit">定价记录</h2>
         
          <ul class="ui-info-list">
         
           <#list item.dppList as dpitem>
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
  
      <h2 class="ui-info-tit">定价信息</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">折扣度</label>
         		<input  name="domainProductsMap['${item.productId}${item_index}'].discountRate" type="text"   onKeyUp="this.value=this.value.replace(/\D/g,'') " onafterpaste="this.value=this.value.replace(/\D/g,'')" value="" class="easyui-validatebox ui-info-input" data-options="required:true,validType:'parcenty'" maxlength="2"/>%
                  <input type="hidden" name="selectype" value="1"/>
         	</li>
         	 
         	<li class="ui-info-item ui-info-item-grey ui-month-base">
         		<label class="ui-info-lbl">开始日期</label>
         		<input  id="startime${item_index+1}" name="domainProductsMap['${item.productId}${item_index}'].effTimestr"    class="easyui-datetimebox ui-info-input date-timestart " data-options="editable:false"  >
         		<span class="showMessage"></span>
         	</li>
         	 <li class="ui-info-item ui-info-item-grey ui-month-base">
         		<label class="ui-info-lbl">结束日期</label>
         		<input  id="endtime${item_index+1}" name="domainProductsMap['${item.productId}${item_index}'].expTimestr"   class="easyui-datetimebox ui-info-input date-timeend" data-options="editable:false" validType="mdMs['#startime${item_index+1}']" >
               <span class="showMessage"></span>
             </li>
             <li class="ui-info-item ui-info-item-grey">
         		<font color="#FF0000">*请仔细查看定价列表,时间段应和列表时间无交集！开始日期应选择后一天的日期,结束日期大于开始日期！</font>
         	
         	</li>  
        </ul>
         </#list>
		</form>
	    <div class="ui-btn-double">
	      <input type="button" value="下一步"  onclick="checkTime()" class="ui-btn-blue" />
	      <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
	    </div>
   	 </div>
  	</div>
    <div id="dlgm" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">库存不足！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
	<script>
	  $(function(){
	   document.getElementById('infoForm1').style.display = "none";
	    validExtend();
	   	richEdit();
	    prodProfit();
		//隐藏和显示
	    $(".ui-page-select").click(function(){
			var index = $(this).data("switch");
			if(index ==  0){
				$("#infoForm1").show();
				$("#infoForm2").hide();
			}else{
				$("#infoForm1").hide();
				$("#infoForm2").show();
			}
		})
		if($(".ui-page-select").eq(0).is(":checked")){
			$("#infoForm1").show();
			$("#infoForm2").hide();
		}
	    
	    $('.ui-submit1').click(function(){
	    	var unitytest = $("#infoForm1"),
	    	othertest = $("#infoForm2");
			//判断哪个显示就验证哪个
			if(!othertest.is(":visible")){
				var isonemenu = checkDate(unitytest);
				if( unitytest.form('validate') && isonemenu ){
	        		unitytest.submit();
	        	}else{
	        		return false;
	        	}
	        	
	      		
			}else{
				var istwomenu = checkDate(othertest);
				if(  othertest.form('validate') && istwomenu){
	        		othertest.submit();
	        	}else{
					return false;
				}
	      		
			}
			
	        //var a=document.getElementById('maxQuantityall').value;
	       // var f=$(this).parents('form');
	        //if(!f.form('validate')){
	        	//return false;
	       // }
	      	//f.submit();
	    });
	});
	 
	 $('#starteffTimestr').datetimebox().datebox('calendar').calendar({
                validator: function(date){
                     var now = new Date();
                     var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
                    return d1 <= date;
                }
            });
    $('#effTimestr2').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
    
     $('#effTimestr2').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
     $('#startime1').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
      $('#endtime1').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
	 $('#startime2').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
      $('#endtime2').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
	 $('#startime3').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
      $('#endtime3').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
     $('#startime4').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
      $('#endtime4').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
     $('#startime5').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
      $('#endtime5').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
    function checkTime(){
    var unitytest = $("#infoForm1"),
	    	othertest = $("#infoForm2");
			//判断哪个显示就验证哪个
			if(!othertest.is(":visible")){
				var isonemenu = checkDate(unitytest);
				if( unitytest.form('validate') && isonemenu ){
	        		 
	        	}else{
	        		return false;
	        	}
			}else{
				var istwomenu = checkDate(othertest);
				if(  othertest.form('validate') && istwomenu){
	        		 
	        	}else{
					return false;
				}
	      		
			}
    	var value="";
		var radio=document.getElementsByName("sex");
		for(var i=0;i<radio.length;i++){
		if(radio[i].checked==true){
		value=radio[i].value;
		break;
		}
		}
	if(value==0){
	 $.ajax({        url: '${base}/operate/checkTime',
	                 type: 'post',
	                 datatype: 'text',
	                 data: $('#infoForm1').serialize(),
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
	                   $('#infoForm1').submit();
	                   }
	                 }
	             });
	 
	}else{
 	$.ajax({
                 url: '${base}/operate/checkTime',
                 type: 'post',
                 datatype: 'text',
                 data: $('#infoForm2').serialize(),
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
                   $('#infoForm2').submit();
                   }
                 }
             });
}
   }
    
    	</script>
</body>
</html>