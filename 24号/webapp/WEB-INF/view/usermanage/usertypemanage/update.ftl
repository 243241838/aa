<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>用户管理-用户类别管理-编辑</title>
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
			moneyThousands();
		});
	</script>
</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
		<#include "/common/include/power.ftl">
	</div>
     <div class="ui-info-content">  
     <form id ="editUserTypeNext" method="post" action="/userManage/userTypeManage/updateUserTypeNext" >       
		<div class="ui-info-wrap ui-multi-wrap ui-info-two">
           	<h3 class="ui-info-tit">用户类别信息</h3>
			<div class="ui-infobg" style="padding-bottom:5px;">
		      <table class="ui-info-tab ">
		      <tr>
		      	<td class="ui-oddtd">用户类别：</td>
		      	<td>
		      		<input type="text" name="levelName" id="levelName" dataType="reqUserType" value="${userLevelExtendMdl.levelName}"  maxlength=40 class="validate[required,custom[name],custom[typeName],ajax2[ajaxUserEditType]] ui-dinput ui-dinput-small"/>
		      		<input type="hidden" name="id"  data-unique="id" value="${userLevelExtendMdl.id}" class="ui-dinput ui-dinput-small"/>
		      	</td>
		      	<td></td><td></td>
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
			<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd"><#if mdl.operType==0>充值手续费</#if><#if mdl.operType==1>提现手续费</#if>	<#if mdl.operType==2>转账手续费</#if><#if mdl.operType==3>收款手续费</#if>：</td><td></td><td></td><td></td>
		      	<input type="hidden" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].operType" value="${mdl.operType}"/>
		      </tr>
		      <tr class="radio-wrap">
		      	<td class="ui-oddtd">手续费类型：</td>
		      	<td colspan='3' class="ui-eventd"> 
		      		${mdl.calculationMethodName} 
		      		<input type="hidden" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].calculationMethod" value="${mdl.calculationMethod}"/>
		      		<input type="hidden" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].calculationMethodName" value="${mdl.calculationMethodName}"/>
		      	</td>
		      </tr>
		      <tr class="ui-lastr">
		      	<td class="ui-oddtd">手续费值：</td>
		      	<#if mdl.calculationMethod==0>
		      	<td colspan='3' class="ui-eventd fn-fee">
		      		${mdl.scale} %
		      		<label class="ui-pos3">下限：</label>
		      		${mdl.minimumYuan} 元
		      		<label  class="ui-pos3">上限：</label>
		      		${mdl.maximumYuan} 元
		      		<input type="hidden" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].scale"  value="${mdl.scale}"/>
		      		<input type="hidden" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].minimumYuan"  value="${mdl.minimumYuan}"/>
		      	    <input type="hidden" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].maximumYuan"  value="${mdl.maximumYuan}"/>
		      	</td>
		      	<#else>
		      	<td colspan='3' class="ui-eventd fn-fee">
		      		${mdl.fixedYuan} 元
		      		<input type="hidden" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].fixedYuan"  value="${mdl.fixedYuan}"/>
		      	</td>
		      	</#if>
		      </tr>
			</table>
		</div>
      </#list>
		    </div> 
		    <div class="ui-submit-warp">
		      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
		      <input type="submit" class="ui-red-btn ui-pos3" value="提 交" />
		    </div>
		    </form>
		</div> 
   </div>
</body>
</html>