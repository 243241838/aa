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
	<div class="crumbs" id="crumbs">
		<a class="crumbs-link" href="${exception.returnPage}">${exception.module}<span>&gt;</span></a>
		<span class="crumbs-tit">异常</span>
	</div>
	<div class="error-page">
		<div class="error-page-out fn-clear">
			<i class="icon"></i>
			<span class="main">
				<h2 class="e-tit">抱歉！您访问的页面不存在。</h2>
				<p class="e-reason">
					出错原因：
					<#if ex?has_content>${(ex.info)?if_exists}</#if>
					<#if ex?has_content>${(ex.error.message)?if_exists}</#if>
				</p>
			</span>
		</div>
	</div>
</body>
</html>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            