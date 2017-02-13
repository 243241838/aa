
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>优惠券使用详情</title>
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
							<label class="name operate-item-label">优惠券码</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="couponCode" id="couponCode" value=""/>
							</span>
						</li>
						<li>
							<label class="name ui-formlabel-100" style="width:120px;">优惠券使用状态</label>
							<select class="ui-combobox" name="couponSts" id="couponSts" >
								<option value="" >全部</option>
                                <option value="0" >尚未领取</option>
                                <option value="1" >已被领取</option>
                                <option value="10" >部分使用</option>
                                <option value="11" >全部使用</option>
                                <option value="-1" >已过期</option>
							</select>
						</li>
						<li>
							<label class="name">领取渠道</label>
							<select class="ui-combobox" name="couponChannel" id="couponChannel" >
								<option value="" >全部</option>
                                <option value="1">E保客户端</option>
                                <option value="2">E保微信</option>
								<option value="3">手机浏览器</option>
                                <option value="4">网站</option>
                                <option value="0">未知来源</option>
							</select>
						</li>
					</ul>
					<ul class="search-list fn-clear">
						<li>
							<label class="name operate-item-label">用户姓名</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="realName" id="realName" value=""/>
							</span>
						</li>
						<li>
							<label class="name operate-item-label">订单号</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="tradeNo" id="tradeNo" value=""/>
							</span>
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
				<div class="coupon-listbox">
					<h2 class="ui-info-tit" style="color:#768399;">活动信息：</h2>
					<table class="relate-produce-table">
					    <tr>
					      <th class="relate-item-style">活动编号</th>
					      <th class="relate-item-style">活动名称</th>
					      <th class="relate-item-style">活动时间</th>
					      <th class="relate-item-style">活动状态</th>
					      <th class="relate-item-style">产品ID</th>
					    </tr>
					    <tr>
					      <td class="ui-channel-titcolor relate-item-text relate-item-textcurr">
					      	<a href="${base}/coupons/promotionEditInfo?promotionId=${promotionRecords.promotionId}">${promotionRecords.promotionId}</a>
					      </td>
					      <td class="ui-channel-titcolor relate-item-text">
						  		${promotionRecords.promotionName}
						  </td>
					      <td class="ui-channel-titcolor relate-item-text">
						     	${promotionRecords.effTime?string('yyyy-MM-dd HH:mm:ss')} 至 ${promotionRecords.expTime?string('yyyy-MM-dd HH:mm:ss')}
						  </td>
					      <td class="ui-channel-titcolor relate-item-text">
						   		<#if promotionRecords.domainStatus == 1>
						   			未进行
						   		<#elseif promotionRecords.domainStatus == 2>
									进行中
								<#elseif promotionRecords.domainStatus == 3>
									已结束
								<#else>
									其它
						   		</#if>
						  </td>
					      <td class="ui-channel-titcolor relate-item-text">
					      	 <#list promotionRecords.productTags as product>
							  	<a href="${base}/product/toProductDetailMsgs?productId=${product.productId}">${product.productId}</a>
							 </#list>
					      </td>
					    </tr>
					</table>
					<h2 class="ui-info-tit" style="color:#768399;">优惠券信息：</h2>
					<table class="relate-produce-table">
					    <tr>
					      <th class="relate-item-style">优惠券编号</th>
					      <th class="relate-item-style">优惠券名称</th>
					      <th class="relate-item-style">优惠方式</th>
					      <th class="relate-item-style">优惠值</th>
					    </tr>
					    <tr>
					      <td class="ui-channel-titcolor relate-item-text relate-item-textcurr">
					      	<a href="${base}/coupons/toEditCoupons?couponId=${couponsRecords.couponId}">${couponsRecords.couponId}</a>
					      </td>
					      <td class="ui-channel-titcolor relate-item-text">
						  		${couponsRecords.couponName}
						  </td>
					      <td class="ui-channel-titcolor relate-item-text">
								<#if couponsRecords.couponType == 1>
                                    折扣优惠
								<#else>
                                    金额优惠
								</#if>
						  </td>
					      <td class="ui-channel-titcolor relate-item-text">
								<#if couponsRecords.couponType == 1>
									${couponsRecords.couponValue}折
								<#else>
									<#assign payAmount=couponsRecords.couponValue/100>
                                    ￥${payAmount?string(",##0.00#")}
								</#if>
						  </td>
					    </tr>
					</table>
				</div>
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
			url:'${base}/coupons/findCouponsDetailsAjax?couponId='+ ${couponsRecords.couponId} +'&promotionId='+ ${promotionRecords.promotionId},
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			idField:'couponId',
			title: "标题",
			columns:[[
				{field:'couponCode',align:'center',width:"8%",title:'优惠券码',
		          	 formatter:function(value,rec){
			          	 return rec.couponCode;
					  }},
				{field:'couponSts',align:'center',width:"8%",title:'使用状态',
                    formatter:function(value,rec){
                        if (rec.couponSts == 0) {
							return '尚未领取';
						} else if (rec.couponSts == 1) {
                            return '已被领取';
						} else if (rec.couponSts == 10) {
                            return '部分使用';
                        } else if (rec.couponSts == 11) {
                            return '全部使用';
                        } else if (rec.couponSts == -1) {
                            return '已过期';
                        }
					}},
				{field:'createTime',align:'center',width:"15%",title:'领取时间',
					formatter:function(value,rec){
						return formatTimestamp(rec.createTime);
					}},
				{field:'channelId',align:'center',width:"8%",title:'领取渠道',
					formatter:function(value,rec){
						if (rec.channelId == 1) {
                            return 'E保客户端';
						} else if (rec.channelId == 2) {
                            return 'E保微信';
						} else if (rec.channelId == 3) {
                            return '手机浏览器';
                        } else if (rec.channelId == 4) {
                            return '网站';
                        } else if (rec.channelId == 0) {
                            return '未知来源';
                        }
					}},
				{field:'userId',align:'center',width:"15%",title:'领取用户',
					formatter:function(value,rec){
						if (rec.couponSts > 0) {
                            var url = '${base}/user/toAccountDetailMsg?userId=' + rec.userId;
                            return '<a class="operation-link" href="' + url + '">' + rec.userId + '</a>';
                        }
					}},
				{field:'realName',align:'center',width:"15%",title:'用户姓名',
					formatter:function(value,rec){
                        if (rec.couponSts > 0) {
                            return rec.realName;
                        }
					}},
				{field:'effTime',align:'center',width:"8%",title:'使用时间',
					formatter:function(value,rec){
                        if (rec.couponSts > 0) {
							if (rec.effDate) {
                                return formatTimestamp(rec.effDate);
                            } else {
								return '/';
							}
                        }
					}},
				{field:'expTime',align:'center',width:"23%",title:'过期时间',
					formatter:function(value, rec){
                        if (rec.couponSts > 0) {
                            if (rec.expDate) {
								return formatTimestamp(rec.expDate);
                            } else {
                                return '/';
                            }
                        }
					}},
				{field:'tradeId',align:'center',width:"13%",title:'订单号',
		          	 formatter:function(value,rec){
                         if (rec.couponSts > 0) {
							 if (rec.tradeId) {
                                 var url = '${base}/businessmanager/findTradeDetails?tradeId=' + rec.tradeId;
                                 return '<a class="operation-link" href="'+ url +'">' + rec.tradeId + '</a>';
                             } else {
								 return '/';
							 }
                         }
				    }}
			]],

			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
	    	var sumCount = ${promotionCouponsPo.codesumCount};
			var pullCount = ${promotionCouponsPo.codepullCount};
			var usedCount = ${promotionCouponsPo.codeusedCount};
			var laveCount= ${promotionCouponsPo.codelaveCount};
			var url = '${base}/coupons/promotionEditInfo?promotionId=${promotionRecords.promotionId}';
	    	var titleHtml='<div class="query-result-title" style="font-size:14px;"><span class="query-result-span">优惠券码信息：优惠券码共：<em class="query-result-num">'+sumCount+
					'</em>张  其中：已被领取：<em class="query-result-num">'+
                    pullCount+'</em> 张 已被使用：<em class="query-result-num">'+
                    usedCount+'</em> 张，剩余可领取数量为：<em class="query-result-num">'+
                    laveCount+'</em> 张<a href="'+ url +'" class="reject-cannel coupone-downcolor">不够了?去添加</a></span><a href="javascript:downExcel();" class="search-btn policy-newcontent reject-cannel">导出优惠券码</a>';
				$(".panel-title").html(titleHtml);
				$(".panel-title").show();
            return eb.loadFilter(data);    //自定义过滤方法
      },
      onLoadSuccess:function(){
      		pageCls();
      		sortCell(['effTime','expTime']);//排序要显示箭头的，以数组形式传	    		
      }
	});
		//分页
		pageAction();
				
   });
    function downExcel() {
        var couponCode = $("#couponCode").val();
        var couponSts = $("#couponSts").val();
        var couponChannel = $("#couponChannel").val();
        var realName = $("#realName").val();
        var tradeNo = $("#tradeNo").val();

        var url= "${base}/coupons/exportExecl?couponId=${couponsRecords.couponId}&promotionId=${promotionRecords.promotionId}";

        if(couponCode != "" && couponCode != null){
            url = url + "&couponCode="+couponCode;
        }
        if(couponSts != "" && couponSts != null){
            url = url + "&couponSts="+couponSts;
        }
        if(couponChannel != "" && couponChannel != null){
            url = url + "&couponChannel="+couponChannel;
        }
        if(realName != "" && realName != null){
            url = url + "&realName="+realName;
        }
        if(tradeNo != "" && tradeNo != null){
            url = url + "&tradeNo="+tradeNo;
        }

        window.location.href = url;
    }
	</script>
</body>
</html>