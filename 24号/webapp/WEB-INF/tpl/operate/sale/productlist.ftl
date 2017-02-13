
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
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="productId" maxlength=9 /></span>
						</li>
						<li>
							<label class="name">保险名称</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="productName" maxlength=40 value=""/></span>
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
								<input name="minProducePrice" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo" maxlength="10"  data-options="validType:['money']" id="moneyStart">
								<em class="ui-channel-titcolor">至</em>
								<input name="maxProducePrice" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo" maxlength="10" data-options="validType:['money','moneycompare[\'#moneyStart\']']">
								<em class="ui-channel-titcolor">元</em>
							</span>
						</li>
					</ul>
					<ul class="search-list fn-clear">
						<li>
						<label class="name">承保公司</label>
						<select name="insurerId" class="ui-combobox" id="insurerId">
						<option value="">全部</option>
						  <#list iList as item>
                        <option value="${item.insurerId}">${item.insurerName}</option>
                        </#list>
                        </select>
						</li>
						<li>
							<label class="name">保险类别</label>
						<select name="classId" class="ui-combobox" id="classId">
						<option value="">全部</option>
						  <#list cList as item>
                        <option value="${item.classId}">${item.className}</option>
                        </#list>
                        </select>
						</li>
						<li>
							<label class="name">来源类别</label>
							<select class="ui-combobox" name="productSource" id="productSource">
								<option value="" >全部</option>
								<option value="1" >自研</option>
								<option value="2" >保险公司</option>
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
    <h3 class="ui-dlg-tit">最多只能选择1条产品信息！</h3>
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
			url:'${base}/operate/findFalshSaleProduct',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			idField:'productId',
			sortName:'maxPremium',
			sortOrder:'desc',
			columns:[[
			    {field: 'pid', checkbox: true },
				{field:'productId',align:'center',width:"10%",title:'产品ID'},
				{field:'productName',align:'center',width:"20%",title:'保险名称'},
				{field:'insurerName',align:'center',width:"19%",title:'承保公司'},
				{field:'maxQuantity',align:'center',width:"19%",title:'总库存',sortable:true,
					formatter: function(value,rec){
					if(rec.maxQuantity==-1){
					return '不限';
					}
    	                return rec.maxQuantity;
               		}
				},
				{field:'shengyuQuantity',align:'center',width:"8%",title:'剩余库存',sortable:true,
					formatter: function(value,rec){
					if(rec.maxQuantity==-1){
					return '不限';
					}
    	                return rec.maxQuantity-rec.totalQuantity;
               		}
				},
				{field:'minPremium',align:'center',width:"15%",title:'保费金额(元)',sortable:true,
					formatter: function(value,rec){
    	               if(rec.minPremium==rec.maxPremium){
					    return (rec.minPremium/100).toFixed(2);
					}
    	                return (rec.minPremium/100).toFixed(2)+"-"+(rec.maxPremium/100).toFixed(2);
               		}},
				{field:'className',align:'center',width:"12%",title:'保险类别'},
				{field:'productSource',align:'center',width:"10%",title:'来源类别',
				formatter:function(value,rec){
						var str = "其他";
						if(rec.productSource == 1){
							str = "自研";
							return str;
						}else if(rec.productSource == 2){
						str = "保险公司";
						   return str;
						} 
							 return str;
					}
				}
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
		
   });
   
   
   function sureselect(){
            var ids = [];
            var rows = $('#dg-list').datagrid('getChecked');
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].productId);
            }
            $("#issueType").val(ids);
            if(ids.length==0){
            showAlert("dlg");
            } else if(ids.length>1){
            showAlert("dlgm");
            }
            else{
            showAlert("dlgmq");
            }
}

function submitselect(){
var ids = $("#issueType").val();
window.location.href="${base}/operate/spricalFalshAdd?ids="+ids;
}
	</script>
</body>
</html>