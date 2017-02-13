<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>增值业务管理平台</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<link rel="stylesheet" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/control.js"></script>
	<script>
	var showMenu=false;//记录收缩状态
    var currentId=false;
	/*二三级栏目资源*/
	var level={
      <#if menudata?has_content>
		   <#list menudata as list>
				<#if list.childList?has_content>
					<#list list.childList as child>
					 <#if child.resourceType?trim!='NOMENU' && child.resourceType?trim!='NOMENULIST'>
					'${child.resourceId}':{
					  'parentId':'${child.parentId?if_exists?default("null")}',
                      'resourceId':'${child.resourceId}',
                      'resourceUrl':'${child.url}',
                      'name':'${child.name}',
                      'resourceType':'${child.resourceType}',
                       'childList':[
                             <#assign index = 0>
                             <#list child.childList as childs>
                              <#if childs.resourceType?trim!='NOMENU' && childs.resourceType?trim!='NOMENULIST'>
                              <#if index != 0>,</#if>	
                             {
                              'parentId':'${childs.parentId?if_exists?default("null")}',
                              'resourceId':'${childs.resourceId}',
                              'resourceUrl':'${childs.url}',
                              'name':'${childs.name}',
                              'resourceType':'${childs.resourceType}'
                             }
                             <#assign index = index + 1>
                             </#if>
                            </#list>
                       ]
					}<#if !list_has_next && !child_has_next> <#else>,</#if>
					</#if>					
					 </#list>
				 </#if>
		  </#list>
	 </#if>
      };
      $(function(){   
		  //获取iframe地址
		  //var param=location.search;
		  //if(param.indexOf("?")>-1){
		//	  $("#link-content").attr("src",param.split("&")[0].split("=")[1]);
		  //}
		   $("#link-content").attr("src",control.getCur());
		  // 初始化选择一级菜单
		  var navId=$(".sm-ui-nav-item-current").index(),
		      subNavId=$(".sm-ui-subnav-item-current").index();
		   // 初始化选择二级显示
		  $("#subNav").find(".sm-ui-subnav-main").eq($(".sm-ui-nav-item-current").index()).show().siblings().hide();
		   
		   // 一级菜单
		  $("#Nav").find(".sm-ui-nav-item").hover(function(){
		  	    navId=$(".sm-ui-nav-item-current").index();
		  	   $(this).addClass("sm-ui-nav-item-current").siblings().removeClass("sm-ui-nav-item-current")
		  	   $("#subNav").find(".sm-ui-subnav-main").eq($(this).index()).show().siblings().hide();

                $("#subNav").find(".sm-ui-subnav-main").eq($(this).index()).hover(function() {
                   $("#Nav").find(".sm-ui-nav-item").eq($(this).index()).addClass("sm-ui-nav-item-current").siblings().removeClass("sm-ui-nav-item-current");
                   $("#subNav").find(".sm-ui-subnav-main").eq($(this).index()).show().siblings().hide();
                }, function() {
                 $("#Nav").find(".sm-ui-nav-item").eq(navId).addClass("sm-ui-nav-item-current").siblings().removeClass("sm-ui-nav-item-current")
               $("#subNav").find(".sm-ui-subnav-main").eq(navId).show().siblings().hide();

                });
		  },function(){
               $("#Nav").find(".sm-ui-nav-item").eq(navId).addClass("sm-ui-nav-item-current").siblings().removeClass("sm-ui-nav-item-current")
               $("#subNav").find(".sm-ui-subnav-main").eq(navId).show().siblings().hide();
		  });


		   // 一级菜单点击
		  $("#Nav").find(".sm-ui-nav-item").click(function(event) {
		  	   navId=$(this).index();
		  	   subNavId=0;
               $(this).addClass("sm-ui-nav-item-current").siblings().removeClass("sm-ui-nav-item-current")
		  	   $("#subNav").find(".sm-ui-subnav-main").eq($(this).index()).show().siblings().hide();
		  	   $(".sm-ui-subnav-item").removeClass("sm-ui-subnav-item-current")
		  	   $("#subNav").find(".sm-ui-subnav-main").eq($(this).index()).find(".sm-ui-subnav-item").eq(subNavId).click();
		  	   //ajaxLeftMenu(this.id);
		  });
		//  $(".sm-ui-nav-item").each(function(i){
		// 	if(this.id==${resourceId}){
		// 		$(this).click();
		//  	}
		//  })

		 // 二级菜单
		  $(".sm-ui-subnav-item").hover(function() {
		  	    $(".sm-ui-subnav-item").removeClass("sm-ui-subnav-item-current");
		     	$(this).addClass('sm-ui-subnav-item-current');
		  }, function() {
		  	    $(".sm-ui-subnav-item").removeClass("sm-ui-subnav-item-current");
		  	    $(".sm-ui-subnav-main").eq(navId).find(".sm-ui-subnav-item").eq(subNavId).addClass('sm-ui-subnav-item-current');
		  });
		 // 二级菜单点击
		  $(".sm-ui-subnav-item").click(function() {
		  	    subNavId=$(this).index()
		  	    navId=$(this).parent(".sm-ui-subnav-main").index()
		  	    $(".sm-ui-subnav-item").removeClass("sm-ui-subnav-item-current");
		     	$(this).addClass('sm-ui-subnav-item-current');
		     	/*选中一级*/
		     	$(".sm-ui-nav-item").eq(navId).addClass("sm-ui-nav-item-current").siblings().removeClass("sm-ui-nav-item-current");
		     	/*展现一级下的二级*/
		     	$("#subNav").find(".sm-ui-subnav-main").eq(navId).show().siblings().hide();
		     	 control.objectLeftMenu(this.id,currentId);
		     	//ajaxLeftMenu(this.id);
		  })
		  
		 /// $(".sm-ui-subnav-main").eq(navId).find(".sm-ui-subnav-item").eq(0).click();
		  
		 // 三级菜单点击
		  $("#leftMenu").delegate('.sm-ui-leftmenu-item', 'click', function(event) {
		        $(this).addClass("sm-ui-leftmenu-item-current").siblings().removeClass("sm-ui-leftmenu-item-current")
		  });


   //设置快捷菜单        
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
<body class="easyui-layout" id="page">
	<div data-options="region:'north',border:false" style="min-width:1280px;height:142px;background:#333333;overflow:hidden">
		<div class="sm-ui-header">
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
		<div class="sm-ui-nav">
			<ul class="sm-ui-nav-main" id="Nav">
				<#if menudata?has_content>
					<#list menudata as list><!-- m-ui-nav-item-current -->
						<li class="sm-ui-nav-item" id="${list.resourceId}">
							<a href="${list.url}" target="mainCont">${(list.name)?if_exists}</a>
						</li>
					</#list>
				</#if>
			</ul>
		</div>
		<div class="sm-ui-subnav" id="subNav"><!-- sm-ui-subnav-item-current -->
			<#if menudata?has_content>
				<#list menudata as list>
					<ul class="sm-ui-subnav-main">
						<#if list.childList?has_content>
							<#list list.childList as child>
								<li class="sm-ui-subnav-item" id="${child.resourceId}">
									<a href="${child.url}"  target="mainCont">${child.name?if_exists}</a>
									<input type="hidden" value="${child.resourceType}" class="checkButton">
								</li>
							</#list>
						</#if>
					</ul>
				</#list>
			</#if>
		</div>
	</div>
	<div data-options="region:'west',split:true,border:false,split:false,title:'  '" style="width:200px;background-color: #ededed;padding-right:10px;">
		<div style="width: 100%;height:100%;background-color: #fff;">
			<div class="sm-ui-leftmenu" id="leftMenu"><!--  sm-ui-leftmenu-item-current -->
			
			</div>
		</div>
	</div>
	<div data-options="region:'center',border:false" style="background:#ededed">
		<iframe id="link-content" scrolling="auto" frameborder="0"  name="mainCont" src="" style="width:100%;height:100%;"></iframe>
	</div>
	 <#include "/common/include/shortcut.ftl">
	<div class="sm-ui-set-content">
	 ${fShortcur(menulist,false)}
    </div>
</body>
</html>