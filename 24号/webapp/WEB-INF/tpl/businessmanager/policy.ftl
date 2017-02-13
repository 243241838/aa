<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>保单查询-保单管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/control.js"></script>
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
						<li class="date">
							<label class="name">查询日期</label>
								<input id="beginDate" name="beginDate" value="${startTime?string('yyyy-MM-dd')}" class="easyui-datebox" data-options="editable:false"  validType="md['#endDate']">
							  <em class="ui-channel-titcolor">至</em>
							  <input id="endDate" name="endDate" value="${endTime?string('yyyy-MM-dd')}" class="easyui-datebox" data-options="editable:false"  validType="md['#beginDate']" >
						</li>
						<li>
							<label class="name">保单号</label>
							<span class="textbox"><input id="policyNo" name="policyNo" class="textbox-text textbox-prompt" type="text" maxlength="32"/></span>
						</li>
						<li>
							<label class="name">交易金额</label>
							<select class="ui-combobox" name="selectAmount" id="transaceAmount">
								<option value="0" selected ="selected">全部</option>
								<option value="1">0-1元</option>
								<option value="2">1-10元</option>
								<option value="3">10-50元</option>
								<option value="4">50-100元</option>
								<option value="5">100元及以上</option>
								<option value="10">自定义</option>
							</select>
							<span class="ui-hidden fn-hide" id="customToggle">
								<input id="customAmountLow" name="customAmountLow" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo" maxlength="10"  data-options="validType:['customMoney']">
								<em class="ui-channel-titcolor">至</em>
								<input id="customAmountHight" name="customAmountHight" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo" maxlength="10" data-options="validType:['customMoney','moneycompare[\'#moneyStart\']']">
								<em class="ui-channel-titcolor">元</em>
							</span>
							
						</li>
						
					</ul>
					<ul class="search-list fn-clear">
						<li>
							<label class="name">承保公司</label>
							<select class="ui-combobox" name="insurerId" id="insurerId">
								<option value="0" selected ="selected">全部</option>
								<#list insurersPoList as insurersPo>
									<option value="${insurersPo.insurerId}">${insurersPo.insurerName}</option>
								</#list>
							</select>
						</li>
						<li>
							<label class="name">被保险人</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" id="insuredName" name="insuredName" type="text"  maxlength="20" value="${insuredName?if_exists}"/></span>
						</li>
						<li>
							<label class="name">保单状态</label>
							<select class="ui-combobox" name="policySts" id="policySts">
								<option value="" selected ="selected">全部</option>
								<!--<option value="1">已创建</option>-->
								<option value="10">核保中</option>
								<option value="20">已承保</option>
								<option value="30">已退保</option>
								<option value="40">已过期</option>
							</select>
						</li>
						<li>
							<label class="name">保险名称</label>
							<span class="textbox"><input id="productName" name="productName" class="textbox-text textbox-prompt" type="text" maxlength="40"/></span>
						</li>
					</ul>
					<ul class="search-list fn-clear">
						<li>
							<label class="name ui-form-lablewd">被保险人手机号码</label>
							<span class="textbox"><input id="mobile" name="mobile" class="textbox-text textbox-prompt" type="text" maxlength="11"/></span>
						</li>

                        <li>
                            <label class="name ui-form-lablewd">是否申请发票</label>
                            <select class="ui-combobox" name="receiptSts" id="receiptSts">
                                <option value="" selected ="selected">全部</option>
                                <!--<option value="1">已创建</option>-->
                                <option value="1">是</option>
                                <option value="0">否</option>
								<option value="-1">申请驳回</option>
								<option value="10">发票已提供</option>
                            </select>
                        </li>
						
						<li class="btn-group">
							<a href="javascript:void(0)" class="search-btn" onclick="submitForm()">搜索</a>
				    		<a href="javascript:void(0)" class="search-btn" onclick="clearForm()">重置</a>
				    		<a href="javascript:void(0)" class="search-btn" onclick="downExcel()">导出EXCEL</a>
						</li>
					</ul>
				</form>
			</div>
			<!-- 搜索end -->
			<!-- 列表 -->
			<div class="list-item list-noadd fn-clear">
				
				<table id="dg-list" class="ebao-datagrid" >	
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
			url:'${base}/businessmanager/findPolicyList',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			idField:'policyNo',//id字段
			sortName:'tradeDate',//当数据表格初始化时以哪一列来排序
			sortOrder:'desc',//'asc'/'desc'（正序/倒序）
			//remoteSort: false,//定义是否通过远程服务器对数据排序
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'policyNo',align:'center',width:"20%",title:'保单号',
						formatter:function(value,rec){
							if(rec.policyNo != null){
								return '<a class="detail-link" href="${base}/businessmanager/findPolicyDetails?detailId='+rec.detailId+'">'+value+'</a>';
							}else{
								return '<a class="detail-link" href="${base}/businessmanager/findPolicyDetails?detailId='+rec.detailId+'">'+'暂未生成保单号'+'</a>';
							}
						}
				},
				{field:'productName',align:'center',width:"8%",title:'保险名称',
					formatter:function(value,rec){
						return '<a class="detail-link" href="${base}/product/toProductDetailMsg?productId='+rec.productId+'">'+value+'</a>';
					}
				},
				{field:'insurerName',align:'center',width:"8%",title:'承保公司'},
				{field:'domainName',align:'center',width:"8%",title:'分销渠道'},
				{field:'tradeDate',align:'center',width:"15%",title:'投保时间',sortable:true,
					formatter:function(value,rec){
					    return formatTimestamp(rec.tradeDate);
					}
				},
				{field:'insuredName',align:'center',width:"8%",title:'被保险人'},
				{field:'mobile',align:'center',width:"10%",title:'被保险人手机号码'},
				{field:'sumPremium',align:'center',width:"10%",title:'保险金额(元)',sortable:true,
				  formatter:function(value,rec){
					    return eb.fenToThousands(rec.sumPremium);
					}
				},
				{field:'policySts',align:'center',width:"10%",title:'保单状态',
					formatter:function(value,rec){
						if(value == 1){
							return '<em class="ui-red">已创建</em>';
						}else if(value == 10){
							return '<em class="ui-red">核保中</em>';
						}else if(value == 20){
							return '<em class="ui-green">已承保</em>';
						}else if(value == 30){
							return '<em class="ui-grey">已退保</em>';
						}else if(value == 40){
							return '<em class="ui-grey">已过期</em>';
						}
					}
				},
                {field:'receiptSts',align:'center',width:"10%",title:'是否申请发票',sortable:true,
                    formatter:function(value,rec){
						if(value == 1){
							return '<em class="ui-green" onclick="alertAddr(\''+rec.shippingAddress+'\')">是</em>';
						}else if(value == 0){
							return '否';
						}else if(value == -1){
							return '申请驳回';
						}else if(value == 10){
							return '发票已提供';
						}
                    }
                }
			]],
			queryParams: eb.form2Json("search-ff"),
		    loadFilter:function(data){
	            return eb.loadFilter(data);    //自定义过滤方法
		    },
		    onLoadSuccess:function(){
		      pageCls();
		      sortCell(['tradeDate','sumPremium']);
		    }
		});
		//分页
		pageAction();

		
   });
	function downExcel(){
   	              
   		var beginDate = $("#beginDate").val();
   		var endDate = $("#endDate").val();
   		var policyNo = $("#policyNo").val();
   		var selectAmount = $("#transaceAmount").val();
   		var customAmountLow = $("#customAmountLow").val();
   		var customAmountHight = $("#customAmountHight").val();
   		var insurerId = $("#insurerId").val();
   		var insuredName = $("#insuredName").val();
   		var policySts = $("#policySts").val();
   		var productName = $("#productName").val();
   		var mobile = $("#mobile").val();
   		
   		var url="${base}/businessmanager/exportExecl?userId=123";
   		if(beginDate != "" && beginDate != null){
   			url = url + "&beginDate="+beginDate;
   		}
		if(endDate != "" && endDate != null){
   			url = url + "&endDate="+endDate;
   		}
   		if(policyNo != "" && policyNo != null){
   			url = url + "&policyNo="+policyNo;
   		}
   		if(selectAmount != "" && selectAmount != null){
   			url = url + "&selectAmount="+selectAmount;
   		}
   		if(customAmountLow != "" && customAmountLow != null){
   			url = url + "&customAmountLow="+customAmountLow;
   		}
   		if(customAmountHight != "" && customAmountHight != null){
   			url = url + "&customAmountHight="+customAmountHight;
   		}
   		if(insurerId != "" && insurerId != null){
   			url = url + "&insurerId="+insurerId;
   		}
   		if(insuredName != "" && insuredName != null){
   			url = url + "&insuredName="+insuredName;
   		}
   		if(policySts != "" && policySts != null){
   			url = url + "&policySts="+policySts;
   		}
   		if(productName != "" && productName != null){
   			url = url + "&productName="+productName;
   		}
   		if(mobile != "" && mobile != null){
   			url = url + "&mobile="+mobile;
   		}
    	window.location.href = url;
   }

    function alertAddr(rec) {
		showAlert('alt','邮寄地址：'+rec);
    }
	</script>
</body>
</html>