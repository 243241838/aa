
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
							<label class="name ui-profess-label">红包规则编号：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="ruleId" maxlength=9/>
							</span>
						</li>
						<li>
							<label class="name ui-profess-label">红包规则名称：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="ruleName" value="" maxlength=40/></span>
						</li>
						<li>
							<label class="name ui-profess-label">红包性质：</label>
							<select class="ui-combobox" name="bonusType" id="transaceAmount" >
								<option value="">全部</option>
								<option value="1">固定金额</option>
								<option value="2">随机金额</option>
							</select>
						</li>
					</ul>
					<ul class="search-list fn-clear">
						<li class="date">
							<label class="name ui-change-item-label">红包发放时间：</label>
								<input id="startTime" name="effTimeStr" class="easyui-datebox" data-options="editable:false" value="" validType="md['#endTime']">
							  <em class="ui-channel-titcolor">至</em>
							  	<input id="endTime" name="expTimeStr" class="easyui-datebox" data-options="editable:false" value="" validType="md['#startTime']">
						</li>
						<li>
							<label class="name ui-profess-label">红包发放状态：</label>
							<select class="ui-combobox" name="bonusGrantSts" id="transaceAmount" >
								<option value="">全部</option>
								<option value="1">未开始</option>
								<option value="2">进行中</option>
								<option value="3">已结束</option>
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
				<a href="${base}/operate/addEnvelope" class="dash-add-btn"><i class="ui-icon ui-icon-add"></i>新增红包规则</a>
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
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
			url:'${base}/operate/findEnvelopeMsg',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			idField:'ruleId',
			sortName:'ruleId',
			sortOrder:'desc',
			columns:[[
				{field:'ruleId',align:'center',width:"8%",title:'红包规则编号',
		          	 formatter:function(value,rec){
			          	 var url='${base}/operate/toEditView?ruleId='+rec.ruleId;
			          	 var str = '<a class="operation-link" href="'+url+'">'+rec.ruleId+'</a>';
						return str;
					  }},
				{field:'ruleName',align:'center',width:"15%",title:'红包规则名称'},
				{field:'ruleScope',align:'center',width:"10%",title:'红包性质',
					formatter: function(value,rec){
						var str = "其他";
    	               if(value == 1){
					    	str = "非订单类固定金额";
						} else if(value == 10){
							str = "订单类随机金额";
						} else if(value == 11){
							str = "订单类固定金额";
						}
						return str;
               		}
               	},
				{field:'bonusLimit',align:'center',width:"10%",title:'红包总数量(个)',sortable:true,
					formatter:function(value,rec){
						var str = "";
						if(value == 0){
							str = "无限制";
						} else {
							str = value ;
						}
						return str;
					}
				},
				{field:'minAmount',align:'center',width:"15%",title:'单个红包金额(元)/比例',sortable:true,
					formatter:function(value,rec){
						var str = "";
						if(rec.ruleScope == 1){
							str = (Number)(rec.bonusAmount/100);
						} else if(rec.ruleScope == 10){
							if(rec.minAmount == rec.maxAmount){
								str =  (Number)(rec.minAmount/100);
							} else {
								str =  (Number)(rec.minAmount/100) +'-'+ (Number)(rec.maxAmount/100);
							}
						} else if(rec.ruleScope == 11){
							if(rec.bonusType == 1){
								str = (Number)(rec.bonusAmount/100);
							} else if(rec.bonusType == 2){
								str = (Number)(rec.bonusAmount/100)+"%";
							}
						}
						return str;
					}
				},
				{field:'effTime',align:'center',width:"15%",title:'红包发放时间',
					formatter:function(value,rec){
					   	var str = formatDate(rec.effTime) +' 至 '+ formatDate(rec.expTime);
					   	return str;
					}
				},
				{field:'expTime',align:'center',width:"10%",title:'红包发放状态',
					formatter:function(value,rec){
						var dt = new Date();
						var str = "";
						if(dt < rec.effTime){
							str = "未开始";
						} else if(dt >= rec.effTime && dt < rec.expTime){
							str = "进行中";
						} else if(dt >= rec.expTime){
							str = "已结束";
						}
					    return str;
					}
				},
				{field:'aaa',align:'center',width:"15%",title:'状态',
					formatter:function(value,rec){
					     str = '<a href="/operate/findGrantList?ruleId='+rec.ruleId+'" >查看发放记录</a>';
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
      			sortCell(['ruleId','bonusLimit','minAmount']);//排序要显示箭头的，以数组形式传
      	}
		});
		//分页
		pageAction();
		
   });
	</script>
</body>
</html>