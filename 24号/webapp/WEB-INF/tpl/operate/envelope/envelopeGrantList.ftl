
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
							<label class="name ui-profess-label">红包流水号：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="logId" maxlength=9/>
							</span>
						</li>
						<li>
							<label class="name ui-profess-label">用户姓名：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="ename" value="" maxlength=40/></span>
						</li>
						<li>
							<label class="name ui-profess-label">用户手机号：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="mobile" value="" maxlength=40/></span>
						</li>
					</ul>
					<ul class="search-list fn-clear">
						<li class="date">
							<label class="name ui-change-item-label">订单号：</label>
								<span class="textbox"><input class="textbox-text textbox-prompt" type="text" name="bizId" value="" maxlength=40/></span>
						</li>
						<li>
							<label class="name ui-profess-label">红包金额：</label>
							<select class="ui-combobox" name="bonusAmount" id="transaceAmount" >
								<option value="">全部</option>
								<option value="1">0-1元</option>
								<option value="2">1-10元</option>	
								<option value="3">10-50元</option>
								<option value="4">50-100元</option>
								<option value="5">100元及以上</option>
								<option value="6">自定义</option>
							</select>
							<span class="ui-hidden fn-hide" id="customToggle">
								<input name="minBonusAmount" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo decimal-ptblur" maxlength="10"  data-options="validType:['customMoney']" id="moneyStart">
								<em class="ui-channel-titcolor">至</em>
								<input name="maxBonusAmount" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo decimal-ptblur" maxlength="10" data-options="validType:['customMoney','moneycompare[\'#moneyStart\']']">
								<em class="ui-channel-titcolor">元</em>
							</span>
						</li>
						<li>
							<label class="name ui-profess-label">发放状态：</label>
							<select class="ui-combobox" name="bonusSts" id="bonusSts" >
								<option value="">全部</option>
								<option value="0">未发放</option>
								<option value="10">发放成功</option>
								<option value="-10">发送失败</option>
								<option value="20">补发成功</option>
								<option value="-20">补发失败</option>
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
				</br>
				<table id="dg-list2" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
				<div class="ui-top-staticis">
					发放详情(注：您可将鼠标移入发放状态以查看发放/补发失败原因)
				</div>
				</br>
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
		</div>
	</div>
	
	<script>
	$(function(){
		validExtend();
		<#-- 查询红包发放记录 -->
		$("#dg-list").datagrid({
			url:'${base}/operate/findBonusSendList?ruleId='+${rulesVo.ruleId},
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			idField:'logId',
			sortName:'logId',
			sortOrder:'desc',
			columns:[[
				{field:'logId',align:'center',width:"8%",title:'红包流水号'},
				{field:'userId',align:'center',width:"8%",title:'用户ID',
		          	 formatter:function(value,rec){
					     str = '<a href="/user/toAccountDetailMsg?userId='+rec.userId+'" >'+value+'</a>';
					     return str;
					}
				},
				{field:'ename',align:'center',width:"8%",title:'用户姓名'},
				{field:'mobile',align:'center',width:"10%",title:'用户手机号码'},
				{field:'bizId',align:'center',width:"15%",title:'订单号',
					formatter:function(value,rec){
					     str = '<a href="/businessmanager/findTradeDetails?tradeId='+rec.bizId+'" >'+value+'</a>';
					     return str;
					}
				},
				{field:'payAmount',align:'center',width:"8%",title:'订单金额(元)',sortable:true,
					formatter:function(value,rec){
						var str = rec.payAmount/100;
					    return str;
					}
				},
				{field:'bonusAmount',align:'center',width:"8%",title:'红包金额(元)',sortable:true,
					formatter:function(value,rec){
					    var str = (Number)(value/100);
					    return str;
					}
				},
				{field:'sendTime',align:'center',width:"12%",title:'发放时间',
					formatter:function(value,rec){
					    return formatTimestamp(rec.sendTime);
					}
				},
				{field:'bonusSts',align:'center',width:"10%",title:'发放状态(描述)',
					formatter:function(value,rec){
						if(value == 0){
							str = '未发放';
						} else if(value == 10){
							str = '发放成功';
						} else if(value == -10){
							str = '<p class="ui-td-article">发放失败</p>'+
							'<div class="ui-hover-tip" style="display: none;top:78px;right:10px;">'+rec.stsDesc+'</div>'
						} else if(value == 20){
							str = '补发成功';
						} else if (value == -20){
							str = '<p class="ui-td-article">补发失败</p>'+
							'<div class="ui-hover-tip" style="display: none;top:78px;right:10px;">'+rec.stsDesc+'</div>'
						}
					    return str;
					}
				},
				{field:'sendCount',align:'center',width:"8%",title:'发放次数',sortable:true}
			]],

			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
	     
            return eb.loadFilter(data);    //自定义过滤方法
          
      },
     	onLoadSuccess:function(){
      		pageCls();
      			sortCell(['payAmount','bonusAmount','sendCount']);//排序要显示箭头的，以数组形式传
      			
      			$('.ui-td-article').hover(function(){
	        $(this).next('.ui-hover-tip').show();
			    },function(){
			         $(this).next('.ui-hover-tip').hide();
		    });
	    
      	}
		});
		//分页
		pageAction();
		
		
	   <#-- 查询红包信息 -->
		$("#dg-list2").datagrid({
			url:'${base}/operate/findEnvelopeMsg?ruleId='+${rulesVo.ruleId},
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pageSize:10,
			idField:'ruleId',
			columns:[[
				{field:'ruleId',align:'center',width:"8%",title:'红包规则编号',
		          	 formatter:function(value,rec){
			          	 var url='${base}/operate/findProductInfo?ruleId='+rec.ruleId;
			          	 var str = '<a class="operation-link" href="'+url+'">'+rec.ruleId+'</a>';
						return str;
					  }},
				{field:'ruleName',align:'center',width:"15%",title:'红包规则名称'},
				{field:'bonusType',align:'center',width:"15%",title:'红包性质',
					formatter: function(value,rec){
						var str = "其他";
    	               if(value == 1){
					    	str = "非订单类固定金额";
						} else if(value == 2){
							str = "订单类固定金额";
						}
						
						return str;
               		}
               	},
				{field:'bonusLimit',align:'center',width:"10%",title:'红包总数量(个)',
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
				{field:'minAmount',align:'center',width:"15%",title:'单个红包金额(元)/比例',
					formatter:function(value,rec){
						var str = "";
						if(rec.conRuleId != null){
							if(rec.bonusType == 1){
								if(rec.maxAmount == rec.minAmount){
									str = (Number)(rec.maxAmount/100);
								} else {
									str =  (Number)(rec.minAmount/100) +'-'+ (Number)(rec.maxAmount/100);
								}
							} else if(rec.bonusType == 2){
								str = rec.bonusAmount+"%";
							}
						} else {
							if(rec.bonusType == 1){
								if(rec.bonusAmount == rec.maxValue){
									str = (Number)(rec.bonusAmount/100);
								} else if (rec.maxValue == 0){
									str =  (Number)(rec.bonusAmount/100) +'-不限';
								} else {
									str =  (Number)(rec.bonusAmount/100) +'-'+ (Number)(rec.maxValue/100);
								}
							} else if(rec.bonusType == 2){
								str = rec.bonusAmount+"%";
							}
						}
						return str;
					}
				},
				{field:'effTime',align:'center',width:"18%",title:'红包发放时间',
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
				}
			]],
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      },
      onLoadSuccess:function(data){
      	moreDlelist=data.total==0?0:1;
      }
	});
});
	</script>
</body>
</html>