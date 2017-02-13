
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
							<label class="name">展示编号</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" maxlength="9"  type="text" name="contentId" value=""/>
							</span>
						</li>
						<li>
							<label class="name">展示位</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="40"  name="posName" value=""/></span>
						</li>
						<li>
							<label class="name gallery-item-label">展示内容类型</label>
							<select class="ui-combobox" name="contentType" id="contentType" >
								<option value="" >全部</option>
								<option value="10">广告推广</option>
								<option value="20">标准产品</option>
								<option value="21">专题产品</option>
								<option value="22">促销产品</option>
								<option value="23">限时抢购产品</option>
								<option value="99">其他</option>
							</select>
						</li>
					</ul>
					<ul class="search-list fn-clear">
						<li>
							<label class="name gallery-item-label">展示内容名称</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" maxlength="40"  type="text" name="posContent" value=""/></span>
						</li>
						<li>
							<label class="name">展示状态</label>
							<select class="ui-combobox" name="domainStatus" id="domainStatus">
								<option value="">全部</option>
								<option value="1">展示未开始</option>
								<option value="2">展示中</option>
								<option value="3">展示已结束</option>
							</select>
						</li>
						<li class="date">
							<label class="name ui-change-item-label">展示时间：</label>
								<input id="startTime" name="effTimestr" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#endTime']">
							   <em class="ui-channel-titcolor">至</em>
							  <input id="endTime" name="expTimestr" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#startTime']">
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
				<a href="${base}/operate/addPositionContent" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增</a>
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
		</div>
	</div>
	
	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'${base}/operate/findPositionListView',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			idField:'contentId',
			sortName:'contentId',
			sortOrder:'desc',
			columns:[[
				{field:'contentId',align:'center',width:"10%",title:'展示编号',styler:function(value,rowData,rowIndex){
 		var html='cursor:pointer;color:blue';
 		return html;
			} },
				{field:'posName',align:'center',width:"15%",title:'展示位'},
				{field:'posContent',align:'center',width:"15%",title:'展示内容名称'},
				{field:'contentType',align:'center',width:"10%",title:'展示内容类型',
				formatter:function(value,rec){
						var str = "其他";
						if(rec.contentType == 10){
							str = "广告推广";
							return str;
						}else if(rec.contentType == 20){
						str = "标准产品";
						   return str;
						} else if(rec.contentType == 21){
						str = "专题产品";
						   return str;
						} else if(rec.contentType == 22){
						str = "促销产品";
						   return str;
						} 
						else if(rec.contentType == 99){
						str = "其他";
						   return str;
						}
						else if(rec.contentType == 23){
						str = "限时抢购产品";
						   return str;
						}
						 return str;
					}
				},
				{field:'domainStatus',align:'center',width:"13%",title:'展示状态',
				formatter:function(value,rec){
						var str = "其他";
						if(rec.domainStatus == 1){
							str = "展示未开始";
							return str;
						}else if(rec.domainStatus == 2){
						str = "展示中";
						   return str;
						} else if(rec.domainStatus == 3){
						str = "展示已结束";
						   return str;
						} 
							 return str;
					}
				},
				{field:'effTime',align:'center',width:"17%",title:'开始时间',sortable:true,
					formatter:function(value,rec){
					    return formatTimestamp(rec.effTime);
					}},
				{field:'expTime',align:'center',width:"17%",title:'结束时间',sortable:true,
					formatter:function(value,rec){
					    return formatTimestamp(rec.expTime);
					}},
			]],
			onClickCell:function(rowIndex, field, value){
			if(field=='contentId'){
			window.location.href="${base}/operate/positionEditInfo?contentId="+value;
			
			}
			},

			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      },
     onLoadSuccess:function(){
      		pageCls();
      		sortCell(['effTime','expTime']);//排序要显示箭头的，以数组形式传
      	}
		});
		//分页
		pageAction();
		
   });
     
	</script>
</body>
</html>