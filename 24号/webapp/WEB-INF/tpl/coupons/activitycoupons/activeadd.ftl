<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>优惠券活动新增</title>
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
        <div class="ui-info-main">
        <form id="infoForm1" method="post" action="${base}/coupons/couponsaddInfo"  >
            <div class="ui-informate">
             	<div class="ui-informate-base ui-channel-baseinfor">
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">活动名称:</label>
                        <span class="ui-base-data">
                            <input class="clause-input ui-channel-inforspan easyui-validatebox  ui-cover" maxlength=128 type="text" name="promotionName" data-options="required:true,validType:['numLetChina']" missingMessage="请输入活动名称"/>
                        </span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">活动介绍:</label>
                        <span class="ui-base-data">
                            <input class="clause-input ui-channel-inforspan easyui-validatebox  ui-cover" maxlength=1024 type="text" name="promotionIntro"  data-options="validType:['numLetChina']" missingMessage="请输入活动介绍" placeholder="选填"/>
                        </span>
                    </div>                  
                      <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">活动配图:</label>
                        <span class="ui-base-data ui-relative">
                            <div class="ui-info-item ui-client-upload-item">
                            <img src="" class="addimg" width="120" height="120" data-leve="no" />
                                <div class="ui-relative ui-clinet-upload">
                                   
                                  <input type="button" class="ui-file-link" value="点击上传">
                                  <input type="file" name="insuranceTerms" class="file-wrap" id="prodimg-file"  onchange="uploadImg('prodimg-file','${base}/product/fileUpload','product');" style="left:1px;width:70px;height:30px;margin-top:-10px;cursor:pointer;">
                                  <input type="text" class="easyui-validatebox ui-unvisib" data-options="required:true" missingmessage="请选择"  id="promotionLogo" name="promotionLogo" />
                                </div>  
                            </div>
                        </span>
                        <span class="showMessage2"></span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">活动适用渠道:</label>
                        <span class="ui-base-data">
                         <#list channelTemp as item>
                         	<input type="checkbox" name="promotionChannels" value="${item.code}" class="search-radioitem"/>${item.domainame}
                         </#list>
                          <input type="text" class="easyui-validatebox ui-unvisib" data-options="required:true" missingmessage="请至少选择一个" id="activeChannel"/>
                        </span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">活动时间:</label>
                        <span class="ui-base-data">
                            <input class="easyui-datetimebox  date-timestart" data-options="editable:false" name="effTimestr" id="startdatetimebox" required="true"> 至 
                            <input class="easyui-datetimebox date-timeend" data-options="editable:false" name="expTimestr" id="datetimeboxEnd" validType="mdMs['#startdatetimebox']" required="true">
                        </span>
                    </div>  
                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">活动产品:</label>
                        <span class="ui-base-data">
                           <input type="button" value="点击选择" class="ui-btn-blue" id="relateProduce" style="font-weight:normal"/>
                        </span>
                        <input type="text" class="easyui-validatebox ui-unvisib" data-options="required:true" missingmessage="请选择活动产品" id="activeProduce"/>
                             
                    </div>
                   <!--关联产品数据填充-->
                   <div id="relateBox" class="ui-paddingl28"></div>
                   <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">优惠券:</label>
                        <span class="ui-base-data">
                           <input type="button" value="点击选择" class="ui-btn-blue" id="couponSele" style="font-weight:normal"/>
                        </span>
                        <input type="text" class="easyui-validatebox ui-unvisib" data-options="required:true" missingmessage="请选择优惠券" id="activeCoupon"/>    
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
			var checked = $(".search-radioitem:checked").length,str='';
			if(checked > 0){
				str='1';
			}
			$("#activeChannel").val(str);
		})

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
			
	      if(f.form('validate')){
	       	    f.submit();
	      }else{
	      	return false;
	   
	      }
	     
	    });
	   
	     
   });
     

      
     function getDataItem2(str){
       var pid=0;
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
		          	var htm = '';
		          	
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
 ' <label class="ui-info-lbl redrule-item-label">优惠券领用时间:</label>'+
 ' <span class="ui-base-data">'+
   ' <input class="date-timestart datebox-starttime" data-options="editable:false"  name="domainCoupondsMap['+result[i].couponId+'].getEffDateStr" id="startActiveTime">至<input class="date-timeend datebox-endtime" data-options="editable:false" name="domainCoupondsMap['+result[i].couponId+'].getExpDateStr" id="endActiveTime">'+
  '</span>'+
'</div>'+
'<div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">'+
  '<label class="ui-info-lbl redrule-item-label">优惠券使用时间:</label>'+
 ' <span>自领用后<input  name="domainCoupondsMap['+result[i].couponId+'].periodValue" type="text" value="" maxlength="9" class="easyui-validatebox ui-info-sinput ui-marginr6" data-options="required:true" missingMessage="请输入" onkeyup="clearNoNum(this);"/>'+  
 ' </span>'+
  '<select class="ui-info-sel couponUserCondite" name="domainCoupondsMap['+result[i].couponId+'].periodType" style="width:110px;">    '+              
      '<option value="0" slected>不限</option>'+
      '<option value="1">天</option>'+
      '<option value="2">周</option>'+
      '<option value="3">月</option>'+
      '<option value="4">年</option>'+
      '<option value="10">指定日期</option>'+
  '</select>'+
  '<span class="predifind-times">'+
    '<input class="date-timestart predifind-starttime" data-options="editable:false" name="domainCoupondsMap['+result[i].couponId+'].effdateStr" id="startActiveTimes1">至<input class="date-timeend predifind-endtime" data-options="editable:false"  name="domainCoupondsMap['+result[i].couponId+'].expdateStr" id="endActiveTimes2">'+
 ' </span>'+

'</div>'+
        '<div class="ui-base-colsinfor ui-base-colwidth-business">'+
                '<span class="ui-base-data">'+
                '<input  type="hidden" name="domainCoupondsMap['+result[i].couponId+'].couponId" value="'+result[i].couponId+'"/>'+
                '</span><input type="button" value="删除" class="ui-btn-blue ui-opera-delete" onclick="deletecou('+result[i].couponId+','+result.length+')"/> '+
            '</div>'+
        '</div>';
		          	htm += data;
		          }
	          	
          		target.append(htm);
          		couponConfig();
				$("#activeCoupon").val("true");
              }
   		});
    
  }  
      
      
      
      
    function couponConfig(){
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
          $custedata = $(this).next(),
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
            $overiptcheck.val('').removeAttr('readOnly');
           
            $overiptcheck.validatebox({    
              required: true
            });  
            //$datetimebox.find(".predifind-starttime").datetimebox({required: false});
        	//$datetimebox.find(".predifind-endtime").datetimebox({required: false, validType:"mdMs['#startActiveTime1']"});  
			 $custedata.hide();
          }

        })
        var seles = $(".couponUserCondite");
       $.each(seles,function(){
       	$(this).find('option').eq(0).trigger('change');
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
					$("#activeProduce").val("true");
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
    </script>
</body>
</html>