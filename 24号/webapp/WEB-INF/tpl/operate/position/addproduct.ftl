<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>新增确认</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script type="text/javascript" src="${base}/resource/js/ajaxfileupload.js"></script>
</head>
<body>
	<div class="ui-info-box">
        <div class="ui-crumbs" id="crumbs">
        	 <#include "/common/include/power.ftl">
        </div>
        <div class="ui-info-main">
        <form id="infoForm1" method="post" action="${base}/operate/findPositionAddInfo">
            <div class="ui-informate">
             	<div class="ui-informate-base ui-channel-baseinfor">
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">展示位:</label>
                       <span class="ui-base-data">
						<select name="posId" class="ui-combobox easyui-validatebox" required="true" missingMessage="请输入展示位" id="posId">
							<option value="">请选择</option>
							  <#list pList as item>
	                        <option value="${item.posId}">${item.posName}</option>
	                        </#list>
                        </select>
                       </span>
                       
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">展示内容类型:</label>
                        <span class="ui-base-data">
							<select name="contentType" class="ui-combobox easyui-validatebox"  id="contentType" required="true" missingMessage="请输入展示内容类型">
								<option value="0" select>请选择</option>
								<option value="10">广告推广</option>
								<option value="20">标准产品</option>
								<option value="21">专题产品</option>
								<option value="22">促销产品</option>
								<option value="23">限时抢购产品</option>
								<option value="99">其他</option>
							</select>
                        </span>
                        
                    </div>
                     <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">展示内容:</label>
                        <span class="ui-base-data">
                           <input type="button" value="选择" class="ui-btn-blue" id="relateProduce"/>
                        </span>
                   		<span class="showMessage"></span>
                    </div>
                     <!--关联产品数据填充-->
                   <div id="relateBox"></div>
                          <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">排序:</label>
                        <span class="ui-base-data">
                            <input class="clause-input ui-channel-inforspan easyui-validatebox  ui-cover" maxlength=5 onKeyUp="this.value=this.value.replace(/\D/g,'') " onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" name="sortCode" data-options="required:true,validType:['numLetChina','maxlen[5]']" missingMessage="请输入排序码"/>
                        </span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">展示位图片:</label>
                        <span class="ui-base-data ui-relative">
                            <div class="ui-info-item ui-client-upload-item">
                             <img src="" class="addimg" width="120" height="120" data-leve="no" />
                                <div class="ui-relative ui-clinet-upload">
                                  <input type="button" class="ui-file-link" value="点击上传">
                                  <input type="file" name="insuranceTerms" class="file-wrap" id="prodimg-file"  onchange="uploadImg('prodimg-file','${base}/product/fileUpload','product');" style="left:1px;width:70px;height:30px;margin-top:-10px;cursor:pointer;">
                                   <input type="hidden" id="posLogo" name="posLogo" />
                                </div>  
                            </div>
                        </span>
                        </div>
                        <span class="showMessage2"></span>
                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">开始时间:</label>
                        <span class="ui-base-data">
                            <input class="easyui-datetimebox" style="width:300px" data-options="editable:false" name="effTimestr" id="startdatetimebox">
                        </span> 
                        <span class="showMessage"></span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">结束时间:</label>
                        <span class="ui-base-data">
                            <input class="easyui-datetimebox" style="width:300px" data-options="editable:false" name="expTimestr" id="datetimeboxEnd" validType="mdMs['#startdatetimebox']">
                        </span>
                        <span class="showMessage"></span> 
                    </div>   
                    <div class="ui-btn-double">
                    	 <input type="button" value="下一步" onclick="checkTime(this)" class="ui-btn-blue" />
	                    <input type="button" value="取消"  class="ui-btn-grey ui-back"/>
                    </div>
                </div>	
         	</div>
         	</form>
    	</div>
      <!--选择弹出框start-->
         <div id="dlgList" class="easyui-dialog ui-dlg-alert ui-select-bigbox"  data-options="iconCls:'icon-save',modal:true,closed: true">
            <iframe src="" frameborder="0" width="100%" height='100%' id="newLoadPage"></iframe>
        </div>


        <!--选择弹出框end-->
	</div>

	<script>
	var selectid='';
	var values=document.getElementById("contentType");
    $(function(){
        validExtend();
        //下拉框联动
        $("#posId").on("change",function(){
        	var text = $(this).find("option:selected").text();

        	if(text.indexOf("限时抢购位") != (-1) ){
        		
        		$("#contentType").find("option").prop("selected");
        		$("#contentType").find("option").eq(5).prop("selected","selected");
				$("#contentType").attr("disabled","false");
        	}else{
        		$("#contentType").removeAttr("disabled");
        		$("#contentType").find("option").eq(0).prop("selected","selected");
        	}
        	$("#relateBox").html("");
        });
        //点击选择显示弹框加上数据
        $("#relateProduce").click(function(event) {
            showAlert("dlgList");
            $("#newLoadPage").attr("src",'${base}/operate/positionSelsetBytype?ids='+values.value);
                 
        })
		//点击下一步
		var  timestart = $("#startdatetimebox"),
	      	  timeend = $("#datetimeboxEnd"),
	      	  produceitem = $("#relateProduce"),
	      	  targets = $(".showMessage"),
	      	  producecon = $("#relateBox").text();
 		$('.ui-submit').click(function(){
	      var f=$(this).parents('form'),
	      	  timestartval = timestart.datebox('getValue'),
	      	  timeendval = timeend.datebox('getValue'),
	      	  produceval = $("#relateBox").text(),
	      	  strstart = '',strend ='',strcon = '',
	      	  istimes = true,istimee = true,iscontent = true;
			
		
			if(timestartval == ''){
				strstart = "请输入开始时间";
				istimes = false;
			}
			if(timeendval == ''){
				strend = "请选择结束时间";
				istimee = false;
			}
			
			if(produceval == ""){
				strcon = "请选择展示内容",
				iscontent = false;
			}
			targets.eq(0).text(strcon);
			targets.eq(1).text(strstart);
			targets.eq(2).text(strend);

	      if(f.form('validate') && istimes && istimee && iscontent){
	       	    f.submit();
	      }else{
	      	return false;
	   
	      }
	     
	    });
	    
   });
     $('#datetimeboxEnd').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
     $('#startdatetimebox').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
    
    
      function getDataItem(str){
      document.getElementById('relateBox').innerHTML="" ;
           $.ajax({
	             url: '${base}/operate/findSpecialSelectProduct?ids='+str,
	             type: 'post',
	             datatype: 'text',
	             success: function (result) {
		             if(!result || result.length == 0){
		             	return false;
		             }
		          	var target =$("#relateBox");
		          	var htm = '';
		          	
		          	for(var i=0; i<result.length; i++){
		          	var sourname="未知";
		          	var maxq=result[i].maxQuantity;
		          	if(result[i].productSource == 1){
		          		sourname="自研";
		          	}else{
		          	    sourname="保险公司";
		          	}
		          	if(result[i].maxQuantity == -1){
		          		maxq="不限";
		          	}
		          	var min=(result[i].minPremium/100).toFixed(2);
		          	var max=(result[i].maxPremium/100).toFixed(2);
		          	var tot=min+"-"+max;
		          	if(min==max){
		          		tot=min;
		          	}
	          		var data = '<div class="relate-box">'+
	                        '<table class="relate-produce-table">'+
	                      '<tr>'+
	                        '<th class="relate-item-style">产品ID</th>'+
	                        '<th class="relate-item-style">保险名称</th>'+
	                        '<th class="relate-item-style">保险公司</th>'+
	                        '<th class="relate-item-style">产品总量</th>'+
	                        '<th class="relate-item-style">保费金额(元)</th>'+
	                        '<th class="relate-item-style">保险类别</th>'+
	                        '<th class="relate-item-style">来源</th>'+
	                      '</tr>'+
	                      '<tr>'+
	                        '<td class="ui-channel-titcolor relate-item-text relate-item-textcurr">'+result[i].productId+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+result[i].productName+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+result[i].insurerName+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+maxq+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+tot+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+result[i].className+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+sourname+'</td>'+
	                        '<input  type="hidden" name="productId" value="'+result[i].productId+'"/>'+
	                      '</tr>'+
	                    '</table>'+
	                    '</div>';
			          	htm += data;
			          }
		          	
	          		target.append(htm);
	              }
       		});
        
      }
      
      function getMarkDataItem(str){
      document.getElementById('relateBox').innerHTML="" ;
           $.ajax({
	             url: '${base}/operate/findMarkSelectProduct?ids='+str,
	             type: 'post',
	             datatype: 'text',
	             success: function (result) {
		             if(!result || result.length == 0){
		             	return false;
		             }
		          	var target =$("#relateBox");
		          	var htm = '';
		          	
		          	for(var i=0; i<result.length; i++){
		          	var status="未知";
		          	if(result[i].domainStatus == 1){
		          		status="促销未开始";
		          	}else if(result[i].domainStatus == 2){
		          		status="促销中";
		          	}else if(result[i].domainStatus == 3){
		          		status="促销已结束";
		          	}
		          	var min=(result[i].minPremium/100).toFixed(2);
		          	var max=(result[i].maxPremium/100).toFixed(2);
		          	var tot=min+"-"+max;
		          	if(min==max){
		          		tot=min;
		          	}
	          		var data = '<div class="relate-box">'+
	                        '<table class="relate-produce-table">'+
	                      '<tr>'+
	                        '<th class="relate-item-style">促销策略ID</th>'+
	                        '<th class="relate-item-style">保险名称</th>'+
	                        '<th class="relate-item-style">保费金额(元)</th>'+
	                        '<th class="relate-item-style">折扣比例</th>'+
	                        '<th class="relate-item-style">促销状态</th>'+
	                        '<th class="relate-item-style">促销开始时间</th>'+
	                        '<th class="relate-item-style">促销结束时间</th>'+
	                      '</tr>'+
	                      '<tr>'+
	                        '<td class="ui-channel-titcolor relate-item-text relate-item-textcurr">'+result[i].priceId+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+result[i].productName+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+tot+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+result[i].discountRate+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+status+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+formatTimestamp(result[i].effTime)+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+formatTimestamp(result[i].expTime)+'</td>'+
	                         '<input  type="hidden" name="priceId" value="'+result[i].priceId+'"/>'+
	                           '<input  type="hidden" name="productId" value="'+result[i].productId+'"/>'+
	                      '</tr>'+
	                    '</table>'+
	                    '</div>';
			          	htm += data;
			          }
		          	
	          		target.append(htm);
	              }
       		});
        
      }
      
      
       function getSpecialDataItem(str){
      document.getElementById('relateBox').innerHTML="" ;
           $.ajax({
	             url: '${base}/operate/findSpecialSelect?ids='+str,
	             type: 'post',
	             datatype: 'text',
	             success: function (result) {
		             if(!result || result.length == 0){
		             	return false;
		             }
		          	var target =$("#relateBox");
		          	var htm = '';
		          	
		          	for(var i=0; i<result.length; i++){
		          	var status="未知";
		          	if(result[i].domainStatus == 1){
		          		status="未开始";
		          	}else if(result[i].domainStatus == 2){
		          		status="进行中";
		          	}else if(result[i].domainStatus == 3){
		          		status="已结束";
		          	}
	          		var data = '<div class="relate-box">'+
	                        '<table class="relate-produce-table">'+
	                      '<tr>'+
	                        '<th class="relate-item-style">专题策略ID</th>'+
	                        '<th class="relate-item-style">专题名称</th>'+
	                        '<th class="relate-item-style">促销状态</th>'+
	                        '<th class="relate-item-style">开始时间</th>'+
	                        '<th class="relate-item-style">结束时间</th>'+
	                      '</tr>'+
	                      '<tr>'+
	                        '<td class="ui-channel-titcolor relate-item-text relate-item-textcurr">'+result[i].specialId+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+result[i].specialName+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+status+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+formatTimestamp(result[i].effTime)+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+formatTimestamp(result[i].expTime)+'</td>'+
	                        '<input  type="hidden" name="specialId" value="'+result[i].specialId+'"/>'+
	                      '</tr>'+
	                    '</table>'+
	                    '</div>';
			          	htm += data;
			          }
		          	
	          		target.append(htm);
	              }
       		});
        
      }
      
      
      
      
      function getFalshDataItem(str){
      document.getElementById('relateBox').innerHTML="" ;
           $.ajax({
	             url: '${base}/operate/findFalshSelectProduct?ids='+str,
	             type: 'post',
	             datatype: 'text',
	             success: function (result) {
		             if(!result || result.length == 0){
		             	return false;
		             }
		          	var target =$("#relateBox");
		          	var htm = '';
		          	
		          	for(var i=0; i<result.length; i++){
		          	var status="未知";
		          	if(result[i].domainStatus == 1){
		          		status="抢购未开始";
		          	}else if(result[i].domainStatus == 2){
		          		status="抢购中";
		          	}else if(result[i].domainStatus == 3){
		          		status="抢购已结束";
		          	}
		          	
		          	var min=(result[i].minPremium/100).toFixed(2);
		          	var max=(result[i].maxPremium/100).toFixed(2);
		          	var tot=min+"-"+max;
		          	if(min==max){
		          		tot=min;
		          	}
	          		var data = '<div class="relate-box">'+
	                        '<table class="relate-produce-table">'+
	                      '<tr>'+
	                        '<th class="relate-item-style">抢购策略ID</th>'+
	                        '<th class="relate-item-style">保险名称</th>'+
	                        '<th class="relate-item-style">保费金额(元)</th>'+
	                        '<th class="relate-item-style">折扣比例</th>'+
	                        '<th class="relate-item-style">抢购状态</th>'+
	                        '<th class="relate-item-style">开始时间</th>'+
	                        '<th class="relate-item-style">结束时间</th>'+
	                      '</tr>'+
	                      '<tr>'+
	                        '<td class="ui-channel-titcolor relate-item-text relate-item-textcurr">'+result[i].specialId+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+result[i].productName+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+tot+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+result[i].discountRate+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+status+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+formatTimestamp(result[i].effTime)+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+formatTimestamp(result[i].expTime)+'</td>'+
	                         '<input  type="hidden" name="specialId" value="'+result[i].specialId+'"/>'+
	                           '<input  type="hidden" name="productId" value="'+result[i].productId+'"/>'+
	                      '</tr>'+
	                    '</table>'+
	                    '</div>';
			          	htm += data;
			          }
		          	
	          		target.append(htm);
	              }
       		});
        
      }
      
      
      
        function checkTime(obj){
        var  timestart = $("#startdatetimebox"),
	      	  timeend = $("#datetimeboxEnd"),
	      	  produceitem = $("#relateProduce"),
	      	  targets = $(".showMessage"),
	      	  producecon = $("#relateBox").text();
         validExtend();
       var f=$(obj).parents('form'),
    timestartval = timestart.datebox('getValue'),
	      	  timeendval = timeend.datebox('getValue'),
	      	  produceval = $("#relateBox").text(),
	      	  strstart = '',strend ='',strcon = '',
	      	  istimes = true,istimee = true,iscontent = true;
			
		
			if(timestartval == ''){
				strstart = "请输入开始时间";
				istimes = false;
			}
			if(timeendval == ''){
				strend = "请选择结束时间";
				istimee = false;
			}
			
			if(produceval == ""){
				strcon = "请选择展示内容",
				iscontent = false;
			}
			targets.eq(0).text(strcon);
			targets.eq(1).text(strstart);
			targets.eq(2).text(strend);
			
			if(f.form('validate') && istimes && istimee && iscontent){
	       	   
	       	   $.ajax({
                 url: '${base}/operate/checkCrossTime',
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
	         
	       	  return false;
	   
	      }
			
	 
   }
      
      
      
      
    </script>
</body>
</html>