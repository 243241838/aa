<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>商品管理-<#if product.productId != null>编辑<#else>新增</#if></title>
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

  <div class="ui-info-content">
	  <form id ="editMerch" method="post" action="" >
			<div class="ui-info-wrap">
			<h3 class="ui-info-tit"> 商品账户信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <tr class="platform-part">
				            <td class="ui-oddtd">商品ID：</td>
				            <td>
				            	${product?if_exists.productId}
				            </td>
				          </tr>
				           <tr class="platform-part">
				            <td class="ui-oddtd">商品名称：</td>
				            <td>
				            	${product?if_exists.productName}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">所属业务：</td>
				            <td>
				            <#list serviceList as item>
				             <#if product.serviceId == "${item.serviceId}">${item.serviceName}</#if>
				             </#list>
				            </td>
				            </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td>
				          	${product.effTimeStr} 	至  ${product.expTimeStr}
				            </td>
				                
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">服务时间：</td>
				            <td>
				          	${product.serviceBeginTime} 	至  ${product.serviceEndTime}
				            </td>
				              <tr class="platform-part">
				            <td class="ui-oddtd">状态：</td>
				            <td>
				            <#if product.productSts == 10>上架</#if>
				            <#if product.productSts == 9>下架</#if>
				            <#if product.productSts == -10>锁定</#if>
				            <#if product.productSts == -11>禁用</#if>
				            </td>
				            </tr>  
				              <tr class="platform-part">
				            <td class="ui-oddtd">是否需要渠道提供用户ID：</td>
				            <td>
				             <#if product.productProps == 0>不需要</#if>
				            <#if product.productProps == 1>需要</#if>
				            </td>
				            </tr>  
				            
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">价格类型：</td>
				            <td>
				             <#if product.pricingMode == 1>固定价格</#if>
				             <#if product.pricingMode == 2>浮动价格</#if>
				            </td>
				          </tr>
				           <#if product.pricingMode == 1>
				            <tr class="platform-part">
				            <td class="ui-oddtd">面值价：</td>
				            <td>
				            	${product?if_exists.productParvalue}
				            </td>
				            </tr>
				            </#if>
						  </tbody>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
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
 
</script>
</body>
</html>