<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>统计报表-交易信息类-消费支付明细</title>
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
	<div class="crumbs" id="crumbs">
	 <#include "/common/include/power.ftl">
	</div>
	<div class="ui-list-content">
	  <!-- 搜索 -->
	  <div class="search-item">
		<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
			<ul class="search-list fn-clear">
				<li class="date">
					<span class="name">交易时间：</span>
					<input id="startTime" name="beginDate" class="easyui-datebox" value="${transactionMessDetailQuery?if_exists.beginDate?if_exists}" validType="mdM['#endTime']">
					<em>至</em>
					<input id="endTime" name="endDate" class="easyui-datebox" value="${transactionMessDetailQuery?if_exists.endDate?if_exists}" validType="mdM['#startTime']">
				</li>
				<li>
					<span class="name">用户：</span>
					<span class="textbox">
					<input class="textbox-text textbox-prompt" type="text" name="username" value="${transactionMessDetailQuery?if_exists.username?if_exists}"/></span>
				</li>
				
				<li class="btn-group">
					<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
		    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset">重 置</a>
				</li>
			</ul>
			<ul class="search-list fn-clear">
				<li>
					<span class="name">交易状态：</span>
					<select class="seaway-combobox" name="state" >
						<option value="">全部</option>
						<#if orderTransferState?has_content>
							<#list orderTransferState as cl>
								<option <#if transactionMessDetailQuery?if_exists.state == cl.key?if_exists>selected="selected"</#if>value="${cl.key?if_exists}">${cl.value?if_exists}</option>
							</#list>
						</#if>					
					</select>
				</li>
				<li>
					<span class="name" style="width:100px;">交易流水号：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="orderNo" value="${transactionMessDetailQuery?if_exists.orderNo?if_exists}"/></span>
				</li>
		   </ul>
		   <input type="hidden" name="sort" value="orderNo"/>
			<input type="hidden" name="order" value="desc"/>
		</form>
		<input type="hidden" id="excel-data"/>
	  </div>
	<!-- 搜索end -->
	<!-- 列表 -->
	<div class="list-item fn-clear ui-relative">
	${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')} 
		<#--<a href="javascript:doExcel('/report/transactionMess/paymentDetailExcel');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>-->
		<table id="paymentList" class="easyui-tab" width="100%">
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
	$("#paymentList").datagrid({
		url:'/report/transactionMess/selectPaymentDetail',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'orderNo',//id字段
		//sortName:'userId',//当数据表格初始化时以哪一列来排序
		sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		pageSize:20,
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pagePosition:top,
		columns:[[
			{field:'orderNo',align:'center',width:"25%",title:'交易流水号'},
			{field:'createTimeString',align:'center',width:"25%",title:'交易时间'},
			{field:'username',align:'center',width:"20%",title:'用户'},
			{field:'paymentSumStr',align:'center',width:"20%",title:'交易金额(元)'},
			{field:'stateStr',align:'center',width:"10%",title:'交易状态'}
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         }
	});
    $("#paymentList").datagrid("getPager").pagination({
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
	         
	         var exdata=$("#"+id).serialize();
	         $('#excel-data').val(exdata);
	        var json = $.parseJSON(jsonStr);
	        return json
	}
	dateValid();
	$("#submit_search").click(function () {
		 if($("#searchform").form("validate")){
		     var listId=$('.easyui-tab').attr('id');
		     $("#"+listId).datagrid({ queryParams: form2Json("searchform") });   //点击搜索
	     }
	});
	$("#submit_reset").click(function(){
	    var form=$(this).parents("form");
	    resetForm(form);
	  
	});

});
</script>
</body>
</html>