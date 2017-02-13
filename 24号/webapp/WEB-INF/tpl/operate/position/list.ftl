
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>运营管理-展示位管理-位置管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	
	
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	
	
</head>

<body style="">
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
		<div class="ui-datagrid-wrap">
			<!-- 搜索 -->
			<div class="search-wrap">
				<form  id="search-ff" class="ui-search-form">
					<ul class="search-list fn-clear">
						<li>
							<label class="name">展示位ID</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" maxlength="9" name="posId" value=""/>
							</span>
						</li>
						<li>
							<label class="name">展示名称</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="40" name="posName" value=""/></span>
						</li>
						<li class="btn-group">
							<a href="javascript:void(0)" class="search-btn" onclick="submitForm()">搜索</a>
				    		<a href="javascript:void(0)" class="search-btn" onclick="clearForm()">重置</a>
						</li>
					</ul>
				</form>
			</div>
			<!-- 搜索end -->
			<!-- 列表 -->
			<div class="list-item fn-clear">
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
				
			</div>
			<div class="showpic-preview" id="preview-box">
				<img src="${base}/resource/images/show.png" class="show-img" width="360" height="540"/>
			</div>
			<!-- 列表end -->
		</div>

	</div>
	
	<script>
	$(function(){
		validExtend();
		
		var viewbox = $("#preview-box");
		//列表
		$("#dg-list").datagrid({
			url:'${base}/operate/findPositionView',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'posId',align:'center',width:"30%",title:'展示位ID'},
				{field:'posName',align:'center',width:"38%",title:'展示位名称'},
				{field:'posLogo',align:'center',width:"30%",title:'展示位位置',
					formatter:function(value,rec){
						return '<a class="opt-link pic-preview" herf="javascript:void(0)" data-path="'+rec.posLogo+'">预览</a>';
					}
				}
				
				
			]],

			queryParams: eb.form2Json("search-ff"),
	    	loadFilter:function(data){
            	return eb.loadFilter(data);    //自定义过滤方法
     		 },
     		 onLoadSuccess:function(){
     		 	pageCls();
     		 	
				$(".pic-preview").click(function(){
					viewbox.show();
					var src = $(this).data("path");
					viewbox.find("img").attr("src",src);
					
				})
				viewbox.click(function(){
					$(this).hide();
				})
     		 }
		});
		//分页
		pageAction();
		
		
		
   });
     
	</script>
</body>
</html>