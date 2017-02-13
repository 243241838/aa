<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>计费管理-商户手续费-设置</title>
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
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
	<script>
	  $(document).ready(function(){        
			$("#sellerUpdateForm").validationEngine({
		maxErrorsPerField: 1
	});
			moneyThousands();
			var str=pad2('${commonUserExtendMdl.userId}',6);
			$('td[data-str="str"]').text(str);
		});
	</script>
</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	   <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">计费管理<span>></span></a>
		<a class="crumbs-link" href="">商户手续费 <span>></span></a>
		<span class="crumbs-tit">商户手续费 </span>-->
	</div>
	<!--详细内容-->
	<div class="ui-info-content">
		<!-- 普通商户-->
		<#if usersSellerExtendMdl.sellerType==0> 
		<form id="sellerUpdateForm" action="/runManage/billingMagage/updateSellFeeFeeNext" method="post">
		  <div class="ui-info-wrap ui-dotted">
		  	<h3 class="ui-info-tit">基本信息</h3>
				<div class="ui-infobg">
					<table class="ui-info-tab">
				      <tr>
				      	<td class="ui-oddtd">用户ID：</td>
				      	<td data-str='str'>${commonUserExtendMdl.userId}</td>
				      	<td class="ui-oddtd">账户名：</td>
				      	<td>${commonUserExtendMdl.username}</td>
				      </tr>
				      <tr>
				      	<td class="ui-oddtd">用户类型:</td><td>${commonUserExtendMdl.userTypeName}</td>
				      	<td class="ui-oddtd">实名：</td>
				      	<td>${commonUserExtendMdl.realName}</td>
				      </tr>
				      <tr>
				      	<td class="ui-oddtd">注册时间:</td>
				      	<td>${commonUserExtendMdl.createTime?string("yyyy-MM-dd HH:mm:ss")}  </td>
				      	<#if commonUserExtendMdl.userType==0><!--0个人1企业-->
					      	<td class="ui-oddtd">身份证号：</td>
					      	<td>${usersPersonalExtendMdl.certificateNumber}</td>
				      	<#else>
					      	<td class="ui-oddtd">营业执照注册号：</td>
					      	<td>${usersEnterpriseExtendMdl.businessLicense}</td>
				      	</#if>
				      </tr>
					</table>
					<input type="hidden" value="${commonUserExtendMdl.userId}" name="userId"/>
		
				</div>
			</div>
			<div class="ui-info-wrap ui-dotted">
		  	<h3 class="ui-info-tit">商户信息</h3>
				<div class="ui-infobg">
					<table class="ui-info-tab">
				      <tr>
				       <td class="ui-oddtd">商户类型：</td><td>${usersSellerExtendMdl.sellerTypeName}</td>
				       <td class="ui-oddtd">商户状态:</td><td>${usersSellerExtendMdl.stateName}</td>
				      </tr>
				      <tr>
				     
				      <td class="ui-oddtd">商户开通时间:</td><td>${usersSellerExtendMdl.createTime?string("yyyy-MM-dd HH:mm:ss")} </td>
				      <td></td><td></td>
				      </tr>
					</table>
				
				</div>
			</div>
			
			<div class="ui-info-wrap ui-multi-wrap ui-info-two">
		  	<h3 class="ui-info-tit">手续费</h3>
		  	  <#list   usersSellerExtendMdl.feeSellerExtendMdl as mdl>
				  <div <#if mdl_index%2!=0>
			     	class="ui-infobg2"
			     	<#elseif mdl_index+1!=usersSellerExtendMdl.feeSellerExtendMdl?size>
			     	class="ui-infobg2  no-bottbor"
			     	<#else>
			     	class="ui-infobg"
			     	</#if>>
					 <table class="ui-info-tab">
					      <tr>
					      	<td class="ui-firtd ui-oddtd">
					      	<#if  mdl.operType=7> 收银手续费：
					      	<#elseif  mdl.operType==8>银行代付手续费：</#if></td>
					      	<input type="hidden" name="feeSellerExtendMdl[${mdl_index}].operType" value="${mdl.operType}"/>  
					      	<input type="hidden" name="feeSellerExtendMdl[${mdl_index}].id" value="${mdl.id}"/>  
					      	<td colspan='3'></td>
					      </tr>
					      <tr class="radio-wrap" data-operType='${mdl.operType}'>
					      	<td class="ui-oddtd">手续费类型：</td>
					      	<td colspan='3' class="ui-eventd "> 
					      		<span class="ui-rdo">
					      			<input type="radio" name="feeSellerExtendMdl[${mdl_index}].calculationMethod"  value="0" <#if mdl.calculationMethod==0>checked</#if>/>
					      			<label>按金额比例</label>
					      		</span>
					      		<span  class="ui-rdo">
					      			<input type="radio" name="feeSellerExtendMdl[${mdl_index}].calculationMethod" value="1" <#if mdl.calculationMethod==1>checked</#if>/>
					      			<label>按每笔固定金额</label>
					      		</span>               
					      	</td>
					      </tr>
					      <tr class="ui-lastr">
					      	 <td class="ui-oddtd">手续费值：</td>
					      	 <td colspan='3' class="ui-eventd fn-fee <#if mdl.calculationMethod==1>fn-hide</#if>">
						      	 <input type="text" name="feeSellerExtendMdl[${mdl_index}].scale" value="${mdl.scale}"  dataType="reqFeePerc"
						      	 class="validate[required,custom[integer],min[0],max[100]] ui-dinput ui-dinput-small"/> %
						      	 
						      	 <label class="ui-pos3">下限：</label>
						      	 <input type="text" name="feeSellerExtendMdl[${mdl_index}].minimumYuan" data-valid="min2Limit${mdl_index}" dataType="reqFeeBott" value="${mdl.minimumYuan}" 
						      	 class="validate[required,custom[number],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
						      	 
						      	 <label class="ui-pos3">上限：</label>
						      	 <input type="text" name="feeSellerExtendMdl[${mdl_index}].maximumYuan"   data-valid="max2Limit${mdl_index}" dataType="reqFeeTop" value="${mdl.maximumYuan}" 
						      	 class="validate[required,custom[number],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
					      	 </td>
					      	 <td colspan='3' class="ui-eventd fn-fee <#if mdl.calculationMethod==0>fn-hide</#if>">
						      	 <input type="text" name="feeSellerExtendMdl[${mdl_index}].fixedYuan" value="${mdl.fixedYuan}" dataType="reqFee"
						      	 class="validate[required,custom[number],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
					      	 </td>
					      </tr> 
				   </table>
				 </div>
			   </#list>
			</div>
			<input type="hidden" value="${usersSellerExtendMdl.sellerType}" name="sellerType"/>
		</#if>
		<!--平台商户-->
		<#if usersSellerExtendMdl.sellerType==1> 
		<form id="sellerUpdateForm" action="/runManage/billingMagage/updateSellFeeFeeNext" method="post">
		  <div class="ui-info-wrap ui-dotted">
		  	<h3 class="ui-info-tit">基本信息</h3>
				<div class="ui-infobg">
					<table class="ui-info-tab">
				      <tr>
				      	<td class="ui-oddtd">用户ID：</td>
				      	<td data-str='str'>${commonUserExtendMdl.userId}</td>
				      	<td class="ui-oddtd">账户名：</td>
				      	<td>${commonUserExtendMdl.username}</td>
				      </tr>
				      <tr>
				      	<td class="ui-oddtd">用户类型:</td>
				      	<td>${commonUserExtendMdl.userTypeName}</td>
				      	<td class="ui-oddtd">实名：</td>
				      	<td>${commonUserExtendMdl.realName}</td>
				      
				      </tr>
				      <tr>
				      	<td class="ui-oddtd">注册时间:</td>
				      	<td>${commonUserExtendMdl.createTimeString} </td>
				      	<#if commonUserExtendMdl.userType==0><!--0个人1企业-->
					      	<td class="ui-oddtd">身份证号：</td>
					      	<td>${usersPersonalExtendMdl.certificateNumber}</td>
				      	<#else>
					      	<td class="ui-oddtd">营业执照注册号：</td>
					      	<td>${usersEnterpriseExtendMdl.businessLicense}</td>
				      	</#if>
				      </tr>
					</table>
					<input type="hidden" value="${commonUserExtendMdl.userId}" name="userId"/>
				
					
				</div>
			</div>
			<div class="ui-info-wrap ui-dotted">
		  	<h3 class="ui-info-tit">商户信息</h3>
				<div class="ui-infobg">
					<table class="ui-info-tab">
				      <tr>
				       <td class="ui-oddtd">商户类型：</td><td>${usersSellerExtendMdl.sellerTypeName}</td>
				       <td class="ui-oddtd">商户状态:</td><td>${usersSellerExtendMdl.stateName}</td>
				      </tr>
				      <tr>
				      
				      <td class="ui-oddtd">商户开通时间:</td><td>${usersSellerExtendMdl.createTimeString}</td>
				      <td></td><td></td>
				      </tr>
					</table>
				
				</div>
			</div>
			<div class="ui-info-wrap ui-multi-wrap ui-info-two">
		  	<h3 class="ui-info-tit">手续费</h3>
		  	    <#list usersSellerExtendMdl.feeSellerExtendMdl as mdl>
					<div <#if mdl_index%2!=0>
				     	class="ui-infobg2"
				     	<#elseif mdl_index+1==usersSellerExtendMdl.feeSellerExtendMdl?size>
				     	class="ui-infobg  no-bottbor"
				     	<#else>
				     	class="ui-infobg"
				     	</#if>>
						<table class="ui-info-tab">
					      <tr>
					      	<td class="ui-oddtd">
					      	<#if  mdl.operType==7> 收银手续费：
					      	<#elseif  mdl.operType==8>银行代付手续费：</#if>
					      	<input type="hidden" name="feeSellerExtendMdl[${mdl_index}].operType" value="${mdl.operType}"/>  
					      	<input type="hidden" name="feeSellerExtendMdl[${mdl_index}].id" value="${mdl.id}"/>  
					      	</td>
					      	<td colspan='3'></td>
					      </tr>
					      <tr class="radio-wrap" data-operType='${mdl.operType}'>
					      	<td class="ui-oddtd">手续费类型：</td>
					      	<td colspan='3' class="ui-eventd "> 
					      		<span class="ui-rdo">
					      			<input type="radio" name="feeSellerExtendMdl[${mdl_index}].calculationMethod"  value="0" <#if mdl.calculationMethod=='0'>checked</#if>/>
					      			<label>按金额比例</label>
					      		</span>
					      		<span  class="ui-rdo">
					      			<input type="radio" name="feeSellerExtendMdl[${mdl_index}].calculationMethod" value="1" <#if mdl.calculationMethod=='1'>checked</#if>/>
					      			<label>按每笔固定金额</label>
					      		</span>               
					      	</td>
					      </tr>
					      <tr class="ui-lastr">
					      	 <td class="ui-oddtd">手续费值：</td>
					      	 <td colspan='3' class="ui-eventd fn-fee">
						      	 <input type="text" name="feeSellerExtendMdl[${mdl_index}].scale" value="${mdl.scale}"  dataType="reqFeePerc"
						      	 class="validate[required,custom[integer],min[0],max[100]] ui-dinput ui-dinput-small"/> %
						      	 
						      	 <label class="ui-pos3">下限：</label>
						      	 <input type="text" name="feeSellerExtendMdl[${mdl_index}].minimumYuan" data-valid="minLimit${mdl_index}" dataType="reqFeeBott" value="${mdl.minimumYuan}" 
						      	 class="validate[required,custom[number],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
						      	 
						      	 <label class="ui-pos3">上限：</label>
						      	 <input type="text" name="feeSellerExtendMdl[${mdl_index}].maximumYuan" data-valid="maxLimit${mdl_index}" dataType="reqFeeTop" value="${mdl.maximumYuan}" 
						      	 class="validate[required,custom[number],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
					      	 </td>
					      	 <td colspan='3' class="ui-eventd fn-fee <#if mdl.calculationMethod==0>fn-hide</#if>">
						      	 <input type="text" name="feeSellerExtendMdl[${mdl_index}].fixedYuan" value="${mdl.fixedYuan}" dataType="reqFee"
						      	 class="validate[required,custom[number],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
					      	 </td>
					      </tr> 
				      	
					  </table>
					</div>
				</#list>
			</div>
			<input type="hidden" value="${usersSellerExtendMdl.sellerType}" name="sellerType"/>
		  
		</#if>  
		<div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	       <input type="submit" class="ui-red-btn ui-pos3" value="下一步" />
	   </div>
	   </form>
  </div>
  
</div>
</body>
</html>