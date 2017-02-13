
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>系统参数管理-编辑</title>
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
    $(function(){
	    $("#editMerch").validationEngine({
			maxErrorsPerField: 1
		});
    	numOnly();
    });
     
	</script>
</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	<#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">系统参数管理<span>></span></a>
		<span class="crumbs-tit">编辑系统参数</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerch" method="post" action="/system/param/editConfirm" >
	  	<input type="hidden" value="${systemParam?if_exists.id?if_exists}" name="id"/>
			<div class="ui-info-wrap">
  	  			<h3 class="ui-info-tit"></h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr>
				            <td class="ui-oddtd">参数名称：</td>
				            <td>
				            	${systemParam?if_exists.title?if_exists}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">参数说明：</td>
				            <td>
				               ${systemParam?if_exists.describe?if_exists}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">参数值：</td>
				            <td>
				            	<#if systemParam?if_exists.ignoreRule?if_exists == 0><!--提现金额处理成数字-->
				            	    <#if  systemParam?if_exists.id?if_exists == 6><!--IP钓鱼只有0，1-->
						                <select class="ui-dselect" name="value">
						                	<option value="0" <#if systemParam?if_exists.value?if_exists == 0>selected="selected"</#if>>0</option>
						                	<option value="1" <#if systemParam?if_exists.value?if_exists == 1>selected="selected"</#if>>1</option>
						                </select>
				            		<#else>	
				            			<input type="text" value="${systemParam?if_exists.value?if_exists}" dataType="reqParam" class="validate[required,custom[number],min[0]] ui-dinput <#if systemParam?if_exists.id==2>numOnly</#if>" name="value" />
				            	    </#if>
				            	<#elseif systemParam?if_exists.ignoreRule?if_exists == 1>
					                <select class="ui-dselect" name="value">
					                	<option value="0" <#if systemParam?if_exists.value?if_exists == 0>selected="selected"</#if>>开</option>
					                	<option value="1" <#if systemParam?if_exists.value?if_exists == 1>selected="selected"</#if>>关</option>
					                </select>
				            	</#if>				            	

				            </td>
				          </tr>
				          </tbody>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      <input type="submit" class="ui-red-btn ui-pos3" value="下一步" />
	    </div>
		</form>
	</div>
</div>
</body>
</html>