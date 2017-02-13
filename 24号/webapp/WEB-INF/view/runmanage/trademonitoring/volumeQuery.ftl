<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>交易监控-交易量查询</title>
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
		<span class="crumbs-tit">交易量查询</span> -->
	</div>
	<div class="ui-list-content">
	  <!-- 搜索 -->
	  <div class="search-item">
		<form name="searchform" method="post" action="" id ="chartForm" class="ui-search-form">
			<ul class="search-list fn-clear">
				<li>
					<span class="name">交易时间：</span>
					<input id="startTime" name="amountMinuteBegin" class="easyui-datebox" vlaue="${amountMinuteBegin?if_exists}" validType="mdM['#endTime']">
					至
					<input id="endTime" name="amountMinuteEnd" class="easyui-datebox" value="${amountMinuteEnd?if_exists}" validType="mdM['#startTime']">
				</li>
                <li>
                    <span class="name">交易类型：</span>
                    <select name="operType" class="ui-dselect ui-dselect-small">
                      		<option value="">全部</option>
                    	<#if userObjectBinary?has_content>
                    		<#list userObjectBinary as list>
                        		<option value="${list.key?if_exists}">${list.value?if_exists}</option>
                        	</#list>
                        </#if>
                    </select>
                </li>
				<li class="btn-group">
                    <input style="font-size:16px;" type="button" id="btn-refresh" class="easyui-linkbutton search-btn" value="查 询">
				</li>
			</ul>
		</form>
		<input type="hidden" id="excel-data"/>
	  </div>
	<!-- 搜索end -->
	<!-- 列表 -->
	<div class="list-item fn-clear ui-relative">
		${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')}
		<!-- <a href="javascript:doExcel('/runManage/tradeMonitoring/transactionListExcel');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a> -->
		<div class="chart-main-out">
	        <div id="main" class="chart-main" data-show-type="vQuery">
	            <span class="load"></span>
	        </div>
	    </div>
	    ${fButton(list, 'DETAILS','<input id="checkDetailsURL" type="hidden" value="@URL@">')}
	</div>
	<!-- 列表end -->
  </div>
 </div>
    <script src="/js/asset/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script>
	$(function(){
		dateValid();
		$('#startTime').datebox("setValue","${amountMinuteBegin?if_exists}");
		$('#endTime').datebox("setValue","${amountMinuteEnd?if_exists}");
		dateType();
		var exdata=$("#chartForm").serialize();
        $('#excel-data').val(exdata);
	})
	</script>
    <script src="/js/chart.js"></script>
</body>
</html>