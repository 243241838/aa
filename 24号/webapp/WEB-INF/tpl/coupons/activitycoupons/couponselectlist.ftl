
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
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
			<div class="ui-btn-double">
	            <input type="button" value="确认添加" class="ui-btn-blue ui-submit" id="ButonGetCheck"/>
	            <input type="button" value="返回"  class="ui-btn-grey" id="ButonGetCheckcel"/>
	        </div>
		</div>
		  <div id="dlgm" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">请选择关联产品！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="closecon()" value="确定"/>
  </div> 
	</div>
	
	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'${base}/coupons/findCouponsselectView',
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
				{field: 'cId', checkbox: true },
				{field:'couponId',align:'center',width:"15%",title:'优惠券编号',
		          	 formatter:function(value,rec){
			          	 var url='${base}/coupons/toEditCoupons';
						return '<a class="operation-link" href="'+url+'?couponId='+rec.couponId+'">'+rec.couponId+'</a>';
			  	}},
				{field:'couponName',align:'center',width:"35%",title:'优惠券名称'},
				{field:'couponType',align:'center',width:"20%",title:'优惠方式',
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
		
		$('#ButonGetCheckcel').click(function(){
			window.parent.$("#dlgCoupon").dialog("close");
			
		});
		
		
		//点击确认添加得到数据
		$('#ButonGetCheck').click(function(){
             var ids = [];
            var rows = $('#dg-list').datagrid('getChecked');
            if(rows.length==0){
             showAlert("dlgm");
		      return false;
            }
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].couponId);
            }
			var checkedItems = $('#dg-list').datagrid('getChecked');

			var names = [];

			$.each(checkedItems, function(index, item){

				names.push(item.agentAreaCity);

			});               
			window.parent.$("#dlgCoupon").dialog("close");
			parent.window.getDataItem2(ids.join(","));
		});
		
		
		
   });
     
     
     
	</script>
</body>
</html>