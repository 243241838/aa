
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>交易统计管理</title>
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
					 <span class="name">统计类型：</span>
							<select class="ui-dselect" name="tjtype" onchange="changelist(this.value)">
								<option value="1">渠道</option>
								<option value="2">供应商</option>
								<option value="3">商品</option>
							</select>
					</li>
					<li id="Messages1" >
						<select name="domainId" class="ui-dselect" >
						<option value="0">请选择渠道</option>
						  <#list domainList as item>
                        <option value="${item.domainId}">${item.domainName}</option>
                        </#list>
                        </select>
					</li>
					<li id="Messages2" style="display:none">
						<select name="providerId" class="ui-dselect" >
						<option value="0">请选择供应商</option>
						  <#list providerList as item>
                        <option value="${item.providerId}">${item.providerName}</option>
                        </#list>
                        </select>
					</li><li id="Messages3" style="display:none">
						<select name="productId" class="ui-dselect" >
						<option value="0">请选择商品</option>
						  <#list productList as item>
                        <option value="${item.productId}">${item.productName}</option>
                        </#list>
                        </select>
					</li>
					<li>
						<span class="name">统计日期：</span>
						<span><input id="effTime" name="effTimeStr" class="easyui-datebox" value="${countDayBegin}" validType="mdM['#effTime']">
					<em>至</em>
					<input id="expTime" name="expTimeStr" class="easyui-datebox" value="${countDayEnd}" validType="mdM['#expTime']"></span>
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
	   url:'/bussiness/bill/findCountList',
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
			{field:'domainName',align:'center',width:"27%",title:'统计类型'},
			{field:'tradecount',align:'center',width:"24%",title:'交易总笔数'},
			{field:'pricesum',align:'center',width:"24%",title:'交易金额(元)'},
			{field:'opt',align:'center',width:"24%",title:'操作',formatter:function(value,rec){
			 var  html=' ${fButton(list, 'VIEW','<a class="operation-link" href="@URL@?type=\'+rec.operType+\'&domainId=\'+rec.domainId+\'">[查看]</a>')}';
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
function changelist(value){
if(value==1){
document.getElementById('Messages1').style.display='block'; 
document.getElementById('Messages2').style.display='none'; 
document.getElementById('Messages3').style.display='none'; 
}
if(value==2){
document.getElementById('Messages2').style.display='block'; 
document.getElementById('Messages1').style.display='none'; 
document.getElementById('Messages3').style.display='none'; 
}
if(value==3){
document.getElementById('Messages3').style.display='block'; 
document.getElementById('Messages1').style.display='none'; 
document.getElementById('Messages2').style.display='none'; 
}

}

</script>
</body>
</html>