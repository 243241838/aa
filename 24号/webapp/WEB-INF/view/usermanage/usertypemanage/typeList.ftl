<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理-用户类别管理-类别下用户管理-列表</title>
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
<!-- 搜索 -->
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	    <#include "/common/include/power.ftl">
		
	</div>
	<div class="ui-list-content">
      <div class="search-item">

		<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
			<input type="hidden" id="levelId"  name="levelId"  value="${levelId}"/>
			<ul class="search-list fn-clear">
				<li>
					<span class="name">用户ID：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="userId" value=""  maxlength=19/></span>
				</li>
				<li>
					<span class="name">账户名：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="username" value=""/></span>
				</li>
				<li>
					<span class="name">实名：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="realName" value=""/></span>
				</li>
				
				<li class="btn-group">
					<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
		    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset">重 置</a>
				</li>
			</ul>
			<ul class="search-list fn-clear">
				
				<li>
					<span class="name">用户状态：</span>
				<select id="select-list" class="seaway-combobox" name="status" >
						<option value="">全部</option>
						<#if userStatus?has_content>
							<#list userStatus as cl>
								<option value="${cl.key?if_exists}">${cl.value?if_exists}</option>
							</#list>
						</#if>
					</select>
				
				</li>
			</ul>
			<input type="hidden" name="sort" value="userId"/>
			<input type="hidden" name="order" value="desc"/>
		</form>
		<input type="hidden" id="excel-data"/>
	</div>
	<!-- 搜索end -->
	<!-- 列表 -->
	<div class="list-item fn-clear ui-relative">
	    <#if levelId!=1> 
           <#--<a href="javascript:list_dialog('/userManage/userTypeManage/addUserView?levelId=${levelId}','类别用户下新增',true);" class="ui-trans-btn ui-add-pos">新增</a>-->
          ${fButton(list, 'ADD','<a href="javascript:list_dialog(\'@URL@?levelId=${levelId}\',\'类别用户下新增\',true);" class="ui-trans-btn ui-add-pos">新增</a>')}  
        </#if>
        <#if levelId!=1> 
          ${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add3-pos">[导出EXCEL表格]</a>')}  
	   <#else>
	     ${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')}  
	   </#if>
	   <#-- <a href="javascript:doExcel('/userManage/userTypeManage/userExcel');" class="ui-excel <#if levelId!=1> ui-add3-pos<#else>ui-add-pos </#if>">[导出EXCEL表格]</a>-->
		<table id="typeUserList" class="easyui-tab" width="100%">
		</table>
		<div class="ui-nodata fn-hide">
		  <img src="/images/nodata.png"/>
		  <span>暂无数据</span>
		</div>
	</div>
  </div>
 </div>
	<!-- 列表end -->
	<iframe id="dlg-box" class="dlg-box fn-hide" scrolling="auto" frameborder="0"  style="width:950px;height:400px;"></iframe>

	<!--设为普通用户-->
	<div id="dlgConfirm" class="ui-dialog warn-dialog confirm-dialog">
		<div class="ui-dlg-content ui-relative">
	    <div class="ui-dlg-text"><span id="del-tip">确定要设为普通用户吗？</span></div>
	    <input type="hidden" id="del-hideId"/>
	   ${fButton(list, 'SET','<a  href="javascript:delNext(\'@URL@\',\'id\');" class="ui-red-btn">确 定</a>')}
		   <#--<a href="javascript:delNext('/userManage/userTypeManage/updateUserTypeById','id');" class="ui-red-btn">确 定</a>-->
		   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
		</div>
	</div>
	<!--设为成功-->
	<div id="dlgOk2" class="ui-dialog ok2-dialog">
		   <div class="ui-dlg-content ui-relative">
	       <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
	       <div class="ui-dlg-text">设为普通用户成功！</div>
	       <a href="javascript:;" class="ui-red-btn" onclick="refresh();">确 定</a>
		</div>
	</div>
	<!--设为失败-->
	<div id="dlgWarn" class="ui-dialog warn-dialog">
			<div class="ui-dlg-content ui-relative">
	       <div class="ui-dlg-text"></div>
	       <a href="javascript:;" class="ui-red-btn ui-dlg-cancel">确 定</a>
			</div>
		</div>
	
	

<script>
$(function(){
   $('#dlgOk2').siblings('.panel-header').find('.panel-tool-close:eq(0)').click(function(){
	  refresh();
	});
	//类别下用户管理列表
	$("#typeUserList").datagrid({
		url:'/userManage/userTypeManage/selectUserTypeUserList?levelId=${levelId}',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'userId',//id字段
		sortName:'userId',//当数据表格初始化时以哪一列来排序
		sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pageSize:20,
		pagePosition:top,
		columns:[[
			{field:'userId',align:'center',width:"15%",title:'用户ID',sortable:true,
				formatter:function(value,rec){
				  return pad(rec.userId, 6);
				}
			},
			{field:'username',align:'center',width:"15%",title:'账户名'},
			{field:'realName',align:'center',width:"15%",title:'实名'},
			{field:'userTypeName',align:'center',width:"15%",title:'用户类型',sortable:true},
			{field:'levelName',align:'center',width:"15%",title:'用户类别'},
			{field:'statusName',align:'center',width:"12%",title:'用户状态',sortable:true},
			{field:'opt',align:'center',width:"12%",title:'操作',
				formatter:function(value,rec){
				var html='${fButton(list, 'DETAILS','<a class="operation-link" href="@URL@?id=\'+rec.userId+\'">[查看]</a>')}';
				if(rec.levelId!=1){
				       html='${fButton(list, 'SET','<a class="operation-link" href="javascript:delConfirm(\'+rec.userId+\');">[设为普通用户  ]</a>')}'+html;
					}
			        return html;
			        }
				 <#-- var html='<a class="operation-link" href="/userManage/userTypeManage/selectUserMessage?id='+rec.userId+'">[查看]</a>';
					if(rec.levelId!=1){
						html='<a class="operation-link" href="javascript:delConfirm('+rec.userId+');">[设为普通用户  ]</a>'+html;
					}
			        return html;
				}-->
			}
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);  
         }
	});
	//分页
$("#typeUserList").datagrid("getPager").pagination({
	    pageSize:20,
	    displayMsg:"",
	    layout:['list','sep','prev','links','next','manual'],
	    showPageList:false
	 });

	function loadFilter(data) {
	//console.log(data);
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