<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
        
        <div class="ui-info-main" id="specialdivblock">
            <ul class="ui-info-list">
            <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">展示编号</label>
         		${position.contentId}
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">展示位</label>
         		 <#list pList as item>
				             <#if position.posId == "${item.posId}">${item.posName}</#if>
				             </#list>
         		 <input   name="posId" type="hidden" value="${position.posId}"/> 
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">展示内容类型</label>
 		             	<#if position.contentType == 20>标准产品</#if>
			            <#if position.contentType == 21>专题活动</#if>
			            <#if position.contentType == 22>促销产品</#if>
			            <#if position.contentType == 23>限时抢购产品</#if>
         		 <input id="contentTypevalue"  name="contentType" type="hidden" value="${position.contentType}"/> 
         	</li>  
         	
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">展示内容</label>
         		             <#if position.contentType == 20>
         		              <div class="relate-box">
	                        <table class="relate-produce-table">
	                      <tr>
	                        <th class="relate-item-style">产品ID</th>
	                        <th class="relate-item-style">保险名称</th>
	                        <th class="relate-item-style">保险公司</th>
	                        <th class="relate-item-style">产品总量</th>
	                        <th class="relate-item-style">保费金额(元)</th>
	                        <th class="relate-item-style">保险类别</th>
	                        <th class="relate-item-style">来源</th>
	                      </tr>
	                      <tr>
	                        <td class="ui-channel-titcolor relate-item-text relate-item-textcurr">${product.productId}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${product.productName}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${product.insurerName}</td>
	                        <td class="ui-channel-titcolor relate-item-text"><#if product.maxQuantity==-1>
         		      不限
         		  <#else> ${product.maxQuantity}
         		  </#if></td>
         		   <#if product.minPremium != null&&product.maxPremium != null>
	                        <td class="ui-channel-titcolor relate-item-text">${product.minPremium/100}-${product.maxPremium/100}</td>
	                     
         		  <#else> 
         		    <td class="ui-channel-titcolor relate-item-text">${product.minPremium}-${product.maxPremium}</td>
         		   </#if>
	                        <td class="ui-channel-titcolor relate-item-text">${product.className}</td>
	                        <td class="ui-channel-titcolor relate-item-text"> <#if product.productSource == 1>自研</#if><#if product.productSource == 2>保险公司</#if></td>
	                        <input  type="hidden" id="productId" name="productId" value="${product.productId}"/>
	                      </tr>
	                    </table>
	                    </div>
         		     </#if>
         		     <#if position.contentType == 21>
         		       <#list sList as item>
         		         <div class="relate-box">
	                        <table class="relate-produce-table">
	                      <tr>
	                        <th class="relate-item-style">营销策略ID</th>
	                        <th class="relate-item-style">专题名称</th>
	                        <th class="relate-item-style">促销状态</th>
	                        <th class="relate-item-style">开始时间</th>
	                        <th class="relate-item-style">结束时间</th>
	                      </tr>
	                      <tr>
	                        <td class="ui-channel-titcolor relate-item-text relate-item-textcurr">${item.specialId}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.specialName}</td>
	                        <td class="ui-channel-titcolor relate-item-text"><#if item.domainStatus == 1>未开始</#if><#if item.domainStatus == 2>进行中</#if><#if item.domainStatus == 3>已结束</#if></td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.effTime?string('yyyy-MM-dd HH:mm:ss')}  </td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.expTime?string('yyyy-MM-dd HH:mm:ss')}  </td>
	                        <input  type="hidden" id="specialId" name="specialId" value="${item.specialId}"/>
	                      </tr>
	                    </table>
	                    </div>
         		       </#list>
         		    </#if>
         		     <#if position.contentType == 22>
         		       <#list priceList as item>
         		        <div class="relate-box">
	                        <table class="relate-produce-table">
	                      <tr>
	                        <th class="relate-item-style">促销策略ID</th>
	                        <th class="relate-item-style">保险名称</th>
	                        <th class="relate-item-style">保费金额(元)</th>
	                        <th class="relate-item-style">折扣比例</th>
	                        <th class="relate-item-style">促销状态</th>
	                        <th class="relate-item-style">促销开始时间</th>
	                        <th class="relate-item-style">促销结束时间</th>
	                      </tr>
	                      <tr>
	                        <td class="ui-channel-titcolor relate-item-text relate-item-textcurr">${item.priceId}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.productName}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.minPremium/100}-${item.maxPremium/100}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.discountRate}</td>
	                        <td class="ui-channel-titcolor relate-item-text"><#if item.domainStatus == 1>促销未开始</#if><#if item.domainStatus == 2>促销进行中</#if><#if item.domainStatus == 3>促销已结束</#if></td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.effTime?string('yyyy-MM-dd HH:mm:ss')}  </td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.expTime?string('yyyy-MM-dd HH:mm:ss')}  </td>
	                         <input  type="hidden" id="priceId" name="priceId" value="${item.priceId}"/>
	                      </tr>
	                    </table>
	                    </div>
         		       </#list>
         		    </#if>
         		    
         		     <#if position.contentType == 23>
         		       <#list falshList as item>
         		        <div class="relate-box">
	                        <table class="relate-produce-table">
	                      <tr>
	                        <th class="relate-item-style">抢购策略ID</th>
	                        <th class="relate-item-style">保险名称</th>
	                        <th class="relate-item-style">保费金额(元)</th>
	                        <th class="relate-item-style">折扣比例</th>
	                        <th class="relate-item-style">抢购状态</th>
	                        <th class="relate-item-style">开始时间</th>
	                        <th class="relate-item-style">结束时间</th>
	                      </tr>
	                      <tr>
	                        <td class="ui-channel-titcolor relate-item-text relate-item-textcurr">${item.specialId}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.productName}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.minPremium/100}-${item.maxPremium/100}</td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.discountRate}</td>
	                        <td class="ui-channel-titcolor relate-item-text"><#if item.domainStatus == 1>抢购未开始</#if><#if item.domainStatus == 2>抢购中</#if><#if item.domainStatus == 3>抢购已结束</#if></td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.effTime?string('yyyy-MM-dd HH:mm:ss')}  </td>
	                        <td class="ui-channel-titcolor relate-item-text">${item.expTime?string('yyyy-MM-dd HH:mm:ss')}  </td>
	                         <input  type="hidden" id="falshId" name="priceId" value="${item.specialId}"/>
	                      </tr>
	                    </table>
	                    </div>
         		       </#list>
         		    </#if>
         	</li>
         	  <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">排序</label>
         		${position.sortCode}
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">展示图片</label>
         		<img src="${base}${position.posLogo}" width=120 height=120/>
         	</li>
        <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">开始时间</label>
         		<input   name="effTimestr" type="hidden" value="${position.effTimestr}"/>
         		 ${position.effTimestr}
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         	 <input   name="expTimestr" type="hidden" value="${position.expTimestr}"/>
         		<label class="ui-info-lbl">结束时间</label>
         		 ${position.expTimestr}
         	</li>
         	<div class="ui-btn-double ui-detail-btnposition">
                        <input type="button" onclick="editpuduct()" value="编辑" class="ui-btn-blue" />
	                    <input type="button" value="返回"  class="ui-btn-grey ui-back" onclick="backspecial()"/>
                    </div>
    	</div>
        
        <div class="ui-info-main" id="specialdivnone" style="display:none">
        <form id="infoForm1" method="post" action="" >
            <div class="ui-informate">
             	<div class="ui-informate-base ui-channel-baseinfor">
             	<div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">展示编号:</label>
                        <span class="ui-base-data">
							${position.contentId}
							<input type="hidden"  value="${position.contentId}" name="contentId"/>
						    <input type="hidden"  value="${position.posUrls}" name="posUrls"/>
							
                        </span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">展示位:</label>
                       <span class="ui-base-data">
						<select name="posId" class="ui-comboboxeasyui-validatebox" required="true" missingMessage="请输入展示位" id="posId">
						<option value="">请选择</option>
						  <#list pList as item>
						  
                        <option value="${item.posId}" <#if position.posId==item.posId>selected </#if> >${item.posName}</option>
                        </#list>
                        
                        
                        </select>
                         </span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">展示内容类型:</label>
                        <span class="ui-base-data">
							<select class="ui-combobox" name="contentType" id="contentType" >
								<option value="0" >请选择</option>
								<option value="10"  <#if position.contentType==10>selected </#if> >广告推广</option>
								<option value="20" <#if position.contentType==20>selected </#if>>标准产品</option>
								<option value="21"<#if position.contentType==21>selected </#if>>专题产品</option>
								<option value="22"<#if position.contentType==22>selected </#if>>促销产品</option>
								<option value="23"<#if position.contentType==23>selected </#if>>限时抢购产品</option>
								<option value="99"<#if position.contentType==99>selected </#if>>其他</option>
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
                            <input class="clause-input ui-channel-inforspan easyui-validatebox  ui-cover" maxlength=5 value="${position.sortCode}" onKeyUp="this.value=this.value.replace(/\D/g,'') " onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" name="sortCode" data-options="required:true,validType:['numLetChina','maxlen[5]']" missingMessage="请输入排序码"/>
                        </span>
                    </div>
                     <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">展示位图片:</label>
						<img src="${base}${position.posLogo}" width="120" height="120" id="produceMap"/>
                        <span class="ui-base-data ui-relative">
                            <div class="ui-info-item ui-client-upload-item">
                                <div class="ui-relative ui-clinet-upload">
                                  <input type="button" class="ui-file-link" value="重新上传">
                                  <input type="file" name="insuranceTerms" class="file-wrap" id="prodimg-file"  onchange="uploadImg('prodimg-file','${base}/product/fileUpload','product');" style="left:1px;width:70px;height:30px;margin-top:-10px;cursor:pointer;">
                                   <input type="hidden" id="posLogo" name="posLogo" value="${position.posLogo}"/>
                                </div>  
                            </div>
                        </span>
                        <span class="showMessage2"></span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">开始时间:</label>
                        <span class="ui-base-data">
                            <input class="easyui-datetimebox" style="width:300px" data-options="editable:false" name="effTimestr" id="startdatetimebox" value="${position.effTime?string('yyyy-MM-dd HH:mm:ss')}"/>
                        </span> 
                        <span class="showMessage"></span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">结束时间:</label>
                        <span class="ui-base-data">
                            <input class="easyui-datetimebox" style="width:300px" data-options="editable:false" name="expTimestr" value="${position.expTime?string('yyyy-MM-dd HH:mm:ss')}" id="datetimeboxEnd" validType="mdMs['#startdatetimebox']"/>
                        </span>
                        <span class="showMessage"></span> 
                    </div>   

                    <div class="ui-btn-double ui-detail-btnposition">
                        <input type="button" value="保存"  onclick="saveproduct()" class="ui-btn-blue ui-submit ui-detail-bntwidth" />
	                    <input type="button" value="取消"  class="ui-btn-grey"  onclick="godown()"/>
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
     <div id="downok" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">操作成功！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="downsussage()" value="确定"/>
  </div>   
   <div id="downno" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">操作失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="downno()" value="确定"/>
  </div>  
   <div id="downnoselect" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">请选择展示内容！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="downno()" value="确定"/>
  </div>  
   <div id="downnoselectlocal" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">请选择展示内容类型或展示位！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="downno()" value="确定"/>
  </div>      
	<script>
    $(function(){
        validExtend();
        //下拉框联动
        $("#posId").on("change",function(){
        	var text = $(this).find("option:selected").text();

        	if(text.indexOf("限时抢购位") != (-1) ){
        		$("#contentType").attr("disabled","false");
        		$("#contentType").find("option").eq(5).attr("selected","selected");
        	}else{
        		$("#contentType").removeAttr("disabled");
        		$("#contentType").find("option").eq(0).attr("selected","selected");
        	}
        	$("#relateBox").html("");
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
        
   });
   function editpuduct(){
	  document.getElementById('specialdivblock').style.display = "none";
	  document.getElementById('specialdivnone').style.display = "block";
	  var str= document.getElementById("contentTypevalue").value;
	  if(str==21){
	  var id= document.getElementById("specialId").value;
	getSpecialDataItem(id);
	}else if(str==22){
	 var mid= document.getElementById("priceId").value;
	getMarkDataItem(mid);
	}else if(str==20){
	  var pid= document.getElementById("productId").value;
     getDataItem(pid);
	}
	else if(str==23){
	 var fid= document.getElementById("falshId").value;
	getFalshDataItem(fid);
	}else{
	
	}
	
	}
   
    var methods = {
            init : function(){

                //全局变量
                this.isflag = true;

                //验证的元素

                var timestart = $("#startdatetimebox"),
                    timeend = $("#datetimeboxEnd"),
                    isflag = true;
               $("#channelBaseInfor").click(function(event) {
                   var datastart = timestart.datebox('getValue'),
                        dataend = timeend.datebox('getValue'),
                        producecont = $("#dg-list").html();
                //时间控件验证是否为空
                if(datastart == ""){
                     $("#clientTimeTool1").show();
                     isflag = false;
                }else{
                     $("#clientTimeTool1").hide();
                     isflag = true;
                }
                //时间控件验证是否为空
                if(dataend == ""){
                     $("#clientTimeTool2").show();
                     isflag = false;
                }else{
                     $("#clientTimeTool2").hide();
                     isflag = true;
                }

            
               });

            //点击选择显示弹框加上数据
            $("#relateProduce").click(function(event) {
            var values=document.getElementById("contentType");
            showAlert("dlgList");
            $("#newLoadPage").attr("src",'${base}/operate/positionSelsetBytype?ids='+values.value);
                
            })
   
            }
        }

        methods.init();
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
		          	if(maxq == -1){
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
	                        '<th class="relate-item-style">促销状态</th>'+
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
	                        '<th class="relate-item-style">营销策略ID</th>'+
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
      //保存编辑
      function saveproduct(){
	     var f=$('#infoForm1');
	      if(!f.form('validate')){
	       return false;
	      }
	        $.ajax({
                 url: '${base}/operate/updatePositionContent',
                 type: 'post',
                 datatype: 'text',
                 data: $('#infoForm1').serialize(),
                 success: function (result) {
                     if (result>0) {
                     showAlert("downok");
                     }if (result==-1) {
                      alert("日期有交集");
                     }if (result==0) {
                     showAlert("downno");
                     } 
                     if (result==-2) {
                     showAlert("downnoselect");
                     }
                     if (result==-3) {
                     showAlert("downnoselectlocal");
                     } 
                 }
             });
	}
		
	      //编辑成功确定
	      function downsussage(){
	      	$("#downok").dialog("close");
	     	 window.location.href="${base}/operate/showInfoView";
	      }
     
      //编辑取消
      	function godown(){
	   		document.getElementById('specialdivblock').style.display = "block";
	  		document.getElementById('specialdivnone').style.display = "none";
	}
	
	//返回按钮
	 function backspecial(){
     	 window.location.href="${base}/operate/showInfoView";
      }
      
      function downno(){
      $("#downno").dialog("close");
       $("#downnoselect").dialog("close");
        $("#downnoselectlocal").dialog("close");
	     	
      }
    </script>
</body>
</html>