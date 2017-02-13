<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>统计报表-用户信息统计-统计结果</title>
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script>
		function formatter2(date){
			if (!date){return '';}
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			return y + '-' + (m<10?('0'+m):m);
		}
		function parser2(s){
			if (!s){return null;}
			var ss = s.split('-');
			var y = parseInt(ss[0],10);
			var m = parseInt(ss[1],10);
			if (!isNaN(y) && !isNaN(m)){
				return new Date(y,m-1,1);
			} else {
				return new Date();
			}
		}
	</script>
</head>

<body>
  <div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	 <#include "/common/include/power.ftl">
	</div>
	<div class="ui-list-content">
	  <!-- 搜索 -->
	  <div class="search-item">
		<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
			<ul class="search-list fn-clear">
				<li class="date ui-date">
					<span class="name">统计时间：</span>
					<#--<input id="startTime" name="countMonthBegin" class="easyui-datebox"  data-options="formatter:formatDay" validType="mdM['#endTime']">
					<em>至</em>
					<input id="endTime" name="countMonthEnd" class="easyui-datebox"   data-options="formatter:formatDay" validType="mdM['#startTime']">
					-->
					<input class="easyui-datetimespinner" value="${month}" name="countMonthBegin" id="startTime"
					data-options="formatter:formatter2,parser:parser2,selections:[[0,4],[5,7]]" style="width:140px;height:26px;" validType="mdM['#endTime']">
					<em>至</em>
					<input class="easyui-datetimespinner" value="${month}" name="countMonthEnd" id="endTime"
					data-options="formatter:formatter2,parser:parser2,selections:[[0,4],[5,7]]" style="width:140px;height:26px;" validType="mdM['#startTime']">
				</li>
				<li class="btn-group">
					<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >统 计</a>
				</li>
			</ul>
			<input type="hidden" name="sort" value="userId"/>
			<input type="hidden" name="order" value="desc"/>
		</form>
		<input type="hidden" id="excel-data"/>
	  </div>
	<!-- 搜索end -->
	<!-- 列表 -->
	<div class="list-item fn-clear ui-relative" >
	${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')} 
		<#--<a href="javascript:doExcel('/report/userMessReport/outExcel');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>-->
		<div class="tab-box">
		<table id="userList" class="easyui-tab" width="300%" >
		<thead>
			<tr>
				<th rowspan="3" field="countMonth" width="800">月份</th>
				<th rowspan="2" colspan="3"  field="thisRegisterQyNum2" width="800" >本期新增注册用户数</th>
				<th rowspan="3"  field="thisTempNum" width="1000">本期新增临<br>时用户数</th>
				<th rowspan="2" colspan="3"  field="noSellerTransferNum" width="800">总注册用户数</th>
				<th rowspan="3" field="totalTempNum" width="800">总临时<br>用户数</th>
				<th rowspan="3" field="totalUserNum" width="800">总用户数</th>
				<th colspan="8" field="countDayString" width="800">用户活跃度</th>
				<th colspan="8" field="countDayString" width="800">用户有效状态</th>
				<th colspan="13" field="countDayString" width="1800">用户认证状态</th>
				
			</tr>
			<tr>
				<th colspan="4"  field="countDayString" width="1200">本期活跃用户数</th>
				<th colspan="4"  field="countDayString" width="800">本期沉默用户数</th>
				
				<th colspan="4"  field="countDayString" width="800">本期正常用户数</th>
				<th colspan="4"  field="countDayString" width="800">本期禁用用户数</th>
				
				<th colspan="3"  field="countDayString" width="800">手机认证用户</th>
				<th colspan="5"  field="countDayString" width="800">邮箱认证用户</th>
				<th colspan="5"  field="countDayString" width="800">实名认证用户</th>
			</tr>
			<tr>
				<th  field="thisRegisterQyNum" width="800">企业</th>
				<th  field="thisRegisterGrNum" width="800">个人</th>
				<th  field="thisRegisterNum" width="800">合计</th>
				
				<th  field="totalRegisterQyNum" width="800">企业</th>
				<th  field="totalRegisterGrNum" width="800">个人</th>
				<th  field="totalRegisterNum" width="800">合计</th>
				
				<th  field="thisActiveQyNum" width="1200">企业</th>
				<th  field="thisActiveGrNum" width="1200">个人</th>
				<th  field="thisActiveNum" width="1200">合计</th>
				<th  field="proportionActiveStr" width="1400">占期末总注册<br>用户数百分比</th>
				
				<th  field="thisSilenceQyNum" width="1200">企业</th>
				<th  field="thisSilenceGrNum" width="1200">个人</th>
				<th  field="thisSilenceNum" width="1200">合计</th>
				<th  field="proportionSilenceStr" width="1400">占期末总注册<br>用户数百分比</th>
				
				<th  field="thisNormalQyNum" width="1200">企业</th>
				<th  field="thisNormalGrNum" width="1200">个人</th>
				<th  field="thisNormalNum" width="1200">合计</th>
				<th  field="proportionNormalStr" width="1400">占期末总注册<br>用户数百分比</th>
				
				<th  field="thisDisableQyNum" width="1200">企业</th>
				<th  field="thisDisableGrNum" width="1200">个人</th>
				<th  field="thisDisableNum" width="1200">合计</th>
				<th  field="proportionDisableStr" width="1400">占期末总注册<br>用户数百分比</th>
				
				<th  field="thisMobileAuthNum" width="1400">本期新增<br>认证用户数</th>
				<th  field="totalMobileAuthNum" width="1400">总认证<br>用户数</th>
				<th  field="proportionMobileAuthStr" width="1400">占期末总个人<br>用户数百分比</th>
				
				<th  field="thisEmailAuthQyNum" width="1400">本期新增企业<br>认证用户数</th>
				<th  field="thisEmailAuthGrNum" width="1400">本期新增个<br>人认证用户数</th>
				<th  field="totalEmailAuthNum" width="1400">本期新增<br>认证合计</th>
				<th  field="totalEmailNum" width="1400">总认证<br>用户数</th>
				<th  field="proportionEmailAuthStr" width="1400">占期末总注册<br>用户数百分比</th>
				
				<th  field="thisRealAuthQyNum" width="1400">本期新增企业<br>认证用户数</th>
				<th  field="thisRealAuthGrNum" width="1400">本期新增个人<br>认证用户数</th>
				<th  field="totalRealAuthNum" width="1400">本期新增认证<br>合计</th>
				<th  field="totalRealNum" width="1400">总认证用户数</th>
				<th  field="proportionRealAuthStr" width="2000">占期末总注册<br>用户数百分比</th>
			</tr>
		</thead>
		</table>
		<div class="ui-nodata fn-hide">
		  <img src="/images/nodata.png"/>
		  <span>暂无数据</span>
		</div>
      </div>
	</div>
	<!-- 列表end -->
  </div>
 </div>
	<script>
	var ifSerach=false;
	$(function(){
	$("#userList").datagrid({
		url:'/report/userMessReport/selectUserCount',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'userId',//id字段
		//sortName:'countMonth',//当数据表格初始化时以哪一列来排序
		//sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		pageSize:20,
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pagePosition:top,
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
	        if(!ifSerach){
	          $('input[name="countMonthBegin"]').val('${month}'),$('input[name="countMonthEnd"]').val('${month}');
			}
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
	         //dateType();
	         var exdata=$("#"+id).serialize();
		     $('#excel-data').val(exdata);
	        var json = $.parseJSON(jsonStr);
	        return json
	}
	dateValid({month:true});
	$("#submit_search").click(function () {
		 if($("#searchform").form("validate")){
	         //dateType();
		     var listId=$('.easyui-tab').attr('id');
		      ifSerach=true;
		     $("#"+listId).datagrid({ queryParams: form2Json("searchform") });   //点击搜索
	     }
	});
	$("#submit_reset").click(function(){
	    var form=$(this).parents("form");
	    resetForm(form);
	  
	})
     
});
</script>

</body>
</html>