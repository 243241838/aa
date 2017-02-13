<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>内容管理-图片管理</title>
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
		  <div class="search-item search-short" >
			<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
				<ul class="search-list fn-clear">
				    <li>
						<span class="name">图片ID：</span>
						<span class="textbox">
						<input class="textbox-text textbox-prompt" type="text" maxlength=120 name="idLike" value="${pictureQuery?if_exists.idLike?if_exists}"/></span>
					</li>
					<li>
						<span class="name">图片位置：</span>
						<span class="textbox">
						<input class="textbox-text textbox-prompt" type="text" maxlength=120 name="posName" value="${pictureQuery?if_exists.posName?if_exists}"/></span>
					</li>
					<li>
						<span class="name">图片标题：</span>
						<span class="textbox">
						<input class="textbox-text textbox-prompt" type="text" maxlength=120  name="title" value="${pictureQuery?if_exists.title?if_exists}"/></span>
					</li>
					<li class="btn-group">
						<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
						<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset" >重 置</a>
					</li>
				</ul>
			</form>
		  </div>
		  <!-- 搜索end -->
		<!-- 列表 -->
		<div class="list-item  nopage-list fn-clear">
	       ${fButton(list, 'ADD','<a href="@URL@" id="colAdd" class="ui-trans-btn ui-add2-pos">新增</a>')} 
			<#--<a href="/content/img/addUI"  class="ui-trans-btn ui-add2-pos">新增</a>-->
			<table id="contentList" class="easyui-tab" width="100%">
			</table>
			<div class="ui-nodata fn-hide">
			  <img src="/images/nodata.png"/>
			  <span>暂无数据</span>
			</div>
		</div>
		<!-- 列表end -->
	  </div>
	</div>
<!--删除-->
	<div id="dlgConfirm" class="ui-dialog warn-dialog confirm-dialog">
		<div class="ui-dlg-content ui-relative">
	    <div class="ui-dlg-text">确定删除图片吗？</div>
	    <input type="hidden" id="del-hideId"/>
		   ${fButton(list, 'DELETE','<a  href="javascript:delNext(\'@URL@\',\'id\');" class="ui-red-btn">确 定</a>')}
		   <#--<a href="javascript:delNext('/content/img/delete','id');" class="ui-red-btn">确 定</a>-->
		   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
		</div>
	</div>
<!--删除成功-->
	<div id="dlgOk2" class="ui-dialog ok2-dialog">
		   <div class="ui-dlg-content ui-relative">
	       <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
	       <div class="ui-dlg-text">删除成功！</div>
	       <a href="javascript:;" class="ui-red-btn" onclick="refresh();">确 定</a>
		</div>
	</div>
<!--删除失败-->
    <div id="dlgWarn" class="ui-dialog warn-dialog">
		<div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-text">删除失败！</div>
       <a href="javascript:;" class="ui-red-btn ui-dlg-cancel">确 定</a>
		</div>
	</div>
<!--预览-->
<div id="dlgView" class="ui-dialog card-dialog view-dialog" data-options="iconCls:'icon-save'">
		<h3></h3>
	    <div class="ui-infobg">
	       <img src="" class="ui-card-img"/>
	    </div>
	</div>
<script>
	$(function(){
	//用户信息查询
	$("#contentList").datagrid({
		url:'/content/img/list',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		//idField:'userId',//id字段
		//sortName:'userId',//当数据表格初始化时以哪一列来排序
		//sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		pageSize:20,
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		columns:[[
			{field:'id',align:'center',width:"20%",title:'图片ID',sortable:true},
			{field:'posName',align:'center',width:"20%",title:'图片位置'},
			{field:'title',align:'center',width:"19%",title:'图片标题'},
			{field:'opt2',align:'center',width:"20%",title:'图片预览',
				formatter:function(value,rec){
			        return '<a class="operation-link" href="javascript:viewImg(\''+rec.url+'\');">预览</a>';
				}
			},
			{field:'opt',align:'center',width:"20%",title:'操作',
				formatter:function(value,rec){
					var html='';
					html='${fButton(list, 'EDIT','<a class="operation-link" href="@URL@?id=\'+rec.id+\'">[编辑]</a>')}';
					html+='${fButton(list, 'DELETE','<a class="operation-link" href="javascript:delConfirm(\'+rec.id+\');">[删除]</a>')}';
					//html='<a class="operation-link" href="/content/img/editUI?id='+rec.id+'">[编辑]</a>';
					//html+='<a class="operation-link" href="javascript:delConfirm('+rec.id+');">[删除]</a>';
			        return html;
				}
			}
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         }
	});
    $("#contentList").datagrid("getPager").pagination({
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
$("#submit_search").click(function(){
	var listId=$('.easyui-tab').attr('id');
     $("#"+listId).datagrid({ queryParams: form2Json("searchform")}); 
});

$("#submit_reset").click(function(){
    $(this).parents("form").get(0).reset();
  
})
	});
	</script>
</body>
</html>