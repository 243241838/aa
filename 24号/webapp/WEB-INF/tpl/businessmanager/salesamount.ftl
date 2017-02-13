<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>销售量</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>

<body>
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>

		<div class="ui-datagrid-wrap">
			
			<!-- 列表 -->
			<div class="list-item fn-clear">
				
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
		</div>
		<div class="ui-infor-box-bottom">
    		<a class="ui-a-return" href="${base}/businessmanager/countmanager">返回</a>
    	</div>
	</div>
	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'${base}/businessmanager/salesamountAjax?productId=${productId}&beginDate=${beginDate}&endDate=${endDate}',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			//idField:'userid',//id字段
			//sortName:'userid',//当数据表格初始化时以哪一列来排序
			//sortOrder:'desc',//'asc'/'desc'（正序/倒序）
			//remoteSort: false,//定义是否通过远程服务器对数据排序
			resizable:false,
			checkOnSelect:false,
			// pagination:true,
			pageSize:10,
			title : "abc",
			columns:[[
				{field:'domainName',align:'center',width:"48%",title:'分销渠道',sortable:true},
				{field:'insureCount',align:'center',width:"48%",title:'销售量(单)'},
				
			]],
			queryParams: eb.form2Json("search-ff"),
		   loadFilter:function(data){
					var titleHtml='<div class="query-result-title">'+
					'<span class="query-result-span">${beginDate} '+
					'<em class="query-result-num"> ${productName} </em>在各分销渠道的销售量明细如下：</span>'+
					'</div>';
					$(".panel-title").html(titleHtml);
					$(".panel-title").show();
		            return eb.loadFilter(data);//自定义过滤方法
	      },
      	onLoadSuccess:pageCls
		});
		//分页
		pageAction();
	
   });
	
	
	</script>
</body>
</html>