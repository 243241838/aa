<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>保险经纪管理平台</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/index.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/control.js"></script>
	
</head>
<body class="easyui-layout" id="page">
	<div data-options="region:'north',border:false" class="ui-nav-wrap">
		
		<div class="sm-ui-header">
			<div class="sm-ui-operation-main">
				<span>操作员</span>
				<span>${userInfo?if_exists.nickname}</span>
				<!--
				<span>您当前有 <a class="ui-red" href="#"><strong>2条</strong></a> 待审核消息。</span>
				-->
				<span>上次登录时间：${lastLoginTime?if_exists}</span>
				<a class="sm-ui-logout" href="${base}/j_spring_security_logout" title="安全退出">安全退出</a>
			</div>
		</div>

		<div class="sm-ui-nav" style="height:100%;">
	    <a  class="sm-ui-logo" href="${base}/" title="后台管理">
				<img src="${base}/resource/images/logo.png" width="59" height="56" />
				<img src="${base}/resource/images/logot.png" width="168" height="22" />
			</a>
		</div>
		
	</div>
	
	<div data-options="region:'center',border:false" class="index-bg">
		<div class="ui-index-outer ">
			<div class="ui-index-two fn-clear">
		      <ul class="ui-index-list">
		      	<#if menudata?has_content>
					<#list menudata as list>
					    <#if list_index lt 8>

				      	  <li class="ui-index-item ${list.menuImage?if_exists}">
				      	    <a onclick="control.setCur('${list.url?if_exists}')" href="${base}/toHome?url=${list.url?if_exists}&resourceId=${list.resourceId?if_exists}"></a>
				      	  </li>
					    </#if>
					</#list>
				</#if>
				<!--
		      	<li class="ui-index-item"><a href="/menu.html?toUrl=dialog.html"></a></li>
		      	<li class="ui-index-item idx-icon-product"><a href="/menu.html?toUrl=product/product.html"></a></li>
		      	<li class="ui-index-item idx-icon-source"><a href="/menu.html?toUrl=dialog.html"></a></li>
		      	<li class="ui-index-item idx-icon-operate"><a href="/menu.html?toUrl=dialog.html"></a></li>
		      	<li class="ui-index-item idx-icon-content"><a href="/menu.html?toUrl=dialog.html"></a></li>
		      	<li class="ui-index-item idx-icon-staticis"><a href="/menu.html?toUrl=dialog.html"></a></li>
		      	<li class="ui-index-item idx-icon-trade"><a href="/menu.html?toUrl=dialog.html"></a></li>
		      	<li class="ui-index-item idx-icon-finance"><a href="/menu.html?toUrl=dialog.html"></a></li>
		      	-->
		      </ul>
		      <ul class="ui-index-list ui-index-list2">
		        <#if menudata?has_content>
					<#list menudata as list>
					    <#if list_index gt 7>
				      	  <li class="ui-index-item ${list.menuImage?if_exists}"><a href="${base}/toHome?url=${list.url?if_exists}&resourceId=${list.resourceId?if_exists}"></a></li>
					    </#if>
					</#list>
				</#if>
		      	<!--<li class="ui-index-item idx-icon-increment"><a href="/menu.html?toUrl=dialog.html"></a></li>
		      	<li class="ui-index-item idx-icon-system"><a href="/menu.html?toUrl=dialog.html"></a></li>
		      	<li class="ui-index-item idx-icon-client"><a href="/menu.html?toUrl=dialog.html"></a></li>-->
		      </ul>
	          <div class="menu-guide">
			      <a class="idx-arr-right" href="javascript:menuLeft();"></a>
			      <a class="idx-arr-left" href="javascript:menuRight();"></a>
		
			      <a class="idx-dot-left idx-dot-on" href="javascript:menuRight();"></a>
			      <a class="idx-dot-right" href="javascript:menuLeft();"></a>
		      </div>
	      </div>
		</div>
	</div>
	<script>
     $(function(){
        <#if menudata?size lt 9>
         $('.ui-index-list2').remove();
         $('.menu-guide').remove();
        </#if>
        var w=document.body.clientWidth;
        var left=0.5*parseFloat(w-parseFloat($('.ui-index-list').css('width')))-10;
        $('.ui-index-list').css('margin','35px '+left+'px');
        $('.ui-index-list2').css('margin-left',parseFloat(left+40)+'px');
     });
     function menuLeft(){
	        $('.ui-index-two').animate({'marginLeft':'-100%'},1000,function(){
	        	$('.idx-dot-right').addClass('idx-dot-on').prev('.idx-dot-left').removeClass('idx-dot-on');	
	        });
	        $('.idx-arr-right').fadeOut(500);
	        $('.idx-arr-left').fadeIn(1000);
     }
     function menuRight(){
	      $('.ui-index-two').animate({'marginLeft':'0'},1000,function(){
	        $('.idx-dot-left').addClass('idx-dot-on').next('.idx-dot-right').removeClass('idx-dot-on');
	      });
	      $('.idx-arr-right').fadeIn(1000);
	      $('.idx-arr-left').fadeOut(500);
     }
	</script>
</body>
</html>