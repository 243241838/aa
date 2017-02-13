<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>运营管理</title>
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
</head>
	
<body>
  <div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	    <#include "/common/include/power.ftl">
		<!-- <a class="crumbs-link" href="#">运营管理 <span>></span></a>
		<a class="crumbs-link" href="">风控管理 <span>></span></a>
		<span class="crumbs-tit">黑名单设置</span> -->
	</div>
	<div class="ui-list-content">
		<!-- 搜索 -->
		<div class="search-item">
			<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
				<ul class="search-list fn-clear">
					<li>
						<span class="name">用户ID：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="userId"  maxlength=19 value="${blacklistQuery?if_exists.userId?if_exists}"/></span>
					</li>
					<li>
						<span class="name">账户名：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="username" value="${blacklistQuery?if_exists.username?if_exists}"/></span>
					</li>
					<li>
						<span class="name">实名：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="realName" value="${blacklistQuery?if_exists.realName?if_exists}"/></span>
					</li>
					<li class="btn-group">
						<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
			    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset">重 置</a>
					</li>
				</ul>
				
			</form>
		</div>
		<!-- 搜索end -->
		<!-- 列表 -->
		<div class="list-item fn-clear ui-relative">
		    <div class="ui-tip">用户被加入黑名单后,其用户状态将会被设置为禁用，账户状态会被设置为冻结。
		       <em class="ui-trig"></em>
		       <i class="ui-trig2"></i>
		    </div>
		    ${fButton(list, 'ADDBLACK','<a href="javascript:addBlack(\'@URL@\');" class="ui-trans-btn ui-add-pos ui-info-trigger fn-left">添加黑名单</a>')}
			<!-- <a href="javascript:addBlack();" class="ui-trans-btn ui-add-pos ui-info-trigger fn-left">添加黑名单</a> -->
			<table id="userTypeList" class="easyui-tab"  width="100%">
			</table>
			<div class="ui-nodata fn-hide">
			  <img src="/images/nodata.png"/>
			  <span>暂无数据</span>
			</div>
		</div>
	<!-- 列表end -->
   </div>
  </div>
  <iframe class="fn-hide" id="black-content" scrolling="auto" frameborder="0"  name="blackCont" src="" style="width:1050px;height:400px;"></iframe>
<!--解除-->
<div id="dlgConfirm" class="ui-dialog warn-dialog confirm-dialog black-dialog">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text">确定将<span id="del-tip"></span>解除黑名单吗？</div>
    <input type="hidden" id="del-hideId"/>
       ${fButton(list,"RELIEVEBLACK",'<a href="javascript:delNext(\'@URL@\',\'id\');" class="ui-red-btn">确 定</a>')}
	   <!-- <a href="javascript:delNext('/runManage/blacklist/relieve','id');" class="ui-red-btn">确 定</a> -->
	   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
	</div>
</div>
<!--解除成功-->
<div id="dlgOk2" class="ui-dialog ok2-dialog black-dialog">
	   <div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
       <div class="ui-dlg-text">解除成功！</div>
       <a href="javascript:;" class="ui-red-btn" onclick="refresh();">确 定</a>
	</div>
</div>
<!--解除失败-->
<div id="dlgWarn" class="ui-dialog warn-dialog black-dialog">
	<div class="ui-dlg-content ui-relative">
      <div class="ui-dlg-text">解除失败！</div>
      <a href="javascript:;" class="ui-red-btn ui-dlg-cancel">确 定</a>
	</div>
</div>
<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
	
<script type="text/javascript" src="/js/plugins.js"></script>
<script>
$(function(){
	$('#dlgOk2').siblings('.panel-header').find('.panel-tool-close:eq(0)').click(function(){
	  refresh();
	});
	
	$("#userTypeList").datagrid({
		url:'/runManage/blacklist/list',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'userId',//id字段
		//sortName:'userId',//当数据表格初始化时以哪一列来排序
		//sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pageSize:20,
		pagePosition:top,
		columns:[[
			{field:'userId',align:'center',width:"24%",title:'用户ID',
				formatter:function(value,rec){
				  return pad(rec.userId, 6);
				}
			},
			{field:'username',align:'center',width:"25%",title:'账户名'},
			{field:'realName',align:'center',width:"25%",title:'实名'},
			{field:'opt',align:'center',width:"25%",title:'操作',formatter:function(value,rec){
				var real=rec.username;
				var name=rec.realName?(rec.realName+'('+real+')'):real;
				var html=' ${fButton(list, 'VIEW','<a class="operation-link" href="@URL@?id=\'+rec.id+\'">[查看]</a>')}'
					/* '<a class="operation-link" href="/runManage/blacklist/detail?id='+rec.id+'">[查看]</a>' */
			      +'<a class="operation-link" href="javascript:delConfirm2('+rec.id+',\'del-hideId\',\'dlgConfirm\',\''+name+'\');">[解除黑名单]</a>';
		        return html;
			 }
			}
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         }
	});
	$("#userTypeList").datagrid("getPager").pagination({
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
         
        var json = $.parseJSON(jsonStr);
        return json
}

$("#submit_search").click(function () {
	 var listId=$('.easyui-tab').attr('id');
     $("#"+listId).datagrid({ queryParams: form2Json("searchform") });   //点击搜索
});
$("#submit_reset").click(function(){
    $(this).parents("form").get(0).reset();
})
});
</script>
</body>
</html>