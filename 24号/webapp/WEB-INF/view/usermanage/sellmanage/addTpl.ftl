<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>商户管理-新增</title>
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

<div id="dlgList" class="ui-dialog list-dialog list-dialog2" style="display:block;">
		<!-- 搜索 -->
	<div class="search-item">
		<form  id="searchform" class="ui-search-form">
			<ul class="search-list fn-clear">
				<li>
					<span class="name">用户ID：</span>
					<span class="textbox">
					  <input class="textbox-text textbox-prompt intOnly" type="text" name="userId" />
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
					<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search">搜 索</a>
				</li>
			</ul>
		</form>
	</div>
	<!-- 搜索end -->
	<!-- 列表 -->
	<div class="list-item dlg-list-item fn-clear">
		<table id="dg-list" class="easyui-tab" width="99%">	
		</table>
		<div class="ui-nodata fn-hide">
		  <img src="/images/nodata.png"/>
		  <span>暂无数据</span>
		</div>
	</div>
	<!-- 列表end -->
	</div>
  
    <script type="text/javascript" src="/js/jquery.datagrid.js"></script>
	<script>
	$(function(){
	
		//列表
		$("#dg-list").datagrid({
			url:'/userManage/sellerManage/selectUserList',
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
				{field:'userId',align:'center',width:"20%",title:'用户ID',formatter:function(value,rec){
				  return pad(value,6);
				}},
				{field:'username',align:'center',width:"20%",title:'账户名'},
				{field:'realName',align:'center',width:"20%",title:'实名'},
				{field:'userTypeName',align:'center',width:"18%",title:'用户类型'},
				{field:'opt',align:'center',width:"20%",title:'操作',
					formatter:function(value,rec){
						return '<a href="javascript:choseID(parent.document,'+rec.userType+','+rec.userId+',\''+rec.username+'\',\''+rec.realName+'\');" class="ui-trans-btn">选择</a>';
					}
				}
			]],
		    queryParams: form2Json("searchform"),
		    loadFilter:function(data){
	            return loadFilter(data);    //自定义过滤方法
	         }
		});
		//分页
        $("#dg-list").datagrid("getPager").pagination({
		    pageSize:20,
		    displayMsg:"",
		    layout:['list','sep','prev','links','next','manual'],
		    showPageList:false
	    });
	$('.datagrid-pager-top').hide();   
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
		    $('.datagrid-pager-top').hide();
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
	     $('.datagrid-pager-top').hide();
	});
    
	});
	</script>
</body>
</html>