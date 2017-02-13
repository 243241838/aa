<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Basic Dialog - jQuery EasyUI Demo</title>
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
	<!--内容管理的菜单-->
	<div class="ui-main-container">
		<div class="crumbs" id="crumbs">
			<a class="crumbs-link" href="#">内容管理 <span>></span></a>
			<span class="crumbs-tit">栏目管理</span>
		</div>
		<div class="ui-menu-container">
			 <ul id="content-menu">
			 	<li class="ui-menu-item ui-meun-item-open">
		 		  <i class="sm-ui-icon-arrow"></i>
					<a class="ui-menu-item-name" href="#">自助服务</a>
					<ul class="ui-submenu-list">
						<li class="ui-submenu-item ui-submenu-fir">
							<a class="ui-submenu-item-name" href="#">密码自助</a>
						</li>
						<li class="ui-submenu-item">
							<a class="ui-submenu-item-name" href="#">账户自助</a>
						</li>
					</ul>
				</li>
				<li class="ui-menu-item">
	 		  <i class="sm-ui-icon-arrow"></i>
				<a class="ui-menu-item-name" href="#">常见问题</a>
					<ul class="ui-submenu-list fn-hide">
						<li class="ui-submenu-item ui-submenu-fir">
							<a class="ui-submenu-item-name" href="#">注册</a>
						</li>
						<li class="ui-submenu-item">
							<a class="ui-submenu-item-name" href="#">账户设置</a>
						</li>
						<li class="ui-submenu-item">
							<a class="ui-submenu-item-name" href="#">交易记录</a>
						</li>
					</ul>
			  </li>
			 </ul>
		</div>
		<div  class="ui-info-container">
		   <div class="ui-info-content">
		   	 <div class="ui-info-wrap ui-dotted">
				  	<h3 class="ui-info-tit">基本信息</h3>
						<div class="ui-infobg">
							<table class="ui-info-tab">
					      <tr>
					      	<td class="ui-oddtd">实名：</td><td>克劳</td>
					      	<td class="ui-oddtd">身份证图片:</td>
					      	<td class="ui-img-wrap">
					      		正面 <span class="ui-pos">反面</span>
					      	</td>
					      </tr>
					      <tr>
					      	<td class="ui-oddtd">实名认证申请时间：</td><td>2014-07-03 19:19:39</td>
					      	<td ></td>
					      	<td rowspan='2' class="ui-img-wrap">
					      		<a href="javascript:;" onclick="maxPic(this);">
			                 <img src="./images/cert.jpg" class="ui-info-card ui-one"/>
			                 <img src="./images/suc_fal.png" class="fn-hide pic-max"/>
			              </a>
			              <img src="./images/cert.jpg" class="ui-info-card ui-two"/>
					      	</td>
					      </tr>
					      <tr>
					      	<td class="ui-oddtd">身份证号码：</td><td>336396658493214632</td>
					      	<td></td><td></td>
					      </tr>
							</table>
						</div>
					</div>
		   </div>
	  </div>
	</div>
</body>
</html>