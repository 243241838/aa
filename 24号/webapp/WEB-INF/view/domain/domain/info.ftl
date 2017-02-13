<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>渠道管理-<#if domain.domainId != null>编辑<#else>新增</#if></title>
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
				            <td class="ui-oddtd">账户类型：</td>
				            <td>
				             <#if domainAccount.acctType == 1>信用额度</#if>
				             <#if domainAccount.acctType == 2>预付款</#if>
				            </td>
				          </tr>
				          <#if domainAccount.acctType == 1> 
				          <tr class="platform-part">
				            <td class="ui-oddtd">信用额度：</td>
				            <td>
				                ${domainAccount?if_exists.acctBalance}
				            </td>
				          </tr></#if>
				            <tr class="platform-part">
				            <td class="ui-oddtd">预警金额：</td>
				            <td>
				            	${domainAccount?if_exists.ewBalance}
				            </td>
				   
				           <tr class="platform-part">
				            <td class="ui-oddtd">状态：</td>
				            <td>
				             <#if domainAccount.acctSts == 10>正常</#if>
				             <#if domainAccount.acctSts == -10>冻结</#if>
				              <#if domainAccount.acctSts == -11>禁用</#if>
				          </tr>
						  </tbody>
		      		</table>
				</div>
			
  	  			<h3 class="ui-info-tit"> 渠道基本信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr class="platform-part">
				            <td class="ui-oddtd">渠道名称：</td>
				            <td>
				            	${domain?if_exists.domainName}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">渠道类型：</td>
				            <td>
				            <#if domain.domainType == 10>银行</#if>
				            <#if domain.domainType == 11>第三方支付</#if>
				            <#if domain.domainType == 12>P2P</#if>
				            <#if domain.domainType == 20>电商</#if>
				            <#if domain.domainType == 1>其他 </#if>
				            </td>
				          </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">地址：</td>
				            <td>
				            	${domain?if_exists.domainAddress}
				            </td>
				           <tr class="platform-part">
				            <td class="ui-oddtd">证件类型：</td>
				            <td>
				             <#if identitieList.idenType == 10>身份证</#if>
				            <#if identitieList.idenType == 20>组织机构代码证</#if>
				            <#if identitieList.idenType == 21>营业执照</#if>
				            <#if identitieList.idenType == 22>税务登记证</#if>
				            </td>
				            <td class="three">证件号码：</td>
				            <td>
				            	${identitieList?if_exists.idenNo}
				            </td>
				          </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">联系人姓名：</td>
				            <td>
				            	${domain?if_exists.domainContacts}
				            </td>
				                <td class="three">联系人电话：</td>
				            <td>
				            	${domain?if_exists.domainTel}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td>
				          	${domain.effTimeStr} 	至  ${domain.expTimeStr}
				            </td>
				                
				          </tr>
						  </tbody>
		      		</table>
				</div>
				
				<h3 class="ui-info-tit">商品配置信息</h3>
				<div class="ui-infobg">
				 <#list domainList as item>
					<table class="ui-center-tab">
			          <tbody>
				          <tr class="platform-part">
				            <td class="ui-oddtd"  style="font-weight:bold;">
				             <#list pList as pitem>
				             <#if item?if_exists.productId == "${pitem.productId}">${pitem.productName}</#if>
				             </#list>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">基准价格：</td>
				            <td>
				            <#if item.benchmarkPrice == 1>面值</#if>
				            <#if item.benchmarkPrice == 2>进货价</#if>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">加价类型：</td>
				            <td>
				            <#if item.settPricing == 1>固定加价金额</#if>
				            <#if item.settPricing == 2>按比例加价</#if>
				            </td>
				          </tr>
				          <#if item.settPricing == 1>
				           <tr class="platform-part">
				            <td class="ui-oddtd">加价配置：</td>
				            <td>
				             ${item.settValue}元
				            </td>
				          </tr>
				          </#if>
				          <tr class="platform-part">
				            <td class="ui-oddtd">加价配置：</td>
				            <td>
				             ${item.settValue}%
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">上限：</td>
				            <td>
				             ${item.settMaxValue}元
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">下限：</td>
				            <td>
				             ${item.settMinValue}元
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">渠道价：</td>
				            <td>
				             ${item.domainValue}元
				            </td>
				          </tr>
				           <tr class="platform-part">
				            <td class="ui-oddtd">零售价配置：</td>
				            <td>
				            <#if item.commValue == 1>固定加价金额</#if>
				            <#if item.commValue == 2>按比例加价</#if>
				            <#if item.commValue == 0>同结算价格</#if>
				            </td>
				          </tr>
				           <#if item.commValue == 1>
				           <tr class="platform-part">
				            <td class="ui-oddtd">售价配置：</td>
				            <td>
				             ${item.domainValue}元
				            </td>
				          </tr>

                           </#if>
                            <#if item.commValue == 2>
				           <tr class="platform-part">
				            <td class="ui-oddtd">售价配置：</td>
				            <td>
				             ${item.domainValue}%
				            </td>
				          </tr>
                           </#if>
                            <tr class="platform-part">
				            <td class="ui-oddtd">渠道价：</td>
				            <td>
				             ${item.domainValue}元
				            </td>
				          </tr>
						  </tbody>
		      		</table>
		      		 </#list>
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