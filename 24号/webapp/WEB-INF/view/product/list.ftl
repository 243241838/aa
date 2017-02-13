
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>商品上架管理</title>
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
						<span class="name">商品ID：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt textbox2" maxlength=120 type="text" name="productId" value=""/></span>
					</li>
					<li>
						<span class="name">商品名称：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt textbox2" maxlength=120 type="text" name="productName" value=""/></span>
					</li>
					<li>
						<span class="name">所属业务：</span>
						<select name="serviceId" class="ui-dselect" id="serviceId">
						<option value="">请选择</option>
						  <#list serviceList as item>
                        <option value="${item.serviceId}">${item.serviceName}</option>
                        </#list>
                        </select>
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
		 ${fButton(list, 'ALLDOWN','<a class="ui-trans-btn ui-add-pos fn-left"  onclick="alldownproduct()">批量下架</a>')}  
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
	   url:'/product/findList?productSts=10',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'productId',//id字段
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pageSize:20,
		pagePosition:top,
		columns:[[
		    {field: 'productId', checkbox: true },
			{field:'pid',align:'center',width:"14%",title:'商品ID',styler:function(value,rowData,rowIndex){
 		var html='cursor:pointer;color:blue';
 		return html;
			} },
			{field:'productName',align:'center',width:"14%",title:'商品名称'}, 
			{field:'serviceName',align:'center',width:"14%",title:'所属业务'}, 
			 
			{field:'effTime',align:'center',width:"20%",title:'生效时间',formatter:function(value,rec){
				return getDate(rec.effTime);
			 }},
			 	{field:'expTime',align:'center',width:"20%",title:'失效时间',formatter:function(value,rec){
				return getDate(rec.expTime);
			 }},
			{field:'opt',align:'center',width:"15%",title:'操作',formatter:function(value,rec){
				  var  html=' ${fButton(list, 'DOWN','<a style="cursor:pointer;" class="operation-link" onclick="downproduct(\'+rec.pid+\')">[下架]</a>')}';
				   return  html;
			 }
			}
		]],
		onClickCell:function(rowIndex, field, value){
        if(field=='pid'){
         window.location.href="/product/toProductInfo?pid="+value;
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
function alldownproduct(){
            var ids = [];
            var rows = $('#paramList').datagrid('getChecked');
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].productId);
            }
            if(ids.length==0){
            $.messager.alert('提示消息', '请勾选需要下架商品！', 'warn');
            }else{
             $.messager.confirm('提示消息', '确定要下架已选商品？共选择'+ids.length+'条', function (r) {
                                 if (r) {
                                     $.ajax({
                                         url: '/product/alldown?ids='+ids+'&sts=2' ,
                                         type: 'post',
                                         datatype: 'text',
                                         success: function (result) {
                                               if (result>0) {
                                               $.messager.alert("操作提示", "处理成功！", "info", function () {
                                               window.location.href="/product/upListView";
                                              });
                                             }else{
                                              $.messager.alert('提示消息', '处理失败！', 'warn');
                                             }
                                         }
                                     });
                                 }
                             });
            }
}
function downproduct(value){
             $.messager.confirm('提示消息', '确定要下架商品？商品ID' +value, function (r) {
                                 if (r) {
                                     $.ajax({
                                         url: '/product/alldown?ids='+value+'&sts=2' ,
                                         type: 'post',
                                         datatype: 'text',
                                         success: function (result) {
                                            if (result>0) {
                                               $.messager.alert("操作提示", "处理成功！", "info", function () {
                                               window.location.href="/product/upListView";
                                              });
                                             }else{
                                              $.messager.alert('提示消息', '处理失败！', 'warn');
                                             }
                                         }
                                     });
                                 }
                             });
                             }
</script>
</body>
</html>