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
         		<label class="ui-info-lbl">专题策略编号</label>
         		${specialsPo.specialId}
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">专题名称</label>
         		${specialsPo.specialName}
         		 <input  id="hiddpid" name="pid" type="hidden" value="${pid}"/> 
         		  <input  id="hiddsid" name="pid" type="hidden" value="${specialsPo.specialId}"/> 
         		 <input  id="domainstsview" name="domainstsviews" type="hidden" value="${specialsPo.domainStatus}"/> 
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">专题说明</label>
         		${specialsPo.specialIntro}
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">专题图片</label>
         		<img src="${base}${specialsPo.specialLogo3}" width="120" height="120"/>
         	</li>
        </ul>
     <h2 class="ui-info-tit">关联产品</h2>
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
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">推荐语</label>
         		  ${item.productRecommend}
         		  <input   name="domainProductsMap['${item.productId}'].productRecommend" type="hidden" value="${item.productRecommend}">
       </li>
        </ul>
          </#list>
          <ul class="ui-info-list">
        <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">开始时间</label>
         		<input   name="effTimestr" type="hidden" value="${specialsPo.effTimestr}"/>
         		 ${specialsPo.effTimestr}
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         	 <input   name="expTimestr" type="hidden" value="${specialsPo.expTimestr}"/>
         		<label class="ui-info-lbl">结束时间</label>
         		 ${specialsPo.expTimestr}
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
         	<div class="ui-btn-double ui-detail-btnposition">
         	 <#if specialsPo.sts==1 || specialsPo.sts==-1>
                        <input type="button" onclick="editpuduct()" value="编辑" class="ui-btn-blue ui-submit" />
                        </#if>
                         <#if specialsPo.domainStatus==2>
	     				<input type="button" value="下线专题" onclick="downSpecial(${specialsPo.specialId})" class="ui-btn-grey"/>
	      				</#if>
	                    <input type="button" value="返回"  class="ui-btn-grey ui-back" onclick="backspecial()"/>
                    </div>
    	</div>
        
        <div class="ui-info-main" id="specialdivnone" style="display:none">
        <form id="infoForm1" method="post" action="" >
            <div class="ui-informate">
             	<div class="ui-informate-base ui-channel-baseinfor">
             	  <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">专题策略编号:</label>
                        <span class="ui-base-data">
                        ${specialsPo.specialId}
                            <input type="hidden" id="priceIdvalue" value=" ${specialsPo.specialId}" name="specialId" />
                        </span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">专题名称:</label>
                        <span class="ui-base-data">
                            <input class="clause-input ui-channel-inforspan easyui-validatebox  ui-cover" type="text" value=" ${specialsPo.specialName}" name="specialName" maxlength=20 data-options="required:true,validType:['numLetChina','maxlen[20]']" missingMessage="请输入专题名称"/>
                        </span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">专题说明:</label>
                        <span class="ui-base-data">
                            <input class="clause-input ui-channel-inforspan easyui-validatebox  ui-cover" type="text" value=" ${specialsPo.specialIntro}" name="specialIntro" maxlength=40 data-options="required:true,validType:['numLetChina','maxlen[40]']" missingMessage="请输入专题说明" />
                        </span>
                    </div>
                     <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">专题图片:</label>
						<img src="${base}${specialsPo.specialLogo3}" width="120" height="120" id="produceMap"/>
                        <span class="ui-base-data ui-relative">
                            <div class="ui-info-item ui-client-upload-item">
                                <div class="ui-relative ui-clinet-upload">
                                  <input type="button" class="ui-file-link" value="重新上传">
                                  <input type="file" name="insuranceTerms" class="file-wrap" id="prodimg-file"  onchange="uploadImg('prodimg-file','${base}/product/fileUpload','product');" style="left:1px;width:70px;height:30px;margin-top:-10px;cursor:pointer;">
                                   <input type="hidden" id="specialLogo3" name="specialLogo3" value="${specialsPo.specialLogo3}"/>
                                </div>  
                            </div>
                        </span>
                        <span class="showMessage2"></span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">关联产品:</label>
                        <span class="ui-base-data">
                           <input type="button" value="选择" class="ui-btn-blue ui-submit" id="relateProduce"/>
                        </span>     
                    </div>
                   <!--关联产品数据填充-->
                   <div id="relateBox"></div>

                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">开始时间:</label>
                        <span class="ui-base-data">
                            <input class="easyui-datetimebox" style="width:300px" data-options="editable:false" name="effTimestr" id="startdatetimebox" value="${specialsPo.effTime?string('yyyy-MM-dd HH:mm:ss')}"/>
                        </span>      
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">结束时间:</label>
                        <span class="ui-base-data">
                            <input class="easyui-datetimebox" style="width:300px" data-options="editable:false" name="expTimestr" value="${specialsPo.expTime?string('yyyy-MM-dd HH:mm:ss')}" id="datetimeboxEnd" validType="mdMs['#startdatetimebox']"/>
                        </span> 
                    </div>   
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
                    <div class="ui-btn-double ui-detail-btnposition">
                        <input type="button" value="保存并提交审核"  onclick="saveproduct()" class="ui-btn-blue ui-submit ui-detail-bntwidth" />
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
    <div id="downspecial" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">确定下线该专题吗？</h3>
    <input type="button" class="ui-dlgOk-btn" onclick="downsuss()" value="确定"/>
    <input type="button" class="ui-dlgCancel-btn" onclick="closedown()" value="取消"/>
    <input  type="hidden" name="issueType"   id="issueType"/>
  </div>   
    <div id="downdlgok" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置成功!</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="backspecial()" value="确定"/>
  </div>   
     <div id="downok" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">您编辑专题的请求已提交审核!</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="downsussage()" value="查看审核详情"/>
  </div>   
   <div id="downno" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="downno()" value="确定"/>
  </div>     
	<script>
	var selectid='';
	var pid=document.getElementById("hiddsid").value;
    $(function(){
        validExtend();
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
    //点击选择显示弹框加上数据
    $("#relateProduce").click(function(event) {
         showAlert("dlgList");
         $("#newLoadPage").attr("src",'${base}/operate/specialnewselect?ids='+selectid);
                 
     })
        
   });
   function editpuduct(){
	  document.getElementById('specialdivblock').style.display = "none";
	  document.getElementById('specialdivnone').style.display = "block";
	  var str= document.getElementById("hiddpid").value;
	  if(str.length>0){
	  getDataItem(str);
	}
	}
     
    
      function getDataItem(str){
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
	                            '<label class="ui-base-label relate-item-label">专题推荐语:</label>'+
	                            '<span class="ui-base-data">'+
	                            '<input  type="hidden" name="domainProductsMap['+result[i].productId+'].productId" value="'+result[i].productId+'"/>'+
	                                '<input class="clause-input ui-channel-inforspan ui-optional easyui-validatebox  ui-cover" type="text" name="domainProductsMap['+result[i].productId+'].productRecommend"  value="'+recommend+'"  data-options="validType:\'numLetChina\'" maxlength="40"/>  '+
	                            '</span><input type="button" value="删除" class="ui-btn-blue ui-opera-delete" onclick="deleteproduct('+result[i].productId+','+result.length+')"/> '+
	                        '</div>'+
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
                 url: '${base}/operate/updateSpecial',
                 type: 'post',
                 datatype: 'text',
                 data: $('#infoForm1').serialize(),
                 success: function (result) {
                     if (result>0) {
                     showAlert("downok");
                     }else{
                       showAlert("downno");
                     }
                 }
             });
	}
		
		  var deleteid='';
		  //删除关联产品弹框
	      function deleteproduct(value,obj){
		      var tempde =selectid.split(",");
		      if(tempde.length==2){
		      showAlert("dlgm");
		      return false;
		      }
		      deleteid=value;
		      showAlert("dlgProduce");
	      }
	      
	      
	      //删除关联产品
	      function submitselect(){
		     /** $.ajax({
		        url: '${base}/operate/deleteSelectProduct?pid='+deleteid+'&sid='+pid,
		                 type: 'post',
		                 success: function (result) {*/ 
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
		               /**  }
		             });*/ 
	      }
	      
      //不允许删除全部产品
	      function closecon(){
	        $("#dlgm").dialog("close");
	      }
	      
	       var speid='';
	       
	       //下线专题
	      function downSpecial(value){
		      speid=value;
		      showAlert("downspecial");
		      }
	     
	      function downsuss(){
	       $("#downspecial").dialog("close");
	       $.ajax({
	        url: '${base}/operate/downSpecialProduct?sid='+speid,
	                 type: 'post',
	                 success: function (result) {
	                   if(result>0){
	                       showAlert("downdlgok");
	                   }else{
	                   showAlert("downno");
	                   }
	                 }
	             });
	      }
	      
       //下线取消
	      function closedown(){
	       $("#downspecial").dialog("close");
	      }
	      //编辑成功确定
	      function downsussage(){
	      	$("#downok").dialog("close");
	  var valu=$('#priceIdvalue').val();
	  var sts=$('#domainstsview').val();
        window.location.href="${base}/operate/findSpecialEditInfo?specialId="+valu+"&domainsts="+sts;
      }
     
	//返回按钮
	 function backspecial(){
	 	$("#downdlgok").dialog("close");
     	 window.location.href="${base}/operate/specialView";
      }
      
      function downno(){
      $("#downno").dialog("close");
	     	 window.location.href="${base}/operate/specialView";
      }
      
       //编辑取消
      	function godown(){
      	 var sts=$('#domainstsview').val();
      	  window.location.href="${base}/operate/findSpecialEditInfo?specialId="+pid+"&domainsts="+sts;
	}
    </script>
</body>
</html>