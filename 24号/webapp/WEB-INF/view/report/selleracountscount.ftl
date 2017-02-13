<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>统计报表-结算信息类-商户结算数据统计</title>
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
	<div class="ui-list-content">
	  <!-- 搜索 -->
	  <div class="search-item">
		<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
			<ul class="search-list fn-clear">
				<li class="date">
					<span class="name">统计时间：</span>
					<input id="startTime" name="countDayBeginReport" value="${countDayBeginReport}"  class="easyui-datebox" validType="mdM['#endTime']">
					<em>至</em>
					<input id="endTime" name="countDayEndReport" value="${countDayEndReport}" class="easyui-datebox"  validType="mdM['#startTime']">
				</li>
				<li>
					<span class="name">商户：</span>
					<select class="seaway-combobox" name="countSellerId" >
						<option value="">全部</option>
						<#if sellerList?has_content>
							<#list sellerList as cl>
								<option value="${cl.userId?if_exists}">${cl.sellerName?if_exists}</option>
							</#list>
						</#if>
					</select>
				</li>
				<li class="btn-group">
					<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >统 计</a>
				</li>
			</ul>
			<ul class="search-list fn-clear">
			    <li>
					<span class="name">统计方式：</span>
					<span class="">
						<#if report_count_type?has_content>
							<#list report_count_type as cl>
							   <#if cl.key==0||cl.key==3>
						       <label>
						       <input class="ui-radio" name="countType" value="${cl.key?if_exists}" type="radio" <#if cl_index==0>checked</#if>/>
						       ${cl.value?if_exists}
						       </label>
							   </#if>
							</#list>
						</#if>
					</span>
			    </li>
			</ul>
		</form>
		<input type="hidden" id="excel-data"/>
	  </div>
	<!-- 搜索end -->
	<!-- 列表 -->
	<div class="list-item fn-clear ui-relative">
	${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')} 
		<#--<a href="javascript:doExcel('/report/accountsMess/sellerAcountsCountExcel');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>-->
		<table id="userList" class="easyui-tab" width="100%">
		</table>
		<#--<div class="amount-tab fn-clear" width="99.15%">
		    <ul width="100%">
		        <li style="width:39px;">总计</li>
			    <li style="width:7.8%;"></li>
			    <li style="width:8.6%;"></li>
			    <li style="width:8.6%;"></li>
			    <li style="width:8.6%;"></li>
			    <li style="width:8.6%;"></li>
			    <li style="width:8.7%;"></li>
			    <li style="width:8.7%;"></li>
			    <li style="width:8.7%;"></li>
			    <li style="width:9.5%;"></li>
			    <li style="width:8.6%;"></li>
			    <li style="width:8.4%;"></li>
		    </ul>
		</div>-->
		<div class="ui-nodata fn-hide">
		  <img src="/images/nodata.png"/>
		  <span>暂无数据</span>
		</div>
	</div>
	
	
	<!-- 列表end -->
  </div>
 </div>
	<script>
	var ifSerach=false,ifcked=0;
	var tabhtml="",tabhead="",dataLen=0;
	$(function(){
	$("#userList").datagrid({
		url:'/report/accountsMess/selectSellerAcountsCount',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'id',//id字段
		//sortName:'countSellerId',//当数据表格初始化时以哪一列来排序
		//sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		pageSize:20,
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pagePosition:top,
		columns:[[
			{field:'countSellerId',align:'center',width:"8%",title:'商户ID'},
			{field:'countSeller',align:'center',width:"9%",title:'商户名称'},
			{field:'countDayString',align:'center',width:"17%",title:'日期',
			 formatter:function(val,rec){
					       return dateformat(rec.countDayString)
					       }
				      },
			{field:'collectNum',align:'center',width:"9%",title:'收银笔数'},
			{field:'collectSumYuan',align:'center',width:"9%",title:'收银金额(元)'},
			{field:'paymentRefundNum',align:'center',width:"9%",title:'退款笔数'},
			{field:'paymentRefundSumYuan',align:'center',width:"9%",title:'退款金额(元)'},
			{field:'paymentNetAccountYuan',align:'center',width:"9%",title:'交易净额(元)'},
			{field:'paymentBankNum',align:'center',width:"9%",title:'银行代付笔数'},
			{field:'paymentBankSumYuan',align:'center',width:"10%",title:'银行代付金额(元)'},
			{field:'handingSumYuan',align:'center',width:"9%",title:'手续费(元)'},
			{field:'totalRevenueYuan',align:'center',width:"9%",title:'到账金额(元)'}
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         },
        onLoadSuccess: function(){
          if(dataLen!=0){
	          var view1=$('.datagrid-view1 .datagrid-body'),view2=$('.datagrid-view2 .datagrid-body'),view=$('.datagrid-view');
	          view2.find('.datagrid-btable').append(tabhtml);
	          view2.css('height',parseInt(parseInt(view2.css('height'))+40)+'px');
	          view1.find('.datagrid-btable').append(tabhead);
	          view1.css('height',parseInt(parseInt(view1.css('height'))+40)+'px');
	          view.css('height',parseInt(parseInt(view.css('height'))+40)+'px');
           }
        }
	});
    $("#userList").datagrid("getPager").pagination({
		    pageSize:20,
		    displayMsg:"",
		    layout:['list','sep','prev','links','next','manual'],
		    showPageList:false
		 });
    
    if(!ifSerach){
	   $("#userList").datagrid('hideColumn', 'countDayString');
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
			dataLen=data.entity.items.length;
			if(dataLen!=0){
			     var amount=data.entity.obj;
			     if(amount!=null){
			     
			      if( ifcked==1){
			         tabhtml='<tr style="height: 40px;"><td><div class="datagrid-cell">'
						     +'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalTwo)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalThree)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalFour)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalFive)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalSix)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalSeven)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalEight)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalNine)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalTen)+'</div></td></tr>';
			      }else{
			         tabhtml='<tr style="height: 40px;"><td><div class="datagrid-cell">'
						     +'</div></td><td><div class="datagrid-cell">'
						     +'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalThree)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalFour)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalFive)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalSix)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalSeven)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalEight)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalNine)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalTen)+'</div></td><td><div class="datagrid-cell">'
						     +notundef(amount.totalEleven)+'</div></td></tr>';
			      }
			     
				  tabhead='<tr class="datagrid-row" style="height: 40px;"><td class="datagrid-td-rownumber">'
				          +'<div class="datagrid-cell-rownumber">总计</div></td></tr>';
			     }
			}
		}
		
		  /* if(data.entity.items.length!=0){
		      $('.amount-tab').show();
		      var amount=data.entity.obj,tds=$('.amount-tab ul:eq(0)').find('li');
		      
		      if( ifcked==1){
		        tds.eq(1).css('border-right-width','0');
		        tds.eq(2).text('');
		        tds.eq(3).text(notundef(amount.totalTwo));
		        tds.eq(4).text(notundef(amount.totalThree));
		        tds.eq(5).text(notundef(amount.totalFour));
		        tds.eq(6).text(notundef(amount.totalFive));
		        tds.eq(7).text(notundef(amount.totalSix));
			    tds.eq(8).text(notundef(amount.totalSeven));
		        tds.eq(9).text(notundef(amount.totalEight));
		        tds.eq(10).text(notundef(amount.totalNine));
		        tds.eq(11).text(notundef(amount.totalTen));
		      }else{
		        tds.eq(1).css('border-right-width','1px');
		        tds.eq(3).text(notundef(amount.totalThree));
		        tds.eq(4).text(notundef(amount.totalFour));
		        tds.eq(5).text(notundef(amount.totalFive));
		        tds.eq(6).text(notundef(amount.totalSix));
			    tds.eq(7).text(notundef(amount.totalSeven));
		        tds.eq(8).text(notundef(amount.totalEight));
		        tds.eq(9).text(notundef(amount.totalNine));
		        tds.eq(10).text(notundef(amount.totalTen));
			    tds.eq(11).text(notundef(amount.totalEleven));
		      }
		     
		        
			    
			$('.amount-tab').insertAfter($('.datagrid-view'));
		   }else{
		     $('.amount-tab').hide();
		   }
		   
		
		}*/
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
			  var d1=datefot('${countDayBeginReport}'),d2=datefot('${countDayEndReport}');
	          $('input[name="countDayBeginReport"]').val(d1),$('input[name="countDayEndReport"]').val(d2);
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
	         
	        dateType();
	        var exdata=$("#"+id).serialize();
	        $('#excel-data').val(exdata);
	        var json = $.parseJSON(jsonStr);
	        return json
	}
	
	dateValid();
	$("#submit_search").click(function () {
	     
		 if($("#searchform").form("validate")){
		     var type=0;
		     type=$('input[name="countType"]:checked').val()==0?0:1; //0 日期 3商户
		     
	         
	         if(type==0){
		        $("#userList").datagrid('showColumn', 'countDayString');
		        $("#userList").datagrid('hideColumn', 'countSellerId');
		        $("#userList").datagrid('hideColumn', 'countSeller');
		        ifcked=1;
		     }else if(type==1){
		        $("#userList").datagrid('showColumn', 'countSellerId');
		        $("#userList").datagrid('showColumn', 'countSeller');
		        $("#userList").datagrid('hideColumn', 'countDayString');
		        ifcked=0;
		     
		     }
	         
	         dateType();
		     ifSerach=true;
		     
		     var listId=$('.easyui-tab').attr('id');
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