<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>交易监控-日交易量查询</title>
    <link rel="stylesheet" type="text/css" href="/css/base.css">
    <link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
    <link rel="stylesheet" type="text/css" href="/css/plugins.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/use.css">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="/js/asset/css/carousel.css" rel="stylesheet">
    <link href="/js/asset/css/echartsHome.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="/js/asset/js/esl/esl.js"></script>
    <script src="/js/asset/js/codemirror.js"></script>
    <script src="/js/asset/js/javascript.js"></script>
    <link href="/js/asset/css/codemirror.css" rel="stylesheet">
    <link href="/js/asset/css/monokai.css" rel="stylesheet">
    <script src="/js/jquery.min.js"></script>
</head>

<body>
  <div class="ui-main-container" style="position:relative">
	<div class="crumbs" id="crumbs">
	 <#include "/common/include/power.ftl">
		<!-- <a class="crumbs-link" href="#">运营管理<span>></span></a>
		<a class="crumbs-link" href="#">交易监控<span>></span></a>
		<span class="crumbs-tit">日交易量查询</span> -->
	</div>
	<div class="ui-list-content">
	<!-- 列表 -->
	<div class="list-item fn-clear ui-relative">
		${fButton(list, 'EXPORTEXCEL','<a style="top: 38px" href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')}
		<!-- <a style="top: 38px" href="javascript:doExcel('/runManage/tradeMonitoring/volumeDayQueryExcel');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a> -->
 	  	<div style="padding-bottom:0" class="ui-info-wrap"><h3 class="ui-info-tit" style="text-align: center;">${date}交易量及成功率情况</h3></div>
		<div class="chart-main-out" tyle="margin-top:0">
	        <div id="main" class="chart-main" data-show-type="vDayQuery">
	            <span class="load"></span>
	        </div>
        </div>
        <form id="chartForm">
        	<input type="hidden" name="date" value="${date}">
        </form>
		<input type="hidden" id="excel-data"/>
	</div>
	<!-- 列表end -->
  </div>
 </div>
    <script src="/js/asset/js/bootstrap.min.js"></script>
    <script src="/js/chart.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script>
	$(function(){
		var exdata=$("#chartForm").serialize();
        $('#excel-data').val(exdata);
	})
	</script>
</body>
</html>