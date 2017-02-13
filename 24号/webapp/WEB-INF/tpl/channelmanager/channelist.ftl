
<!DOCTYPE>
<html>
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
						<input  type="hidden" id="domainId" readonly="true" name="domainId" value="${domainId}"/>
						<li>
							<label class="name">保险名称</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="productName" maxlength="40"  value=""/></span>
						</li>
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
							<label class="name">审核状态</label>
							<select class="ui-combobox" name="sts" id="sts">
								<option value="">全部</option>
								<#if sts == 1>
									<option value="1" selected>待审核</option>
									<option value="2">审核未通过</option>
									<option value="3">审核通过</option>
								<#elseif sts == 10>
									<option value="1" >待审核</option>
									<option value="2">审核未通过</option>
									<option value="3" selected>审核通过</option>
								<#elseif sts == 2>
									<option value="1" >待审核</option>
									<option value="2" selected>审核未通过</option>
									<option value="3" >审核通过</option>
								<#else>
									<option value="1">待审核</option>
									<option value="2">审核未通过</option>
									<option value="3">审核通过</option>
								</#if>
							</select>
						</li>
					</ul>
					
					<ul class="search-list fn-clear">
						<li class="date">
							<label class="name ui-change-item-label">上下架时间：</label>
								<input id="startTime" name="effTimestr" class="easyui-datebox" data-options="editable:false"  validType="md['#endTime']">
							  <em>至</em>
							  <input id="endTime" name="expTimestr" class="easyui-datebox" data-options="editable:false"  validType="md['#startTime']">
						</li>
						<li class="btn-group">
							<a href="javascript:void(0)" class="search-btn" onclick="submitForm()">搜索</a>
				    		<a" style="cursor:pointer;" class="search-btn" onclick="clearFormdomain(${domainId})">重置</a>
						</li>
					</ul>
				</form>
			</div>
			<!-- 搜索end -->
			<!-- 列表 -->
			
			<div class="list-item fn-clear">
			<div class="ui-top-staticis">分销商ID：${domainPo.domainId} 
				 	分销商名称：<font color="#00F">${domainPo.domainName} </font>合作时间:${domainPo.effTimestr}至${domainPo.expTimestr}
				 	&nbsp;总计合作产品:<font color="#FF0000">${countAll}个 </font>,其中审核通过:<font color="#FF0000">${countOk}个 </font>,
				 	待审核:<font color="#FF0000">${countIng}个 </font>,审核未通过:<font color="#FF0000">${countNo}个 </font>
				 	</div>
				 	<a class="search-btn policy-newcontent" href="${base}/operate/findUpDomainProduct?domainId=${domainId}">新增合作产品</a>
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
		</div>
	</div>
	
	<script>
	var s ;
	$(function(){
	s =$('#domainId').val();
		validExtend();
          var i=1;
           function formatNumber(value){
		    return (value < 10 ? '0' : '') + value;
     }
	 $('#starteffTimestr').datetimebox({
		    formatter:function(date){
		       console.log(date)
		       //alert(i);
		       i++;
			   var y = date.getFullYear();
			   var m = (date.getMonth()+1)>=10?(date.getMonth()+1):("0"+(date.getMonth()+1).toString());
			   var d = date.getDate();
			   var h = date.getHours();
			   var M = date.getMinutes();
			   var s = date.getSeconds();
			   rDate = y+'-'+m+'-'+formatNumber(d)+' '+formatNumber(h)+':'+formatNumber(M)+':'+formatNumber(s);
			   return rDate;
			   
			 }
	  }); 
		//列表
		$("#dg-list").datagrid({
			url:'${base}/operate/finddomainproduct',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			idField:'productId',
			sortName:'maxQuantity',
			sortOrder:'desc',
			columns:[[
				{field:'productId',align:'center',width:"5%",title:'产品ID'},
				{field:'productName',align:'center',width:"15%",title:'保险名称',
		          	 formatter:function(value,rec){
			          	 var   url='${base}/product/toProductDetailMsgs';
						return '<a class="operation-link" href="'+url+'?productId='+rec.productId+'">'+rec.productName+'</a>';
					  }
				},
				{field:'insurerName',align:'center',width:"10%",title:'承保公司'},
				{field:'maxQuantity',align:'center',width:"10%",title:'总库存',sortable:true},
				{field:'currentQuantity',align:'center',width:"10%",title:'当前库存',sortable:true,
					formatter:function(value,rec){
					return rec.maxQuantity-rec.totalQuantity;
					}
				},
					{field:'sts',align:'center',width:"10%",title:'渠道产品状态',
				formatter:function(value,rec){
						 var str = "其他";
						if(rec.sts == 10){
							str = "有效";
						} else{
						  str = "无效";
						}
						return str;
					}},
				{field:'auditSts',align:'center',width:"8%",title:'审核状态',
		          	 formatter:function(value,rec){
		          	 	var str = "其他";
						 if(rec.auditSts == 0){
							str = "待审核";
						}if(rec.auditSts == -1){
							str = "审核未通过";
						}if(rec.auditSts == 1){
							str = "审核通过";
						}
			          	 var   url='${base}/operate/findProductDomainInfo';
						return '<a class="operation-link" href="'+url+'?pId='+rec.productId+'&domainId='+s+'">'+str+' </a>';
					  }
				},
		
				{field:'effTime',align:'center',width:"15%",title:'上架时间',
					formatter:function(value,rec){
					    return formatTimestamp(rec.effTime);
					}},
				{field:'expTime',align:'center',width:"15%",title:'下架时间',
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
      		sortCell(['maxQuantity','currentQuantity']);//排序要显示箭头的，以数组形式传
      	}
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
   
     function clearFormdomain(value){
     clearForm();
	document.getElementById('search-ff').reset();
	$('#domainId').val(value);
	
}
	</script>
</body>
</html>