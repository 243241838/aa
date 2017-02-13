
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>货品管理</title>
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
						<span class="name">货品ID：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt textbox2" maxlength=120 type="text" name="productCode" value=""/></span>
					</li>
					<li>
						<span class="name">货品名称：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt textbox2" maxlength=120 type="text" name="productName" value=""/></span>
					</li>
					<li>
						<span class="name">供应商：</span>
						<select name="providerId" class="ui-dselect" id="providerId">
						<option value="">请选择</option>
						  <#list providerList as item>
                        <option value="${item.providerId}">${item.providerName}</option>
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
	   url:'/product/findallList',
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
			{field:'productCode',align:'center',width:"8%",title:'货品ID',styler:function(value,rowData,rowIndex){
 		var html='cursor:pointer;color:blue';
 		return html;
			} },
			{field:'productName',align:'center',width:"16%",title:'货品名称'}, 
			{field:'providerName',align:'center',width:"16%",title:'供应商'}, 
			{field:'productNameTemp',align:'center',width:"20%",title:'关联商品',
				formatter:function(value,rec){
				var s ;
				if(rec.productIdTemp == 0){s = '未关联';} else{
				s=rec.productNameTemp;
				}
		        return s;
			 }},
			 
			{field:'effTime',align:'center',width:"12%",title:'生效时间',formatter:function(value,rec){
				return getDate(rec.effTime);
			 }},
			 	{field:'expTime',align:'center',width:"12%",title:'失效时间',formatter:function(value,rec){
				return getDate(rec.expTime);
			 }},
			{field:'opt',align:'center',width:"15%",title:'操作',formatter:function(value,rec){
				 var  html=' ${fButton(list, 'EDIT','<a class="operation-link" href="@URL@?productCode=\'+rec.productCode+\'&providerId=\'+rec.providerId+\'">[编辑]</a>')}';
				   var phtml='';
				  if(rec.productIdTemp==0){
				   phtml=' ${fButton(list, 'UNIT','<a class="operation-link" href="@URL@?productCode=\'+rec.productCode+\'&providerId=\'+rec.providerId+\'">[关联]</a>')}';
				    
				}else{
				   var  phtml=' ${fButton(list, 'CENCELUNIT','<a style="cursor:pointer;" class="operation-link" onclick="downproduct(\'+rec.productCode+\',\'+rec.providerId+\',\'+rec.psts+\')">[取消关联]</a>')}';
				  
				   }
				   return  html+phtml;
		       
			 }
			}
		]],
		onClickCell:function(rowIndex, field, value){
if(field=='productCode'){
window.location.href="/product/toproviderProductInfo?pid="+value;

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
 
function downproduct(code,providerid,sts){
	if(sts==10){
	   $.messager.alert('提示消息', '不能取消关联上架状态的商品，请先下架商品后操作!', 'warn');
	}else{
	      $.messager.confirm('提示消息', '确认取消关联操作？', function (r) {
                                 if (r) {
                                     $.ajax({
                                         url: '/product/cenclunion?code='+code+'&providerid='+providerid,
                                         type: 'post',
                                         datatype: 'text',
                                         success: function (result) {
                                             if (result>0) {
                                               window.location.reload();
                                             }
                                         }
                                     });
                                 }
                             });
	}
}
</script>
</body>
</html>