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
				            	${tradeRecord?if_exists.requestTimer}
				            </td>
				          </tr> 
				            <tr class="platform-part">
				              <td class="ui-oddtd">发货时间：</td>
				            <td>
				            	${tradeRecord?if_exists.deliveryTimer}
				            </td>
				          </tr> 
				            <tr class="platform-part">
				             <td class="ui-oddtd">支付时间：</td>
				            <td>
				            	${tradeRecord?if_exists.payTimer}
				            </td>
				          </tr> 
				             <tr class="platform-part">
				             <td class="ui-oddtd">商品名称：</td>
				            <td>
				            	${tradeRecord?if_exists.productName}
				            </td>
				          </tr> 
				            <tr class="platform-part">
				             
				            <td class="ui-oddtd">供应商：</td>
				            <td>
				            <#list pList as item>
				             <#if tradeRecord.providerId == "${item.providerId}">${item.providerName}</#if>
				             </#list>
				            </td>
				          </tr> 
				            <tr class="platform-part">
				             
				             <td class="ui-oddtd">渠道：</td>
				            <td>
				            <#list dList as item>
				             <#if tradeRecord.domainId == "${item.domainId}">${item.domainName}</#if>
				             </#list>
				            </td>
				          </tr> 
				             <tr class="platform-part">
				            
				          </tr> 
				            <tr class="platform-part">
				             
				          </tr> 
				            <tr class="platform-part">
				             
				          </tr> 
				             <tr class="platform-part">
				            
				          </tr> 
				            <tr class="platform-part">
				             
				          </tr> 
				            <tr class="platform-part">
				             
				          </tr> 
				          
				          
				            <tr class="platform-part">
				            <td class="ui-oddtd">面值价：</td>
				            <td>
				            	${tradeRecord?if_exists.productParValue}
				            </td>
				           
				            
				            </tr>
				            <tr class="platform-part">
				           <td class="ui-oddtd">进货价：</td>
				            <td>
				            	${tradeRecord?if_exists.productPrice}
				            </td>
				            </tr>
				            <tr class="platform-part">
				            
				            
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
				            </tr>
				              <tr class="platform-part">
				             <td class="ui-oddtd">交易完成时间：</td>
				            <td>
				            	${tradeRecord?if_exists.lastTimer}
				            </td>
				            </tr>
				             <tr class="platform-part">
				            <td class="ui-oddtd">交易状态：</td>
				            <td>
							<#if tradeRecord.tradeSts==10> 已下单</#if>
							<#if tradeRecord.tradeSts==-10> 订单取消</#if>
							<#if tradeRecord.tradeSts==20> 已支付</#if>
							<#if tradeRecord.tradeSts==21> 支付不足</#if>
							<#if tradeRecord.tradeSts==-20> 支付超时失败</#if>
							<#if tradeRecord.tradeSts==-21> 支付不足超时失败</#if>
							<#if tradeRecord.tradeSts==30> 发货中</#if>
							<#if tradeRecord.tradeSts==35> 已发货</#if>
							<#if tradeRecord.tradeSts==-31> 渠道余额不足发货失败</#if>
							<#if tradeRecord.tradeSts==-32> 供应商余额不足发货失败</#if>
							<#if tradeRecord.tradeSts==-33> 网络异常发货失败</#if>
							<#if tradeRecord.tradeSts==40> 全部核销</#if>
							<#if tradeRecord.tradeSts==41> 部分核销</#if>
							<#if tradeRecord.tradeSts==50> 全部退款申请</#if>
							<#if tradeRecord.tradeSts==51> 同意全部退款</#if>
							<#if tradeRecord.tradeSts==-51> 拒绝全部退款</#if>
							<#if tradeRecord.tradeSts==55> 部分退款申请</#if>
							<#if tradeRecord.tradeSts==56> 同意部分退款</#if>
							<#if tradeRecord.tradeSts==-56> 拒绝部分退款</#if>
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