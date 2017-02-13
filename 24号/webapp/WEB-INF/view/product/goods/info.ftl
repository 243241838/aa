<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>货品管理-<#if product.productId != null>编辑<#else>新增</#if></title>
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
			<h3 class="ui-info-tit"> 货品基本信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr class="platform-part">
				            <td class="ui-oddtd">货品ID：</td>
				            <td>
				                ${product?if_exists.productCode}
				            </td>
				          </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">货品名称：</td>
				            <td>
				            	${product?if_exists.productName}
				            </td>
				   
				           <tr class="platform-part">
				            <td class="ui-oddtd">供应商：</td>
				            <td>
				          <#list providerList as item>
				             <#if product.providerId == "${item.providerId}">${item.providerName}</#if>
				             </#list>
				          </tr>
				           <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td>
				          	${product.effTimeStr} 	至  ${product.expTimeStr}
				            </td>
				                
				          </tr>
						  </tbody>
		      		</table>
				</div>
			<#if product.productId!=0>
  	  			<h3 class="ui-info-tit">关联信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr class="platform-part">
				            <td class="ui-oddtd">关联商品：</td>
				            <td>
				             <#list productList as item>
				             <#if product.productId == "${item.productId}">${item.productName}</#if>
				             </#list>
				            </td>
				          </tr>
				          
				            <tr class="platform-part">
				            <td class="ui-oddtd">面值价：</td>
				            <td>
				            	${product?if_exists.productParvalue}
				            </td></tr>
				           <tr class="platform-part">
				            <td class="ui-oddtd">进货来源：</td>
				            <td>
				             <#if product.costSource == 1>从供应商获取</#if>
				            <#if product.costSource == 2>手动配置</#if>
				            </td>
				            <td class="three">基准价格：</td>
				            <td>
				            	 <#if product.benchmarkPrice == 1>面值价</#if>
				            </td>
				          </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">加价类型：</td>
				            <td>
				             <#if product.costPricing == 1>按每笔固定金额</#if>
				            <#if product.costPricing == 2>按金额比例</#if>
				            </td>
				              
				          </tr>
				           <tr class="platform-part">
				            <td class="ui-oddtd">加价配置：</td>
				            <td>
				            	${product?if_exists.costValue}
				            </td></tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">上限：</td>
				            <td>
				            	${product?if_exists.costMaxValue}
				            </td></tr>
				            
				            <tr class="platform-part">
				            <td class="ui-oddtd">下限：</td>
				            <td>
				            	${product?if_exists.costMinValue}
				            </td></tr>
						  </tbody>
		      		</table>
				</div>
				</#if>
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