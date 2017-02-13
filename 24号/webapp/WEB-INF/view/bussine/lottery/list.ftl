
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>交易明细管理</title>
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
</head>
	
<body>
  <div class="ui-main-container">
	<div class="crumbs" id="crumbs" id="crumbs">
	 <#include "/common/include/power.ftl">
	</div>
	<div class="ui-list-content">
		<!-- 搜索 -->
		<div class="search-item">
			<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
				<ul class="search-list fn-clear">
					<li>
						<span class="name">渠道ID：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt textbox2" maxlength=120 type="text" name="domainId" value=""/></span>
					</li>
					<li>
						<span class="name">渠道名称：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt textbox2" maxlength=120 type="text" name="domainName" value=""/></span>
					</li>
					<li class="btn-group">
						<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
			    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset">重 置</a>
					</li>
				</ul>
			</form>
			<input type="hidden" id="excel-data"/>
		</div>
		<!-- 搜索end -->
		<!-- 列表 -->
		<div class="list-item fn-clear ui-relative">
		${fButton(list, 'EXPORTEXCEL','<a href="@URL@" class="ui-trans-btn ui-add-pos fn-left">导出Excel</a>')}  
			<table id="paramList"  width="100%">
			</table>
			<div class="ui-nodata fn-hide">
			  <img src="/images/nodata.png"/>
			  <span>暂无数据</span>
			</div>
		</div>
	<!-- 列表end -->
   </div>
  </div>

<script>
$(function(){
	$('#dlgOk2').siblings('.panel-header').find('.panel-tool-close:eq(0)').click(function(){
	  refresh();
	});
	
//用户类别管理
	$("#paramList").datagrid({
	   url:'/bussiness/bill/findList?serviceId=11',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'userId',//id字段
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pageSize:20,
		pagePosition:top,
		columns:[[
			{field:'tradeId',align:'center',width:"14%",title:'交易流水号'},
			{field:'requestTime',align:'center',width:"13%",title:'下单时间',formatter:function(value,rec){
				return getDateTime(rec.requestTime);
			 }}, 
			{field:'productName',align:'center',width:"10%",title:'商品名称'},
			{field:'productPrice',align:'center',width:"7%",title:'进货价(元)'},
		 
			{field:'domainPrice',align:'center',width:"7%",title:'渠道价(元)'},
			{field:'productParValue',align:'center',width:"7%",title:'面值价(元)'},
			 {field:'domainName',align:'center',width:"10%",title:'渠道'},
			 {field:'providerName',align:'center',width:"10%",title:'供应商'},
			 {field:'tradeSts',align:'center',width:"13%",title:'状态',
				formatter:function(value,rec){
				var s = '其他';
				if(rec.tradeSts == 10){s = '已受理';} 
				if(rec.tradeSts == -10){s = '订单取消';} 
				if(rec.tradeSts == 20){s = '已支付';} 
				if(rec.tradeSts == 21){s = '支付超额';} 
				if(rec.tradeSts == -20){s = '支付失败';} 
				if(rec.tradeSts == -21){s = '支付不足';} 
				if(rec.tradeSts == -22){s = '库存不足';} 
				if(rec.tradeSts == 30){s = '发货中';} 
				if(rec.tradeSts == 35){s = '部分核销部分未使用';} 
				if(rec.tradeSts == -30){s = '下载/发货失败';} 
				if(rec.tradeSts == 40){s = '核销成功';}
				if(rec.tradeSts == 50){s = '部分退款';} 
				if(rec.tradeSts == 51){s = '全额退款';} 
				if(rec.tradeSts == -51){s = '拒绝全部退款';} 
				if(rec.tradeSts == -40){s = '核销失败';} 
				if(rec.tradeSts == -45){s = '等待退款';} 
		        return s;
			 }},
			{field:'opt',align:'center',width:"8%",title:'操作',formatter:function(value,rec){
				    var  html=' ${fButton(list, 'VIEW','<a class="operation-link" href="@URL@?id=\'+rec.tradeId+\'">[查看详情]</a>')}';
				   return  html;
		       
			 }
			}
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         }
	});
	$("#paramList").datagrid("getPager").pagination({
	    pageSize:20,
	    displayMsg:"",
	    layout:['list','sep','prev','links','next','manual'],
	    showPageList:false
	 });

function loadFilter(data) {
	var value = {
		total: data.succ?data.entity.totalItems:0,
		rows: []
	};
	if(data.succ){
	for (var i = 0; i < data.entity.items.length; i++) {
		var o = {};
		_loadArray(data.entity.items[i], o, "");
		value.rows.push(o);
	}
	}
	if( data.entity.items.length==0){
	   $('.ui-nodata').removeClass('fn-hide');
	   $('.datagrid-pager').css('visibility','hidden');
	}else{
	   $('.ui-nodata').addClass('fn-hide');
	   $('.datagrid-pager').css('visibility','visible');
	}
	
	return value;
}

function _loadArray(data, o, pre) {
	if (pre)
		pre = pre + ".";
	for (var att in data) {
		var row = data[att];
		if (typeof(row) == "object") {
			_loadArray(row, o, pre + att);
		} else {
			o[pre + att] = row;
		}

	}
}
    function form2Json(id) {
       var arr = $("#"+id).serializeArray()
       var jsonStr = "";
       jsonStr += '{';
        $.each(arr, function(i, field){
           if(field.value){
            jsonStr += '"' + field.name + '":"' + field.value + '",'
           }
        });
        jsonStr = jsonStr.length>1?jsonStr.substring(0, (jsonStr.length - 1)):jsonStr;
         jsonStr += '}';
         //console.log(jsonStr)
        var exdata=$("#"+id).serialize();
	    $('#excel-data').val(exdata);
        var json = $.parseJSON(jsonStr);
        return json
}

$("#submit_search").click(function () {
     $("#paramList").datagrid({ queryParams: form2Json("searchform") });   //点击搜索
});
$("#submit_reset").click(function(){
    $(this).parents("form").get(0).reset();
})
});


</script>
</body>
</html>