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
	<script type="text/javascript" src="${base}/resource/js/kindeditor/kindeditor.js"></script>
</head>
<body>
	<div class="ui-info-box">
        <div class="ui-crumbs" id="crumbs">
        	 <#include "/common/include/power.ftl">
        </div>
        <div class="ui-info-main">
        <form id="infoForm1" method="post" action="${base}/operate/findSpecialAddInfo" >
            <div class="ui-informate">
             	<div class="ui-informate-base ui-channel-baseinfor">
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">专题名称:</label>
                        <span class="ui-base-data">
                            <input class="clause-input ui-channel-inforspan easyui-validatebox  ui-cover" type="text" name="specialName" maxlength=20 data-options="required:true,validType:['numLetChina','maxlen[20]']" missingMessage="请输入专题名称"/>
                        </span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">专题说明:</label>
                        <span class="ui-base-data">
                            <input class="clause-input ui-channel-inforspan easyui-validatebox  ui-cover" type="text" name="specialIntro" maxlength=40 data-options="required:true,validType:['numLetChina','maxlen[40]']" missingMessage="请输入专题说明"/>
                        </span>
                    </div>
                    
                   
                    
                     <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label theme-item-label">专题图片:</label>
                        <span class="ui-base-data ui-relative">
                            <div class="ui-info-item ui-client-upload-item">
                            <img src="" class="addimg" width="120" height="120" data-leve="no" />
                                <div class="ui-relative ui-clinet-upload">
                                   
                                  <input type="button" class="ui-file-link" value="点击上传">
                                  <input type="file" name="insuranceTerms" class="file-wrap" id="prodimg-file"  onchange="uploadImg('prodimg-file','${base}/product/fileUpload','product');" style="left:1px;width:70px;height:30px;margin-top:-10px;cursor:pointer;">
                                   <input type="hidden" id="specialLogo3" name="specialLogo3" />
                                </div>  
                            </div>
                        </span>
                        <span class="showMessage2"></span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">关联产品:</label>
                        <span class="ui-base-data">
                           <input type="button" value="选择" class="ui-btn-blue" id="relateProduce"/>
                        </span>
                        <span class="showMessage2"></span>      
                    </div>
                   <!--关联产品数据填充-->
                   <div id="relateBox"></div>

                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">开始时间:</label>
                        <span class="ui-base-data">
                            <input class="easyui-datetimebox ui-channel-inforspan date-timestart" data-options="editable:false" name="effTimestr" id="startdatetimebox">
                        </span> 
                        <span class="showMessage"></span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base">
                        <label class="ui-base-label theme-item-label">结束时间:</label>
                        <span class="ui-base-data">
                            <input class="easyui-datetimebox ui-channel-inforspan date-timeend" data-options="editable:false" name="expTimestr" id="datetimeboxEnd" validType="mdMs['#startdatetimebox']">
                        </span>
                        <span class="showMessage"></span> 
                    </div>   
                    <div class="ui-btn-double">
                    	 <input type="submit" value="下一步" class="ui-btn-blue ui-submit" />
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


        <!--选择弹出框end-->
	</div>

	<script>
	var selectid='';
    $(function(){
        validExtend();
        //点击选择显示弹框加上数据
        $("#relateProduce").click(function(event) {
            showAlert("dlgList");
            $("#newLoadPage").attr("src",'${base}/operate/specialnewselect?ids='+selectid);
                 
        })
		
	  //点击下一步
		var  produceitem = $("#relateProduce");
 		$('.ui-submit').click(function(){
	      var f=$(this).parents('form'),
	      	  produceval = $("#relateBox").text(),
	      	  producetarget = produceitem.parent().next(),
	      	  isproduce = true,isflag = checkDate(f),str ='';
			
			if(produceval == ''){
				str = "请为专题配置产品";
				isproduce = false;
			}
			producetarget.text(str);

	      if(f.form('validate') && isflag && isproduce ){
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
    
    function submitForm(){
        if($('#search-ff').form('validate')){
                //eb.backToFstPage("#datagrid");
                $("#dg-list").datagrid({queryParams : eb.form2Json("search-ff")});
                
                 pageAction();
            }
    }
    
      function getDataItem(str){
      selectid+=str+",";
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
	                            '<input  type="hidden" maxlength=40 name="domainProductsMap['+result[i].productId+'].productId" value="'+result[i].productId+'"/>'+
	                                '<input class="clause-input ui-channel-inforspan ui-optional easyui-validatebox  ui-cover" type="text" name="domainProductsMap['+result[i].productId+'].productRecommend"   data-options="validType:\'numLetChina\'" maxlength="40"/>'+
	                            '</span>'+
	                        '</div>'+
	                    '</div>';
			          	htm += data;
			          }
		          	
	          		target.append(htm);
	              }
       		});
        
      }
    </script>
</body>
</html>