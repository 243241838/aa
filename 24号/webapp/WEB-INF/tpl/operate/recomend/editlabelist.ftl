<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>运营管理-营销策略管理-专题管理</title>
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
        	 <#include "/common/include/power.ftl">
        </div>
        <div class="ui-info-main">
            <div class="ui-informate">
          
             	<div class="ui-informate-base ui-channel-baseinfor" id="style1">
              
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label ui-special-label">参数名称:</label>
                        <span class="ui-base-data">产品标签</span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label ui-special-label">参数值:</label>
                       <#list tageList as item>
                        <span class="ui-base-data ">
                            <span class="ui-baselabel-param">${item.tagName}</span>
                        </span>
                        </#list>
                    </div>
                    <div class="ui-btn-double">
                        <input type="button" class="ui-btn-blue" value="编辑" id="editlable"/>
                        <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
                    </div>
                </div>
                  <form id="infoForm" method="post" action="">
                <div class="ui-informate-base ui-channel-baseinfor" id="style2" style="display:none">
              
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label ui-special-label">参数名称:</label>
                        <span class="ui-base-data">产品标签</span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label ui-special-label">参数值:</label>
                        <div class="ui-base-data ui-baseparm-cols ui-parma-data" >
                       
                        
                       <input type="hidden" id="hiddenvalue" name="hiddenvalue" value="-1" />
                         <#list tageList as item>
                            <div class="ui-oneparam-item" id="div${item.tagId}">
                           		<input  type="text" class="ui-paramlabel-editor easyui-validatebox"  data-options="validType:['numLetChina']" name="domainProductsMap['${item.tagId}'].tagName" value="${item.tagName}"> 
                                <input type="hidden" name="domainProductsMap['${item.tagId}'].tagId" value="${item.tagId}" class="ui-paramlabel-editor">
                                <i onclick="deletelable(${item.tagId})" class="ui-close-red ui-hidden"></i>
                            </div>
                           </#list>
							<div class="channel-infor-item" id="paramItemBox"></div>
                            <div class="ui-baseparm-cols" id="paramItemOpera">
                                <a class="ui-toggle-add" href="javascript:;" id="paramAdd"></a>
                                <a class="ui-toggle-add ui-menu-redue" href="javascript:;" id="pamamDelete"></a>
                            </div>
                            
                        </div>
                    </div>
                    <div class="ui-btn-double">
                        <input type="button" value="保存"  onclick="domainok()" class="ui-btn-blue ui-submit" id="paramSave" />
                        <input type="button" value="取消" onclick="tomain()" class="ui-btn-grey"/>
                    </div>
                </div>
                </form>                			
         	</div>
    	</div>
    	<div id="dlgsuss" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">编辑成功!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="确定"/>
  </div>
  <div id="dlgerr" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">编辑失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
  <div id="dlgdecel" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">删除失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
	</div>

	<script>
	validExtend();
    $(function(){
    	
 		var temp=$("#hiddenvalue").val(),
       		paramadd = $("#paramAdd"),
            paramdelete = $("#pamamDelete"),
            parambox = $("#paramItemBox");
           
                           
		
        //点击信息参数
        paramadd.click(function(event) {
      
         	$("#hiddenvalue").val(parseInt($("#hiddenvalue").val())+1);
         	emp=$("#hiddenvalue").val();
           	parambox.append('<div class="ui-oneparam-item">'+
   						
                                '<input type="text" class="ui-paramlabel-editor add-paramval" maxlength="10" name="domainProductsMap['+$("#hiddenvalue").val()+'].tagName" value="" >'+
                            '</div>');
            $('.add-paramval').validatebox({required:true,validType: 'numLetChina'}); 

        });

        //单击出现关闭图标
        paramdelete.click(function(event) {
           parambox.find('.ui-oneparam-item:last').remove();
        });

        //单击保存按钮
        $("#paramSave").click(function(event) {
            showAlert('dlg')

            setTimeout(function(){
                location.href="parambaselabel.html";
            },1000)


        });

	$("#editlable").click(function(){
			 $('#style2').show();
	  		$('#style1').hide();
	})
           
       
   })
       

      function domainok(){
      if($('#infoForm').form('validate')){
             $.ajax({
                 url: '${base}/operate/addLable',
                 type: 'post',
                 datatype: 'text',
                 data: $('#infoForm').serialize(),
                 success: function (result) {
                     if (result>0) {
                     showAlert("dlgsuss");
                     }else{
                       showAlert("dlgerr");
                     }
                 }
             });
   }
   }
    function tomain(){
   		window.location.href="${base}/operate/lableList";
   }
   
   function deletelable(id){
    $.ajax({
                 url: '${base}/operate/deletelable?id='+id,
                 type: 'post',
                 success: function (result) {
                     if (result>0) {
                     document.getElementById('div'+id+'').style.display = "none";
                     }else{
                       showAlert("dlgdecel");
                     }
                 }
             });
   }
    </script>
</body>
</html>