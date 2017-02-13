<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-红包管理-新增</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/kindeditor/kindeditor.js"></script>
	<script type="text/javascript" src="${base}/resource/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.form.js"></script>
</head>
<body>
<div id="produce-add">
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
    <div id="searchForm">
      <div class="ui-info-main">
        <h2 class="ui-info-tit">产品信息</h2>
         <ul class="ui-info-list">
           	<li class="ui-info-item">
           		<label class="ui-info-lbl">红包规则名称:</label>
           		${rules.ruleName}
           	</li>
           	<li class="ui-info-item ui-info-item-grey">
           		<label class="ui-info-lbl">红包性质:</label>
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
	            <li class="ui-info-item ui-info-item-grey">
	              <label class="ui-info-lbl redrule-item-label"></label>
	              <!--关联产品数据填充-->
	               <div id="relateBox2"></div>
	            </li>
	            <#if rules.ruleScopeStr == 1 >
		            <li class="ui-info-item ui-info-item-grey">
		              <label class="ui-info-lbl redrule-item-label">采用模式:</label>
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
		              <label class="ui-info-lbl redrule-item-label">采用模式:</label>
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
			              <label class="ui-info-lbl redrule-item-label">营销费用/订单金额</label>
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
	            <li class="ui-info-item ui-info-item-grey fn-clear">
	                <div class="ui-resureLimit-fir">
		          	  <label class="ui-info-lbl redrule-item-label" style="vertical-align: top;" >单个红包金额：</label>
	                  <!--<a class="ui-guarant-reduce" href="javascript:;"></a>-->
		              <span>
		                  <#if configs??>
							  <#list configs as item>
					              	  ${item.minAmountStr} 元
						              <#if item.minAmountStr!=item.maxAmountStr&&item.maxAmountStr!=''>至  ${item.maxAmountStr} 元</#if>
						  			  <label class="ui-info-lbl ui-info-lblw">发放比例：</label>
						  			  ${item.sendPercent} %
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
		              <#if rules.triggerAmount == 0>
							无限制
		              <#else>
		                	${rules.triggerAmountStr} 元
		              </#if>
	            </li>
	        </#if>
            <li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label">红包总数量:</label>
              	<#if rules.bonusLimit == 0>
					无限制
                <#else>
                	${rules.bonusLimit}个
                </#if>
            </li>
           	<li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label">红包发放时间：</label>
              <span data-qb="qb">
             	${rules.effTimeStr}
                 <em>至</em>
                ${rules.expTimeStr} 
              </span>
            </li>
           	<li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label">红包祝福语:</label>
              ${rules.bonusWishing}
            </li>
            <li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label">红包备注信息:</label>
              ${rules.bonusRemark}
            </li>
			       <li class="ui-info-item">
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
            <li class="ui-info-item">
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
          <li class="ui-info-item">
                <label class="ui-info-lbl redrule-item-label">失败是否补发:</label>
                <#if rules.autoResend == -1>
                	否
                <#else>
                	是&nbsp;&nbsp;${rules.autoResend} 次
                </#if>
            </li>
            <#if  rules.ruleScopeStr == 2>
	            <li class="ui-info-item">
	                <label class="ui-info-lbl redrule-item-label">是否采用奖金池模式:</label>
	                <#if rules.poolId == 0>
	                	否
	                <#else>
	                	是
	                </#if>
	            </li>
	            <#if rules.poolId != 0>
		            <li class="ui-info-item">
		                <label class="ui-info-lbl redrule-item-label">奖金池初始金额:</label>
		                ${pools.bonusPoolStr} 元 
		            </li>
		            <li class="ui-info-item">
		                <label class="ui-info-lbl redrule-item-label">奖金池最低剩余金额/奖金池总金额:</label>
		                ${pools.maxTakeoutStr} %  
		            </li>
		        </#if>
	        </#if>
          </ul>
    	</div>
      <div class="ui-btn-double">
        <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
        <input type="button" value="编辑" class="ui-btn-blue" id="configEditorPage"/>
      </div>
      </div>
    <form class="fn-hide" id="infoForm" method="post" action="" >
      <div class="ui-info-main">
        <h2 class="ui-info-tit">产品信息</h2>
         <ul class="ui-info-list">
           	<li class="ui-info-item">
           		<label class="ui-info-lbl redrule-item-label redrule-item-label">红包性质:</label>
           		<#-- onfocus="this.defaultIndex=this.selectedIndex;" onchange="this.selectedIndex=this.defaultIndex;"   -->
				<select class="ui-info-sel" name="" disabled="disabled">
           			<option value="0" <#if rules.ruleScopeStr == 0>selected = "selected"</#if> >非订单类固定金额</option>
           			<option value="1" <#if rules.ruleScopeStr == 1>selected = "selected"</#if> >订单类固定金额</option>
           			<option value="2" <#if rules.ruleScopeStr == 2>selected = "selected"</#if> >订单类随机金额</option>
				</select>
				<input type="hidden" name="ruleId" value="${rules.ruleId}" />
				<input type="hidden" name="ruleName" value="${rules.ruleName}" />
				<input type="hidden" name="ruleScopeStr" value="${rules.ruleScopeStr}" />
           	</li>
           	<#if rules.ruleScopeStr == 1 || rules.ruleScopeStr == 2>
           	
	            <li class="ui-info-item ui-info-item-grey">
	              <label class="ui-info-lbl redrule-item-label redrule-item-label"></label>
	              <input type="button" value="重新选择" class="ui-btn-blue redrule-selepage"  id="relateProduce"/>
                  <!--关联产品数据填充-->
                  <div id="relateBox"></div>
	            </li>
	            <#if rules.ruleScopeStr == 1 >
		            <li class="ui-info-item ui-info-item-grey">
		              <label class="ui-info-lbl redrule-item-label redrule-item-label">采用模式:</label>
					  <select class="ui-info-sel" name="" disabled="disabled" >
		              		<option value="1" <#if rules.bonusType2 == 1>selected = "selected"</#if> >固定数值</option>
		             		<option value="2" <#if rules.bonusType2 == 2>selected = "selected"</#if> >按订单比例</option>
					  </select>
					  <input type="hidden" name="bonusType2" value="${rules.bonusType2}" />
		            </li>
		        <#elseif rules.ruleScopeStr == 2>
		            <li class="ui-info-item ui-info-item-grey">
		              <label class="ui-info-lbl redrule-item-label redrule-item-label">采用模式:</label>
		              <select class="ui-info-sel" name="" disabled="disabled">
		              		<option value="1" <#if rules.bonusType3 == 1>selected = "selected"</#if> >订单比例模式</option>
		             		<option value="2" <#if rules.bonusType3 == 2>selected = "selected"</#if> >指定最大金额</option>
					  </select>
					  <input type="hidden" name="bonusType3" value="${rules.bonusType3}" />
		            </li>
		        </#if>
	            <#if  rules.ruleScopeStr == 2>
	            	<#if rules.bonusType3 == 1>
			            <li class="ui-info-item">
			              <label class="ui-info-lbl redrule-item-label">营销费用/订单金额:</label>
              			  <input name="bonusAmountStr" type="text" class="easyui-validatebox ui-info-input decimal-pointtwo"
              				data-options="required:true,validType:'integerParent'" missingMessage="请输入" 
              				value="${rules.bonusAmountStr}" onkeyup="clearNoNumPoint(this);" /> %
			            </li>
		            <#elseif rules.bonusType3 == 2>
			            <li class="ui-info-item">
			              <label class="ui-info-lbl redrule-item-label">营销费用最大金额:</label>
			              <input name="maxValueStr" type="text" class="easyui-validatebox ui-info-input decimal-pointtwo" 
              				data-options="required:true,validType:'integerMoney'" value="${rules.maxValueStr}"/> 元
			            </li>
			         <#else>
			         	
			         </#if>
	            </#if>
            </#if>
            <#if rules.ruleScopeStr == 0 || rules.ruleScopeStr == 1>  
            	<#if rules.bonusType2 == 2>
            		<li class="ui-info-item">
		              <label class="ui-info-lbl redrule-item-label">单个红包金额/订单总金额:</label>
		              <input name="bonusAmountStr" type="text" class="easyui-validatebox ui-info-input decimal-pointtwo" 
              			data-options="required:true,validType:'integerParent'" value="${rules.bonusAmountStr}"  
              			missingMessage="请输入" onkeyup="clearNoNumPoint(this);" />%
		            </li>
		            <li class="ui-info-item">
		              <label class="ui-info-lbl redrule-item-label">红包最大金额限制:</label>
		              <input name="maxValueStr" type="text" class="easyui-validatebox ui-info-input decimal-pointtwo" 
              			data-options="required:true,validType:'integerMoney'" value="${rules.maxValueStr}"/>元
		            </li>
		        <#else>
		        	<li class="ui-info-item">
		              <label class="ui-info-lbl redrule-item-label">单个红包金额:</label>
		              	<input name="bonusAmountStr" type="text" class="easyui-validatebox ui-info-input decimal-pointtwo" 
              				data-options="required:true,validType:'integerMoney'" value="${rules.bonusAmountStr}"/>元
		            </li>
		        </#if>
            </#if>
	        <#if  rules.ruleScopeStr == 2>
	            <li class="ui-info-item ui-info-item-grey ui-resureLimit-wrap fn-clear " id="addreduceItem">
		          	  <label class="ui-info-lbl redrule-item-label" style="vertical-align: top;">单个红包金额：</label>
	                  <!--<a class="ui-guarant-reduce" href="javascript:;"></a>-->
		              <span>
		                  <#if configs??>
							  <#list configs as item>
							  <div class="ui-resureLimit-inner <#if item_index==0>ui-resureLimit-fir<#else></#if>">
				              	  <input  name="configsMap[${item_index+1}].minAmountStr" type="text" value="${item.minAmountStr}" class="easyui-validatebox ui-info-sinput produce-item-toggle" 
                   		 			data-options="required:true,validType:['money']" missingMessage="请输入" />元
					              	<a href="javascript:void(0);" class="ui-info-to get-limit">至</a> 
						          <input  name="configsMap[${item_index+1}].maxAmountStr" type="text" class="easyui-validatebox <#if item.minAmountStr==item.maxAmountStr&&item.maxAmountStr!=''>fn-hide </#if> ui-info-sinput  produce-item-toggle"
						           		value="<#if item.minAmountStr==item.maxAmountStr&&item.maxAmountStr!=''><#else>${item.maxAmountStr}</#if>"
                       					 missingMessage="请输入"/><em class="<#if item.minAmountStr==item.maxAmountStr&&item.maxAmountStr!=''>fn-hide </#if>">元</em>
						  			  <label class="ui-info-lbl ui-info-lblw">发放比例：</label>
						  		  <input name="configsMap[${item_index+1}].sendPercent" type="text" value="${item.sendPercent}" class="ui-info-sinput easyui-validatebox produce-item-toggle redrule-percentage" 
                         				data-options="required:true,validType:['integer']" missingMessage="请输入" onkeyup="clearNoNum(this);"/>%
                         				
                         		  <#if configs?size==1><a class="ui-guarant-addfir" href="javascript:;"></a></#if>
				                  <#if configs?size gt 1 && item_has_next><a class="ui-guarant-reduce" href="javascript:;"></a></#if>
				                  <#if configs?size gt 1 && !item_has_next><a class="ui-guarant-addfir" href="javascript:;"></a><a class="ui-guarant-reduce" href="javascript:;"></a></#if>
						      </div>
				              </#list>
				          </#if>
			          </span>
	            </li>
	         </#if>
	        <#if rules.ruleScopeStr == 1 || rules.ruleScopeStr == 2>
	            <li class="ui-info-item">
	              <label class="ui-info-lbl redrule-item-label">红包触发金额:</label>
	                	<input name="triggerAmountStr" type="text" class="easyui-validatebox ui-info-input decimal-pointtwo" 
          					data-options="required:true,validType:'integerMoney'" 
          					<#if rules.triggerAmount == 0>value=""  disabled="disabled"<#else>
          						value="${rules.triggerAmountStr}" </#if>  /> 元
						<input type="checkbox" name="triggerAmountStr" value="0" class="ui-unlimited" 
							<#if rules.triggerAmount == 0>checked</#if> />无限制
	            </li>
	        </#if>
            <li class="ui-info-item ui-info-item-grey ">
              <label class="ui-info-lbl redrule-item-label">红包总数量:</label>
                	<input name="bonusLimit" type="text" class="easyui-validatebox ui-info-input" 
              			data-options="required:true,validType:'integer'"
              			<#if rules.bonusLimit == 0>value=""  disabled="disabled"<#else> 
              			value="${rules.bonusLimit}"</#if> />个
					<input type="checkbox" name="bonusLimit" value="0" class="ui-unlimited" 
						<#if rules.bonusLimit == 0>checked</#if> />无限制
            </li>
           	<li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label ui-info-small">红包发放时间：</label>
              <span data-qb="qb">
                 <input type="text" name="effTimeStr" id="startTimeStr" class="easyui-datebox ui-info-sinput" data-options="editable: false",required:true" validType="mdMs['#endTimeStr']" value="${rules.effTimeStr}"/>
                 <em>至</em>
                 <input type="text" name="expTimeStr" id="endTimeStr" class="easyui-datebox ui-info-sinput" data-options="editable: false,required:true" validType="mdMs['#startTimeStr']" value="${rules.expTimeStr}"/> &nbsp;
              </span>
            </li>
           	<li class="ui-info-item ui-info-item-grey">
              <label class="ui-info-lbl redrule-item-label">红包祝福语:</label>
               <input name="bonusWishing" type="text" class="easyui-validatebox ui-info-input" 
              		data-options="required:true" value="${rules.bonusWishing}" />
            </li>
            <li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label">红包备注信息:</label>
              <input name="bonusRemark" type="text" class="easyui-validatebox ui-info-input" 
              		data-options="required:true" value="${rules.bonusRemark}"/>
            </li>
			<li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl redrule-item-label">每人每天最多发放个数:</label>
                	<input name="dayUserLimit" type="text" class="easyui-validatebox ui-info-sinput" 
                  		data-options="required:true,validType:'integer'" missingMessage="请输入"
                  		<#if rules.dayUserLimit == 0> value="" disabled="disabled" <#else> 
                  		value="${rules.dayUserLimit}" </#if> onkeyup="clearNoNum(this);" id="dailyCount" />个
					 <input type="checkbox" name="dayUserLimit" value="0" class="ui-unlimited" <#if rules.dayUserLimit == 0>checked</#if>  data-lime="1"/>无限制
            </li>
            <li class="ui-info-item">
                <label class="ui-info-lbl redrule-item-label">每天最多发放人数:</label>
                	<input name="userLimit" type="text"  class="easyui-validatebox ui-info-sinput" 
                  		data-options="required:true,validType:'integer'" missingMessage="请输入"
                  		<#if rules.userLimit == 0>
                  		value="" disabled="disabled" <#else> 
                  		value="${rules.userLimit}" </#if> onkeyup="clearNoNum(this);" id="dayNum"/>人
                   <input type="checkbox" name="userLimit" value="0" class="ui-unlimited" <#if rules.userLimit == 0>checked</#if> data-lime="1"/>无限制
            </li>
            <li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl redrule-item-label">每天最多发放个数:</label>
                	<input name="dayLimit" type="text" class="easyui-validatebox ui-info-sinput" 
                  		data-options="required:true,validType:'integer'" missingMessage="请输入"
                  		<#if rules.dayLimit == 0>
                  			value="" disabled="disabled" <#else> 
                  		value="${rules.dayLimit}" </#if><#if rules.userLimit != 0 && rules.dayUserLimit != 0> readonly</#if> onkeyup="clearNoNum(this);" id="dayTotal"/> 个
					<input type="checkbox" name="dayLimit" value="0" class="ui-unlimited" <#if rules.dayLimit == 0>checked</#if> />无限制
            </li>
            <li class="ui-info-item">
              <label class="ui-info-lbl"></label>
              <span style="color:#f00;padding:10px 0;">每天最多发放个数=每人每天最多发放个数*每天最多发放人数</span>
            </li>
          	<li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl redrule-item-label">失败是否补发:</label>
                <select class="ui-info-sel" id="redruleReissue" name="autoResendStr" style="width:100px;">
                	<option value="1" <#if rules.autoResend gte 1> selected = "selected"</#if> >是</option>
                	<option value="-1" <#if rules.autoResend == -1> selected = "selected"</#if> >否</option>
				</select>
				<span>
					<input name="autoResend" type="text" class="easyui-validatebox ui-info-sinput" 
					<#if rules.autoResend gte 1>value="${rules.autoResend}"<#else> value="" </#if>
            			data-options="required:'true',validType:'integer'"  
							 missingMessage="请输入" onkeyup="clearNoNum(this);" />次  
                </span>
            </li>
            <#if  rules.ruleScopeStr == 2>
	            <li class="ui-info-item ">
	                <label class="ui-info-lbl redrule-item-label">是否采用奖金池模式:</label>
	                <select class="ui-info-sel" id="prizePoolModel" name="poolIdSts" style="width:100px;"> 
	                	<option value="1" <#if rules.poolId gte 1> selected = "selected"</#if> >是</option>
	                	<option value="0" <#if rules.poolId == 0> selected = "selected"</#if> >否</option>
					</select>
					<input type="hidden" name="poolId" value="${rules.poolId}" />
	            </li>

	            <li class="ui-info-item  prizepoolmodel-toggle <#if rules.poolId == 0>fn-hide</#if>" >
	                <label class="ui-info-lbl redrule-item-label">奖金池初始金额:</label>
	                <input name="bonusPoolStr"  type="text" value="${pools.bonusPoolStr}" class="easyui-validatebox ui-info-sinput decimal-pointtwo" 
              		data-options="required:true,validType:'integerMoney'" missingMessage="请输入"/>元 
	            </li>
	            <li class="ui-info-item ui-info-item-grey prizepoolmodel-toggle  <#if rules.poolId == 0>fn-hide</#if> " >
	                <label class="ui-info-lbl redrule-item-label">奖金池最低剩余金额/奖金池总金额:</label>
	                <input name="maxTakeoutStr"  type="text" value="${pools.maxTakeoutStr}" class="easyui-validatebox ui-info-sinput decimal-pointtwo" 
              		data-options="required:true,validType:'integerParent'" missingMessage="请输入" onkeyup="clearNoNumPoint(this);"/>%  
	            </li>
	        </#if>
          </ul>
    	</div>
      <div class="ui-btn-double">
        <input type="button" value="下一步" class="ui-btn-blue" onclick="forSubmit();"/>
        <input type="button" value="取消"  class="ui-btn-grey" id="returnSearch"/>
      </div>
      </form>
    </div>
    <!--选择弹出框start-->
     <div id="dlgList" class="easyui-dialog ui-dlg-alert ui-select-bigbox"  data-options="iconCls:'icon-save',modal:true,closed: true">
        <iframe src="" frameborder="0" width="100%" height='100%' id="newLoadPage"></iframe>
    </div>
   
</div>
<div id="produce-result" style="display:none"></div>
<div id="dlgReport" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
	<h3 class="ui-dlg-tit" id="delStartTit" >异常情况,操作失败!</h3>
  </div>
<div id="dlgParent" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:430px;">
  <h3 class="ui-dlg-tit">单个红包发放比例总和必须等于100%，请重新分配！</h3>
  <input type="button" class="ui-dlgOk-btn ui-dlgok" value="确定"/>
</div>
<script>
$(function(){
	validExtend();
    
	redruleMoreLine($('.ui-resureLimit-wrap'),['minAmountStr', 'maxAmountStr','sendPercent'],false);
	var searchForm = $("#searchForm"),
		infoForm = $("#infoForm");
	//点击编辑	
	$("#configEditorPage").on('click',function(){
		searchForm.hide();
		infoForm.show();
		defaultOperate();
		redruleOperate();
	})
//点击返回查看页面
	$("#returnSearch").on('click',function(){
		searchForm.show();
		infoForm.hide();
	})
	
	//返回
     $("body").on('click', '#back', function() {
        $("#produce-add").show();
        $("#produce-result").hide().empty();
        $('body').off('click','#redruleSubmit');
    });
	<#-- 弹出联系人信息-->
    $("#relateProduce").click(function(event) {
        showAlert("dlgList",'','min');
        $("#newLoadPage").attr("src",'/operate/findDomainProduct');
    });
    
	//显示产品列表
	var ids = '${rules.productIds}';
    $.ajax({
         url: '/operate/findDomainProducts?ids='+ids,
         type: 'post',
         dataType: 'json',
         success: function (result) {
            if(!result || result.length == 0){
             	return false;
            }
          	var target =$("#relateBox");
          	var target2 =$("#relateBox2");
          	var htm = '';
          	var productIds = '';
          	var data = '<div class="relate-box">'+
                        '<table class="relate-produce-table">'+
                      '<tr>'+
                        '<th class="relate-item-style">产品ID</th>'+
                        '<th class="relate-item-style">保险名称</th>'+
                        '<th class="relate-item-style">保费金额(元)</th>'+
                        '<th class="relate-item-style">销售数量(份)</th>'+
                        '<th class="relate-item-style">上架状态</th>'+
                        '<th class="relate-item-style">上架时间</th>'+
                        '<th class="relate-item-style">下架时间</th>'+
                      '</tr>';
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
      		target.append(htm);
      		target2.append(htm);
          }
	});
})
function forSubmit() {
       var formbox = $('#infoForm');
		formbox.ajaxForm({
		     target: '#produce-result',
		     success: function() {
		            $("#produce-add").hide();
		            $('#produce-result').show();
		     }
		})
		formbox.attr("action", "${base}/operate/toSure");
		var parent = calculateParent(false);
		if(formbox.form('validate')&& parent){
			  formbox.submit();
		}else if(!formbox.form('validate')){
			$("#delStartTit").text("信息内容不合法，请核对!");
			showAlert('dlgReport');
		    return false;
		}
		
}
function defaultOperate(){
	var fixedamount = $(".redrule-orderfixed-amount"),
		radomamount = $(".redrule-orderRadom-amount"),
		noorderamount = $(".redrule-noorder-amount"),
		noorderradom = $(".redrule-noOrderRadom-amount"),
		singlered = $(".redrule-singleRed-amount"),
		radomfixed =$(".adopteradom-fixed"),
		radomscale = $(".adopteradom-scale"),
		modelfixed = $(".adoptionmodel-fixed"),
		modelscale = $(".adoptionmodel-scale"),
		prizebox = $(".prizepoolmodel-toggle"),
		maxmoney= $(".maxredrule-money");
	
	//是否采用奖金池模式、
	<#if  rules.ruleScopeStr == 2>
		<#if rules.poolId == 0>
			seleNatureToggle([],[prizebox]);
		<#else>
			seleNatureToggle([prizebox],[]);
		</#if>
	</#if>
	//失败补发
	var reissue = $("#redruleReissue");
	<#if rules.autoResend gte 1>
	seleNatureToggle([reissue.next()],[])
	</#if>
	
	<#if rules.autoResend == -1>
	seleNatureToggle([],[reissue.next()])
	</#if>
	
	
	//无限制
	var limets = $(".ui-unlimited");
	$.each(limets,function(i,v){
 		var isflag = $(this).is(":checked");
	    if(isflag){
	    	$(this).prev().validatebox('disableValidation')
	    }
	})	
}
var selectid = '';

function getDataItem(str){
      selectid+=str+",";
      var data = '<div class="relate-box"><table class="relate-produce-table"><tr><th class="relate-item-style">产品ID</th><th class="relate-item-style">保险名称</th><th class="relate-item-style">保费金额(元)</th><th class="relate-item-style">销售数量(份)</th><th class="relate-item-style">上架状态</th><th class="relate-item-style">上架时间</th><th class="relate-item-style">下架时间</th></tr>';	          	
       $.ajax({
             url: '/operate/findDomainProducts?ids='+str,
             type: 'post',
             dataType: 'json',
             success: function (result) {
	             if(!result || result.length == 0){
	             	return false;
	             }
	          	var target =$("#relateBox");
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

</script>	

</body>
</html>