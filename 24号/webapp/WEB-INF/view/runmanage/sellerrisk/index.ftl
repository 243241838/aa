<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>运营管理-风控管理-商户风控管理-列表</title>
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
		<span class="crumbs-tit">商户风控管理</span> -->
	</div>
	<div class="ui-list-content">
	  <!-- 搜索 -->
	  <div class="search-item">
		<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
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
					<span class="name">商户类型：</span>
					<select class="seaway-combobox" name="sellerType" >
						<option value="">全部</option>
							<#if sellType?has_content>
							<#list sellType as cl>
								<option value="${cl.key?if_exists}">${cl.value?if_exists}</option>
							</#list>
						
						</#if>
					</select>
				</li>
				
				<li>
					<span class="name">商户类别：</span>
					<select class="seaway-combobox" name="levelId" >
						<option value="">全部</option>
						<#if userLevelExtendMdl?has_content>
							<#list userLevelExtendMdl as cl>
								<option value="${cl.id?if_exists}">${cl.levelName?if_exists}</option>
							</#list>
						</#if>
					</select>
				</li>
				<li>
					<span class="name">商户状态：</span>
					<select class="seaway-combobox" name="sellState" >
						<option value="">全部</option>
						<#if sellerState?has_content>
							<#list sellerState as cl>
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
	  ${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')}
	  <!-- <a href="javascript:doExcel('/runManage/sellerRisk/sellMessageExcel');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a> -->
	  <table id="userList" class="easyui-tab" width="100%">
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
    <div class="ui-dlg-text">确定要此商户状态设为<span id="del-tip">禁用</span>吗？
  </div>
    <input type="hidden" id="del-hideId"/>
	   <a href="javascript:delNext('/runManage/sellerRisk/updateSellerState');" class="ui-red-btn">确 定</a>
	   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
	</div>
  </div>
  <!--删除成功-->
  <div id="dlgOk2" class="ui-dialog ok2-dialog">
	   <div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
       <div class="ui-dlg-text">设置成功！</div>
       <a href="javascript:;" class="ui-red-btn" onclick="refresh();">确 定</a>
	</div>
  </div>
  <!--删除失败-->
  <div id="dlgWarn" class="ui-dialog warn-dialog">
		<div class="ui-dlg-content ui-relative">
       <div class="ui-dlg-text"></div>
       <a href="javascript:;" class="ui-red-btn ui-dlg-cancel">确 定</a>
		</div>
	</div>
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script>
	$(function(){
	//用户信息查询
	$("#userList").datagrid({
		url:'/runManage/sellerRisk/sellMessageList',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'userId',//id字段
		sortName:'userId',//当数据表格初始化时以哪一列来排序
		sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		pageSize:20,
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pagePosition:top,
		columns:[[
			{field:'userId',align:'center',width:"10%",title:'用户ID',sortable:true,
				formatter:function(value,rec){
				   return pad(rec.userId, 6);
				}
			},
			{field:'username',align:'center',width:"18%",title:'账户名'},
			{field:'realName',align:'center',width:"15%",title:'实名'},
			{field:'sellerTypeName',align:'center',width:"15%",title:'商户类型',sortable:true},
			{field:'levelName',align:'center',width:"14%",title:'商户类别',sortable:true},
			{field:'sellStateName',align:'center',width:"14%",title:'商户状态',sortable:true},
			{field:'opt',align:'center',width:"13%",title:'操作',
				formatter:function(value,rec){
				var html='';
				if(rec.sellState==0){
				  html='${fButton(list,"SET","<a class=\"operation-link\" href=\"javascript:delConfirm('+rec.userId+','+'\\'禁用\\''+')\">[设为禁用]</a>")}';
					 /*  '<a class="operation-link" href="javascript:delConfirm('+rec.userId+',\'禁用\');">[设为禁用]</a>'; */
				}else{
					html='${fButton(list,"SET","<a class=\"operation-link\" href=\"javascript:delConfirm('+rec.userId+','+'\\'正常\\''+')\">[设为正常]</a>")}';
				   /* html='<a class="operation-link" href="javascript:delConfirm('+rec.userId+',\'正常\');">[设为正常]</a>'; */
				}
				 html+='${fButton(list,"DETAILS","<a class=\"operation-link\" href=\"@URL@?id='+rec.userId+'\">[查看]</a>")}';
					 /* '<a class="operation-link" href="/runManage/sellerRisk/selectSellDetailsMessage?id='+rec.userId+'">[查看]</a>'; */
			        return html;
				}
			}
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         }
	});
    $("#userList").datagrid("getPager").pagination({
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
	 var listId=$('.easyui-tab').attr('id');
     $("#"+listId).datagrid({ queryParams: form2Json("searchform") });   //点击搜索
});
$("#submit_reset").click(function(){
    $(this).parents("form").get(0).reset();
   /* $(this).parents("form").find('select').each(function(index){
    	  var optidx='';
    	  $(this).find('option').each(function(opt){
    	  	if($(this).val()==''){
               optidx=opt;
               return;
    	  	}
    	  });
          $('.combo-p:eq('+index+')').find('.combobox-item:eq(0)').addClass('combobox-item-selected').siblings('.combobox-item').removeClass('combobox-item-selected');
    });*/
  
})
	});
	</script>
</body>
</html>