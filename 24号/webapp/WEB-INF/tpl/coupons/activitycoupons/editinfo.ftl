<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>优惠券活动编辑</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script type="text/javascript" src="${base}/resource/js/ajaxfileupload.js"></script>
	<script src="${base}/resource/js/handlebars-v4.0.5.js"></script>
</head>
<body>
	<div class="ui-info-box">
        <div class="ui-crumbs" id="crumbs">
        	 <#include "/common/include/power.ftl">
        </div>
        
        <div class="ui-info-main" id="specialdivblock">
            <ul class="ui-info-list">
             	 <li class="ui-info-item ui-info-item-grey">
                        <label class="ui-info-lbl">活动名称:</label>
                      	  ${promotionsPo.promotionName}
                   <input  id="hiddpid" name="pid" type="hidden" value="${pid}"/> 
                   <input  id="hiddcid" name="pid" type="hidden" value="${cid}"/> 
                   <input  id="hiddpromotionid" name="pid" type="hidden" value="${promotionsPo.promotionId}"/> 
                   </li>
                    <li class="ui-info-item ui-info-item-grey">
                        <label class="ui-info-lbl">活动介绍:</label>
                      	  ${promotionsPo.promotionIntro}
                   </li>
                   
                   <li class="ui-info-item ui-info-item-grey">
                        <label class="ui-info-lbl">活动配图:</label>
                      	  <img src="${base}${promotionsPo.promotionLogo}" width="120" height="120"/>
                   </li>
                   
                    <li class="ui-info-item ui-info-item-grey">
                        <label class="ui-info-lbl">活动适用渠道:</label>
                        <#list channelTemp as item>
                    <input type="checkbox" disabled  <#if item.domainsts==1>checked="checked"</#if> value="${item.code}" class="search-radioitem"/>${item.domainame}
                  </#list>
                   </li>
                   
                   
                   <li class="ui-info-item ui-info-item-grey">
                        <label class="ui-info-lbl">活动配图:</label>
                      	  ${promotionsPo.effTimestr}至${promotionsPo.expTimestr}
                   </li>
                    
                    </ul>
                    <h2 class="ui-info-tit">活动产品</h2>
                    <#list pList as item>
       			 <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">产品ID</label>
         		  ${item.productId}
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
                   <!--关联产品数据填充-->
                  <h2 class="ui-info-tit">优惠劵</h2>
                    <#list couponsList as item>
                     <ul class="ui-info-list">
                     <li class="ui-info-item ui-info-item-grey">
                        <label class="ui-info-lbl">优惠券编号</label>
	         		  <a class="operation-link" href="${base}/coupons/toEditCoupons?couponId=${item.couponId}"><font color="#00F">${item.couponId}</font></a>
	         	  
	         	  
	         	    <label class="ui-info-lbl">优惠券名称</label>
	         			${item.couponName}
	         	    <label class="ui-info-lbl">优惠方式</label>
	         		 <#if item.couponType==1>折扣<#else>金额</#if>
	         	    <label class="ui-info-lbl">优惠值</label>
	         		   <#if item.couponType==1>${item.couponValue/100}%<#else>${item.couponValue/100}</#if>
                  </li>
        </ul> 
        <ul class="ui-info-list">
                     <li class="ui-info-item ui-info-item-grey">
                        <label class="ui-info-lbl">优惠券领用时间:</label>
                        ${item.getEffDateStr}至${item.getExpDateStr}
                    </li>
                     <li class="ui-info-item ui-info-item-grey">
                        <label class="ui-info-lbl">优惠券使用时间:</label>
                        <#if item.periodType==0>不限</#if>
		         		<#if item.periodType==1>${item.periodValue}天</#if>
		         		<#if item.periodType==2>${item.periodValue}周</#if>
		         		<#if item.periodType==3>${item.periodValue}月</#if>
		         		<#if item.periodType==4>${item.periodValue}年</#if>
		         		<#if item.periodType==10>
         		 ${item.effdateStr}至 ${item.expdateStr}</#if>
                     </li>  
                     
                     <li class="ui-info-item ui-info-item-grey">
                    	   该优惠券共 <a class="operation-link" href="${base}/coupons/findCouponDetail?couponId=${item.couponId}&promotionId=${promotionsPo.promotionId}"><font color="#00F"> ${item.allcount}</font></a> 张，已被领取  <a class="operation-link" href="${base}/coupons/findCouponDetail?couponId=${item.couponId}&promotionId=${promotionsPo.promotionId}"><font color="#00F"> ${item.rececount}</font></a> 张
                    	   ，已使用 <a class="operation-link" href="${base}/coupons/findCouponDetail?couponId=${item.couponId}&promotionId=${promotionsPo.promotionId}"><font color="#00F"> ${item.usecount}</font></a> 张                         
                 
                		 <a href="javascript:downExcel(${item.couponId});" class="ui-btn-blue">导出优惠券码</a>
                    </li>
                     
                      </ul>   
                    </#list>
                   <!--关联产品数据填充-->
                   
                    <div class="ui-btn-double">
                    	<input type="button" value="编辑" onclick="editpuduct()" class="ui-btn-blue"  />
	                    <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
                    </div>

                </div>	
         	</div>
    	</div>
        
        
        
        <div class="ui-info-main" id="specialdivnone" style="display:none">
        <form id="infoForm1" method="post" action="${base}/coupons/couponseditInfo">
            <div class="ui-informate">
             	<div class="ui-informate-base ui-channel-baseinfor">
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">活动名称:</label>
                        <span class="ui-base-data">
                          <input type="hidden" name="promotionId" value ="${promotionsPo.promotionId}"/>
                            <input class="clause-input ui-channel-inforspan easyui-validatebox  ui-cover" maxlength=128 type="text" name="promotionName" value ="${promotionsPo.promotionName}" data-options="required:true,validType:['numLetChina']" missingMessage="请输入活动名称"/>
                        </span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">活动介绍:</label>
                        <span class="ui-base-data">
                            <input class="clause-input ui-channel-inforspan easyui-validatebox  ui-cover" maxlength=1024 type="text" name="promotionIntro"  value="${promotionsPo.promotionIntro}" data-options="validType:['numLetChina']" missingMessage="请输入活动介绍" placeholder="选填"/>
                        </span>
                    </div>       
                    
                    
                     <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">活动配图:</label>
						<img src="${base}${promotionsPo.promotionLogo}" width="120" height="120" id="produceMap"/>
                        <span class="ui-base-data ui-relative">
                            <div class="ui-info-item ui-client-upload-item">
                                <div class="ui-relative ui-clinet-upload">
                                  <input type="button" class="ui-file-link" value="重新上传">
                                  <input type="file" name="insuranceTerms" class="file-wrap" id="prodimg-file"  onchange="uploadImg('prodimg-file','${base}/product/fileUpload','product');" style="left:1px;width:70px;height:30px;margin-top:-10px;cursor:pointer;">
                                   <input type="hidden" id="promotionLogo" name="promotionLogo" value="${promotionsPo.promotionLogo}"/>
                                </div>  
                            </div>
                        </span>
                        <span class="showMessage2"></span>
                    </div>
                      
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">活动适用渠道:</label>
                        <span class="ui-base-data">
                          <#list channelTemp as item>
                   			 <input type="checkbox"  name="promotionChannels" <#if item.domainsts==1>checked="checked"</#if> value="${item.code}" class="search-radioitem  search-radioitem-editor"/>${item.domainame}
                   			
                 		 </#list>
                 		  <input type="text" class="easyui-validatebox ui-unvisib" data-options="required:true" missingmessage="请至少选择一个" id="activeChannel"/>
                        </span>
                    </div>
                    
                    
                     <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">活动时间:</label>
                        <span class="ui-base-data">
                            <input class="easyui-datetimebox" style="width:300px" data-options="editable:false" name="effTimestr" id="startdatetimebox" value="${promotionsPo.effTime?string('yyyy-MM-dd HH:mm:ss')}"/>
                        </span> 至
                        <span class="ui-base-data">
                            <input class="easyui-datetimebox" style="width:300px" data-options="editable:false" name="expTimestr" value="${promotionsPo.expTime?string('yyyy-MM-dd HH:mm:ss')}" id="datetimeboxEnd" validType="mdMs['#startdatetimebox']"/>
                        </span>      
                    </div>
                    
                    
                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">活动产品:</label>
                        <span class="ui-base-data">
                           <input type="button" value="点击选择" class="ui-btn-blue" id="relateProduce" style="font-weight:normal"/>
                        </span>
                         
                    </div>
                   <!--关联产品数据填充-->
                   <div id="relateBox" class="ui-paddingl28"></div>
                   <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">优惠券:</label>
                        <span class="ui-base-data">
                        	<input type="hidden" id="couponCount" value="0"/>
                           <input type="button" value="点击选择" class="ui-btn-blue" id="couponSele" style="font-weight:normal"/>
                        </span>  
                        
                    </div>
                   <!--关联产品数据填充-->
                   <div id="couponTempShow" class="ui-paddingl28"></div>
                    <div class="ui-btn-double">
                    	<input type="submit" value="下一步" class="ui-btn-blue" id="conponSubmit" />
	                    <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
                    </div>

                </div>	
         	</div>
         	</form>
    	</div>
      <!--选择弹出框start-->
         <div id="dlgList" class="easyui-dialog ui-dlg-alert ui-select-bigbox"  data-options="iconCls:'icon-save',modal:true,closed: true">
            <iframe src="" frameborder="0" width="100%" height='100%' id="newLoadPage"></iframe>
        </div>
      <div id="dlgCoupon" class="easyui-dialog ui-dlg-alert ui-select-bigbox"  data-options="iconCls:'icon-save',modal:true,closed: true">
            <iframe src="" frameborder="0" width="100%" height='100%' id="newCouponPage"></iframe>
        </div>

        <!--选择弹出框end-->
	</div>
	
	 <div id="dlgProduce" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">确定删除该关联产品吗？</h3>
    <input type="button" class="ui-dlgOk-btn" onclick="submitselect()" value="确定"/>
    <input type="button" class="ui-dlgCancel-btn" value="取消"/>
    <input  type="hidden" name="issueType"   id="issueType"/>
  </div>     
  <div id="dlgm" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">不允许删除全部关联产品！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="closecon()" value="确定"/>
  </div> 
  
  
   <div id="dlgProducecou" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">确定删除该关联优惠劵吗？</h3>
    <input type="button" class="ui-dlgOk-btn" onclick="submitselectcou()" value="确定"/>
    <input type="button" class="ui-dlgCancel-btn" value="取消"/>
    <input  type="hidden" name="issueType"   id="issueType"/>
  </div>     
  <div id="dlgmcou" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">不允许删除全部优惠劵！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="closeconcou()" value="确定"/>
  </div> 
  
<script type="text/x-handlebars-template" id="couponConfig">
<!--优惠券start-->  
   

<!--优惠券end--> 
</script>
	<script>
	var selectid='';
	var selectidcou='';
    $(function(){
        validExtend();
        
        $(".search-radioitem").click(function(){
			var chks = $(".search-radioitem-editor"),str='',len=0;
			$.each(chks,function(i,v){
				if(v.checked){
					len +=1;
				}
			})
			str = len>0?'1':"";
			$("#activeChannel").val(str);
		})
		var initlen = $(".search-radioitem-editor:checked").length;
		if(initlen > 0){
			$("#activeChannel").val('1');
		}
		
		
        //点击选择显示弹框加上数据
        $("#relateProduce").click(function(event) {
            showAlert("dlgList");
            $("#newLoadPage").attr("src",'${base}/operate/specialnewselect?ids='+selectid);
                  
        })
        $("#couponSele").click(function(event) {
            showAlert("dlgCoupon");
            $("#newCouponPage").attr("src",'${base}/coupons/couponsselect?ids='+selectidcou);     
        })
        
 //$("#couponSele").attr('disabled','disabled');
       
	  //点击下一步
		var  produceitem = $("#relateProduce");
 		$('#conponSubmit').click(function(){
	      var f=$(this).parents('form'),
	      	  produceval = $("#relateBox").text(),
              couponsval = $("#couponTempShow").text(),
	      	  producetarget = produceitem.parent().next(),
	      	  isproduce = true,iscoupon = true,isflag = checkDate(f),str ='',str2='';
			if(produceval == ''){
				str = "请选择活动产品";
				isproduce = false;
		        producetarget.text(str);
		        return false;
			}
	      if(f.form('validate') && isproduce ){
	       			  document.getElementById("infoForm1").submit();
	       	    //f.submit();
	      }else{
	      	return false;
	   
	      }
	     
	    });
	   
	     
   });
     
 function editpuduct(){
	  document.getElementById('specialdivblock').style.display = "none";
	  document.getElementById('specialdivnone').style.display = "block";
	  var str= document.getElementById("hiddpid").value;
	  var cstr= document.getElementById("hiddcid").value;
	  if(str.length>0){
	  getDataItem(str);
	}
	 if(cstr.length>0){
	  getDataItem2(cstr);
	}
	}
      
     function getDataItem2(str){
        var pid= document.getElementById("hiddpromotionid").value;
     	 selectidcou+=str+",";
           $.ajax({
	             url: '${base}/coupons/findSelectcoupons?ids='+str+'&pid='+pid,
	             type: 'post',
	             datatype: 'text',
	             success: function (result) {
		             if(!result || result.length == 0){
		             	return false;
		             }
		          	var target =$("#couponTempShow");
		          	var currcount;
		          	var htm = '',changearrs = [];
		          	
		          	for(var i=0; i<result.length; i++){
		          	var coupontype="未知";
		          	var couponvalue="";
		          	if(result[i].couponType == 1){
		          		coupontype="折扣";
		          		couponvalue=result[i].couponValue/100+"%";
		          	}else{
		          	    coupontype="金额";
		          	    couponvalue=result[i].couponValue/100;
		          	}
		          	var geteffdate=formatTimestamp(result[i].getEffDate);
		          	var getexpdate=formatTimestamp(result[i].getExpDate);
		          	var effdate=formatTimestamp(result[i].effDate);
		          	var expdate=formatTimestamp(result[i].expDate);
		          	var periodType = '';
		          	periodType += '<select class="ui-info-sel couponUserCondite" name="domainCoupondsMap['+result[i].couponId+'].periodType" style="width:110px;">    ';             
				      if(result[i].periodType==0){
				      	periodType += '<option selected value="0">不限</option>';
				      	periodType += '<option   value="1">天</option>';
				      	periodType += '<option   value="2">周</option>';
				      	periodType += '<option   value="3">月</option>';
				      	periodType += '<option   value="4">年</option>';
				      	periodType += '<option   value="10">指定日期</option>';
				      	changearrs[i] = 0;
				      }if(result[i].periodType==1){
				      	periodType += '<option  value="0">不限</option>';
				      	periodType += '<option  selected value="1">天</option>';
				      	periodType += '<option   value="2">周</option>';
				      	periodType += '<option   value="3">月</option>';
				      	periodType += '<option   value="4">年</option>';
				      	periodType += '<option   value="10">指定日期</option>';
				      	changearrs[i] = 1;
				      } if(result[i].periodType==2){
				      	periodType += '<option  value="0">不限</option>';
				      	periodType += '<option   value="1">天</option>';
				      	periodType += '<option  selected value="2">周</option>';
				      	periodType += '<option   value="3">月</option>';
				      	periodType += '<option   value="4">年</option>';
				      	periodType += '<option   value="10">指定日期</option>';
				      	changearrs[i] = 2;
				      } 
				      if(result[i].periodType==3){
				      	periodType += '<option  value="0">不限</option>';
				      	periodType += '<option   value="1">天</option>';
				      	periodType += '<option   value="2">周</option>';
				      	periodType += '<option  selected value="3">月</option>';
				      	periodType += '<option   value="4">年</option>';
				      	periodType += '<option   value="10">指定日期</option>';
				      	changearrs[i] = 3;
				      } 
				      if(result[i].periodType==4){
				      	periodType += '<option  value="0">不限</option>';
				      	periodType += '<option   value="1">天</option>';
				      	periodType += '<option   value="2">周</option>';
				      	periodType += '<option   value="3">月</option>';
				      	periodType += '<option  selected value="4">年</option>';
				      	periodType += '<option   value="10">指定日期</option>';
				      	changearrs[i] = 4;
				      } 
				      if(result[i].periodType==10){
				      periodType += '<option  value="0">不限</option>';
				      	periodType += '<option   value="1">天</option>';
				      	periodType += '<option   value="2">周</option>';
				      	periodType += '<option   value="3">月</option>';
				      	periodType += '<option   value="4">年</option>';
				      	periodType += '<option  selected value="10">指定日期</option>';
				      	changearrs[i] = 5;
				      }   
				  periodType +='</select><span class="predifind-times">'+
					    '<input class="date-timestart predifind-starttime" data-options="editable:false" value="'+effdate+'" name="domainCoupondsMap['+result[i].couponId+'].effdateStr" id="startActiveTimes1">至<input class="date-timeend predifind-endtime" data-options="editable:false" value="'+expdate+'" name="domainCoupondsMap['+result[i].couponId+'].expdateStr" id="endActiveTimes2">'+
					 ' </span>';
	          		var data = '<div class="relate-box">'+
	                        '<table class="relate-produce-table">'+
	                      '<tr>'+
	                        '<th class="relate-item-style">优惠券编号</th>'+
	                        '<th class="relate-item-style">优惠券名称</th>'+
	                        '<th class="relate-item-style">优惠券方式</th>'+
	                        '<th class="relate-item-style">优惠值</th>'+
	                      '</tr>'+
	                      '<tr>'+
	                        '<td class="ui-channel-titcolor relate-item-text relate-item-textcurr">'+result[i].couponId+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+result[i].couponName+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+coupontype+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+couponvalue+'</td>'+
	                      '</tr>'+
	                    '</table>'+	                    
	                   '<div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">'+
                        '<label class="ui-info-lbl redrule-item-label">优惠券领用时间:</label>'+
                        '<span class="ui-base-data">'+
                          '<input   name="domainCoupondsMap['+result[i].couponId+'].couponId" type="hidden" value="'+result[i].couponId+'">'+
                        '<input class="date-timestart1 datebox-starttime"  style="width:300px"  value="'+geteffdate+'"  data-options="editable:false" name="domainCoupondsMap['+result[i].couponId+'].getEffDateStr" id="startdatetimebox'+i+'">'+
                        '</span> 至<span class="ui-base-data">'+
                        '<input class="date-timestart1 datebox-starttime" style="width:300px"   value="'+getexpdate+'"  data-options="editable:false" name="domainCoupondsMap['+result[i].couponId+'].getExpDateStr"  id="datetimeboxEnd'+i+'" >'+
                        '</span>'+     
                    '</div>'+
'<div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">'+
  '<label class="ui-info-lbl redrule-item-label">优惠券使用时间:</label>'+
 ' <span>自领用后<input  name="domainCoupondsMap['+result[i].couponId+'].periodValue" maxlength="9" type="text" value="'+result[i].periodValue+'" class="easyui-validatebox ui-info-sinput ui-marginr6" data-options="required:true" missingMessage="请输入" onkeyup="clearNoNum(this);">'+  
 ' </span>'+periodType+
'</div>'+
'<div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">  该优惠券共     '+result[i].allcount+' 张，已被领取 '+result[i].rececount+' 张，已使用  '+result[i].usecount+' 张 '+ 
 
  '<label class="ui-info-lbl redrule-item-label">新添加优惠券:</label>'+
 ' <span><input  name="domainCoupondsMap['+result[i].couponId+'].couponcount" type="text"  maxlength="9"  class="easyui-validatebox ui-info-sinput ui-marginr6" data-options="required:true" missingMessage="请输入" onkeyup="clearNoNum(this);">'+  
 ' </span>张'+
 
'</div>'+
        '<div class="ui-base-colsinfor ui-base-colwidth-business">'+
                '<span class="ui-base-data">'+
                '</span><input type="button" value="删除" class="ui-btn-blue ui-opera-delete" onclick="deletecou('+result[i].couponId+','+result.length+')"/> '+
            '</div>'+
        '</div>';
		          	htm += data;
		          	
		          	
		          }
          		target.append(htm);
          		currcount = parseInt($("#couponCount").val())+changearrs.length;
          		$("#couponCount").val(currcount);
          		couponConfig(changearrs);
          		
          	
              }
   		});
    
  }  
      
      
      
      
    function couponConfig(arrssub){
        $(".datebox-starttime").datetimebox({        
          required: true
        });
        $(".datebox-endtime").datetimebox({        
          required: true,    
          validType:"mdMs['#startActiveTime']"
        }); 
        
        $(".predifind-starttime").datetimebox({        
          //required: true
        });
        $(".predifind-endtime").datetimebox({        
         //required: true,    
          //validType:"mdMs['#startActiveTime1']"
        }); 
        
        $(".coupone-dynamecheck").validatebox({    
          required: true
        });  
        var $predeipts = $(".coupone-prededate");
        $(".couponUserCondite").on('change',function(){
          var val = $(this).val(),
          $nextipt = $(this).prev(),
          $custedata = $(this).next('.predifind-times'),
          $overiptcheck = $nextipt.find('input'),
          $datetimebox = $(this).next();
          
          if(val == 0){
            $nextipt.show();
            $overiptcheck.val('').attr('readOnly', 'readOnly');
            $overiptcheck.validatebox({    
              required: false
            });  
			 $custedata.hide();
            //$datetimebox.find(".predifind-starttime").datetimebox({});
        	//$datetimebox.find(".predifind-endtime").datetimebox({});  
           

          }else if(val == 10){
            $nextipt.hide();
            $overiptcheck.validatebox({    
              required: false
            });  
            $custedata.show();
           // $datetimebox.find(".predifind-starttime").datetimebox({required: true});
        	//$datetimebox.find(".predifind-endtime").datetimebox({required: true, validType:"mdMs['#startActiveTime1']"});   
            

          }else{
            $nextipt.show();
            $overiptcheck.removeAttr('readOnly');
           
            $overiptcheck.validatebox({    
              required: true
            });  
            //$datetimebox.find(".predifind-starttime").datetimebox({required: false});
        	//$datetimebox.find(".predifind-endtime").datetimebox({required: false, validType:"mdMs['#startActiveTime1']"});  
			 $custedata.hide();
          }

        })
        var seles = $(".couponUserCondite"),
        	addcount = parseInt($("#couponCount").val())-arrssub.length,
        	addindex = 0;
       $.each(seles,function(i,v){
       	if(i >= addcount){
     
       		$(this).find('option').eq(arrssub[addindex]).trigger('change');
       		addindex++;
       	}
       	
       })
       	
       
        $(".generate-coupons").click(function(){
          $(this).next().show();
        })
      }
      
      
       function getDataItem(str){
       var pid=0;
      selectid+=str+",";
           $.ajax({
	             url: '${base}/operate/findupdateSelectProduct?ids='+str+'&pid='+pid,
	             type: 'post',
	             datatype: 'text',
	             success: function (result) {
		             if(!result || result.length == 0){
		             	return false;
		             }
		          	var target =$("#relateBox");
		          	var htm = '';
		          	
		          	for(var i=0; i<result.length; i++){
		          	var maxq=result[i].maxQuantity;
		          	var sourname="未知";
		          	if(result[i].productSource == 1){
		          		sourname="自研";
		          	}else{
		          	    sourname="保险公司";
		          	}
		          	if(result[i].maxQuantity == -1){
		          		maxq="不限";
		          	}
		          	var recommend="";
		            if(result[i].productRecommend == null){
		          	}else{
		          	recommend=result[i].productRecommend;
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
	                        '<td class="ui-channel-titcolor relate-item-text">'+result[i].minPremium/100+'-'+result[i].maxPremium/100+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+result[i].className+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+sourname+'</td>'+
	                      '</tr>'+
	                    '</table>'+
	                    '<div class="ui-base-colsinfor ui-base-colwidth-business">'+
	                            '<span class="ui-base-data">'+
	                            '<input  type="hidden" name="domainProductsMap['+result[i].productId+'].productId" value="'+result[i].productId+'"/>'+
	                            '</span><input type="button" value="删除" class="ui-btn-blue ui-opera-delete" onclick="deleteproduct('+result[i].productId+','+result.length+')"/> '+
	                        '</div>'+
	                    '</div>';
			          	htm += data;
			          }
		          	
	          		target.append(htm);
	          	
	              }
       		});
        
      }
      
      
       var deleteid='';
		  //删除关联产品弹框
	      function deleteproduct(value,obj){
		      var tempde = selectid.split(",");
		      if(tempde.length==2){
		      showAlert("dlgm");
		      return false;
		      }
		      deleteid=value;
		      showAlert("dlgProduce");
	      }
      
      
       //删除关联产品
	      function submitselect(){
		   
		                  var temp =selectid.split(",");
					      var selecttemp='';
					      var strtemp='';
					      console.log(temp);
					       for(var i=0;i<temp.length;i++){
						   if(temp[i]==deleteid){
						   temp.splice(i,1);
						   } 
						   selecttemp+=temp[i]+",";
					       }
					       strtemp = selecttemp.substring(0,selecttemp.length-1);
					       document.getElementById('relateBox').innerHTML="" 
					       getDataItem(strtemp);
					       $("#dlgProduce").dialog("close");
					       selectid=strtemp;
		               
	      }
	      
      //不允许删除全部产品
	      function closecon(){
	        $("#dlgm").dialog("close");
	      }
	      
	      
	      
	        var deleteidcou='';
		  //删除关联产品弹框
	      function deletecou(value,obj){
		      var tempde = selectidcou.split(",");
		      if(tempde.length==2){
		      showAlert("dlgmcou");
		      return false;
		      }
		      deleteidcou=value;
		      showAlert("dlgProducecou");
	      }
      
      
       //删除关联产品
	      function submitselectcou(){
		   
		                  var temp =selectidcou.split(",");
					      var selecttemp='';
					      var strtemp='';
					      console.log(temp);
					       for(var i=0;i<temp.length;i++){
						   if(temp[i]==deleteidcou){
						   temp.splice(i,1);
						   } 
						   selecttemp+=temp[i]+",";
					       }
					       strtemp = selecttemp.substring(0,selecttemp.length-1);
					       document.getElementById('couponTempShow').innerHTML="" 
					       getDataItem2(strtemp);
					       $("#dlgProducecou").dialog("close");
					       selectidcou=strtemp;
		               
	      }
	      
      //不允许删除全部产品
	      function closeconcou(){
	        $("#dlgmcou").dialog("close");
	      }
	      
	   function downExcel(cid) {
        var url= "${base}/coupons/exportExecl?couponId="+cid+"&promotionId=${promotionsPo.promotionId}";
        window.location.href = url;
    }
    </script>
</body>
</html>