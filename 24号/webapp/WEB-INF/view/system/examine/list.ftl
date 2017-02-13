
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>渠道管理</title>
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
						<span class="name">交易日期：</span>
						<span class="textbox"><input id="effTime" name="effTimeStr" class="easyui-datebox" value="${countDayBegin}" validType="mdM['#effTime']">
					<em>至</em>
					<input id="expTime" name="expTimeStr" class="easyui-datebox" value="${countDayEnd}" validType="mdM['#expTime']"></span>
					</li>
					<li>
						<span class="name">操作员：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt textbox2" maxlength=120 type="text" name="chargeUser" value=""/></span>
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
	   url:'/system/examine/findexamineList',
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
			{field:'charge_id',align:'center',width:"10%",title:'交易流水号' },
			{field:'charge_time',align:'center',width:"14%",title:'交易时间',formatter:function(value,rec){
				return getDateTime(rec.charge_time);
			 }},
			{field:'opertype',align:'center',width:"14%",title:'操作类型' ,
			formatter:function(value,rec){
				var s = '';
				if(rec.opertype =='0'){
					s = '渠道账户充值';
				}if(rec.opertype =='1'){
					s = '供应商账户充值';
				} 
		        return s;
			 }},
			{field:'charge_user',align:'center',width:"14%",title:'操作员'}, 
			{field:'charge_sts',align:'center',width:"14%",title:'审核状态' ,
			formatter:function(value,rec){
				var s = '其他';
				if(rec.charge_sts == '10'){
					s = '待审核';
				}if(rec.charge_sts == '20'){
					s = '审核通过';
				}if(rec.charge_sts == '-20'){
					s = '审核失败';
				}if(rec.charge_sts == '30'){
					s = '到账成功';
				}if(rec.charge_sts == '-30'){
					s = '到账失败';
				}
		        return s;
			 }},
			 {field:'approval_time',align:'center',width:"14%",title:'审核时间',formatter:function(value,rec){
				return getDateTime(rec.approval_time);
			 }}, 
			 	{field:'opt',align:'center',width:"19%",title:'操作',formatter:function(value,rec){
			 var phtml='';				   
				if(rec.charge_sts=='10'){
				   phtml=' ${fButton(list, 'HANDL','<a class="operation-link" href="@URL@?id=\'+rec.charge_id+\'&type=\'+rec.opertype+\'">[处理]</a>')}';
				}else{
				   phtml=' ${fButton(list, 'HANDVIEW','<a class="operation-link" href="@URL@?id=\'+rec.charge_id+\'&type=\'+rec.opertype+\'">[查看]</a>')}';
				   }
				   return  phtml;
		       
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