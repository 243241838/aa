<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>分销商信息管理</title>
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
    </div>

		<div class="ui-datagrid-wrap">
			<!-- 搜索 -->
			<div class="search-wrap">
				<form  id="search-ff" class="ui-search-form">
						<ul class="search-list fn-clear">
						<li>
							<label class="name">促销ID</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="priceId" maxlength="9"  value=""/>
							</span>
						</li>
						<li>
							<label class="name">保险名称</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="40"  name="productName" value=""/></span>
						</li>
						<li>
							<label class="name">保费范围</label>
							<select class="ui-combobox" name="bettemoney" id="transaceAmount" >
								<option value="0">全部</option>
								<option value="1">0-1元</option>
								<option value="2">1-10元</option>
								<option value="3">10-50元</option>
								<option value="4">50-100元</option>
								<option value="5">100元及以上</option>
								<option value="6">自定义</option>
							</select>
							<span class="ui-hidden fn-hide" id="customToggle">
								<input name="minProducePrice" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover" maxlength="10"  data-options="validType:['money']" id="moneyStart">
								<em class="ui-channel-titcolor">至</em>
								<input name="maxProducePrice" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover" maxlength="10" data-options="validType:['money','moneycompare[\'#moneyStart\']']">
								<em class="ui-channel-titcolor">元</em>
							</span>
						</li>
						<li>
							<label class="name">折扣范围</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" onKeyUp="this.value=this.value.replace(/\D/g,'') " onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" name="discountRate" value=""/>
							</span>
							至
							<span class="textbox"><input class="textbox-text textbox-prompt" onKeyUp="this.value=this.value.replace(/\D/g,'') " onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" name="discountRatestr" value=""/>
							</span>%
						</li>
					</ul>
					<ul class="search-list fn-clear">
					
						<li>
							<label class="name">促销状态</label>
							<select class="ui-combobox" name="domainStatus" id="domainStatus">
							<option value="">全部</option>
							<option value="1" >促销未开始</option>
							<option value="2" selected ="selected">促销中</option>
							<option value="3" >促销已结束</option>
							</select>
						</li>
						<li class="date">
							<label class="name ui-change-item-label">促销时间：</label>
								<input id="startTime" name="effTimestr" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#endTime']">
							  <em>至</em>
							  <input id="endTime" name="expTimestr" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#startTime']">
						</li>
						<li>
							<label class="name">审核状态</label>
							<select class="ui-combobox" name="exsts" id="exsts">
								<option value="">全部</option>
								<option value="1">待审核</option>
								<option value="2">审核不通过</option>
								<option value="3" selected ="selected">审核通过</option>
							</select>
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
			<!-- 列表end -->
			<div class="ui-btn-double">
	            <input type="button" value="确认添加" class="ui-btn-blue ui-submit" id="ButonGetCheck"/>
	            <input type="button" value="返回"  class="ui-btn-grey" id="ButonGetCheckcel"/>
	        </div>
		</div>
		  <div id="dlgm" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">请选择促销产品！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="closecon()" value="确定"/>
  </div> 
   <div id="dlgmon" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">只能选择一条促销产品！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="closecon()" value="确定"/>
  </div> 
  <div id="dlgmonend" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">只能选择促销中的产品！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="closecon()" value="确定"/>
  </div> 
	</div>

	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'${base}/operate/findmarkView',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
			    {field: '', checkbox: true },
				{field:'priceId',align:'center',width:"10%",title:'促销策略ID'},
				{field:'productName',align:'center',width:"25%",title:'保险名称'},
				{field:'minPremium',align:'center',width:"9%",title:'保费金额(元)',
					formatter: function(value,rec){
    	               if(rec.minPremium==rec.maxPremium){
					    return (rec.minPremium/100).toFixed(2);
					}
    	                return (rec.minPremium/100).toFixed(2)+"-"+(rec.maxPremium/100).toFixed(2);
               		}},
				{field:'discountRate',align:'center',width:"9%",title:'折扣比例(%)'},
				{field:'domainStatus',align:'center',width:"8%",title:'促销状态',
				formatter:function(value,rec){
						 var str = "其他";
						if(rec.domainStatus == 1){
							str = "促销未开始";
						}if(rec.domainStatus == 2){
							str = "促销中";
						}if(rec.domainStatus == 3){
							str = "促销已结束";
						}
						return str;
					}},
				{field:'effTime',align:'center',width:"15%",title:'开始时间',
					formatter:function(value,rec){
					    return formatTimestamp(rec.effTime);
					}},
				{field:'expTime',align:'center',width:"15%",title:'结束时间',
					formatter:function(value,rec){
					    return formatTimestamp(rec.expTime);
					}}
			]],
			queryParams: eb.form2Json("search-ff"),
	    	loadFilter:function(data){
            		return eb.loadFilter(data);    //自定义过滤方法
     		 },
      		onLoadSuccess:function(data){                   
      			pageCls();
				if(data){

					$.each(data.rows, function(index, item){

						if(item.checked){

								$('#dg-list').datagrid('checkRow', index);

						}

					});

				}

			}                
		});
		//分页
		pageAction();


		//点击确认添加得到数据
		$('#ButonGetCheck').click(function(){
		
            var ids = [];
            var rows = $('#dg-list').datagrid('getChecked');
            if(rows.length==0){
             showAlert("dlgm");
		      return false;
            }
            if(rows.length>1){
             showAlert("dlgmon");
		      return false;
            }
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].priceId);
                if(rows[i].domainStatus!=2){
                 showAlert("dlgmonend");
		         return false;
                }
            }
			var checkedItems = $('#dg-list').datagrid('getChecked');

			var names = [];

			$.each(checkedItems, function(index, item){

				names.push(item.agentAreaCity);

			});        
			window.parent.$("#dlgList").dialog("close");
			parent.window.getMarkDataItem(ids.join(","));
		});

		
$('#ButonGetCheckcel').click(function(){
			window.parent.$("#dlgList").dialog("close");
			
		});
		
   });
	 function showText(obj){
   		if(obj.value == 6){
   			$("#t1").css('display','block');
   			$("#t2").css('display','block');
   		}else{
   			$("#t1").css('display','none');
   			$("#t2").css('display','none');
   		}
   }
	</script>
</body>
</html>