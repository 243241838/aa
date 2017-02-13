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
    <script type="text/javascript" src="${base}/resource/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
<body>
	<div class="ui-info-box">
        <div class="ui-crumbs" id="crumbs">
        	
        </div>
        <div class="ui-info-main">
            <div class="ui-informate">
				<!--保单信息start-->
                <h4 class="ui-info-tit">保单信息</h4>
                <ul class="ui-base-produceinfor">		
             			<li class="ui-base-colsinfor ui-base-colwidth-business">
         					<label class="ui-base-label ui-channel-base-label">保单号:</label>
     						<span class="ui-base-data">
                            ${tradeDetailsPo.policyNo}              
                            </span>
             			</li>
                        <li class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">保单状态:</label>
                            <span class="ui-base-data">
                           <#if tradeDetailsPo.policySts == 1>
                            	已创建
                            <#elseif tradeDetailsPo.policySts == 10>
                        		核保中
                        	<#elseif tradeDetailsPo.policySts == 20>
                        		已承保
                        	<#elseif tradeDetailsPo.policySts == 30>
                        		已退保
                        	<#elseif tradeDetailsPo.policySts == 40>
                        		已过期
                        	</#if>
                            </span>
                        </li>
                         <li class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">投保时间:</label>
                            <span class="ui-base-data ">
                           ${tradeRecordPo.tradeDate?if_exists?string('yyyy-MM-dd HH:mm:ss')}
                            </span>
                        </li>
                         <li class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">起保时间:</label>
                            <span class="ui-base-data">
                            ${tradeRecordPo.startTime?if_exists?string('yyyy-MM-dd HH:mm:ss')}
                            </span>
                        </li>
                         <li class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">终保时间:</label>
                            <span class="ui-base-data">
                           ${tradeRecordPo.endTime?if_exists?string('yyyy-MM-dd HH:mm:ss')}
                            </span>
                        </li>
                         <li class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">投保人:</label>
                            <span class="ui-base-data">
                            ${tradeRecordPo.policyholderName}
                            </span>
                        </li>
                        <li class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">被保险人:</label>
                            <span class="ui-base-data">
                            ${tradeDetailsPo.insuredName}
                            </span>
                             <#if tradeDetailsPo.insuredName?if_exists>
                        		<span class="ui-base-data ui-base-range-data"><a href="${base}/businessmanager/policy?insuredName=${tradeDetailsPo.insuredName}">该被保险人的其它保单</a></span>
                        	</#if>
                        </li>
                         <li class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">受益人:</label>
                            <span class="ui-base-data">
                              <#if tradeDetailsPo.benCounts == 0>
	                            		法定
	                        	<#else>
	                            	<#list tradeDetailsPo.benList as tradeBeneficiarysPo>
	                            		${tradeBeneficiarysPo.beneficiaryName}
	                            	</#list>
	                        	</#if>
                            </span>
                        </li>
                         <li class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">保费:</label>
                             <#if tradeDetailsPo.insurePremium?if_exists>
	                            <#assign insurePremiums=tradeDetailsPo.insurePremium/100>
                            <span class="ui-base-data">
                           		￥${insurePremiums?string(",##0.00#")}
                            </span>
                            </#if>
                        </li>
                         <li class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">份数:</label>
                            <span class="ui-base-data">
                            ${tradeDetailsPo.insureCount}
                            </span>
                        </li>
                         <li class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">总计:</label>
                            <#if tradeDetailsPo.sumPremium?if_exists>
	                            <#assign sumPremiums=tradeDetailsPo.sumPremium/100>
                            <span class="ui-base-data">
                            	￥${sumPremiums?string(",##0.00#")}
                            </span>
                             </#if>
                        </li>  
                </ul>
                <!--保单信息end-->
                <!--理赔信息start-->
                <h4 class="ui-info-tit">理赔信息</h4>
                <div class="ui-base-produceinfor">       
                        <div class="ui-base-colsinfor ui-base-colwidth-business">
                            <label class="ui-base-label ui-channel-base-label">理赔编号:</label>
                           <span class="ui-base-data">
                            ${claimRecordsPo.claimId}
                            <input type="hidden" id = "bizId" name="bizId" value="${claimRecordsPo.claimId}" />
                            <input type="hidden" id = "auditSts" name="auditSts" value="" />
                            </span>
                        </div>
                        <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">申请理赔时间:</label>
                            <span class="ui-base-data">
                              ${claimRecordsPo.createTimeStr}
                            </span>
                        </div>
                         <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">理赔状态:</label>
                            <span class="ui-base-data">
                             <#if claimRecordsPo.state == 10>
                            	理赔中
                            <#elseif claimRecordsPo.state == -10>
                        		理赔失败
                        	<#elseif claimRecordsPo.state == 20>
                        		理赔中
                        	<#elseif claimRecordsPo.state == 30>
                        		已理赔待打款
                        		<#elseif claimRecordsPo.state == 40>
                        		已理赔已打款
                        	<#elseif claimRecordsPo.state == -20>
                        		理赔失败
                        	</#if>
                            </span>
                        </div>
                           <#if claimRecordsPo.submitTimeStr?if_exists>
                         <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">再次提交时间:</label>
                            <span class="ui-base-data">
                            ${claimRecordsPo.submitTimeStr}
                            </span>
                        </div>
                        </#if>
                         <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">理赔申请材料:</label>
                           
                        </div>
                         <ul class="ui-base-colsinfor fn-clear" style="padding-left:7%;width:93%;" id="claimsMaterial">
                            <#list attachmentListPo as aitem>
                            <li class="verify-item">
                                <h4 class="verify-item-align">${aitem.typeName}${aitem.typeSubName}</h4>
                                <img src="${base}${aitem.patch}" class="client-imgpreview" height="119" width="210" alt="">
                                <span class="ui-base-policy verifygroup">
                                    <input type="radio"  disabled="true" name="data${aitem_index +1}"  <#if aitem.auditState ==1>checked </#if> class="reject-cannel audit-pass">审核通过
                                    <input type="radio"  disabled="true" name="data${aitem_index +1}"<#if aitem.auditState ==-1>checked </#if>   class="reject-cannel audit-nopass">审核不通过
                                    
                                     <input type="hidden" name="domainProductsMap['${aitem_index}'].typeId"   value='${aitem.typeId}'/>
                                      <input type="hidden" name="domainProductsMap['${aitem_index}'].subTypeId"    value='${aitem.subTypeId}'/>
                                    <input type="hidden" name="domainProductsMap['${aitem_index}'].auditSts" class="state" value=''/>
                                </span>
                                <#if aitem.auditState ==-1>
                                <select class=" ui-combobox calims-sele-text claims-reason"   disabled="true"   name="domainProductsMap['${aitem_index}'].comment">
                                  
                                   	<#if aitem.auditComment == 10><option>上传照片不清晰</option></#if>
						            <#if aitem.auditComment == 11><option>上传非要求照片</option></#if> 
						            <#if aitem.auditComment == 12><option>照片伪造作假</option><#else>
						            <option>其他，请说明</option>
						            </#if> 
                                </select>
                                </#if> 
                                 <#if aitem.auditState ==-1&&aitem.auditComment!=10&&aitem.auditComment!=11&&aitem.auditComment!=12>
                                <textarea name="domainProductsMap['${aitem_index}'].commentview"  disabled="true"  class=" calims-sele-text claims-explain" id="" cols="26" rows="6">${aitem.auditComment}</textarea>
                            </#if> 
                            </li>
                           
                             </#list>
                        </ul>
                    </div>
              <!--理赔信息end-->
              <!--审核记录start-->
              <div >
                <h4 class="ui-info-tit">审核记录</h4>
                 
                <div class="gecy-inst">
                     <table class="ui-inst-table">
                       <tr>
                           <th>审核阶段</th>
                           <th>审核结果</th>
                           <th>审核人</th>
                           <th>审核时间</th>
                       </tr>
                      <#list logPoList as item>
                       <tr>
                           <td><#if item.auditStep == 1>
		                	初审
		                </#if>
		                <#if item.auditStep == 2>
		                	一级复审
		                </#if></td>
                           <td> 
		                <#if item.auditSts == 20>
		                	审核通过
		                </#if>
		                 <#if item.auditSts == 30>
		                	审核通过
		                </#if>
		                  <#if item.auditSts == -10>
		                	审核不通过
		                </#if>
		                 <#if item.auditSts == -20>
		                	审核不通过
		                </#if>
		                </td>
                           <td>${item.auditNickname}</td>
                           <td>${item.auditTime1}</td>
                       </tr>
                        </#list>
                     </table>
                </div>
                 <#if claimRecordsPo.state == 30||claimRecordsPo.state == 40>
                <ul class="ui-base-produceinfor ui-base-policy">       
                        <li class="ui-base-colsinfor ui-base-colwidth-business">
                            <label class="ui-base-label ui-channel-base-label">折损比例:</label>
                            <span class="ui-base-data">
                             ${claimRecordsPo.lossRatio}%
                            </span>
                        </li>
                        <li class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                            <label class="ui-base-label ui-channel-base-label">折旧比例:</label>
                            <span class="ui-base-data">
                             ${claimRecordsPo.deprectionRatio}%
                            </span>
                            <label class="ui-base-label ui-channel-base-label">折旧天数:</label>
                            <span class="ui-base-data">
                           ${claimRecordsPo.betweenDay}天
                            </span>
                        </li>
                         <li class="ui-base-colsinfor ui-base-colwidth-business">
                            <label class="ui-base-label ui-channel-base-label">实际理赔金额:</label>
                            <span class="ui-base-data">
                           ${claimRecordsPo.sumAmount}元
                            </span>
                        </li>     
                        
                </ul>
                </#if>
                <!--审核记录end-->
            </div>
             <div class="ui-btn-double">
                <input type="button" value="返回" class="ui-btn-grey ui-back">
             </div> 
     </div>
    	</div>
          <div class="client-imgshow photoid-pos" id="imgbox-toggle">
		 <img src="" id="client-bigimg" width="300" height="300" />
		</div>
	</div>
<!--审核不通过原因-->
<div id="dlgReason" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
  <h3 class="ui-dlg-tit">请选择审核不通过原因！</h3>
  <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定"/>
</div>
<div id="dlgSucc" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
  <h3 class="ui-dlg-tit">审核已完成！</h3>
</div>
<div id="dlgNOPass" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
  <h3 class="ui-dlg-tit">您还有理赔照片未审核！</h3>
  <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定"/>
</div>
<script> 
$(function(){
    validExtend();
    //审核材料验证
    claimsMaterialCheck();
     showBigPic();
})


</script>

</body>
</html>