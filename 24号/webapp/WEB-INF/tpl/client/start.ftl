<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>启动页面管理-客户端管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
</head>

<body>
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>

		<div class="ui-datagrid-wrap">
			<!-- 搜索 -->
			<div class="search-wrap">
				<form  id="search-ff" class="ui-search-form">
					<ul class="search-list search-oneline fn-clear">
						<li>
							<label class="name">标题</label>
							<span class="textbox">
								<input class="textbox-text textbox-prompt" type="text" name="resourceKeywords" value=""/>
							</span>
						</li>
						<li>
							<label class="name">系统类型</label>
							<select class="ui-combobox" name="resourceLabel" id="resourceLabel">
								<option value="" selected ="selected">全部</option>
								<option value="1" >IOS</option>
								<option value="2">Android</option>
							</select>
						</li>
            			<li class="date">
							<label class="name">有效期</label>
								<input id="startTime" name="effTimeStr" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#endTime']"/>
							  <em class="ui-channel-titcolor">至</em>
							  <input id="endTime" name="expTimeStr" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#startTime']"/>
						</li>
					  	<li class="btn-group">
							  <a href="javascript:void(0)" class="search-btn" onclick="submitForm()">搜索</a>
				    		<a href="javascript:void(0)" class="search-btn" onclick="clearForm()">重置</a>
						</li>
					</ul>
				</form>
				<input type="hidden" id="excel-data"/>
			</div>
			<!-- 搜索end -->
			<!-- 列表 -->
			<div class="list-item fn-clear">
				<a href="${base}/client/toAddStartImg" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增</a>
				<table id="dg-list" class="easyui-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
		</div>
	</div>

	<!--弹框-->  
  <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="delStartTit" >确定要删除首次启动页面吗？</h3>
    <input type="button" class="ui-dlgOk-btn" value="确定" id="confirmDel"/>
    <input type="button" class="ui-dlgCancel-btn" value="取消" id="cannelDel"/>
  </div>
  <div id="alt" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="delStartTit2" >删除成功!</h3>
  </div>
  <div id="error" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="delStartTit3" >异常情况,删除失败!</h3>
  </div>
	<div class="client-imgshow" id="imgbox-toggle">
		<img src="" id="client-bigimg" width="400" height="600" />
	</div>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'${base}/client/findStartMessage',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'resourceId',align:'center',width:"15%",title:'启动ID',
					formatter:function(value,rec){
						var url = "${base}/client/toEditView?resourceId="+rec.resourceId;
						return '<a class="operation-link" href="'+url+'">'+rec.resourceId+'</a>';
					}
				},
				{field:'resourceValue',align:'center',width:"15%",title:'图片预览',
					formatter: function(value,rec){
						var url = '<img src="${base}'+value+'" class="client-imgpreview" width="100" height="30" />';
						return url;
					}
				},
				{field:'resourceKeywords',align:'center',width:"15%",title:'标题'},
				{field:'resourceLabel',align:'center',width:"20%",title:'系统类型',
					formatter: function(value,rec){
						var str = "";
						if(value=="ios_startup_logo"){
							str = "IOS";
						} else if (value=="android_startup_logo"){
							str = "Android";
						} else {
							str = "Other";
						}
    	                return str;
               		}
				},
				{field:'effTime',align:'center',width:"18%",title:'有效期',
					formatter: function(value,rec){
    	                return formatDate(rec.effTime)+" 至 "+formatDate(rec.expTime);
               		}
				},
				{field:'opt',align:'center',width:"15%",title:'操作',
           			formatter:function(value,rec){
           				var str = "";
						if(rec.resourceLabel=="ios_startup_logo"){
							str = "IOS";
						} else if (rec.resourceLabel=="android_startup_logo"){
							str = "Android";
						} else {
							str = "Other";
						}
           				
           				var url = '<font color="red"><a class="operation-link" '+ 
           					' href="javascript:delRow('+rec.resourceId+',\''+str+'\');">[删除]</a></font>';
						return url;
					}
			  	}	
			]],
			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      },
      onLoadSuccess:function(){
      	pageCls();
      	showBigPic();
      }
		});
		//分页
		pageAction();
		
   });
	
	function delRow(id,name){
	
		showAlert('dlg');
		$("#delStartTit").text("确定要删除"+name+"首次启动页面吗？");
		$("#confirmDel").click(function(){
			$.ajax({
				url : '${base}/client/delResour',
				type : 'post',
				dataType : 'json',
				data: {"resourceId": id},
				success : function(data) {
				    if(data.succ){
				    	showAlert('alt');
				    	window.setInterval( function () {
					    	location.reload();
						}, 1000 );
				    }else{
				    	$("#delStartTit3").text(data.entity);
				    	showAlert('error');
				    	return false;
				    }
				},
				error:function(data){
				   showAlert('error');
				   return false;
				}		
			});
		})
	}
	</script>
</body>
</html>