<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>栏目管理-全部类别的栏目</title>
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
			 		  <#--  <#assign va = ""/>
			 		    <#if cata?if_exists.id == 1 && pid == 1>
			 		    	<#assign va = "javascript:;"/>
			 		    <#elseif cata?if_exists.id == 2 && pid == 2>
			 		    	<#assign va = "javascript:;"/>
			 		    <#else>
			 		    	<#assign va = "/content/column/listView?pid=${cata?if_exists.id}"/>
			 		    </#if>-->
						<a class="ui-menu-item-name parent_search" href="javascript:;" data-id="${cata?if_exists.id}" title="${cata?if_exists.title}">${cata?if_exists.title}</a>
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
		<!-- 列表 nopage-list -->
		<div class="list-item  nopage-list fn-clear ui-relative">
	       ${fButton(list, 'ADD','<a href="@URL@?cataId=${pid?if_exists}" id="colAdd" class="ui-trans-btn ui-addColum-pos">新增</a>')} 
			<#--<a href="/content/column/addUI?cataId=${pid?if_exists}" id="colAdd" class="ui-trans-btn ui-addColum-pos">新增</a>-->
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
</div>
	<!--删除-->
	<div id="dlgConfirm" class="ui-dialog warn-dialog confirm-dialog">
		<div class="ui-dlg-content ui-relative">
	    <div class="ui-dlg-text">确定删除<span id="del-tip">此栏目</span>吗？</div>
	    <input type="hidden" id="del-hideId"/>
		   ${fButton(list, 'DELETE','<a  href="javascript:delNext(\'@URL@\',\'id\');" class="ui-red-btn">确 定</a>')}
		   <#--<a href="javascript:delNext('/content/column/delete','id');" class="ui-red-btn">确 定</a>-->
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
	<script>
	$(function(){
	//用户信息查询
	$("#contentList").datagrid({
			url:'/content/column/list',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		//idField:'userId',//id字段
		//sortName:'userId',//当数据表格初始化时以哪一列来排序
		//sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pageSize:20,
		pagePosition:top,
		columns:[[
			{field:'title',align:'center',width:"30%",title:'栏目名称',sortable:true},
			{field:'columnName',align:'center',width:"29%",title:'所属类别'},
			{field:'sorts',align:'center',width:"20%",title:'排序'},
			{field:'opt',align:'center',width:"20%",title:'操作',
				formatter:function(value,rec){
					var html='';
					html='${fButton(list, 'EDIT','<a class="operation-link" href="@URL@?id=\'+rec.id+\'">[编辑]</a>')}';
					html+='${fButton(list, 'DELETE','<a class="operation-link" href="javascript:delConfirm(\'+rec.id+\');">[删除]</a>')}';
					//html='<a class="operation-link" href="/content/column/editUI?id='+rec.id+'">[编辑]</a>';
					//html+='<a class="operation-link" href="javascript:delConfirm('+rec.id+');">[删除]</a>';
			        return html;
				}
			}
		]],
	    queryParams: initSearch(),
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
	
	function initSearch(){
	    var inits='{}';
		<#if pid?if_exists && id?if_exists>
		   inits= '{'+'"id":"' + ${id} + '"'+ '}';
		<#elseif pid?if_exists>
		   inits= '{'+'"parentId":"' +${pid} + '"'+ '}';
		</#if>
		 return $.parseJSON(inits);
	} 
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
	$(".submit_search").each(function(){
		$(this).click(function () {
			var id=$(this).attr('data-id'),
			   pid=$(this).parents('.ui-submenu-list').siblings('.ui-menu-item-name').attr('data-id'),
			   str= '{'+'"id":"' + id + '"'+ '}';
			$("#contentList").datagrid({ queryParams:$.parseJSON(str)  }); 
			$('#colAdd').attr('href','/content/column/addUI?cataId='+pid);
		});
	});
	$(".parent_search").each(function(){
		$(this).click(function () {
		var id=$(this).attr('data-id');
		str= '{'+'"parentId":"' +id + '"'+ '}';
		     $("#contentList").datagrid({ queryParams:$.parseJSON(str)  }); 
		     $('#colAdd').attr('href','/content/column/addUI?cataId='+id);
		});
		
	});
	$("#submit_reset").click(function(){
	    $(this).parents("form").get(0).reset();
	  
	})
	});
	</script>
</body>
</html>