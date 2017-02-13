<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-计费管理-用户类别手续费-设置预览</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script>
	  $(document).ready(function(){        
			
			var str=pad2('${userLevelExtendMdl.id}',6);
			$('input[data-str="str"]').val(str);
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
    <form id ="addUserTypeNext" method="post" action="/runManage/billingMagage/updateUserTypeOk" >     
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
	      		${userLevelExtendMdl.levelName}
	      		<input type="hidden" name="levelName" value="${userLevelExtendMdl.levelName}"/>
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
			<table class="ui-info-tab">
		      <tr>
		      	<td class="ui-oddtd"><#if mdl.operType==0>充值手续费</#if><#if mdl.operType==1>提现手续费</#if>	<#if mdl.operType==2>转账手续费</#if><#if mdl.operType==3>收款手续费</#if>：</td><td></td><td></td><td></td>
		      	<input type="hidden" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].operType" value="${mdl.operType}"/>
		      	<input type="hidden" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].id" value="${mdl.id}"/>
		      </tr>
		      <tr class="radio-wrap">
		      	<td class="ui-oddtd">手续费类型：</td>
		      	<td colspan='3' class="ui-eventd"> 
		      		${mdl.calculationMethodName} 
		      		<input type="hidden" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].calculationMethod" value="${mdl.calculationMethod}"/>
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
    <a href="javascript:history.go(-1);" class="ui-red-btn">返  回</a>
    <a href="javascript:ajaxSubmit('addUserTypeNext','dlgOk2','dlgWarn');" class="ui-red-btn ui-pos3">提  交</a>
  </div>
 </div>
</div>
<!--成功提示-->	      
<div id="dlgOk2" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
    <div class="ui-dlg-text">用户类别手续费设置成功！</div>
    <a data-fn="backToList" href="/runManage/billingMagage/userType" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog" data-options="iconCls:'icon-save'">
		<div class="ui-dlg-content ui-relative">
	       <div class="ui-dlg-text">用户类别手续费设置失败</div>
	       <a href="#" class="ui-red-btn ui-toClose">确 定</a>
		</div>
	</div>	
</body>
</html>