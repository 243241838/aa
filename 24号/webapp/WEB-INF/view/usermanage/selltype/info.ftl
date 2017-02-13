<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
	<script type="text/javascript" src="/js/plugins.js"></script>
</head>
<body>

<div id="dlgList" class="ui-dialog list-dialog" style="display:block;">
		<!-- 搜索 -->
	<div class="search-item">
		<form  id="searchform2" class="ui-search-form">
			<ul class="search-list fn-clear">
				<li>
					<span class="name">用户ID：</span>
					<span class="textbox">
					  <input class="textbox-text textbox-prompt intOnly" type="text" name="userId"  maxlength=19/>
					</span>
				</li>
				<li>
					<span class="name">账户名：</span>
					<span class="textbox">
					  <input class="textbox-text textbox-prompt" maxlength=120 type="text" name="username" />
					</span>
				</li>
				<li>
					<span class="name">实名：</span>
					<span class="textbox">
					  <input class="textbox-text textbox-prompt" maxlength=120 type="text" name="realName" />
					</span>
				</li>
				<li class="btn-group">
					<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search2">搜 索</a>
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
		</form>
	</div>
	<!-- 搜索end -->
	<!-- 列表 -->
	<div class="list-item dlg-list-item fn-clear ui-relative">
	    <form id="typeOtherAdd" action="/userManage/sellTypeManage/updateSellerType" method="post">
	        <input type="hidden" value="${levelId}" id="levelId"/>
	        <input type="hidden" value="${levelName}" id="levelName2"/>
			<table id="dgck-list" class="easyui-tab" width="99%">	
			</table>
			<div class="ui-nodata fn-hide">
			  <img src="/images/nodata.png"/>
			  <span>暂无数据</span>
			</div>
			<a href="javascript:addTypeUser('typeOtherAdd',1);" id="batchAdd"  class="ui-trans-btn ui-batch-pos">批量添加</a>
		</form>
	</div>
	<!-- 列表end -->
	</div>
	
	<!--确认-->
	<div id="dlgConfirm2" class="ui-dialog warn-dialog confirm-dialog">
		<div class="ui-dlg-content ui-relative">
	    <div class="ui-dlg-text">确认要将这些用户加入"<span id="del-tip"></span>"类别吗？</div>
	    <input type="hidden" id="del-hideId2"/>
		   <a href="javascript:addTypeNext('typeOtherAdd','dlgOk22','dlgWarn2');" class="ui-red-btn">确 定</a>
		   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
		</div>
	</div>
	<!--确认 单个-->
	<div id="dlgConfirm3" class="ui-dialog warn-dialog confirm-dialog">
		<div class="ui-dlg-content ui-relative">
	    <div class="ui-dlg-text"></div>
	    <input type="hidden" id="del-hideId"/>
		   <a href="javascript:addTypeNext('typeOtherAdd','dlgOk22','dlgWarn2','one');" class="ui-red-btn">确 定</a>
		   <a href="javascript:;" class="ui-red-btn ui-dlg-cancel" >取 消</a>
		</div>
	</div>
    <!--成功提示-->	      
	<div id="dlgOk22" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
		<div class="ui-dlg-content ui-relative">
	    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
	    <div class="ui-dlg-text">添加成功！</div>
	    <a  href="javascript:parent.location.reload();" class="ui-red-btn ui-toList">确 定</a>
		</div>
	</div>
	<!--失败提示-->	
	<div id="dlgWarn2" class="ui-dialog warn-dialog" data-options="iconCls:'icon-save'">
		<div class="ui-dlg-content ui-relative">
	       <div class="ui-dlg-text">添加失败</div>
	       <a href="#" class="ui-red-btn ui-toClose">确 定</a>
		</div>
	</div>
    <script type="text/javascript" src="/js/jquery.datagrid.js"></script>
	<script>
	$(function(){
		//列表
		$("#dgck-list").datagrid({
			url:'/userManage/sellTypeManage/selectUserListBySellLevel?levelId=2',
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
			columns:[[
			    {field:'id',align:'center',width:"10%",title:'<input type="checkbox" onclick="ckbxAll(this);"/>',
				    formatter:function(value,rec){
				           return '<input type="checkbox" class="ckbxSon" name="list" value="'+rec.userId+'"/>'
				   }
			     },
				{field:'userId',align:'center',width:"15%",title:'用户ID',
				   formatter:function(value,rec){
						  return pad(rec.userId, 6);
					}
				},
				{field:'username',align:'center',width:"20%",title:'账户名'},
				{field:'realName',align:'center',width:"14%",title:'实名'},
				{field:'sellerTypeName',align:'center',width:"12%",title:'商户类型'},
				{field:'sellStateName',align:'center',width:"13%",title:'商户状态'},
				{field:'opt',align:'center',width:"15%",title:'操作',
					formatter:function(value,rec){
						return '<a href="javascript:addTypeUserOne('+rec.userId+',\''+rec.realName+'\',\''+rec.username+'\');" class="ui-trans-btn">选择</a>';
					}
				}
			]],
		    queryParams: form2Json("searchform2"),
		    loadFilter:function(data){
	            return loadFilter(data);    //自定义过滤方法
	         }
		});
		//分页
        $("#dgck-list").datagrid("getPager").pagination({
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
		   $('#batchAdd').hide();
		}else{
		   $('.ui-nodata').addClass('fn-hide');
		   $('.datagrid-pager').css('visibility','visible');
		    $('#batchAdd').show();
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

	$("#submit_search2").click(function () {
		 var listId=$('.easyui-tab').attr('id');
	     $("#"+listId).datagrid({ queryParams: form2Json("searchform2") });   //点击搜索
	});
 
	});
	</script>
</body>
</html>