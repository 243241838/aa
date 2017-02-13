<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>角色管理-编辑</title>
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
		<!--<a class="crumbs-link" href="#">运营管理 <span>></span></a>
		<a class="crumbs-link" href="">风控管理 <span>></span></a>
		<span class="crumbs-tit">黑名单设置</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerchs" method="post" action="/role/doEdit" >
			<div class="ui-info-wrap">
  	  			<h3 class="ui-info-tit"></h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
				          <tr>
				            <td class="ui-oddtd">账户名：</td>
				            <td>
				            	${detail?if_exists.username}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">实名：</td>
				            <td>
				            	${detail?if_exists.realName}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">手机号码：</td>
				            <td>
				            	${detail?if_exists.mobile}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">电子邮箱：</td>
				            <td>
				            	${detail?if_exists.email}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">用户类型：</td>
				            <td>
				            	<#if detail?if_exists.userType == 0>
				            		个人用户
				            	<#else>
				            		企业用户
				            	</#if>
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">拉黑日期：</td>
				            <td>
				            	${detail?if_exists.createTime?string("yyyy-MM-dd")}
				            </td>
				          </tr>
				          <tr class="platform-part">
				            <td class="ui-oddtd">拉黑原因：</td>
				            <td>
				            	${detail?if_exists.reason?if_exists}
				            </td>
				          </tr>
				          </tbody>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp ui-submit-one">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	    </div>
		</form>
	</div>
</div>
</body>
</html>