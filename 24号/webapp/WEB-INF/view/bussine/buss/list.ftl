
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>业务配置管理</title>
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
		 
		<!-- 搜索end -->
		<!-- 列表 -->
		<div class="list-item fn-clear ui-relative">
	     ${fButton(list, 'ADD','<a href="@URL@" class="ui-trans-btn ui-add-pos fn-left">新增</a>')}  
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
	   url:'/bussiness/bill/findBussList',
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
			{field:'serviceId',align:'center',width:"14%",title:'业务编号',styler:function(value,rowData,rowIndex){
 		var html='cursor:pointer;color:blue';
 		return html;
			} },
			{field:'serviceName',align:'center',width:"10%",title:'业务名称'},
			{field:'effTime',align:'center',width:"13%",title:'开始时间',formatter:function(value,rec){
				return getDateTime(rec.effTime);
			 }}, 
			 {field:'expTime',align:'center',width:"13%",title:'结束时间',formatter:function(value,rec){
				return getDateTime(rec.expTime);
			 }}, 
			  {field:'serviceBeginTime',align:'center',width:"13%",title:'服务开始时间'}, 
			  {field:'serviceEndTime',align:'center',width:"13%",title:'服务结束时间'}, 
			 
			 {field:'serviceSts',align:'center',width:"13%",title:'状态',
				formatter:function(value,rec){
				var s = '其他';
				if(rec.serviceSts == 0){s = '下架';} 
				if(rec.serviceSts == 10){s = '上架';} 
				if(rec.serviceSts == -10){s = '锁定';} 
				if(rec.serviceSts == -11){s = '禁用';} 
				 
		        return s;
			 }},
			{field:'opt',align:'center',width:"8%",title:'操作',formatter:function(value,rec){
				  var  html=' ${fButton(list, 'EDIT','<a class="operation-link" href="@URL@?id=\'+rec.serviceId+\'">[编辑]</a>')}';
				  var  phtml='${fButton(list, 'PRODUCT','<a class="operation-link" href="@URL@?id=\'+rec.serviceId+\'">[商品管理]</a>')}';
				  
				   return  html+phtml;
		       
			 }
			}
		]],
		onClickCell:function(rowIndex, field, value){
if(field=='serviceId'){
window.location.href="/bussiness/bill/findBussListView?serviceId="+value;

}
},
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