
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
	<div>
		<div class="ui-datagrid-wrap" style="border:0;">
			<div class="coupon-optedetail">
				<div class="m-b-10">
				    <label for="">活动名称：</label>
				    <span>${productName}</span>
				</div>
				<!--查看优惠券码start-->
				<div>
				<p class="m-b-10">以下为该活动的优惠券码详情，如需查看每个优惠券码的领取及使用情况，请点击列表中的数字在新页面中查看</p>
				<#if promotionCouponsPoList?if_exists>
				<table class="relate-produce-table">
				    <tr>
				      <th class="relate-item-style">优惠券编号</th>
				      <th class="relate-item-style">优惠券领用时间</th>
				      <th class="relate-item-style">优惠券使用时间</th>
				      <th class="relate-item-style">优惠券总数量</th>
				      <th class="relate-item-style">已领取数量</th>
				      <th class="relate-item-style">已使用数量</th>
				      <th class="relate-item-style">剩余可领取数量</th>
				    </tr>
				<#list promotionCouponsPoList as promotionCouponsPo>
				    <tr>
				      <td class="ui-channel-titcolor relate-item-text relate-item-textcurr">
				      	<a href="javascript:parent.window.location.href='${base}/coupons/toEditCoupons?couponId=${promotionCouponsPo.couponId}'">${promotionCouponsPo.couponId}</a>
				      </td>
				      <td class="ui-channel-titcolor relate-item-text">
						  <#if promotionCouponsPo.takeEffDate?if_exists && romotionCouponsPo.takeExpDate?if_exists>
							  ${promotionCouponsPo.takeEffDate?string('yyyy-MM-dd HH:mm:ss')}
								  </br>至
							  ${promotionCouponsPo.takeExpDate?string('yyyy-MM-dd HH:mm:ss')}
						  <#else>
						  		不限
						  </#if>
					  </td>
				      <td class="ui-channel-titcolor relate-item-text">
						  <#if promotionCouponsPo.effDate?if_exists && promotionCouponsPo.expDate?if_exists>
							  ${promotionCouponsPo.effDate?string('yyyy-MM-dd HH:mm:ss')}
								  </br>至
							  ${promotionCouponsPo.expDate?string('yyyy-MM-dd HH:mm:ss')}
						  <#else>
								不限
						  </#if>

					  </td>
				      <td class="ui-channel-titcolor relate-item-text">
					   <a href="javascript:parent.window.location.href='${base}/coupons/findCouponDetail?couponId=${promotionCouponsPo.couponId}&promotionId=${promotionId}'">${promotionCouponsPo.codesumCount}</a>
					  </td>
					  <td class="ui-channel-titcolor relate-item-text">
					   <a href="javascript:parent.window.location.href='${base}/coupons/findCouponDetail?couponId=${promotionCouponsPo.couponId}&promotionId=${promotionId}'">${promotionCouponsPo.codepullCount}</a>
					  </td>
					  <td class="ui-channel-titcolor relate-item-text">
					   <a href="javascript:parent.window.location.href='${base}/coupons/findCouponDetail?couponId=${promotionCouponsPo.couponId}&promotionId=${promotionId}'">${promotionCouponsPo.codeusedCount}</a>
					  </td>
				      <td class="ui-channel-titcolor relate-item-text">
				      	<a href="javascript:parent.window.location.href='${base}/coupons/findCouponDetail?couponId=${promotionCouponsPo.couponId}&promotionId=${promotionId}'">${promotionCouponsPo.codelaveCount}</a>
				      </td>
				    </tr>
				</#list>
				</table>
				</#if>
				</div>
				<br />
				<!--查看优惠券码end-->
				<!--生成优惠券码start-->
			<#list couponsPoList as couponPo>
				<div>
				<table class="relate-produce-table">
				    <tr>
				      <th class="relate-item-style">序号</th>
				      <th class="relate-item-style">优惠券编号</th>
				      <th class="relate-item-style">优惠券名称</th>
				      <th class="relate-item-style">优惠券方式</th>
				      <th class="relate-item-style">优惠值</th>
				    </tr>
				    <tr>
				      <td class="ui-channel-titcolor relate-item-text relate-item-textcurr">
				      	${couponPo_index + 1}
				      </td>
				     
				      <td class="ui-channel-titcolor relate-item-text">
					   <a href="javascript:parent.window.location.href='${base}/coupons/toEditCoupons?couponId=${couponPo.couponId}'">${couponPo.couponId}</a>
					  </td>
					  <td class="ui-channel-titcolor relate-item-text">
						  ${couponPo.couponName}
					  </td>
					  <td class="ui-channel-titcolor relate-item-text">
						  <#if couponPo.couponType == 1>
						      折扣优惠
						  <#else>
							  金额优惠
						  </#if>
					  </td>
				      <td class="ui-channel-titcolor relate-item-text">
							<#if couponPo.couponType == 1>
								${couponPo.couponValue}折
							<#else>
								<#assign payAmount=couponPo.couponValue/100>
								￥${payAmount?string(",##0.00#")}
							</#if>
				      </td>
				    </tr>
				</table>
				<div class="m-b-10" style="margin-top:20px;">
					<label for="" class="ui-page-fir">该优惠券共</label>
					<input type="hidden" name="promotionId" value="${promotionId}" class="coupons-param">
					<input type="hidden" name="couponId" value="${couponPo.couponId}" class="coupons-param">
					<input name="countTicket" type="text" value="" class="easyui-validatebox ui-info-sinput ui-menuoptmargin coupons-param">
					<input type="button" value="生成优惠券码" class="ui-btn-blue coupon-longbtn generate-couponcode"/> 
					<#--<a href="#" class="fn-hide coupon-codelink">点击下载全部优惠券码</a>-->
				</div>
				</div>
			</#list>
			<!--生成优惠券码end-->   
			</div>
		</div>
	</div>
    <div id="dlgMessage" class="easyui-dialog ui-dlg-alert" data-options="iconCls:'icon-save',modal:true,closed: true">
        <h3 class="ui-dlg-tit">确定要删除该类别吗？</h3>
        <input type="button" class="ui-dlgOk-btn ui-dlgok" value="确定"/>
    </div>
	<script>
$(function(){
	$(".generate-couponcode").on('click',function(){
		var This = this,$parambox =$(this).parent('div'),
		    paramarrs = $parambox.find('.coupons-param'),
		 	paramvals = [];
		$.each(paramarrs,function(i,v){
			paramvals[i]= $(v).val();
		})
		if($parambox.form('validate')){
			$.ajax( {
				url : "${base}/coupons/generateCouponCodes",
				dataType : "json",
				type : "post",
				data: {"promotionId":paramvals[0], "couponId":paramvals[1],"countTicket":paramvals[2]},
				success : function(data) {
					//显示链接
					console.log(data);
                    showAlert('dlgMessage', data.entity);
				}
			});
		}
	})
})	
</script>	
</body>
</html>