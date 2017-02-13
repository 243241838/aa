<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-红包管理-新增</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
</head>
<body>

<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
    <form id="nextInfoForm" method="post" action="" >
      <div class="ui-info-main">
        <h2 class="ui-info-tit">产品信息</h2>
        <#-- 数据  -->
        <input type="hidden" name="rules" value="${rulesStr}" />
        <input type="hidden" name="pools" value="${poolsStr}" />
        <input type="hidden" name="configs" value="${configsStr}" />
         <ul class="ui-info-list">
           	<li class="ui-info-item" >
           		<label class="ui-info-lbl redrule-item-label">红包规则名称:</label>
           		${rules.ruleName}
           	</li>
           	<li class="ui-info-item ui-info-item-grey">
           		<label class="ui-info-lbl redrule-item-label redrule-item-label">红包性质:</label>
           		<#if rules.ruleScopeStr == 0>
           			非订单类固定金额
           		<#elseif rules.ruleScopeStr == 1>
           			订单类固定金额
           		<#elseif rules.ruleScopeStr == 2>
           			订单类随机金额
           		<#else>
           			其他
           		</#if>
           	</li>
           	<#if rules.ruleScopeStr == 1 || rules.ruleScopeStr == 2>
           	
	            <li class="ui-info-item">
	              <label class="ui-info-lbl redrule-item-label redrule-item-label"></label>
	              <!--关联产品数据填充-->
	               <div id="relateConfirmBox"></div>
	            </li>
	            <#if rules.ruleScopeStr == 1 >
		            <li class="ui-info-item ui-info-item-grey">
		              <label class="ui-info-lbl redrule-item-label redrule-item-label">采用模式:</label>
		              <#if rules.bonusType2 == 1>
		              		固定数值
		              <#elseif rules.bonusType2 == 2>
		             		按订单比例
		              <#else>
		              		其他
		              </#if>
		            </li>
		        <#elseif rules.ruleScopeStr == 2>
		            <li class="ui-info-item ui-info-item-grey">
		              <label class="ui-info-lbl redrule-item-label redrule-item-label">采用模式:</label>
		              <#if rules.bonusType3 == 1>
		              		订单比例模式
		              <#elseif rules.bonusType3 == 2>
		             		指定最大金额
		              <#else>
		              		其他
		              </#if>
		            </li>
		        </#if>
	            <#if  rules.ruleScopeStr == 2>
	            	<#if rules.bonusType3 == 1>
			            <li class="ui-info-item">
			              <label class="ui-info-lbl redrule-item-label">营销费用/订单金额:</label>
			              ${rules.bonusAmountStr} %
			            </li>
		            <#elseif rules.bonusType3 == 2>
			            <li class="ui-info-item">
			              <label class="ui-info-lbl redrule-item-label">营销费用最大金额:</label>
			              ${rules.maxValueStr} 元
			            </li>
			         <#else>
			         	
			         </#if>
	            </#if>
            </#if>
            <#if rules.ruleScopeStr == 1>
            	<#if rules.bonusType2 == 2>
	            	<li class="ui-info-item">
		              <label class="ui-info-lbl redrule-item-label">单个红包金额/订单总金额:</label>
		              ${rules.bonusAmountStr} %
		            </li>
		            <li class="ui-info-item">
		              <label class="ui-info-lbl redrule-item-label">红包最大金额限制:</label>
		              ${rules.maxValueStr}元
		            </li>
		         </#if>
            </#if>
            <#if rules.ruleScopeStr == 0 || rules.ruleScopeStr == 1>  
            	<#if rules.bonusType2 != 2>
            		<li class="ui-info-item">
		              <label class="ui-info-lbl redrule-item-label">单个红包金额:</label>
		              	${rules.bonusAmountStr}元
		            </li>
		        </#if>
            </#if>
	        <#if  rules.ruleScopeStr == 2>
	            <li class="ui-info-item ui-info-item-grey ui-resureLimit-wrap fn-clear">
	                <div class="ui-resureLimit-inner ui-resureLimit-fir">
		          	  <label class="ui-info-lbl redrule-item-label" style="vertical-align: top;">单个红包金额：</label>
	                  <!--<a class="ui-guarant-reduce" href="javascript:;"></a>-->
		              <span >
		                  <#if configs.configsMap??>
		                  	  <#assign item=configs.configsMap>
							  <#list item?values as item2>
					              	  ${item2.minAmountStr} 元
						              <#if item2.minAmountStr != item2.maxAmountStr && item2.maxAmountStr != ''>至  ${item2.maxAmountStr} 元</#if>
						  			  <label class="ui-info-lbl ui-info-lblw">发放比例：</label>
						  			  ${item2.sendPercent} %
						          </br>
				              </#list>
				          </#if>
			          </span>
	              	</div>
	            </li>
	         </#if>
	        <#if rules.ruleScopeStr == 1 || rules.ruleScopeStr == 2>
	            <li class="ui-info-item">
	              <label class="ui-info-lbl redrule-item-label">红包触发金额:</label>
		              <#if rules.triggerAmountStr == 0>
							无限制
		              <#else>
		                	${rules.triggerAmountStr} 元
		              </#if>
	            </li>
	        </#if>
            <li class="ui-info-item ui-info-item-grey">
              <label class="ui-info-lbl redrule-item-label">红包总数量:</label>
              	<#if rules.bonusLimit == 0>
					无限制
                <#else>
                	${rules.bonusLimit}个
                </#if>
            </li>
           	<li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label ui-info-small">红包发放时间：</label>
              <span data-qb="qb">
             	${rules.effTimeStr}
                 <em>至</em>
                ${rules.expTimeStr} 
              </span>
            </li>
           	<li class="ui-info-item ui-info-item-grey">
              <label class="ui-info-lbl redrule-item-label">红包祝福语:</label>
              ${rules.bonusWishing}
            </li>
            <li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label">红包备注信息:</label>
              ${rules.bonusRemark}
            </li>
			       <li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl redrule-item-label">每人每天最多发放个数:</label>
                <#if rules.dayUserLimit == 0>
					无限制
                <#else>
                	${rules.dayUserLimit} 个
                </#if>
            </li>
            <li class="ui-info-item">
                <label class="ui-info-lbl redrule-item-label">每天最多发放人数:</label>
                <#if rules.userLimit == 0>
					无限制
                <#else>
                	${rules.userLimit} 人
                </#if>
            </li>
            <li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl redrule-item-label">每天最多发放个数:</label>
                <#if rules.dayLimit == 0>
					无限制
                <#else>
                	${rules.dayLimit} 个
                </#if>
            </li>
            <li class="ui-info-item">
              <label class="ui-info-lbl"></label>
              <span style="color:#f00;padding:10px 0;">每天最多发放个数=每人每天最多发放个数*每天最多发放人数</span>
            </li>
          <li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl redrule-item-label">失败是否补发:</label>
                <#if rules.autoResendStr == -1>
                	否
                <#else>
                	是&nbsp;&nbsp;${rules.autoResend} 次
                </#if>
            </li>
            <#if  rules.ruleScopeStr == 2>
	            <li class="ui-info-item">
	                <label class="ui-info-lbl redrule-item-label">是否采用奖金池模式:</label>
	                <#if rules.poolIdSts == 0>
	                	否
	                <#else>
	                	是
	                </#if>
	            </li>
	            <#if rules.poolIdSts != 0>
		            <li class="ui-info-item">
		                <label class="ui-info-lbl redrule-item-label">奖金池初始金额:</label>
		                ${pools.bonusPoolStr} 元 
		            </li>
		            <li class="ui-info-item ui-info-item-grey">
		                <label class="ui-info-lbl redrule-item-label">奖金池最低剩余金额/奖金池总金额:</label>
		                ${pools.maxTakeoutStr} %  
		            </li>
		         </#if>
	        </#if>
          </ul>
    	</div>
      <div class="ui-btn-double">
        <input type="button" value="确认" class="ui-btn-blue" id="lastConfirmSubmit"/>
        <input type="button" value="返回修改"  class="ui-btn-grey" id="back"/>
      </div>
      </form>
    </div>
   
</div>
<script type="text/template" id="dlgConfirm">
<div id="dlgSubmit" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
  <h3 class="ui-dlg-tit">确定提交该红包规则吗？</h3>
  <input type="button" class="ui-dlgOk-btn ui-dlgok" value="确定" id="redruleSubmit"/>
  <input type="button" class="ui-dlgCancel-btn" value="取消"/>
</div>
</script>
<script type="text/template" id="dlgMessage">
  <div id="error" class="easyui-dialog ui-dlg-alert ui-newdlg"  data-options="iconCls:'icon-save',modal:true,closed: true">
  </div>
</script>
<script>
$(function(){
	//确认提交
	$("#lastConfirmSubmit").click(function(){
		$($('#dlgConfirm').html()).dialog({closed: false});
		$(this).prop('disabled',true);
	})
		
	$('body').on('click','#redruleSubmit',function(){
		
		if('${rules.ruleId}' != ""){
			url = "${base}/operate/editBonusRule";
		} else {
			url = "${base}/operate/addBonusRule";
		}
		$.ajax( {
			url : url,
			type : "post",
			dataType: 'json',
			data:$("#nextInfoForm").serialize(),
			// 成功后调用
			success : function(data) {

				if(data.succ){
					$($('#dlgMessage').html()).text(data.entity).dialog({closed: false});				

			        setTimeout(function(){
			        	location.href="${base}/operate/envelopeManage";
			        },2000);
				}else{

					$($('#dlgMessage').html()).text(data.entity).dialog({closed: false});
					$('#lastConfirmSubmit').prop('disabled',false);
			    	return false;
				}
				
			},
			error:function(data){
			
				if(data != null && data.entity != null && data.entity != ""){
					$($('#dlgMessage').html()).text(data.entity).dialog({closed: false});

				} else {
				    $($('#dlgMessage').html()).text(data.entity).dialog({closed: false});
				}
				$('#lastConfirmSubmit').prop('disabled',false);
				return false;
			}
		});
	})
	
  
  //显示产品列表
  var ids = '${rules.productIds}';
  var data = '<div class="relate-box"><table class="relate-produce-table"><tr><th class="relate-item-style">产品ID</th><th class="relate-item-style">保险名称</th><th class="relate-item-style">保费金额(元)</th><th class="relate-item-style">销售数量(份)</th><th class="relate-item-style">上架状态</th><th class="relate-item-style">上架时间</th><th class="relate-item-style">下架时间</th></tr>';	          	      
  if(ids != ""){
	   $.ajax({
	         url: '/operate/findDomainProducts?ids='+ids,
	         type: 'post',
	         dataType: 'json',
	         success: function (result) {
	            if(!result || result.length == 0){
	              return false;
	            }
	            var target =$("#relateConfirmBox");
	            var htm = '';
	            var productIds = '';
	            for(var i=0; i<result.length; i++){
	              var sourname="未知";
	              var maxq=result[i].maxQuantity;
	              //设置保费金额
	              var minPre = '';
	              if(result[i].minPremium == result[i].maxPremium){
	            minPre = (result[i].minPremium/100).toFixed(2);
	        } else {
	                  minPre = (result[i].minPremium/100).toFixed(2)+" - "+(result[i].maxPremium/100).toFixed(2);
	        }
	        //设置上架状态
	        var domainStatus = '';
	        if(result[i].domainStatus == 1){
	          domainStatus = '待上架';
	        }else if(result[i].domainStatus == 2){
	          domainStatus = '已上架';
	        }else if(result[i].domainStatus == 3){
	          domainStatus = '已下架';
	        } else {
	          domainStatus = '其他';
	        }
	        //设置销售数量
	        var maxQuantity = '';
	        if(result[i].maxQuantity >= 0){
	          maxQuantity = result[i].maxQuantity;
	        } else {
	          maxQuantity = '0';
	        }
	                  htm = htm + '<tr>'+
	                        '<td class="ui-channel-titcolor relate-item-text relate-item-textcurr">'+result[i].productId+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+result[i].productName+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+minPre+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+maxQuantity+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+domainStatus+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+formatTimestamp(result[i].effTime)+'</td>'+
	                        '<td class="ui-channel-titcolor relate-item-text">'+formatTimestamp(result[i].expTime)+'</td>'+
	                      '</tr>';
	                      productIds += result[i].productId+',';
	              }
	          htm = data + htm + '</table> <input type="hidden" value="'+productIds+'" name="productIds" />';
	          target.html(htm);
	          }
	  });

  }
  
  
        
})

</script> 

</body>
</html>