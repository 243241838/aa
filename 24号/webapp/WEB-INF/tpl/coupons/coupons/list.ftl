
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>运营管理-营销策略管理-专题管理</title>
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
							<label class="name operate-item-label">优惠券编号</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="couponId" value="" maxlength=6/>
							</span>
						</li>
						<li>
							<label class="name" style="width:75px;">优惠券名称</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="40"  name="couponName" value=""/></span>
						</li>
						<li>
							<label class="name">优惠方式</label>
							<select class="ui-combobox" name="couponType" id="couponType" >
								<option value="" >全部</option>
								<option value="1">折扣优惠</option>
								<option value="2">金额优惠</option>
							</select>
						</li>
					</ul>
					<ul class="search-list fn-clear">
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
				<a href="${base}/coupons/addCoupons" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增优惠劵</a>
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
			url:'${base}/coupons/findCouponsView',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			idField:'couponId',
			columns:[[
				{field:'couponId',align:'center',width:"10%",title:'优惠券编号',
		          	 formatter:function(value,rec){
			          	 var url='${base}/coupons/toEditCoupons';
						return '<a class="operation-link" href="'+url+'?couponId='+rec.couponId+'">'+rec.couponId+'</a>';
			  	}},
				{field:'couponName',align:'center',width:"35%",title:'优惠券名称'},
				{field:'couponType',align:'center',width:"10%",title:'优惠方式',
					formatter:function(value,rec){
						var str = "其他";
						if(rec.couponType == 1){
							str = "折扣";
						}if(rec.couponType == 2){
							str = "金额";
						}
						return str;
				}},
				{field:'couponValue',align:'center',width:"20%",title:'优惠值',
					formatter:function(value,rec){
					if(rec.couponType == 1){
						return rec.couponValue/100+"%";
					} else{
					    return (rec.couponValue/100).toFixed(2);
					}
				}},
				{field:'opt',align:'center',width:"23%",title:'操作',
					formatter:function(value,rec){
						 var url='${base}/coupons/activitylistView';
						return '<a class="operation-link" href="'+url+'?couponId='+rec.couponId+'">查看关联活动</a>';
			  	}}
			]],

			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      },
    	onLoadSuccess:function(){
      		pageCls();
      		//sortCell(['effTime','expTime']);//排序要显示箭头的，以数组形式传
      	}
		});
		//分页
		pageAction();
		
   });
     
	</script>
</body>
</html>