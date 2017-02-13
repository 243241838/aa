<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>货品管理-编辑</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>
</head>
<body>
<div id="page-form">
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
       <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">角色管理 <span>></span></a>
		<span class="crumbs-tit">新增角色</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerch" method="post"  action="${action?if_exists}" >
			<div class="ui-info-wrap">
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          	<#if product.providerId != null>
				            	<input id="providerId" type="hidden" name="providerId" value="${product?if_exists.providerId}"/>
				            	<input id="productCode" type="hidden" name="productCode" value="${product?if_exists.productCode}"/>
			  </#if>
				          <tr class="platform-part">
				            <td class="ui-oddtd">货品ID：</td>
				            <td>
				               ${product?if_exists.productCode}
				 	             
				            </td>
				          </tr>
				          	        
				          <tr class="platform-part">
				            <td class="ui-oddtd">货品名称：</td>
				            <td>
				               <input id='productName' 　  type="text" maxlength=40  class=" ui-dinput" name="productName" value="${product?if_exists.productName}"/>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">面值：</td>
				            <td>
				               <input id='productParvalue' 　  type="text" maxlength=40  class=" ui-dinput" name="productParvalue" value="${product?if_exists.productParvalue}"/>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">供应商：</td>
				            <td>
				             <#list providerList as item>
				             <#if product.providerId == "${item.providerId}">${item.providerName}</#if>
				             </#list>
				             </td>
				          </tr>
				            
				     <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td colspan="3">
				            	   <input id="effTime" name="effTimeStr" class="easyui-datebox" value="${product.effTime?string('yyyy-MM-dd')}" validType="mdM['#effTime']">
					<em>至</em>
					<input id="expTime" name="expTimeStr" class="easyui-datebox" value="${product.expTime?string('yyyy-MM-dd')}" validType="mdM['#expTime']">
				            	
				            </td>
				          </tr> 
				           
						  </tbody>
		      		</table>
				</div>
				
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      <input type="submit" value="下一步" class="ui-red-btn ui-pos3"/>
	    </div>
		</form>
	</div>
</div>
</div>
<div id="page-result" style="display:none"></div>
<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
<script>
  $(document).ready(function(){
     
	 $("#editMerch").validationEngine({
		maxErrorsPerField: 1
	});
	
	 $("body").delegate('#back', 'click', function(event) {
            $("#page-form").show();
            $("#page-result").hide().empty();
      });
    $('#editMerch').ajaxForm({
        target: '#page-result',
        success: function() {
            $("#page-form").hide();
            $('#page-result').show();
        }
    });
 });
 
 function changelist(value){
 alert(value);
 if(value==1){   
 alert("ssss");
   document.getElementById("productTypeStyle").style.display="block";
 }else{
 document.getElementById("productTypeStyle").style.display="none";
 }
 }
</script>
</body>
</html>