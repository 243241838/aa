<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
    	 <#include "/common/include/power.ftl">
    </div>

		<div class="ui-datagrid-wrap">
			<!-- 搜索 -->
			<div class="search-wrap">
				<form  id="search-ff" class="ui-search-form">
					<ul class="search-list fn-clear">
						<li>
							<label class="name ui-change-item-label">分销商ID：</label>
							<span class="textbox"><input name="domainId" class="textbox-text textbox-prompt " type="text"  maxlength="9"/></span>
						</li>
						<li>
							<label class="name ui-change-item-label">分销商名称：</label>
							<span class="textbox"><input name="domainName" class="textbox-text textbox-prompt" type="text" maxlength="20"/></span>
						</li>
						<li>
							<label class="name ui-change-item-label">分销商状态：</label>
							<select class="ui-combobox" name="domainSts" id="transaceAmount">
								<option value="" selected ="selected">全部</option>
								<option value="10">有效</option>
								<option value="-11">无效</option>
							</select>
						</li>	
					</ul>
					<ul class="search-list fn-clear">
						<li class="date">
							<label class="name ui-change-item-label">合作时间：</label>
								<input id="startTime" name="beginDate" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#endTime']">
							   <em class="ui-channel-titcolor">至</em>
							  <input id="endTime" name="endDate" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#startTime']">
						</li>
						
						
						<!--<li>
							<label class="name ui-change-item-label">合作产品总数：</label>
							<span class="textbox"><input name="combineCount" class="textbox-text textbox-prompt easyui-validatebox  ui-cover" validType="plusIntOther" type="text" maxlength="10"/></span>
						</li>-->
						
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
				<a href="${base}/channelmanager/newchannel" class="search-btn policy-newcontent">新增分销商</a>
				<table id="dg-list" class="easyui-datagrid"  style="margin-right:10px;">	
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
			url:'${base}/channelmanager/getChannelInfo',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			//idField:'userid',//id字段
			sortName:'effTime',//当数据表格初始化时以哪一列来排序
			sortOrder:'desc',//'asc'/'desc'（正序/倒序）
			//remoteSort: false,//定义是否通过远程服务器对数据排序
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'domainId',align:'center',width:"6%",title:'分销商ID',sortable:true, rowspan:2,},
				{field:'domainName',align:'center',width:"8%",title:'分销商名称', rowspan:2,
						formatter:function(value,rec){
							return '<a class="detail-link" href="${base}/channelmanager/searchDomainInfos?domainId='+rec.domainId+'&combineCount='+rec.productCount+'">'+value+'</a>';
						}
				},
				{field:'domainSts',align:'center',width:"8%",title:'分销商状态', rowspan:2,
					formatter:function(value,rec){
						if(value == 10){
							return "有效";
						}else if(value == -11){
							return "无效";
						}else if(value == 1){
							return "待审核";
						}else if(value == -10){
							return "锁定";
						}
						
					}
				},
				{field:'effTime',align:'center',width:"8%",title:'开始时间',sortable:true, rowspan:2,
					formatter:function(value,rec){
					    return formatDate(rec.effTime);
					}
				},
				{field:'expTime',align:'center',width:"8%",title:'结束时间', rowspan:2,
					formatter:function(value,rec){
					    return formatDate(rec.expTime);
					}
				},
				{field:'black',"title":"合作产品","colspan":4,align:'center'},
				{field:'name',align:'center',width:"20%",title:'操作',sortable:true,rowspan:2,
					formatter:function(value,rec){
						var phtml=''; 
                           if(rec.keyCount > 0){
                                    phtml='<a class="operation-link" href="${base}/channelmanager/findDomainKey?domainId='+rec.domainId+'">查看秘钥</a>';
                           } else {
                                    phtml='<a class="operation-link" href="${base}/channelmanager/toAddKey?domainId='+rec.domainId+'">新增秘钥</a>';
                           }
                           phtml += '<a class="operation-link" href="${base}/domain/userManager?domainId='+rec.domainId+'">渠道用户管理</a>';
                           return phtml + '<a class="operation-link" href="${base}/operate/findUpDomainProduct?domainId='+rec.domainId+'">新增合作产品</a>';
					}
				}
			],[
				
				{field:'productCount',align:'center',width:"10%",title:'总量',sortable:true,
					formatter:function(value,rec){
						if(rec.domainSts == -11){
							return 0;
						}else{
							return '<a class="detail-link" href="${base}/operate/domainproductView?domainId='+rec.domainId+'">'+value+'</a>';
						}
					}
				},
				{field:'passCount',align:'center',width:"10%",title:'审核通过',sortable:true,
					formatter:function(value,rec){
						if(rec.domainSts == -11){
							return 0;
						}else{
							return '<a class="detail-link" href="${base}/operate/domainproductView?domainId='+rec.domainId+'&sts=10">'+rec.passCount+'</a>';
						}
					}	
				},
				{field:'waitCount',align:'center',width:"10%",title:'待审核',sortable:true,
					formatter:function(value,rec){
						if(rec.domainSts == -11){
							return 0;
						}else{
							return '<a class="detail-link" href="${base}/operate/domainproductView?domainId='+rec.domainId+'&sts=1">'+rec.waitCount+'</a>';
						}
					}	
				},
				{field:'noPassCount',align:'center',width:"10%",title:'审核未通过',sortable:true,
					formatter:function(value,rec){
						if(rec.domainSts == -11){
							return 0;
						}else{
							return '<a class="detail-link" href="${base}/operate/domainproductView?domainId='+rec.domainId+'&sts=2">'+rec.noPassCount+'</a>';
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
		      sortCell(['domainId','effTime','productCount','passCount','waitCount','noPassCount']);
		    }
		});
		//分页
		pageAction();
		
   });
	function submitForm(){
		if($('#search-ff').form('validate')){
			    //eb.backToFstPage("#datagrid");
				$("#dg-list").datagrid({queryParams : eb.form2Json("search-ff")});
				 pageAction();
			}
	}
	function clearForm(){
		$("#search-ff").form('clear');
	}
	
	</script>
</body>
</html>
