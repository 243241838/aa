<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>异常页面</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
</head>
<body>
  <div class="ui-info-box">
	<div class="ui-crumbs" id="crumbs">
	    <span>当前位置：</span>
		<a href="${exception.returnPage}">${exception.module}</a><em>></em>
		<span>异常</span>
	</div>
	<div class="error-page">
		<div class="error-page-out fn-clear">
			<i class="icon"></i>
			<span class="main">
				<h2 class="e-tit">抱歉！无法访问本页。</h2>
				<p class="e-reason">出错原因：${exception.message}</p>
			</span>
		</div>
		<#--
		<div class="error-page-out fn-clear">
			<i class="icon"></i>
			<span class="main">
				<h2 class="e-tit">抱歉！无法访问本页。</h2>
				<p class="e-reason">
					出错原因：
					<ul>
						<#list exception.stackTrace as _stackTrace>
							<li>${_stackTrace}</li>
						</#list>
					</ul>
				</p>
			</span>
		</div>
		-->
	</div>
 </div>
</body>
</html>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            