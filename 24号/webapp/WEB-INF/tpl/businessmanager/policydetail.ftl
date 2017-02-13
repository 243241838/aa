<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>订单明细</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/control.js"></script>
</head>

<body>
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
    <div class="ui-info-main ui-policy-detail">
         <div class="ui-informate">
         	<div class="ui-informate-base">
         		<h4 class="ui-base-tit">保单信息</h4>
           		<table class="ui-base-table">
                    <tr class="ui-base-rowbg ui-base-rowborder">
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label">保单号：</label>
                            <span class="ui-base-data ui-base-range-data">${tradeDetailsPo.policyNo}</span>
                        </td>
                        <td class="ui-base-colsinfor">
                            <label  class="ui-base-label ui-base-range-label">保单状态:</label>
                            <span  class="ui-base-data ui-base-range-data" >
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
                        </td>
                    </tr>
                    <tr class="ui-base-rowborder">
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label">投保时间:</label>
                            <span  class="ui-base-data ui-base-range-data">${tradeRecordPo.tradeDate?if_exists?string('yyyy-MM-dd HH:mm:ss')}</span>
                        </td>
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label">起保时间:</label>
                            <span  class="ui-base-data ui-base-range-data">${tradeRecordPo.startTime?if_exists?string('yyyy-MM-dd HH:mm:ss')}</span>
                        </td>
                    </tr>
                    <tr class="ui-base-rowbg ui-base-rowborder">
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label">终保时间:</label>
                            <span  class="ui-base-data ui-base-range-data">${tradeRecordPo.endTime?if_exists?string('yyyy-MM-dd HH:mm:ss')}</span>
                        </td>
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label">投保人:</label>
                            <span  class="ui-base-data ui-base-range-data">${tradeRecordPo.policyholderName}</span>
                        </td>
                    </tr>
                    <tr class="ui-base-rowborder">
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label">被保险人：</label>
                            <span class="ui-base-data ui-base-range-data">${tradeDetailsPo.insuredName}</span>
                            <#if tradeDetailsPo.insuredName?if_exists>
                        		<span class="ui-base-data ui-base-range-data"><a href="${base}/businessmanager/policy?insuredName=${tradeDetailsPo.insuredName}">该被保险人的其它保单</a></span>
                        	</#if>
                        </td>
                        <td class="ui-base-colsinfor">
                            <label  class="ui-base-label ui-base-range-label ui-detail-lablewd">被保险人手机号码:</label>
                            <span  class="ui-base-data ui-base-range-data" >
	                           ${tradeDetailsPo.mobile}
                        	</span>
                        </td>
                    </tr>
                    <tr class="ui-base-rowborder">
                    	<td class="ui-base-colsinfor">
                            <label  class="ui-base-label ui-base-range-label">受益人:</label>
                            <span  class="ui-base-data ui-base-range-data" >
	                            <#if tradeDetailsPo.benCounts == 0>
	                            		法定
	                        	<#else>
	                            	<#list tradeDetailsPo.benList as tradeBeneficiarysPo>
	                            		${tradeBeneficiarysPo.beneficiaryName}
	                            	</#list>
	                        	</#if>
                        	</span>
                        </td>
                        <td class="ui-base-colsinfor"></td>
                    </tr>
                    <tr class="ui-base-rowbg ui-base-rowborder">
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label">保费：</label> 
                            <#if tradeDetailsPo.insurePremium?if_exists>
	                            <#assign insurePremiums=tradeDetailsPo.insurePremium/100>
	                            <span class="ui-base-data ui-base-range-data">￥${insurePremiums?string(",##0.00#")}</span>
                        	</#if>
                        </td>
                        <td class="ui-base-colsinfor">
                            <label  class="ui-base-label ui-base-range-label">份数:</label>
                            <span  class="ui-base-data ui-base-range-data" >${tradeDetailsPo.insureCount}</span>
                        </td>
                    </tr>
                    <tr class="ui-base-rowborder">
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label">总计：</label>
                            <#if tradeDetailsPo.sumPremium?if_exists>
	                            <#assign sumPremiums=tradeDetailsPo.sumPremium/100>
	                            <span class="ui-base-data ui-base-range-data">￥${sumPremiums?string(",##0.00#")}</span>
                        	</#if>
                        </td>
                        <td class="ui-base-colsinfor">
                        </td>
                    </tr>

                    <tr class="ui-base-rowborder">
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label ui-detail-lablewd">是否申请发票：</label>
                            <span class="ui-base-data ui-base-range-data">${tradeDetailsPo.receiptSts}
                                <#if tradeDetailsPo.receiptSts == 0>
                                    否
                                <#elseif tradeDetailsPo.receiptSts == 1>
                                    是
                                <#elseif tradeDetailsPo.receiptSts == -1>
                                    申请拒绝
                                <#elseif tradeDetailsPo.receiptSts == 10>
                                    发票已提供
                                </#if>
                            </span>
                        </td>
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label ui-detail-lablewd">发票邮寄地址：</label>
                            <span class="ui-base-data ui-base-range-data">${tradeDetailsPo.shippingAddress}</span>
                        </td>
                    </tr>

                    <tr class="ui-base-rowbg ui-base-rowborder policy-hide">
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label">退保时间：</label>
                            <span class="ui-base-data ui-base-range-data">
                            <#if tradeDetailsPo.refundTime?if_exists>
                            	${tradeDetailsPo.refundTime?string('yyyy-MM-dd HH:mm:ss')}
                            </#if>
                            </span>
                        </td>
                        <td class="ui-base-colsinfor">
                        <label class="ui-base-label ui-base-range-label">退款金额：</label>
                        <#if tradeDetailsPo.refundAmount?if_exists>
                            <#assign refundAmounts=tradeDetailsPo.refundAmount/100>
                            <span class="ui-base-data ui-base-range-data">￥${refundAmounts?string(",##0.00#")}</span>
                        </#if>
                        </td>
                    </tr>
                    <tr class="ui-base-rowborder policy-hide">
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label">退款机构:</label>
                            <span class="ui-base-data ui-base-range-data">
                              <#list tradePaymentsPoList as tradePaymentsPo>
                            		${tradePaymentsPo.refundOrganization}
                            	</#list>
                            </span>
                        </td>
                        <td class="ui-base-colsinfor">
                            <label class="ui-base-label ui-base-range-label">退款卡号:</label>
                            <span class="ui-base-data ui-base-range-data">
                            	<#list tradePaymentsPoList as tradePaymentsPo>
                            		${tradePaymentsPo.refundAccount}
                            	</#list>
                            </span>
                        </td>
                    </tr>
                    <#if tradeDetailsPo.policyUrl?if_exists>
                        <tr class="ui-base-rowborder policy-hide">
                            <td class="ui-base-colsinfor">
                                <span class="ui-base-data ui-base-range-data">
                                    <a href="${tradeDetailsPo.policyUrl}" class="ui-a-return" >点击下载该电子保单</a>
                                </span>
                            </td>
                            <td class="ui-base-colsinfor">
                            </td>
                        </tr>
                    </#if>
                </table>

                <!-- 产品信息开始 -->
                <div class="ui-base-produceinfor">
                    <h2 class="ui-info-tit">产品基本信息</h2>
                    <ul class="ui-info-list ui-info-newlist">
                        <li class="ui-info-item">
                            <label class="ui-info-lbl">产品ID</label>
                            <a href="${base}/product/toProductDetailMsg?productId=${productId}">
                            ${productId}
                            </a>
                        </li>
                        <li class="ui-info-item">
                            <label class="ui-info-lbl">保险名称</label>
                        ${product.productName}
                        </li>
                        <li class="ui-info-item ui-info-item-grey">
                            <label class="ui-info-lbl">保险类别</label>
                        <#list parentClassList as item>
                            <#if product.classId == item.classId>
                            ${item.className}
                            </#if>
                        </#list>
                        <#--
                        <select class="ui-info-sel" id="childSel" name="classId" onchange="findVal(this);">
                            <option>请选择</option>
                        </select>
                     -->
                        </li>
                        <li class="ui-info-item">
                            <label class="ui-info-lbl">承保公司</label>
                            <!--必填的样式<select class="easyui-combobox ui-info-sel" required="true" validtype="selectRequired">-->
                        <#list iList as item>
                            <#if product.insurerId == item.insurerId>
                            ${item.insurerName}
                            </#if>
                        </#list>
                            <!--<select class="easyui-combobox ui-info-sel" name="insurerId" validtype="selectRequired" id="insureVal">
		           			<option>请选择</option>
		                    <#list iList as item>
			                      <option value="${item.insurerId}">${item.insurerName}</option>
			                </#list>
		           	  </select>
		           	  <input type="hidden" name="insurerName" />-->
                        </li>
                        <li class="ui-info-item ui-relative">
                            <label class="ui-info-lbl">产品配图</label>
                            <img src="${base}${product.productLogo}" width="120" height="120" data-leve='produce' id='produceImg1'/>
                        </li>
                        <li class="ui-info-item ui-info-item-grey" id="aa" >
                            <label class="ui-info-lbl">当前库存</label>
                            &nbsp;0 份
                            <label class="ui-info-lbl ui-info-lblsmall">分配数量</label>
                        <#if product.maxQuantity lte -1>
                            不限
                        <#else>
                        ${product.maxQuantity}
                        </#if>

                            <label class="ui-info-lbl ui-info-lblsmall">总库存</label>
	           		<span id="totalNum">
                    <#if product.maxQuantity == -1>
                        不限
                    <#elseif product.maxQuantity gte 0>
                    ${product.maxQuantity}份
                    <#else>
                        0份
                    </#if>
	           		</span>
                        </li>
                        <li class="ui-info-item">
                            <label class="ui-info-lbl ui-info-small">产品有效期</label>
	              <span data-qb="qb">
                  <#if product.longTime == 1>
                      长期
                  <#else>
                  ${product.effTimeStr} 至 ${product.expTimeStr}
                  </#if>
	              </span>
                        </li>
                        <li class="ui-info-item">
                            <label class="ui-info-lbl">承保年龄</label>
                        <#if product.ageStr == 1>
                            不限
                        <#else>
                            <#if product.minAge == product.maxAge>
                            ${product.maxAge} 岁
                            <#else>
                            ${product.minAge} - ${product.maxAge} 岁
                            </#if>
                        </#if>
                        <#--
                           <label class="ui-info-lbl ui-info-lblw">保险经纪人</label>
                           <input name="productAgent" type="text" value="" class="easyui-validatebox ui-info-input"
                          data-options="required:true,validType:['letchi','length[1,10]']" missingMessage="请输入保险经纪人"/>
                          -->
                        </li>
                        <li class="ui-info-item ui-info-item-grey">
                            <label class="ui-info-lbl">最高职业类别</label>
                        <#if product.occupationClass == 9>
                            不限
                        <#elseif product.occupationClass == 7>
                            特别费率
                        <#else>
                        ${product.occupationClass}
                        </#if>
                        </li>
                        <li class="ui-info-item">
                            <label class="ui-info-lbl">适用人群</label>
                        ${product.suitablePeople}
                        </li>
                        <li class="ui-info-item">
                            <label class="ui-info-lbl">产品亮点</label>
                        ${product.perferWords}
                        </li>
                        <li class="ui-info-item ui-relative ui-rich-wrap">
                            <label class="ui-info-lbl">保险条款</label>
	           		<span class="ui-article-text prod-edit-item-bef" style="width:84%;" >
                    <#if product.productsMap?if_exists>
                        <#list product.productsMap?values as item>
                            <a href="${item.insuranceTerms3}"><span class="ui-channel-phonemargin">${item.insuranceTerms}</span></a>
                        </#list>
                    </#if>
					</span>
                        </li>
                        <li class="ui-info-item ui-info-item-grey ui-rich-wrap">
                            <label class="ui-info-lbl">投保须知</label>
	           		<span class="ui-article-text prod-edit-item-bef" style="width:84%;" >
                    ${product.productStatement}
	           		</span>
                        </li>
                        <li class="ui-info-item ui-rich-wrap">
                            <label class="ui-info-lbl">理赔指南</label>
	           		<span class="ui-article-text prod-edit-item-bef" style="width:84%;">
                    ${product.claimsGuide}
					</span>
                        </li>
                        <li class="ui-info-item ui-info-item-grey ui-rich-wrap" >
                            <label class="ui-info-lbl">温馨提示</label>
					<span class="ui-article-text prod-edit-item-bef" style="width:84%;">
                    ${product.productPrompt}
					</span>
                        </li>
                        <li class="ui-info-item">
                            <label class="ui-info-lbl ui-info-small">生效方式</label>
                <span>
                <#if product.effectType==1>
                    及时生效
                <#elseif product.effectType==2>
                    次日生效
                <#elseif product.effectType==3>
                    延迟生效 &nbsp; ${product.effectDay}天
                </#if>
                </span>
                        </li>
                        <li class="ui-info-item  ui-info-item-grey">
                            <label class="ui-info-lbl ui-info-small">支持电子保单</label>
                <span>
                <#if product.policyType == 1 || product.policyType == "">
                    是
                <#else>
                    否
                </#if>
                </span>
                        </li>
                        <li class="ui-info-item electore-policy" <#if product.policyType == 0 >style="display:none"</#if> >
                            <label class="ui-info-lbl ui-info-small">请选择保单样式</label>
	                <span>
                    <#if product.policyTemplate?if_exists>
                        <#list epolicyList?if_exists as item>
                            <#if product.policyTemplate == item.value>${item.key}</#if>
                        </#list>
                    <#else>
                        无
                    </#if>
	                </span>
                        </li>
                        <li class="ui-info-item  ui-info-item-grey electore-policy" <#if product.policyType == 0 >style="display:none"</#if> >
                            <label class="ui-info-lbl ui-info-small">是否平台生成电子保单</label>
                <span>
                <#if product.supportPolicy == 1>
                    是
                <#elseif  product.supportPolicy == 0 || product.supportPolicy == "">
                    否
                </#if>
                </span>
                        </li>
                        <li class="ui-info-item">
                            <label class="ui-info-lbl ui-info-small">是否支持退保</label>
                <span>
                <#if product.refundFlag == 2>
                    支持
                <#elseif product.refundFlag == 0>
                    不支持
                <#elseif product.refundFlag == 1>
                    仅支持生效前退保
                </#if>
                </span>
                        </li>
                        <li class="ui-info-item  ui-info-item-grey">
                            <label class="ui-info-lbl ui-info-small">最多投保份数</label>
                        <#if product.buyQuota == 0>
                            不限
                        <#else>
                        ${product.buyQuota}
                        </#if>
                        </li>
                        <li class="ui-info-item">
                            <label class="ui-info-lbl ui-info-small">受益人自定义</label>
                <span>
                <#if product.beneficiaryNumStr == 1>
                    是
                <#elseif product.beneficiaryNumStr == 0 || product.beneficiaryNumStr == "">
                    否
                </#if>
                </span>
                        </li>
                        <li class="ui-info-item <#if product.beneficiaryNumStr == 0 || product.beneficiaryNumStr == "">fn-hide</#if> more-bendficiarie">
                            <label class="ui-info-lbl ui-info-small">最多受益人数</label>
                <span>
                  ${product.beneficiaryNum} 人
                </span>
                        </li>
                        <li class="ui-info-item ui-info-item-grey">
                            <label class="ui-info-lbl ui-info-small">是否需要激活</label>
                <span>
                <#if product.activation == 1>
                    是
                <#elseif product.activation == 0 || product.activation == "">
                    否
                </#if>
                </span>
                        </li>
                        <li class="ui-info-item <#if product.activation == 0 || product.activation == "">fn-hide</#if> active-audit" >
                            <label class="ui-info-lbl ui-info-small">激活后是否需要审核</label>
                <span>
                <#if product.auditFlag == 1>
                    是
                <#elseif product.auditFlag == 0 || product.auditFlag == "">
                    否
                </#if>
                </span>
                        </li>
                        <li class="ui-info-item ui-info-item-grey">
                            <label class="ui-info-lbl ui-info-small">是否支持在线理赔</label>
                <span>
                <#if product.claimOnline == 1>
                    是
                <#elseif product.claimOnline == 0 || product.claimOnline == "">
                    否
                </#if>
                </span>
                        </li>
                        <li class="ui-info-item">
                            <label class="ui-info-lbl ui-info-small">是否为统保产品</label>
                <span>
                <#if product.isTotalProduct == 1>
                    是
                <#elseif product.isTotalProduct == 0 || product.isTotalProduct == "">
                    否
                </#if>
                </span>
                        </li>
                        <li class="ui-info-item ui-info-item-grey cmu-produce" <#if product.isTotalProduct == 0 || product.isTotalProduct == "">style="display: none;"</#if> >
                            <label class="ui-info-lbl">投保人姓名</label>
                        ${user.realName}
                        </li>
                        <li class="ui-info-item cmu-produce" <#if product.isTotalProduct == 0 || product.isTotalProduct == "">style="display: none;"</#if> >
                            <label class="ui-info-lbl">投保人电话</label>
                        ${user.mobile}
                        </li>
                    </ul>
                </div>
                <div class="ui-info-main">
                    <h2 class="ui-info-tit">产品保障信息</h2>
                    <ul class="ui-info-list">
                        <!--保障期限start-->
                        <li class="ui-info-item ui-info-item-grey ui-resureLimit-wrap fn-clear" style="padding-left:36px;">
                            <label class="ui-info-lbl">保障期限</label>
                        </li>
                        <li class="ui-info-item ui-info-item-grey ui-resureLimit-wrap fn-clear" >
                        <#if perDateStr?if_exists>
                            <div class="produce-newdates">
                                <#list perDateStr as item>
                                    <span>
                                    ${item}
        					</span>
                                </#list>
                            </div>
                        </#if>
                        </li>
                    </ul>
                    <!--保障期限end-->
                    <!--保障利益start-->
                    <ul class="ui-info-list">
                        <li class="ui-info-item ui-info-item-grey ui-guarant-item" id="guarantList1" style="padding-left:36px;">
                            <label class="ui-info-lbl">保障利益</label>

                            <div class="ui-guarant-wrap" <#if !benPoList?if_exists> style="display:none;" </#if> >
                                <ul class="ui-guarant-list">
                                    <li>
                                        <span class="ui-gone">保障利益标题</span>
                                        <span class="ui-gtwo">是否必选</span>
                                        <span class="ui-gthree">是否有前置条件</span>
                                    </li>
                                <#if benPoList?if_exists>
                                    <#list benPoList as item>
                                        <li>
                                            <div class="ui-guarant-tit">
                                                <a href="javascript:;" onclick="toggleSub(this);" class="ui-gone">
                                                    <strong>${item.benefitName}</strong>
                                                    <i class="ui-icon-arrow"></i>
                                                </a>
                                                <span class="ui-gtwo"></span>
                                                <span class="ui-gthree"></span>
                                            </div>
                                            <#list item.benefitsPoList as benItem>
                                                <table class="ui-guarant-tab" width="100%">
                                                    <tbody>
                                                    <tr class="ui-tab-last">
                                                        <td width="30%" class="ui-td-fir">
                                                            <span>${benItem.benefitName1}</span>
                                                        </td>
                                                        <td width="35%">
                                                            <#if benItem.isRequired == 1>
                                                                是
                                                            <#elseif benItem.isRequired == 0>
                                                                否
                                                            </#if>
                                                        </td>
                                                        <td width="30%">
                                                            <#if benItem.condition == 1>
                                                                是
                                                            <#elseif benItem.condition == 0>
                                                                否
                                                            </#if>
                                                        </td>
                                                    </tr>
                                                        <#if benItem.condition == 1>
                                                        <tr class="ui-resureLimit-inner" style="display: table-row;">
                                                            <td colspan="3" style="padding:10px 0;">
                                                                <ul class="preadd-conditelist">
                                                                    <#list benItem.benefitList as fitItem>
                                                                        <li>
                                                                            <label for="" style="margin:0 22px;">购买</label>
                                                                            <#list benPoList as benPoItem>
                                                                                <#list benPoItem.benefitsPoList as fitsList>
                                                                                    <#if fitsList.benefitId1 != benItem.benefitId1>
                                                                                        <#if fitItem.preCondition == fitsList.benefitId1 >
                                                                                            <strong>${fitsList.benefitName1}</strong>
                                                                                        <#elseif fitItem.preCondition == 0>
                                                                                            <strong>任意保障项目</strong>
                                                                                        </#if>
                                                                                    </#if>
                                                                                </#list>
                                                                            </#list>
                                                                            </select>
                                                                        ${fitItem.minCondition}份
                                                                        </li>
                                                                    </#list>
                                                                    <li>
                                                                        <label for="" style="margin:0 22px;">可购买</label>
                                                                    ${benItem.conditionQuota}份
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        </#if>
                                                    </tbody>
                                                </table>
                                            </#list>
                                        </li>
                                    </#list>
                                </#if>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <!--保障利益end-->
                    <div>
                        <ul class="ui-info-list" >
                        <#if benfitPoList?if_exists>
                            <li class="ui-info-item ui-info-item-grey ui-guarant-item ui-resureLimit-wrap fn-clear" style="padding-left:36px;">
                                <div class="ui-guarant-wrap" style="width:100%;overflow:auto;">
                                    <div id="configBoxDetail">
                                        <ul class="ui-guarant-list" style="width:100%;">
                                            <li>
                                                <span class="config-tit-one" style="margin:0 12px 0 0;">保障利益标题</span>
                                                <span class="config-tit-two produce-detailshow">保障价格</span>
                                                <span class="config-tit-three" style="width:120px;margin-right:180px;">保障次/天数</span>
                                                <#if perDateStr?if_exists>
                                                    <#list perDateStr as item>
                                                        <span class="config-tit-four produce-detailshow">
                                                        ${item}
	            					</span>
                                                    </#list>
                                                </#if>
                                            </li>
                                        </ul>
                                        <!--start-->
                                        <ul>
                                            <#list benfitPoList as item>
                                                <#list item.priceList as priceItem>
                                                    <li class="ui-info-item ui-info-item-grey ui-resureLimit-wrap produce-newconfig fn-clear">
                                                        <label class="ui-info-lbl produece-align proconfig-txt">${item.benefitName}</label>
                                                        <div class="ui-resureLimit-inner ui-resureLimit-fir" data-index="0" style="text-align:center;">
                                                            <#if priceItem.insuredAmount?number/1000000 gte 1>
                                                                <#assign proPrice = (priceItem.insuredAmount/1000000)?string('0.##')>
                                                                <#assign proPriceType = 3>
                                                            <#elseif priceItem.insuredAmount?number/100000 gte 1>
                                                                <#assign proPrice = (priceItem.insuredAmount/100000)?string('0.##')>
                                                                <#assign proPriceType = 2>
                                                            <#else>
                                                                <#assign proPrice = (priceItem.insuredAmount/100)?string('0.##')>
                                                                <#assign proPriceType = 1>
                                                            </#if>

                                                            <#assign inputKey = priceItem.priceId>
                                                            <span class="produce-detailshow">
			      								${proPrice}<#if proPriceType == 1>元<#elseif proPriceType == 2>千元<#elseif proPriceType == 3>万元</#if>
			      							</span>
                                                            <#if priceItem.insuredUnit?if_exists>
                                                                <#list priceItem.insuredUnit?split(" ") as unitItem>
                                                                    <#if unitItem_index == 0>
                                                                        <#assign insuredUnitVal = unitItem>
                                                                    </#if>
                                                                    <#if unitItem_index == 1>
                                                                        <#assign insuredUnitType = unitItem>
                                                                    </#if>
                                                                </#list>
                                                            </#if>
									        <span class="produce-detailshow" style="width:120px;margin-right:74px;">
								            ${insuredUnitVal}<#if insuredUnitType=="次">次<#elseif insuredUnitType=="天">天</#if>
								            </span>
                                                            <label class="ui-info-lbl ui-info-lblw proconfig-premium">保费:</label>
                                                            <!--<a class="ui-guarant-reduce" href="javascript:;"></a>-->
                                                            <#list item.benPriceList as price>
                                                                <span class="fn-hide">0</span>
						      					<span class="produce-detailshow">
									            ${(price.productPremium/100)?string('0.##')} 元
									            </span>
                                                            </#list>
                                                        </div>
                                                    </li>
                                                </#list>
                                            </#list>
                                        </ul>
                                        <!--end-->
                                    </div>
                                </div>
                            </li>
                        </#if>
                        </ul>
                    </div>
                </div>
                <!-- 产品信息结束 -->

                <h4 class="ui-base-tit">订单信息</h4>
                <div class="ui-base-produceinfor">
                    <div class="ui-base-rowbg ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label ui-base-colwidth-business-label">用户ID：</label>
                        <span class="ui-base-data ui-base-colwidth-business-data">
                        <a class="detail-link" href="${base}/user/toAccountDetailMsg?userId=${tradeRecordPo.userId}">
                        	${tradeRecordPo.userId}
                        </a>
                        </span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label ui-base-colwidth-business-label">订单号:</label>
                        <span class="ui-base-data ui-base-colwidth-business-data">
                        	${tradeRecordPo.tradeId}
                        </span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label ui-base-colwidth-business-label">投保人姓名:</label>
                        <span class="ui-base-data ui-base-colwidth-business-data">
                        	${tradeRecordPo.policyholderName}
                        </span>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label ui-base-colwidth-business-label ui-detail-lablewd">投保人手机号码:</label>
                        <span class="ui-base-data ui-base-colwidth-business-data">
                        	${tradeRecordPo.mobile}
                        </span>
                    </div>
                    <div class="ui-base-produceinfor-toggle inforToggle">
                        <div class="ui-base-rowbg ui-base-colsinfor ui-base-colwidth-business">
                            <label class="ui-base-label ui-base-colwidth-business-label">订单状态:</label>
                            <span class="ui-base-data ui-base-colwidth-business-data">
                                <#if tradeRecordPo.tradeSts == 10>
										待支付
								<#elseif tradeRecordPo.tradeSts == 18>
										已支付待激活
							    <#elseif tradeRecordPo.tradeSts == 20>
										已支付待发货
								<#elseif tradeRecordPo.tradeSts == 25>
										已激活待审核
								<#elseif tradeRecordPo.tradeSts == 30>
										发货中
								<#elseif tradeRecordPo.tradeSts == -30>
										发货失败				
								<#elseif tradeRecordPo.tradeSts == 35>
										已发货
								<#elseif tradeRecordPo.tradeSts == 50>
										已退款
								<#elseif tradeRecordPo.tradeSts == -11>
										已失效
								<#elseif tradeRecordPo.tradeSts == -12>
										已关闭
								<#elseif tradeRecordPo.tradeSts == -13>
										已删除
	                            </#if>
	                       </span>
                        </div> 
                        <div class="ui-base-colsinfor ui-base-colwidth-business">
                            <label class="ui-base-label ui-base-colwidth-business-label">投保时间:</label>
                            <span class="ui-base-data ui-base-colwidth-business-data">${tradeRecordPo.tradeDate?if_exists?string('yyyy-MM-dd HH:mm:ss')}</span>
                        </div> 
                        <div class="ui-base-rowbg ui-base-colsinfor ui-base-colwidth-business">
                            <label class="ui-base-label ui-base-colwidth-business-label">投保份数:</label>
                            <span class="ui-base-data ui-base-colwidth-business-data">${tradeDetailsPo.insureCount}</span>
                        </div> 
                        <div class="ui-base-colsinfor ui-base-colwidth-business">
                            <label class="ui-base-label ui-base-colwidth-business-label">交易总额:</label>
                            <#if tradeRecordPo.payAmount?if_exists>
	                            <#assign payAmount=tradeRecordPo.payAmount/100>
	                            <span class="ui-base-data ui-base-colwidth-business-data">￥${payAmount?string(",##0.00#")}</span>
                            </#if>
                        </div> 
                        <div class="ui-base-rowbg ui-base-colsinfor ui-base-colwidth-business">
                            <label class="ui-base-label ui-base-colwidth-business-label">分销渠道:</label>
                            <span class="ui-base-data ui-base-colwidth-business-data">${domainPo.domainName}</span>
                        </div> 
                        <div class="ui-base-colsinfor ui-base-colwidth-business">
                            <label class="ui-base-label ui-base-colwidth-business-label">支付时间:</label>
                            <span class="ui-base-data ui-base-colwidth-business-data">
                            	<#list tradePaymentsPoList as tradePaymentsPo>
                            		${tradePaymentsPo.payTime?if_exists?string('yyyy-MM-dd HH:mm:ss')}
                            	</#list>
                            </span>
                        <div class="ui-base-rowbg ui-base-colsinfor ui-base-colwidth-business">
                            <label class="ui-base-label ui-base-colwidth-business-label">支付渠道:</label>
                            <span class="ui-base-data ui-base-colwidth-business-data">
                                <#list paymentsPoList as paymentsPo>
	                            	${paymentsPo.paymentName}
	                            </#list>
	                        </span>
                        </div> 
                        <div class="ui-base-colsinfor ui-base-colwidth-business">
                            <label class="ui-base-label ui-base-colwidth-business-label">手续费:</label>
                            <span class="ui-base-data ui-base-colwidth-business-data">
                            	<#assign payCounts=0>
                            	<#list tradePaymentsPoList as tradePaymentsPo>
                            		<#if tradePaymentsPo.payCommission?if_exists>
	                            		<#assign payCounts=tradePaymentsPo.payCommission + payCounts>
	                            		<#assign payCounts=payCounts/100>
                            		</#if>
                            	</#list>
                            	￥${payCounts?string(",##0.00#")}
                            </span>
                        </div>
                        <div class="ui-base-rowbg ui-base-colsinfor ui-base-colwidth-business surrender-hide">
                            <label class="ui-base-label ui-base-colwidth-business-label">退款时间:</label>
                            <span class="ui-base-data ui-base-colwidth-business-data">
                                <#list tradePaymentsPoList as tradePaymentsPo>
                                	<#if tradePaymentsPo.refundTime?if_exists>
                            		${tradePaymentsPo.refundTime?string('yyyy-MM-dd HH:mm:ss')}
                            		</#if>
                            	</#list>
                            </span>
                        </div>
                         <div class="ui-base-rowbg ui-base-colsinfor ui-base-colwidth-business surrender-hide">
                            <label class="ui-base-label ui-base-colwidth-business-label">退款金额:</label>
                            <span class="ui-base-data ui-base-colwidth-business-data">
                              <#list tradePaymentsPoList as tradePaymentsPo>
                              		<#if tradePaymentsPo.refundAmount?if_exists>
	                            		<#assign refundAmount=tradePaymentsPo.refundAmount/100>
	                            		￥${refundAmount?string(",##0.00#")}
                            		</#if>
                            	</#list>
                            </span>
                        </div>
                         <div class="ui-base-colsinfor ui-base-colwidth-business surrender-hide">
                            <label class="ui-base-label ui-base-colwidth-business-label">退款机构:</label>
                            <span class="ui-base-data ui-base-colwidth-business-data">
                            	<#list tradePaymentsPoList as tradePaymentsPo>
                            		${tradePaymentsPo.refundOrganization}
                            	</#list>
                            </span>
                        </div>
                         <div class="ui-base-rowbg ui-base-colsinfor ui-base-colwidth-business surrender-hide">
                            <label class="ui-base-label ui-base-colwidth-business-label">退款卡号:</label>
                            <span class="ui-base-data ui-base-colwidth-business-data">
                            	<#list tradePaymentsPoList as tradePaymentsPo>
                            		${tradePaymentsPo.refundAccount}
                            	</#list>
                            </span>
                        </div>
                    </div>
                    </div>
                    <div class="ui-base-producetoggle">
                          <span class="ui-order-updown"></span>
                    </div>
                </div>	
         	</div>
    	</div>
    	<div class="ui-infor-box-bottom">
    		<a href="javascript:history.back();" class="ui-a-return" >返回</a>
    	</div>
    	
	</div>
	<script>
	$(function(){


        //信息隐藏展开
        $(".ui-base-producetoggle").click(function(){
            $(this).parents(".ui-base-produceinfor").find(".inforToggle").toggle();
            $(this).find(".ui-order-updown").toggleClass("ui-icon-toggle");
        })

        //订单信息，退保显示两条信息
        <#if tradeRecordPo.tradeSts == 50>
             $(".surrender-hide").show();
       </#if>
            
       
       //保单信息，退保显示四条信息
       <#list tradeDetailsPoList as tradeDetailsPo>
       <#if tradeDetailsPo.policySts == 30>
             $(".policy-hide").show();
       </#if>
       </#list>

    })
	
	</script>
</body>
</html>