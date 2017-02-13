<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>代理人信息管理</title>
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
        <div class="ui-info-main">
            <div class="ui-informate">
             	<div class="ui-informate-base ui-channel-baseinfor">
					<!--分销商基本信息start-->
             		<div id="baseForm">
                        <h4 class="ui-info-tit">分销商基本信息</h4>
                        <div class="ui-base-produceinfor">		
                 			<div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">代理ID:</label>
         						<span class="ui-base-data">${salesmanPo.salesamanId}</span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">代理账号:</label>
                                <span class="ui-base-data">${salesmanPo.salesamanUser}</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">代理人名称:</label>
                                <span class="ui-base-data">${salesmanPo.salesamanName}</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">代理所属渠道:</label>
                                <span class="ui-base-data channel-data">${salesmanPo.domainId}</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">代理人状态:</label>
                                <span class="ui-base-data channel-data" name="salesamanSts">
         							<#assign x = '${salesmanPo.salesamanSts}'>
         								<#if x == '10'>
         									正常
         								<#elseif x == '-10'>
         								 	禁用
         								 <#elseif x == '-11'>
         								 	后台冻结
         								 <#elseif x == '-12'>
         								 	密码错冻结
         								 <#elseif x == '-13'>
         								 	登录异常冻结
         							</#if>
         						</span>
                            </div>
                            
                        </div>
                        
                        <div class="ui-btn-double">
                            <input type="button" value="编辑" class="ui-btn-blue ui-submit" id="serchEditor"/>
                            <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
                        </div>
                    </div>
                    <!--分销商基本信息end-->
                    <!--分销商基本信息---编辑页面start-->
                    <form class="dlg-box" id="editorForm" >
                        <h4 class="ui-info-tit">分销商基本信息</h4>
                        <div class="ui-base-produceinfor">		
                 			<div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">代理ID:</label>
         						<span class="ui-base-data">${salesmanPo.salesamanId}</span>
         						<input type="hidden" name="salesamanId" value="${salesmanPo.salesamanId}"/>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">代理账号:</label>
             					<span class="ui-base-data">${salesmanPo.salesamanUser}</span>
         						<input type="hidden" name="salesamanId" value="${salesmanPo.salesamanUser}"/>             					
         						</span>
                 			</div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">代理人名称:</label>
                                <span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox ui-cover" type="text" name="salesamanName" value="${salesmanPo.salesamanName}" />
                                </span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">代理所属渠道:</label>
         						<span  name="salesamanUser" class="ui-base-data channel-basicdata fn-hide" >${salesmanPo.salesamanUser}</span>
         						<span class="ui-base-data channel-data" name="salesamanUser">
         							<select class="listsele" name="domainId" id="domainIdIdSel">
         								<#assign x = '${salesmanPo.domainId}'>
			                            <#list domainIdList as domainId>
			                            	<option value="${domainId}" <#if x == '${domainId}'>selected</#if>>${domainId}</option>
			                            </#list>
			                        </select>
         						</span>
                 			</div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">代理人状态:</label>
         						<span  name="salesamanUser" class="ui-base-data channel-basicdata fn-hide" >${salesmanPo.salesamanSts}</span>
         						<span class="ui-base-data channel-data" name="salesamanSts">
         							<select class="listsele" name="salesamanSts">
         								<#assign x = '${salesmanPo.salesamanSts}'>
			                            <option value="10" <#if x == '10'>selected</#if>>正常</option>
			                            <option value="-10"  <#if x == '-10'>selected</#if>>禁用</option>
			                            <option value="-11" <#if x == '-11'>selected</#if>>后台冻结</option>
			                            <option value="-12" <#if x == '-12'>selected</#if>>密码错冻结</option>
			                            <option value="-13"<#if x == '-13'>selected</#if>>登录异常冻结</option>
			                        </select>
         						</span>
                 			</div>
                        </div>
                        <div class="ui-btn-double">
                            <input type="button" value="完成" class="ui-btn-blue ui-submit" id="baseSaveInfor"/>
                            <input type="button" value="取消"  class="ui-btn-grey" id="backBaseForm"/>
                        </div>
                    </form>
                    <!--分销商基本信息---编辑页面end-->
                </div>	
         	</div>
    	</div>
    	<!--提示添加成功start-->
            <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
                <h3 class="ui-dlg-tit" id="titMessage" >代理人信息编辑成功！<h3>
            </div>
        <!--提示添加成功end-->
        <!--添提示添加失败-->  
  		<div id="dlgFailure" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
             <h3 class="ui-dlg-tit">代理人信息编辑失败！</h3>
    		<input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定"/>
        </div>   
	</div>
<script> 
$(function(){
	validExtend();
	var basepage = $("#serchEditor"),backbase = $("#backBaseForm"),
		baseform = $("#baseForm"),editorform = $("#editorForm");

	//点击编辑显示页面
	basepage.click(function(){
		baseform.hide();
		editorform.show();
	
	})
	
	//点击取消返回基本分销商信息页面
	backbase.click(function(){
		baseform.show();
		editorform.hide();
	})
	
	//点击 完成
	$("#baseSaveInfor").click(function(){
		var arrsinfor = $(".channel-basicdata");
		$.ajax({
         		url : '${base}/agent/updateSalesmanInfos',
         		type :　'post',
         		data : $("#editorForm").serialize(),
         		dataType : "json",
         		success : function(data){
         		
         			//如果返回一个字符串则提示成功否则提示失败
         			if(data.success == "true"){
         				showAlert('dlg');
	            		setTimeout(function(){
	            			
	            			//返回到信息管理的页面
	            			location.href="${base}/agent/saleManView";
	            		},1000)
         			}else{
         				showAlert("dlgFailure");
         			}
         		}
         	})       
	})


})
</script>

</body>
</html>