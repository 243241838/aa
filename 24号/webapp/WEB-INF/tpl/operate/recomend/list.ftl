
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>运营管理-运营参数管理-推荐系数</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	
	
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<style>

	.ui-list-table .combo-arrow{height: 54px!important;}
	.ui-list-table .textbox-text{ text-align: center;}
	</style>
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
								<input name="minProducePrice" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo decimal-ptblur" maxlength="10"  data-options="validType:['customMoney']" id="moneyStart">
								<em class="ui-channel-titcolor">至</em>
								<input name="maxProducePrice" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo decimal-ptblur" maxlength="10" data-options="validType:['customMoney','moneycompare[\'#moneyStart\']']">
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
							<label class="name" style="width:120px;">是否设置推荐系数</label>
							<select class="ui-combobox" name="sortCode" id="sortCode">
								<option value="" >全部</option>
								<option value="1" >是</option>
								<option value="2" >否</option>
							</select>
						</li>
						<li>
							<label class="name">上架状态</label>
							<select class="ui-combobox" name="domainStatus" id="domainStatus">
								<option value="" >全部</option>
								<option value="1" selected ="selected" >待上架</option>
								<option value="2" >已上架</option>
								<option value="3" >已下架</option>
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
			<div class="list-item fn-clear ui-list-table">
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
		</div>
	</div>
	<script>
	function celdiv(){
	$(this).parents('.easyui-dialog').dialog('close');
	}
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'${base}/operate/findrecomendView',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			singleSelect: true,
			onClickCell: onClickCell,
			onAfterEdit :getChanges,
			columns:[[
				{field:'productId',align:'center',width:"6%",title:'产品ID'},
				{field:'productName',align:'center',width:"20%",title:'保险名称',
		          	 formatter:function(value,rec){
			          	 var   url='${base}/product/toProductDetailMsgs';
						return '<a class="operation-link" href="'+url+'?productId='+rec.productId+'">'+rec.productName+'</a>';
					  }
				},
				{field:'insurerName',align:'center',width:"12%",title:'承保公司'},
				{field:'maxQuantity',align:'center',width:"10%",title:'产品总量(份)',
					formatter: function(value,rec){
					if(rec.maxQuantity==-1){
					return '不限';
					}
    	                return rec.maxQuantity;
               		}
				},
				{field:'minPremium',align:'center',width:"10%",title:'保费金额(元)',
					formatter: function(value,rec){
    	               if(rec.minPremium==rec.maxPremium){
					    return (rec.minPremium/100).toFixed(2);
					}
    	                return (rec.minPremium/100).toFixed(2)+"-"+(rec.maxPremium/100).toFixed(2);
               		}},
				{field:'className',align:'center',width:"8%",title:'保险类别',sortable:true},
				{field:'productSource',align:'center',width:"6%",title:'来源渠道',
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
				},{field:'domainStatus',align:'center',width:"10%",title:'状态',
				formatter:function(value,rec){
						var str = "未设置上架时间";
						if(rec.domainStatus == 1){
							str = "待上架";
							 
						} if(rec.domainStatus == 2){
						str = "已上架";
						   
						}  if(rec.domainStatus == 3){
						str = "已下架";
						  
						} 
							 return str;
					}
				},
				{field:'sortCode',align:'center',width:"14%",title:'推荐系数',formatter:unitformatter,
				editor:{type:'combobox',options: { data: Address, valueField: "value", textField: "text" } }
			}
			]],
			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      },
      onLoadSuccess:pageCls
		});
		//分页
		pageAction();
		
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
   
 
	$.extend($.fn.datagrid.methods, {
		editCell: function(jq,param){
			return jq.each(function(){
				var opts = $(this).datagrid('options');
				var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
				for(var i=0; i<fields.length; i++){
					var col = $(this).datagrid('getColumnOption', fields[i]);
					col.editor1 = col.editor;
					if (fields[i] != param.field){
						col.editor = null;
					}
				}
				$(this).datagrid('beginEdit', param.index);
				for(var i=0; i<fields.length; i++){
					var col = $(this).datagrid('getColumnOption', fields[i]);
					col.editor = col.editor1;
				}
			});
		}
	});
		
	var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true}
		if ($('#dg-list').datagrid('validateRow', editIndex)){
			$('#dg-list').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	function onClickCell(index, field){
		if (endEditing()){
			$('#dg-list').datagrid('selectRow', index)
					.datagrid('editCell', {index:index,field:field});
			editIndex = index;
		}
	}
		
 	var Address = [{ "value": "0", "text": "请选择" }, { "value": "10000", "text": "1" }, { "value": "20000", "text": "2" }, { "value": "30000", "text": "3" }, { "value": "40000", "text": "4" }, { "value": "50000", "text": "5" }, { "value": "60000", "text": "6" }, { "value": "70000", "text": "7" }, { "value": "80000", "text": "8" }, { "value": "90000", "text": "9" }];
 
	function unitformatter(value, rowData, rowIndex) {
	    if (value == 0) {
	        return 0;
	    }
	
	 
	    for (var i = 0; i < Address.length; i++) {
	   
	        if (Address[i].value == value) {
	        	
	            return '<span class="parma-colorblue">'+Address[i].text+'</span>';
	        }
	    }
	    
	    
	    
	}
	//编辑完成得到数据
	var isflag = 1;
	function getChanges(rowIndex, rowData, changes){
		isflag++;
		if(isflag % 2 == 0 && typeof(changes.sortCode) != 'undefined'){
			 $.ajax({
                 url: '${base}/operate/updateRecomendProduct?pid='+rowData.productId+'&sort='+rowData.sortCode,
                 type: 'post',
                 success: function (result) {
                 }
             });
		}
			
	}
	
	
	</script>
</body>
</html>