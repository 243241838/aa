<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>代理人管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
	
<body>

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
						<label class="name" style="width:100px">代理ID：</label>
						<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=9 type="text" name="salesamanId" value=""/></span>
					</li>
					<li>
						<label class="name" style="width:100px">代理账号：</label>
						<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=9 type="text" name="salesamanUser" value=""/></span>
					</li>
					<li>
						<label class="name" style="width:100px">代理人名称：</label>
						<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="salesamanName" value=""/></span>
					</li>
					<li class="btn-group">
						<a href="javascript:void(0)" class="search-btn" onclick="submitForm()">搜 索</a>
			    		<a href="javascript:void(0)" class="search-btn" onclick="clearForm()">重 置</a>
					</li>
				</ul>
			<input type="hidden" name="idenType" value="" id="idenTypeId" />
			<input type="hidden" name="salesamanSts" value="" id="salesamanStsId" />
			<input type="hidden" name="domainId" value="" id="domainIdId" />
			</form>
		</div>
		<!-- 搜索end   /**/ phtml='<a class="operation-link" href="${base}/telcom/getDoaminLink?telcomCode='+rec.telcomCode+'&domainCode='+rec.domainCode+'">复制链接</a>';
		-->
		<!-- 列表 -->
		<div  class="list-item fn-clear">
		    <!--${fButton(list, 'ADD','<a href="@URL@" class="ui-trans-btn ui-add-pos fn-left">新增</a>')}    -->
			<a href="/agent/toAddSalesman" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增</a>
			<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
			</table>
		</div>
	<!-- 列表end -->
   </div>
  </div>
  <!--弹框-->  
  <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="delStartTit" >确定要删除吗？</h3>
    <input type="button" class="ui-dlgOk-btn" value="确定" id="confirmDel"/>
    <input type="button" class="ui-dlgCancel-btn" value="取消" id="cannelDel"/>
  </div>
  <div id="alt" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="delStartTit2" >删除成功!</h3>
  </div>
  <div id="error" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
    <h3 class="ui-dlg-tit" id="delStartTit3" >异常情况,删除失败!</h3>
  </div>
<script>
$(function(){
	
	$("#dg-list").datagrid({
		url:'${base}/agent/getSalesManInfo',
		method:'post',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'domainCode',//id字段
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:'salesamanId',align:'center',width:"10%",title:'代理ID'},
			{field:'salesamanUser',align:'center',width:"10%",title:'代理账号'},
			{field:'salesamanName',align:'center',width:"15%",title:'代理人名称',
				formatter:function(value,rec){
							return '<a class="detail-link" href="${base}/agent/searchTelcomDomainInfos?salesamanId='+rec.salesamanId+'&domainId='+rec.domainId+'">'+value+'</a>';
						}
			},
			{field:'domainId',align:'center',width:"10%",title:'<select class="listsele" name="domainId" id="domainIdIdSel" onChange="submitForm();">'
                                +'<option value="">代理所属渠道</option>'
                                +'<#list domainIdList as domainId>'
                                +'<option value=${domainId}>${domainId}</option>'
                                +'</#list>'
                            +'</select>'},
			{field:'createTime',align:'center',width:"25%",title:'代理账户生成时间',sortable:true,
					formatter:function(value,rec){
						if(value == null || value == ""){
							return "";
						} else {
							return formatTimestamp(value);
						}
					}
				},
			{field:'salesamanSts',align:'center',width:"15%",title:'<select class="listsele" name="salesamanSts" id="salesamanStsIdSel" onChange="submitForm();">'
                                +'<option value="">代理人状态</option>'
                                +'<option value="10">正常</option>'
                                +'<option value="-10">禁用</option>'
                                +'<option value="-11">后台冻结</option>'
                                +'<option value="-12">密码错冻结</option>'
                                +'<option value="-13">登录异常冻结</option>'
                            +'</select>',
				formatter:function(value,rec){
		            var s = '';
		            if(rec.salesamanSts == '10'){
		                s = '正常';
		            }
		            if(rec.salesamanSts == '-10'){
		                s = '禁用';
		            }    
		            if(rec.salesamanSts == '-11'){
		                s = '后台冻结';
		            }    
		             if(rec.salesamanSts == '-12'){
		                s = '密码错冻结';
		            }    
		             if(rec.salesamanSts == '-13'){
		                s = '登录异常冻结';
		            }    
		            return s;
		           }
              },
              {field:'name',align:'center',width:"15%",title:'操作',
				formatter:function(value,rec){
				var phtml=''; 
                    phtml='<a class="operation-link" href="javascript:delRow(\''+rec.salesamanId+'\');">删除</a>';
                   return  phtml;
             	}
            }
		]],
		queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
	    },
	    onLoadSuccess:function(data){
	      sessionStorage.setItem('TelcomDomainInfoList',data.currentPage);//当前页
	      pageCls();
	    }
	});
	pageAction();//分页
	
});
    function submitForm(){
		if($('#search-ff').form('validate')){
				var idenType = $("#idenTypeIdSel").val();
				var salesamanSts = $("#salesamanStsIdSel").val();
				var domainId = $("#domainIdIdSel").val();
				$("#idenTypeId").val(idenType);
                $("#salesamanStsId").val(salesamanSts);
                $("#domainIdId").val(domainId);
			    //eb.backToFstPage("#datagrid");
				$("#dg-list").datagrid({queryParams : eb.form2Json("search-ff")});
				 pageAction();
				 $("#idenTypeIdSel").val(idenType);
				 $("#salesamanStsIdSel").val(salesamanSts);
				 $("#domainIdIdSel").val(domainId);
			}
	}
	function clearForm(){
		$("#search-ff").form('clear');
	}
	function delRow(salesamanId){
	
		showAlert('dlg');
		$("#delStartTit").text("确定要删除吗？");
		$("#confirmDel").click(function(){
			$.ajax({
				url : '${base}/agent/deleteSalesmanInfos',
				type : 'post',
				dataType : 'json',
				data: {"salesamanId": salesamanId},
				success : function(data) {
				    if(data.succ){
				    	showAlert('alt');
				    	window.setInterval( function () {
					    	location.reload();
						}, 1000 );
				    }else{
				    	$("#delStartTit3").text(data.entity);
				    	showAlert('error');
				    	return false;
				    }
				},
				error:function(data){
				   showAlert('error');
				   return false;
				}		
			});
		})
	}
</script>
</body>
</html>