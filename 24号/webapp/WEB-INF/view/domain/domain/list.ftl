
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
	   url:'/domain/findList',
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
			{field:'domainId',align:'center',width:"7%",title:'渠道ID',styler:function(value,rowData,rowIndex){
 		var html='cursor:pointer;color:blue';
 		return html;
			} },
			{field:'domainName',align:'center',width:"11%",title:'渠道名称'}, 
			{field:'domainType',align:'center',width:"11%",title:'渠道类型',
			formatter:function(value,rec){
				var s = '其他';
				if(rec.domainType == 20){
					s = '电商';
				}	if(rec.domainType == 11){
					s = '第三方支付';
				}	if(rec.domainType == 12){
					s = 'P2P';
				}if(rec.domainType == 10){
					s = '银行';
				}
		        return s;
			 }
			},
			{field:'acct_type',align:'center',width:"11%",title:'账户类型' ,
			formatter:function(value,rec){
				var s = '其他';
				if(rec.acct_type == 1){
					s = '信用额度';
				}if(rec.acct_type == 2){
					s = '预付款';
				}
		        return s;
			 }},
		 
			{field:'effTime',align:'center',width:"13%",title:'生效时间',formatter:function(value,rec){
				return getDate(rec.effTime);
			 }},
			 	{field:'expTime',align:'center',width:"13%",title:'失效时间',formatter:function(value,rec){
				return getDate(rec.expTime);
			 }},
			
		 
			{field:'domainSts',align:'center',width:"8%",title:'状态',
				formatter:function(value,rec){
				var s = '其他';
				if(rec.domainSts == 1){
					s = '待审核';
				}if(rec.domainSts == 10){
					s = '正常';
				}if(rec.domainSts == -10){
					s = '锁定';
				}if(rec.domainSts == -11){
					s = '禁用';
				}
		        return s;
			 }
			},
			{field:'domainCount',align:'center',width:"10%",title:'商品配置',
				formatter:function(value,rec){
				var s = '已配置';
				if(rec.domainCount == 0){
					s = '未配置';
				} 
		        return s;
			 }},
			{field:'opt',align:'center',width:"15%",title:'操作',formatter:function(value,rec){
			 var phtml='';
				  var  html=' ${fButton(list, 'EDIT','<a class="operation-link" href="@URL@?id=\'+rec.domainId+\'">[编辑]</a>')}';
				   
				if(rec.domainCount==0){
				   phtml=' ${fButton(list, 'CONFIGURE','<a class="operation-link" href="@URL@?id=\'+rec.domainId+\'">[商品配置]</a>')}';
				    
				}else{
				   phtml=' ${fButton(list, 'CONFIGUREEDIT','<a class="operation-link" href="@URL@?id=\'+rec.domainId+\'">[商品编辑]</a>')}';
				   }
				   return  html+ phtml;
		       
			 }
			}
		]],
		onClickCell:function(rowIndex, field, value){
if(field=='domainId'){
window.location.href="/domain/toDomainInfo?domainId="+value;

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