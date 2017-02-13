
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>自研产品管理-产品信息管理-产品管理</title>
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
							<label class="name">产品ID</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="productId" maxlength=9/>
							</span>
						</li>
						<li>
							<label class="name">保险名称</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="productName" value="" maxlength=40/></span>
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
								<input name="minProducePrice" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo decimal-ptblur" maxlength="10"  data-options="validType:['customMoney']" id="moneyStart">
								<em class="ui-channel-titcolor">至</em>
								<input name="maxProducePrice" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo decimal-ptblur" maxlength="10" data-options="validType:['customMoney','moneycompare[\'#moneyStart\']']">
								<em class="ui-channel-titcolor">元</em>
							</span>
						</li>
					</ul>
					<ul class="search-list fn-clear">
					
					<li>
							<label class="name">上架状态</label>
							<select class="ui-combobox" name="domainStatus" id="domainStatus">
								<option value="">全部</option>
								<option value="1">待上架</option>
								<option value="2">已上架</option>
								<option value="3">已下架</option>
							</select>
						</li>
					
						<li>
							<label class="name">上架渠道</label>
							<select name="domainId" class="ui-combobox" id="domainId">
						<option value="">全部</option>
						  <#list dList as item>
                        <option value="${item.domainId}">${item.domainName}</option>
                        </#list>
                        </select>
						</li>
						<li class="date">
							<label class="name ui-change-item-label">上下架时间：</label>
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
			
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
				<a href="javascript:void(0)" class="search-btn" onclick="sureselect()">确定选择</a>
				 <a href="javascript:history.go(-1);" class="search-btn">返 回</a>
			</div>
			<!-- 列表end -->
		</div>
	</div>
	<div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">请勾选需要促销的产品!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"  value="确定"/>
  </div>
  <div id="dlgm" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">最多只能选择5条产品信息！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
 <div id="dlgmq" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">确定要促销已选产品吗？</h3>
    <input type="button" class="ui-dlgOk-btn" onclick="submitselect()" value="确定"/>
    <input type="button" class="ui-dlgCancel-btn" value="取消"/>
    <input  type="hidden" name="issueType"   id="issueType"/>
  </div>
	<script>
	function celdiv(){
	$(this).parents('.easyui-dialog').dialog('close');
	}
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'${base}/operate/findProductUp',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			idField:'productId'-'domain_id',
			sortName:'maxPremium',
			sortOrder:'desc',
			columns:[[
			    {field: 'pid', checkbox: true },
				{field:'productId',align:'center',width:"10%",title:'产品ID'},
				{field:'productName',align:'center',width:"23%",title:'保险名称',
		          	 formatter:function(value,rec){
			          	 var url='${base}/product/toProductDetailMsgs';
						return '<a class="operation-link" href="'+url+'?productId='+rec.productId+'">'+rec.productName+'</a>';
					  }},
				{field:'minPremium',align:'center',width:"15%",title:'保费金额(元)',sortable:true,
					formatter: function(value,rec){
    	               if(rec.minPremium==rec.maxPremium){
					    return (rec.minPremium/100).toFixed(2);
					}
    	                return (rec.minPremium/100).toFixed(2)+"-"+(rec.maxPremium/100).toFixed(2);
               		}},
               		{field:'domainName',align:'center',width:"10%",title:'上架渠道'},
				{field:'maxQuantity',align:'center',width:"10%",title:'销售数量(份)'},
				{field:'domainStatus',align:'center',width:"10%",title:'上架状态',
				formatter:function(value,rec){
						 var str = "其他";
						if(rec.domainStatus == 1){
							str = "待上架";
						}if(rec.domainStatus == 2){
							str = "已上架";
						}if(rec.domainStatus == 3){
							str = "已下架";
						}
						return str;
					}},
					
				
				{field:'effTime',align:'center',width:"15%",title:'上架时间',sortable:true,
					formatter:function(value,rec){
					    return formatTimestamp(rec.effTime);
					}},
				{field:'expTime',align:'center',width:"15%",title:'下架时间',sortable:true,
					formatter:function(value,rec){
					    return formatTimestamp(rec.expTime);
					}}
			]],
			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      },
  onLoadSuccess:function(){
      		pageCls();
      		sortCell(['maxPremium','shengyuQuantity','minPremium']);//排序要显示箭头的，以数组形式传
      	}
		});
		//分页
		pageAction();
		$(".datagrid-header").find("[type=checkbox]").hide();
   });
   
   
   function sureselect(){
            var ids = [];
             var domainids = [];
            var rows = $('#dg-list').datagrid('getChecked');
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].productId+"="+rows[i].domain_id);
             
            }
            $("#issueType").val(ids);
            if(ids.length==0){
            showAlert("dlg");
            } else if(ids.length>5){
            showAlert("dlgm");
            }
            else{
            showAlert("dlgmq");
            }
}

function submitselect(){
var ids = $("#issueType").val();
window.location.href="${base}/operate/selectMarkProduct?ids="+ids;
}
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