<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>业务管理</title>
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
			<h3 class="ui-info-tit"> 渠道账户信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				           
				          <tr class="platform-part">
				            <td class="ui-oddtd">交易流水号：</td>
				            <td>
				                ${tradeRecord?if_exists.tradeId}
				            </td>
				          </tr> 
				            <tr class="platform-part">
				            <td class="ui-oddtd">下单时间：</td>
				            <td>
				            	${tradeRecord?if_exists.requestTime}
				            </td>
				            <td class="ui-oddtd">发货时间：</td>
				            <td>
				            	${tradeRecord?if_exists.deliveryTime}
				            </td>
				            <td class="ui-oddtd">支付时间：</td>
				            <td>
				            	${tradeRecord?if_exists.payTime}
				            </td>
				            </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">商品名称：</td>
				            <td>
				            	${tradeRecord?if_exists.productName}
				            </td>
				            <td class="ui-oddtd">供应商：</td>
				            <td>
				            <#list pList as item>
				             <#if tradeRecord.providerId == "${item.providerId}">${item.providerName}</#if>
				             </#list>
				            </td>
				             <td class="ui-oddtd">渠道：</td>
				            <td>
				            <#list dList as item>
				             <#if tradeRecord.domainId == "${item.domainId}">${item.domainName}</#if>
				             </#list>
				            </td>
				            </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">面值价：</td>
				            <td>
				            	${tradeRecord?if_exists.productParValue}
				            </td>
				            <td class="ui-oddtd">进货价：</td>
				            <td>
				            	${tradeRecord?if_exists.productPrice}
				            </td>
				            <td class="ui-oddtd">渠道价：</td>
				            <td>
				            	${tradeRecord?if_exists.domainPrice}
				            </td>
				            </tr>
				             <tr class="platform-part">
				            <td class="ui-oddtd">用户ID：</td>
				            <td>
				            	${tradeRecord?if_exists.userId}
				            </td>
				            <td class="ui-oddtd">交易完成时间：</td>
				            <td>
				            	${tradeRecord?if_exists.lastTime}
				            </td>
				            <td class="ui-oddtd">交易状态：</td>
				            <td>
				            <#if tradeRecord.tradeSts == 10>已受理</#if>
				            <#if tradeRecord.tradeSts == 20>已支付</#if>
				            <#if tradeRecord.tradeSts == 21>支付超额</#if>
				            <#if tradeRecord.tradeSts == -20>支付失败</#if>
				            <#if tradeRecord.tradeSts == -21>支付不足</#if>
				            <#if tradeRecord.tradeSts == -22>库存不足</#if>
				            <#if tradeRecord.tradeSts == 30>发货</#if>
				            <#if tradeRecord.tradeSts == 35>部分未使用</#if>
				            <#if tradeRecord.tradeSts == -30>发货失败</#if>
				            <#if tradeRecord.tradeSts == 40>核销成功</#if>
				            <#if tradeRecord.tradeSts == 50>部分退款</#if>
				            </td>
				            </tr>
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
  
</body>
</html>