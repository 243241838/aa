<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>用户管理-商户管理-商户类别管理-新增预览</title>
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
	</div>
   <div class="ui-info-content">
   <form id ="addMerchNext" method="post" action="/userManage/sellTypeManage/addSellLevelOk" >
		<div class="ui-info-wrap ">
	  	<h3 class="ui-info-tit">商户类别信息 </h3>
			<div class="ui-infobg">
				<table class="ui-center-tab">
		          <tbody>
		          <tr>
		            <td class="ui-oddtd">商户类别：</td>
		            <td>
		            	${userLevelExtendMdl.levelName}
		            </td>
		          </tr>
		          <tr>
		            <td class="ui-oddtd">日收银限额：</td>
		            <td>
		            	${userLevelExtendMdl.dayMoneyYuan} 元
		            </td>
		          </tr>
		          <tr>
		            <td class="ui-oddtd">月收银限额：</td>
		            <td>
		            	${userLevelExtendMdl.monthMoneyYuan} 元
		            </td>
		          </tr>
				</tbody>
			   </table>
			</div>
		</div>
		<input type="hidden" value="${userLevelExtendMdl.levelName}" name="levelName"/>
		<input type="hidden" value="${userLevelExtendMdl.dayMoneyYuan}" name="dayMoneyYuan"/>
		<input type="hidden" value="${userLevelExtendMdl.monthMoneyYuan}" name="monthMoneyYuan"/>
		<div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      <a href="javascript:ajaxSubmit('addMerchNext','dlgOk2','dlgWarn');" class="ui-red-btn ui-pos3">下一步</a>
	    </div>
	</form>
	</div>
  </div>
<!--成功提示-->	      
<div id="dlgOk2" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
    <div class="ui-dlg-text">商户类别新增成功！</div>
    <a data-fn="backToList"  href="/userManage/sellTypeManage/selectSellType" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog" data-options="iconCls:'icon-save'">
		<div class="ui-dlg-content ui-relative">
	       <div class="ui-dlg-text">失败</div>
	       <a href="#" class="ui-red-btn ui-toClose">确 定</a>
		</div>
	</div>	
</body>
</html>