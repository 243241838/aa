<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>文章管理-常见问题</title>
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
	<div class="ui-menu-container">
		 <ul id="content-menu">
		 	<!-- 遍历树形 -->
			<#if cataList?if_exists>
				<#list cataList as cata>
					<li class="ui-menu-item ui-meun-item-open">
			 		    <i class="sm-ui-icon-arrow"></i>
						<a class="ui-menu-item-name parent_search" href="<#if cata?if_exists.id == 1>listView?pid=1&type=s<#else>javascript:;</#if>" data-id="${cata?if_exists.id}" title="${cata?if_exists.title}">${cata?if_exists.title}</a>
						<ul class="ui-submenu-list">
							<#if cata?if_exists.problemList?if_exists>
								<#list cata.problemList as proCata>
									<li class="ui-submenu-item <#if proCata_index == 0>ui-submenu-fir</#if>">
										<a class="ui-submenu-item-name submit_search" href="javascript:;" data-id="${proCata?if_exists.id}" title="${proCata?if_exists.title}">${proCata?if_exists.title}</a>
									</li>
								</#list>
							</#if>
						</ul>
					</li>
				</#list>
			</#if>
	    </ul>
	</div>
	<div  class="ui-info-container">
		<div class="ui-list-content">
		  <!-- 搜索 -->
		  <div class="search-item search-short" >
			<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
				<input  name="parentId" value="${parentId?if_exists}" type="hidden"/>
				<input  name="pid" value="${pid?if_exists}" type="hidden"/>
				<ul class="search-list fn-clear">
					<li>
						<span class="name">文章标题：</span>
						<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength=120 name="title" value="${title?if_exists}"/></span>
					</li>
					<li>
						<input class="textbox-text textbox-prompt " type="checkbox"  name="searchAll" value="yes"/>
					    <span >搜索全部文章</span>
					</li>
					<li class="btn-group">
						<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
					</li>
				</ul>
			</form>
		  </div>
		  <!-- 搜索end -->
		  <!-- 列表 -->
		  <div class="list-item  nopage-list fn-clear">
			${fButton(list, 'ADD','<a href="@URL@?cataId=${pid?if_exists}" id="addArticleBut" class="ui-trans-btn ui-add2-pos">新增</a>')} 
			${fButton(list, 'DELETE','<a href="javascript:delAll(\'articleList\');"  class="ui-trans-btn ui-del-pos">删除</a>')} 
			<!--<a href="javascript:delAll('articleList');" class="ui-trans-btn ui-del-pos">删除</a>
			<a id="del" href="javascript:;" class="ui-trans-btn ui-del-pos">删除</a>-->
			<table id="articleList" class="easyui-tab" width="100%">
			</table>
			<div class="ui-nodata fn-hide">
			  <img src="/images/nodata.png"/>
			  <span>暂无数据</span>
			</div>
		  </div>
		  <!-- 列表end -->
	  </div>
   </div>
</div>
<!--删除-->
<div id="dlgConfirm" class="ui-dialog warn-dialog confirm-dialog">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text"><span id="del-tip">确定删除此文章吗？</span></div>
    <input type="hidden" id="del-hideId" name="id"/>
	   ${fButton(list, 'DELETE','<a  href="javascript:delNext(\'@URL@\',\'id\');" class="ui-red-btn">确 定</a>')}
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
       <div class="ui-dlg-text"></div>
       <a href="javascript:;" class="ui-red-btn ui-dlg-cancel">确 定</a>
</div>
	<script>
	$(function(){
	$("#articleList").datagrid({
		url:'/content/article/pList',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'sorts',//id字段
		sortName:'sorts',//当数据表格初始化时以哪一列来排序
		sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		pageSize:20,
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		columns:[[
			 {field:'ck',width:"15%",checkbox:true},
			{field:'title',align:'center',width:"17%",title:'文章标题'},
			{field:'cataName',align:'center',width:"18%",title:'所属类别'},
			{field:'columnName',align:'center',width:"18%",title:'所属栏目'},
			{field:'sorts',align:'center',width:"18%",title:'排序'},
			{field:'opt',align:'center',width:"25%",title:'操作',
				formatter:function(value,rec){
				var html='';
			  html='${fButton(list, 'DETAILS','<a class="operation-link" href="@URL@?id=\'+rec.id+\'">[查看]</a>')}'
					 +'${fButton(list, 'EDIT','<a class="operation-link" href="@URL@?id=\'+rec.id+\'">[编辑]</a>')}'
					 +'${fButton(list, 'DELETE','<a class="operation-link" href="javascript:delConfirm(\'+rec.id+\');">[删除]</a>')}';
			       return html;
				}
		    }
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         }
	});
    $("#articleList").datagrid("getPager").pagination({
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
	$(".submit_search").each(function(){
		$(this).click(function () {
			var id=$(this).attr('data-id'),
			   pid=$(this).parents('.ui-submenu-list').siblings('.ui-menu-item-name').attr('data-id');
			var str= '{'+'"parentId":"' + id + '"'+ '}';
		    $("#articleList").datagrid({ queryParams:$.parseJSON(str)  }); 
		    $('#searchform').find('input[name="parentId"]:eq(0)').val(id);
		    $('#addArticleBut').attr('href','/content/article/addUI?parentId='+id+"&cataId="+pid);
		});
	});
	$(".parent_search").each(function(){
		$(this).click(function () {
			var id=$(this).attr('data-id');
			if(id==2){//常见问题
			  $('input[name="parentId"]').val('');
			  $('input[name="pid"]').val(id);
		     $("#articleList").datagrid({ queryParams:form2Json('searchform')  }); 
		     $('#searchform').find('input[name="parentId"]:eq(0)').val(id);
			}
			 
		     $('#addArticleBut').attr('href','/content/article/addUI?parentId=&cataId='+id);
		});
		
	});
	$("#submit_search").click(function(){
	   var listId=$('.easyui-tab').attr('id');
	     $("#"+listId).datagrid({ queryParams: form2Json("searchform") });   //点击搜索
	});
	$("#submit_reset").click(function(){
	    $(this).parents("form").get(0).reset();
	  });
	});
	</script>
</body>
</html>