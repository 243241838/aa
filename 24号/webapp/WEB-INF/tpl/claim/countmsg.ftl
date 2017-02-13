<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>理赔管理-理赔统计</title>
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
				<form  id="search-ff" class="ui-search-form" action="" method="post">
					<ul class="search-list fn-clear ">
						<li>
							<label class="name">申请时间</label>
							<input id="startTime" name="strStartDate" class="easyui-datebox" data-options="editable:false" value="${vo.strStartDate}" 
								validType="md['#startTime']"> <em class="ui-channel-titcolor">至</em>
							<input id="endTime" name="strEndDate" class="easyui-datebox" data-options="editable:false" value="${vo.strEndDate}" validType="md['#endTime']">
						</li>
						<li>
							<label class="name">保险名称</label>
							<span class="textbox">
								<input class="textbox-text textbox-prompt" type="text" id="productName" name="productName" value="${vo.productName}"/>
							</span>
						</li>
						<li>
							<a href="javascript:void(0)" class="search-btn" onclick="subForm()">统计</a>
				    		<a href="${base}/claim/toCountMsg" class="search-btn" >重置</a>
				    		<a href="javascript:void(0)" class="search-btn" onclick="downExcel()">导出EXCEL</a>
			    		</li>
					</ul>
				</form>
			</div>
			<!-- 搜索end -->
			<!-- 列表 -->
			<div class="list-item fn-clear">
				<div class="ui-top-staticis">
					统计时间: ${vo.strStartDate} 至 ${vo.strEndDate}
					共理赔<font color="#FF0000">  <#if count.sumCon gt 0 >${count.sumCon?string(',###.##')}<#else>0</#if> 笔 </font>&nbsp;&nbsp;
					理赔金额<font color="#FF0000"> <#if count.totMon gt 0 >${count.totMon?string(',###.00')}<#else>0</#if> 元 </font>
				</div><br/>
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
		</div>
	</div>

  <div id="alt" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="altText">请将信息填写完整!</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定"/>
  </div>
	<script>
	$(function(){
		validExtend();
   		//列表
		$("#dg-list").datagrid({
			url: '${base}/claim/findListMsg',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,
			sortName:'createTime',
			sortOrder:'desc',
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'createTime',align:'center',width:"12%",title:'理赔时间',
					formatter:function(value,rec){
					    return formatDate(value);
					}
				},
				{field:'productName',align:'center',width:"22%",title:'保险名称',
					formatter:function(value,rec){
					    return '<a href="${base}/product/toProductDetailMsg?type=detail&productId='+rec.productId+'">'+value+'</a>';
					}
				},
				{field:'totCon',align:'center',width:"21%",title:'申请理赔笔数',sortable:true,
					formatter:function(value,rec){
					    return '<a href="${base}/claim/toMsgList?productId='+rec.productId+'&effTimeStr='+formatDate(rec.createTime)+'">'+value+'</a>';
					}
				},
				{field:'succCon',align:'center',width:"21%",title:'成功理赔笔数',sortable:true,
					formatter:function(value,rec){
					    return '<a href="${base}/claim/toMsgList?productId='+rec.productId+'&sts=4&effTimeStr='+formatDate(rec.createTime)+'">'+value+'</a>';
					}
				},
				{field:'totMon',align:'center',width:"22%",title:'理赔金额',sortable:true,
					formatter:function(value,rec){
					    return (value/100).toFixed(2);
					}
				}
			]],
			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      	},
      	onLoadSuccess:function(){
      		pageCls();
      		sortCell(['totCon','succCon','totMon']);//排序要显示箭头的，以数组形式传
      	}
	 });
		//分页
		pageAction();
		
   });
   
   function subForm(){
   		$("#search-ff").attr("action","${base}/claim/toCountMsg");
   		$("#search-ff").submit();
   }
   
   function downExcel(){
   		var strStartTime = $("#startTime").val();
   		var strEndTime = $("#endTime").val();
   		var productName = $("#productName").val();
   		var url="${base}/claim/exportExecl?type='count'";
   		if(strStartTime != "" && strStartTime != null
				&& strEndTime !="" && strEndTime !=null){
   			url = url + "&strStartDate="+strStartTime+"&strEndDate="+strEndTime;
   		}else if(productName !="" && productName != null){
   			url = url + "&strStartDate="+strStartTime+"&strEndDate="+strEndTime+"&productName="+productName;
   		} else {
   			$("#altText").text('请选择申请起止时间!');
	        showAlert('alt');
   		}
    	window.location.href = url;
   }
	</script>
</body>
</html>