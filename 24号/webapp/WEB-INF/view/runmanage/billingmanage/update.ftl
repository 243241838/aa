<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-计费管理-用户类别手续费-设置</title>
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
			$("#editUserTypeNext").validationEngine({
				maxErrorsPerField: 1
			});
			var str=pad2('${userLevelExtendMdl.id}',6);
			$('input[data-str="str"]').val(str);
			moneyThousands();
		});
	</script>
</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	  <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">运营管理<span>></span></a>
		<a class="crumbs-link" href="#">计费管理<span>></span></a>
		<span class="crumbs-tit">用户类别手续费</span>-->
	</div>
     <div class="ui-info-content"> 
     <form id ="editUserTypeNext" method="post" action="/runManage/billingMagage/updateUserTypeNext" >       
		<div class="ui-info-wrap ui-multi-wrap ui-info-two">
           	<h3 class="ui-info-tit">用户类别手续费</h3>
			<div class="ui-infobg" style="padding-bottom:5px;">
		      <table class="ui-info-tab ">
		      <tr>
		        <td class="ui-oddtd">用户类别ID：</td>
		      	<td>
		      		<input type="text" data-str="str" name="id" value="${userLevelExtendMdl.id}" class="ui-dreadOnly" readOnly/>
		      	</td>
		      	<td class="ui-oddtd">用户类别：</td>
		      	<td>
		      		<input type="text" name="levelName" id="levelName" value="${userLevelExtendMdl.levelName}" class="ui-dreadOnly" readOnly/>
		      	</td>
		      </tr>
		      </table>
		      </div>
		      <!--循环手续费-->
		     <#list userLevelExtendMdl.feeLevelExtendMdl as mdl>
		     	<div <#if mdl_index%2!=0>
			     	class="ui-infobg"
			     	<#elseif mdl_index+1!=userLevelExtendMdl.feeLevelExtendMdl?size>
			     	class="ui-infobg2  no-bottbor"
			     	<#else>
			     	class="ui-infobg2"
			     	</#if>>	
				<table class="ui-info-tab ">
		      <tr>
		      	<td class="ui-oddtd"><#if mdl.operType==0>充值手续费</#if><#if mdl.operType==1>提现手续费</#if>	<#if mdl.operType==2>转账手续费</#if><#if mdl.operType==3>收款手续费</#if>：</td><td></td><td></td><td></td>
		      	<input type="hidden" value="${mdl.operType}" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].operType"/>
		      	<input type="hidden" value="${mdl.id}" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].id"/>
		      </tr>
		      <tr class="radio-wrap">
		      	<td class="ui-oddtd">手续费类型：</td>
		      	<td colspan='3' class="ui-eventd"> 
		      		<span class="ui-rdo">
		      			<input type="radio" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].calculationMethod"  value="0" <#if mdl.calculationMethod==0>checked</#if> />
		      			<label for="rdo1">按金额比例</label>
		      		</span>
		      		<span  class="ui-rdo">
		      			<input type="radio"  name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].calculationMethod" value="1" <#if mdl.calculationMethod==1>checked</#if> />
		      			<label for="rdo2">按每笔固定金额</label>
		      		</span>               
		      	</td>
		      </tr>
		      <tr class="ui-lastr">
		      	<td class="ui-oddtd">手续费值：</td>
		      	<td colspan='3' class="ui-eventd fn-fee">
		      		<input type="text" value="${mdl.scale}" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].scale" dataType="reqFeePerc" class="validate[required,custom[number],min[0],max[100]] ui-dinput ui-dinput-small"/> %
		      		<label class="ui-pos3">下限：</label>
		      		<input type="text" value="${mdl.minimumYuan}" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].minimumYuan"  dataType="reqFeeBott" data-valid="minLimit${mdl_index}"  class="validate[required,custom[number],min[0],max[9999999999]] qfw ui-dinput ui-dinput-small"/> 元
		      		<label  class="ui-pos3">上限：</label>
		      		<input type="text" value="${mdl.maximumYuan}" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].maximumYuan" dataType="reqFeeTop"  data-valid="maxLimit${mdl_index}"  class="validate[required,custom[number],min[0],max[9999999999]] qfw ui-dinput ui-dinput-small"/> 元
		      	</td>
		      	<td colspan='3' class="ui-eventd fn-fee fn-hide">
		      	<input type="text" value="${mdl.fixedYuan}" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].fixedYuan" dataType="reqFee" class="validate[required,custom[number],min[0],max[9999999999]] qfw ui-dinput ui-dinput-small qfw"/> 元
		      	</td>
		      </tr>
				</table>
			</div>
			
		      </#list>
		      
		      <div class="ui-submit-warp">
		      <a href="javascript:history.go(-1);" class="ui-red-btn">返&nbsp&nbsp回</a>
		       <input type="submit" class="ui-red-btn ui-pos3" value="提 交" />
		    </div>
		    </form>
		</div> 
	</div>
</body>
</html>