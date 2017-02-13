<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>增值业务管理平台</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<link rel="stylesheet" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/use.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/control.js"></script>
	<script>
  $(function() {
	$(".sm-ui-icon-set").hover(function() {
		var top = $(this).offset().top + 60
		var left = $(this).offset().left + 20 - 75
		$(".sm-ui-set-content").css({
			top: top,
			left: left
		}).show();
		$(".sm-ui-set-content").hover(function() {
			$(this).show()
		}, function() {
			$(this).hide()
		});
	}, function() {
		$(".sm-ui-set-content").hide();
	});
})
	</script>
</head>
<body>
	<div class="sm-ui-header" style="min-width:1280px">
		<a  class="sm-ui-logo" href="/" title="后台管理">
			<img src="images/logo.png" width="360" height="40" />
		</a>
		<div class="sm-ui-operation-main">
			<span class="sm-ui-fc-write">您好！操作员${userInfo?if_exists.nickname}</span>
				<span class="sm-ui-fc-cry">上次登录IP：${ip?if_exists} ${city?if_exists}</span>
				<span class="sm-ui-fc-cry">上次登录时间：${lastLoginTime?if_exists}</span>
			<a class="sm-ui-icon-set" href="#" title="设置"></a>
			<a class="sm-ui-icon-logout" href="/loginOut" title="退出"></a>
		</div>
	</div>
	<div class="home-show-out">
		<div class="home-show-in">
			<div class="home-menu-list">
				<!-- <a href="" class="icon menu_user spec"></a>
				<a href="" class="icon menu_fund"></a>
				<a href="" class="icon menu_cash"></a>
				<a href="" class="icon menu_cont"></a>
				<a href="" class="icon menu_statis spec"></a>
				<a href="" class="icon menu_oper"></a>
				<a href="" class="icon menu_sys"></a> -->
				<#if menudata?has_content>
					<#list menudata as list>
						<a onclick="control.setCur('${list.url?if_exists}')" href="/toHome?url=${list.url?if_exists}&resourceId=${list.resourceId?if_exists}" class="icon ${list?if_exists.menuImage} <#if list_index==0||list_index==4>spec</#if>"></a>
					</#list>
				</#if>
			</div>
		</div>
	</div>
	 <#include "/common/include/shortcut.ftl">
    <div class="sm-ui-set-content">
    ${fShortcur(menulist,true)}
    </div>
</body>
</html>
