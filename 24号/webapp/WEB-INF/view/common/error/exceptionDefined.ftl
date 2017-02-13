<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>异常页面</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<link rel="stylesheet" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/use.css">
</head>
<body>
	<div class="crumbs" id="crumbs">
		<a class="crumbs-link" href="${exception.returnPage}">${exception.module}<span>&gt;</span></a>
		<span class="crumbs-tit">异常</span>
	</div>
	<div class="error-page">
		<div class="error-page-out fn-clear">
			<i class="icon"></i>
			<span class="main">
				<h2 class="e-tit">${exception.message}。</h2>
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
	</div>
</body>
</html>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            