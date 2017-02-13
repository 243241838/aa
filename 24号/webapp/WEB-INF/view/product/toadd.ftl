<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>商品管理-新增</title>
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
	<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
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
			<h3 class="ui-info-tit"> 渠道账户信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			           <tr class="platform-part">
				            <td class="ui-oddtd">商品名称：</td>
				            <td>
				               <input id='productName' 　  type="text" maxlength=40  class=" ui-dinput" name="productName" value="${domain?if_exists.productName}"/>
				            </td>
				            <td></td>
				            <td></td>
				          </tr>
				           <tr class="platform-part">
				            <td class="ui-oddtd">所属业务：</td>
				            <td>
				             <select name="serviceId" class="ui-dselect" id="serviceId">
						  <#list serviceList as item>
                          <option value="${item.serviceId}">${item.serviceName}</option>
                          </#list>
                           </select>
				            </td>
				            <td></td>
				            <td></td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td colspan="3">
				            <input id="effTime" name="effTimeStr" class="easyui-datebox" value="${countDayBegin}" validType="mdM['#effTime']">
					<em>至</em>
					<input id="expTime" name="expTimeStr" class="easyui-datebox" value="${countDayEnd}" validType="mdM['#expTime']">
				            </td>
				          </tr>
				          
				          <tr class="platform-part">
				            <td class="ui-oddtd">服务时间：</td>
				            <td colspan="3">
				            <input id="serviceBeginTime" name="serviceBeginTime" class="easyui-timespinner" value="${countDayBegin}" validType="mdM['#serviceBeginTime']">
					<em>至</em>
					<input id="serviceEndTime" name="serviceEndTime" class="easyui-timespinner" value="${countDayEnd}" validType="mdM['#serviceEndTime']">
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">是否需要渠道提供用户ID：</td>
				            <td>
				              <input  type="radio" name="productProps" value="1" checked="checked" />需要
                              <input  type="radio" name="productProps" value="0" />不需要
				            </td>
				               
				            <td></td>
				            <td></td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">价格类型：</td>
				            <td>
				 	                 <select class="ui-dselect" name="pricingMode"    onchange="changelist(this.value)">
				                	<option value="1" >固定价格</option>
				                	<option value="2" >浮动价格</option>
				                </select>
				            </td>
				          </tr>
		 
				          <tr class="platform-part"     id="styletype" >
				            <td class="ui-oddtd">面值价：</td>
				            <td>
				                <input id='productParvalue' 　  type="text" maxlength=40  class=" ui-dinput" name="productParvalue"   value="0"  />元
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
 if(value==1){   
   document.getElementById("styletype").style.display="";
 }else{
 document.getElementById("styletype").style.display="none";
 }
 }
</script>
</body>
</html>