<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>理赔管理-理赔信息管理</title>
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
				<form  id="search-ff" class="ui-search-form" action="">
					<ul class="search-list fn-clear">
						<li>
							<label class="name">理赔编号</label>
							<span class="textbox">
								<input class="textbox-text textbox-prompt intOnly" type="text" id="claimId" name="claimId" maxlength=20/>
							</span>
						</li>
						<li>
							<label class="name">保单号</label>
							<span class="textbox">
								<input class="textbox-text textbox-prompt" type="text" id="policyNo" name="policyNo" value="" maxlength=32/>
							</span>
						</li>
						<li>
							<label class="name">保险名称</label>
							<span class="textbox">
								<input class="textbox-text textbox-prompt" type="text" id="productName" name="productName" value="" maxlength=40/>
								<input class="" type="hidden" id="productId" name="productId" value="${productId}"/>
							</span>
						</li>
						<li>
							<label class="name">用户ID</label>
							<span class="textbox">
								<input class="textbox-text textbox-prompt" type="text" id="userId" name="userId" value="" maxlength=10/>
							</span>
						</li> 
						<li>
							<label class="name">投保人</label>
							<span class="textbox">
								<input class="textbox-text textbox-prompt" type="text" id="userId" name="policyholderName" value="" maxlength=10/>
							</span>
						</li> 
					</ul> 
					<ul class="search-list fn-clear">
						<li>
							<label class="name">手机号码</label>
								<span class="textbox">
									<input class="textbox-text textbox-prompt" type="text" id="mobile" name="mobile" value="" maxlength=11/>
								</span>
							</li>
						<li>
							<label class="name">申请时间</label>
							<input id="startTime" name="effTimeStr" class="easyui-datebox" data-options="editable:false" value="${effTimeStr}" validType="md['#startTime']">
						</li>
						<li>
							<label class="name">理赔状态</label>
							<select class="ui-combobox" name="sts" id="sts">
								<option value="" >全部</option>
								<option value="1" <#if sts == '1'>selected="selected"</#if> >理赔中</option>
								<option value="2" <#if sts == '2'>selected="selected"</#if> >已理赔待打款</option>
								<option value="4" <#if sts == '4'>selected="selected"</#if> >已理赔已打款</option>
								<option value="3" <#if sts == '3'>selected="selected"</#if> >理赔失败</option>
							</select>
						</li>
						<li>
							<label class="name">审核状态</label>
							<select class="ui-combobox" name="state" id="state">
								<option value="" >全部</option>
								<option value="10">待初审</option>
								<option value="20">待一级复审</option>
								<option value="-10">初审失败</option>
								<option value="-20">一级审核失败</option>
								<option value="30">审核通过</option>
							</select>
						</li>
					</ul>
					<ul class="search-list fn-clear">
						<li>
							<a href="javascript:void(0)" class="search-btn" onclick="submitForm()">搜索</a>
				    		<a href="javascript:void(0)" class="search-btn" onclick="clearForm()">重置</a>
				    		<a href="javascript:void(0)" class="search-btn" onclick="downExcel()">导出EXCEL</a>
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
		</div>
	</div>
	  <div id="dlgmq" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">确定该笔理赔已打款？</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="submitselect()" value="确定"/>
    <input type="button" class="ui-dlgCancel-btn" value="取消"/>
    <input  type="hidden" name="issueType"   id="issueType"/>
  </div>
  <div id="dlgSucc" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
  <h3 class="ui-dlg-tit">处理成功！</h3>
  <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定"/>
</div>
	<script>
	$(function(){
		validExtend();
   		//列表
   		var dt = "${type}";
		$("#dg-list").datagrid({
			url: '${base}/claim/findClaimList',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,
			idField:'productId',
			sortName:'createTime',
			sortOrder:'desc',
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'claimId',align:'center',width:"15%",title:'理赔编号'},
				{field:'policyNo',align:'center',width:"15%",title:'保单号',
		          	 formatter:function(value,rec){
			          	 var   url=' ${base}/businessmanager/findPolicyDetails';
						return '<a class="operation-link" href="'+url+'?detailId='+rec.detailId+'">'+rec.policyNo+'</a>';
					  }
				},
				{field:'productName',align:'center',width:"13%",title:'保险名称',
		          	 formatter:function(value,rec){
			          	 var   url=' ${base}/product/toProductDetailMsgs';
						return '<a class="operation-link" href="'+url+'?productId='+rec.productId+'">'+rec.productName+'</a>';
					  }
				},
				{field:'userId',align:'center',width:"7%",title:'用户ID',
		          	 formatter:function(value,rec){
			          	 var   url=' ${base}/user/toAccountDetailMsg';
						return '<a class="operation-link" href="'+url+'?userId='+rec.userId+'">'+rec.userId+'</a>';
					  }
				},
				{field:'policyholderName',align:'center',width:"6%",title:'投保人'},
				
				{field:'mobile',align:'center',width:"9%",title:'手机号码'},
				{field:'createTime',align:'center',width:"12%",title:'申请时间',sortable:true,
					formatter:function(value,rec){
							return formatTimestamp(rec.createTime);
					}
				},
				
				
				{field:'sts',align:'center',width:"8%",title:'理赔状态',
					formatter:function(value,rec){
						var str = "";
			          	if(rec.state==10||rec.state==20){ 
			          	   str="理赔中";
			          	}
						else if(rec.state == -10 || rec.state == -20){
							str ="理赔失败";
						}else if(rec.state == 30){
							str = "已理赔待打款";
						}else if(rec.state == 40){
							str = "已理赔已打款";
						}else {
							str = "其他";
						}
						return str;
					}
				},
				{field:'state',align:'center',width:"11%",title:'审核状态',
					formatter:function(value,rec){
						var str = "";
						var strok = "";
						var url='${base}/claim/toClaimAudit';
						var urlok='${base}/claim/updateClaimok';
						if(rec.state == 10){
						 str = '<a class="operation-link" href="'+url+'?detailId='+rec.detailId+'&claimId='+rec.claimId+'&state='+rec.state+'">待初审</a>';
						} else if(rec.state ==20){
							str = '<a class="operation-link" href="'+url+'?detailId='+rec.detailId+'&claimId='+rec.claimId+'&state='+rec.state+'">待一级复审</a>';
						} else if(rec.state ==-10){
							str = '<a class="operation-link" href="'+url+'?detailId='+rec.detailId+'&claimId='+rec.claimId+'&state='+rec.state+'">初审失败</a>';
						} else if(rec.state ==-20){
							str = '<a class="operation-link" href="'+url+'?detailId='+rec.detailId+'&claimId='+rec.claimId+'&state='+rec.state+'">一级审核失败</a>';
						} else if(rec.state ==30){
							str = '<a class="operation-link" href="'+url+'?detailId='+rec.detailId+'&claimId='+rec.claimId+'&state='+rec.state+'">审核通过</a>';
							strok = '<a class="operation-link" href="javascript:auditsts('+ rec.claimId.toString().substring(0,6) +',\''+ rec.claimId.toString().substring(6) +'\')" >已打款</a>';
						}else if(rec.state ==40){
							str = '<a class="operation-link" href="'+url+'?detailId='+rec.detailId+'&claimId='+rec.claimId+'&state='+rec.state+'">审核通过</a>';
						} else {
							str = "其他";
						}
						return str+strok;
					}
				}
			]],
			
			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      	},
      	onLoadSuccess:function(){
      		pageCls();
      		sortCell(['maxQuantity','totalQuantity','minPremium']);//排序要显示箭头的，以数组形式传
      	}
	 });
		//分页
		pageAction();
		
   });
 
   function downExcel(){
   	              
   		var claimId = $("#claimId").val();
   		var policyNo = $("#policyNo").val();
   		var productName = $("#productName").val();
   		var userId = $("#userId").val();
   		var mobile = $("#mobile").val();
   		var startTime = $("#startTime").val();
   		var sts = $("#sts").val();
   		var state = $("#state").val();
   		
   		var url="${base}/claim/exportExecl?type='msg'";
   		if(claimId != "" && claimId != null){
   			url = url + "&claimId="+claimId;
   		}
		if(policyNo != "" && policyNo != null){
   			url = url + "&policyNo="+policyNo;
   		}
   		if(productName != "" && productName != null){
   			url = url + "&productName="+productName;
   		}
   		if(userId != "" && userId != null){
   			url = url + "&userId="+userId;
   		}
   		if(mobile != "" && mobile != null){
   			url = url + "&mobile="+mobile;
   		}
   		if(startTime != "" && startTime != null){
   			url = url + "&startTime="+startTime;
   		}
   		if(sts != "" && sts != null){
   			url = url + "&sts="+sts;
   		}
   		if(state != "" && state != null){
   			url = url + "&state="+state;
   		}
    	window.location.href = url;
   }
   
   function auditsts(cid,cids){
    $("#issueType").val(cid.toString()+cids.toString());
    
   showAlert("dlgmq");
   }
   function submitselect(){
   	$(this).parents('.easyui-dialog').dialog('close');
	var ids = $("#issueType").val();
	
	 $.ajax({
	                 url: '${base}/claim/updateClaimok?claimId='+ids,
	                 type: 'post',
	                 datatype: 'text',
	                   success : function(data) {
                     if(data.succ){
                         //保存成功跳转页面
                        showAlert("dlgSucc");
                        $('#dg-list').datagrid('reload');
                    } else {
                        alert(data.entity);
                     }
                 },
                 error:function(data){
                     alert('请求出错！')
                 }
	             });
	
}
	</script>
</body>
</html>