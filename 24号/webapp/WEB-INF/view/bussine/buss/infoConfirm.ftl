
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>业务管理-编辑</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>

</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	  <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">角色管理 <span>></span></a>
		<span class="crumbs-tit">新增角色</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerchs" method="post" action="${action?if_exists}" >
			<div class="ui-info-wrap">
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			           <tr class="platform-part">
				            <td class="ui-oddtd">业务编号：</td>
				            <td>
				            	${service?if_exists.serviceId}
				            </td>
				          </tr>
			          <tr class="platform-part">
				            <td class="ui-oddtd">业务名称：</td>
				            <td>
				            	${service?if_exists.serviceName}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">状态：</td>
				            <td>
				            <#if service.serviceSts == 10>上架</#if>
				            <#if service.serviceSts == 0>下架</#if>
				            <#if service.serviceSts == -10>锁定</#if>
				            <#if service.serviceSts == -11>禁用</#if>
				            </td>
				          </tr>
				            
				         
				          <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td>
				            	${service.effTimeStr} 	至  ${service.expTimeStr}
				            </td>
				          </tr>
				           <tr class="platform-part">
				            <td class="ui-oddtd">服务时间：</td>
				            <td>
				            	${service.serviceBeginTime} 	至  ${service.serviceEndTime}
				            </td>
				          </tr>
				          
				          </tbody>
				        <input type="hidden" name="serviceId" value="${service?if_exists.serviceId}"/>
				        <input type="hidden" name="serviceName" value="${service?if_exists.serviceName}"/>
				            <input type="hidden" name="serviceSts" value="<#if service.serviceSts == 10>10</#if>
				            <#if service.serviceSts == 0>0</#if>
				            <#if service.serviceSts == -10>-10</#if>
				            <#if service.serviceSts == -11>-11</#if>"/>
				          <input type="hidden" name="effTimeStr" value="${service?if_exists.effTimeStr}"/>
				          <input type="hidden" name="expTimeStr" value="${service?if_exists.expTimeStr}"/>
				          <input type="hidden" name="serviceBeginTime" value="${service?if_exists.serviceBeginTime}"/>
				          <input type="hidden" name="serviceEndTime" value="${service?if_exists.serviceEndTime}"/>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:void(0);" id="back" class="ui-red-btn">返 回</a>
	      <a href="javascript:ajaxSubmit('editMerchs','dlgOk2','dlgWarn');" class="ui-red-btn ui-pos3">保存</a>
	    </div>
		</form>
	</div>
</div>
<!--成功提示-->	      
<div id="dlgOk2" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
    <div class="ui-dlg-text"><#if service.sts !=1>编辑业务成功！<#else>新增业务成功！</#if></div>
    <a data-fn="backToList" href="/bussiness/bill/busspz" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog"  data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text"><#if service.sts !=1>编辑业务失败！<#else>新增业务失败！</#if></div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>
</body>
</html>