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
             					<label class="ui-base-label ui-channel-base-label">分销商ID:</label>
         						<span class="ui-base-data">${domainPo.domainId}</span>
                 			</div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">分销商名称:</label>
                                <span class="ui-base-data">${domainPo.domainName}</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">联系人:</label>
                                <span class="ui-base-data">${domainPo.domainContacts}</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">联系电话:</label>
                               <span class="ui-base-data">
                               		<#assign phone = domainPo.domainTel?if_exists?split(',')>
                                   <em>${phone[0]}</em>
                                   <em>${phone[1]}</em>
                               </span>
                            </div> 
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">合作时间:</label>
                                <span class="ui-base-data">
                                    <em>${domainPo.effTime?string('yyyy-MM-dd')}</em> 至
                                    <em>${domainPo.expTime?string('yyyy-MM-dd')}</em>
                                </span>
                            </div>   
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">分销商状态:</label>
                                <span class="ui-base-data">
										<#if domainPo.domainSts == 10>
											有效
										<#elseif domainPo.domainSts == -11>
											无效
										</#if>
                                </span>  
                            </div>      
                        </div>
                        <h4 class="ui-info-tit">分销商银行账户信息</h4>
                        <div class="ui-base-produceinfor">      
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">结算账户开户行:</label>
                                <span class="ui-base-data">${domainPo.depositBank}</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">结账账户户名:</label>
                                <span class="ui-base-data">${domainPo.accountName}</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">结账账户账号:</label>
                                <span class="ui-base-data">${domainPo.accountNo}</span>
                            </div> 
                             
                        </div>
                        <p class="ui-base-colsinfor">该分销商合作的保险产品共有${combineCount}个,<a href="${base}/operate/domainproductView?domainId=${domainPo.domainId}" class="ui-detail-a">点击查看详情</a></p>
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
             					<label class="ui-base-label ui-channel-base-label">分销商ID:</label>
         						<span class="ui-base-data">${domainPo.domainId}</span>
         						<input type="hidden" name="domainId" value="${domainPo.domainId}"/>
                 			</div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">分销商名称:</label>
                                <span class="ui-base-data">${domainPo.domainName}</span>
                                <input type="hidden" name="domainName" value="${domainPo.domainName}"/>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">联系人:</label>
                                <span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox ui-cover" type="text" name="domainContacts" value="${domainPo.domainContacts}" data-options="required:true,validType:['letchi','maxlen[10]']" missingMessage="请输入联系人" />
                                </span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">联系电话:</label>
                               <span class="ui-base-data ">
                                    <input class="clause-input ui-channel-inforspan ui-channel-phonemargin easyui-validatebox" type="text" name="fixedPhone" value="${phone[0]}" placeholder="固定" data-options="required:true,validType:['integer']" missingMessage="请输入联系电话" maxlength="12" />                  
        							<input class="clause-input ui-channel-inforspan easyui-validatebox" type="text" name="phone" value="${phone[1]}" placeholder="手机" data-options="required:true,validType:['integer']" missingMessage="请输入联系电话" maxlength="11" />
                                </span>
                            </div> 
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">合作时间:</label>
                                <span class="ui-base-data">
                                    <input class="easyui-datetimebox ui-channel-inforspan" name="effTime" validType="md['#endChannelDateTime']"  id="startChannelDateTime" data-options="editable:false">
                                    <em>至</em>
                                  <input class="easyui-datetimebox ui-channel-inforspan" name="expTime"  validType="md['#startChannelDateTime']" id="endChannelDateTime" data-options="editable:false">
                                </span>                               
                            </div>   
              
              <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">分销商状态：</label>
                                <span class="ui-base-data">
                                    <select class="ui-combobox clause-input ui-channel-inforspan" name="domainSts" id="transaceAmount">
										<#if domainPo.domainSts == 10>
											<option value="10" selected>有效</option>
                                        	<option value="-11">无效</option>
										<#elseif domainPo.domainSts == -11>
											<option value="10">有效</option>
                                        	<option value="-11" selected>无效</option>
										</#if>
                                    </select>   
                                </span>  
                            </div>      
                        </div>
                        <h4 class="ui-info-tit">分销商银行账户信息</h4>
                        <div class="ui-base-produceinfor">      
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">结算账户开户行:</label>
                                <span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox ui-cover" type="text" name="depositBank" value="${domainPo.depositBank}" data-options="required:true,validType:['numLetChina','maxlen[20]']" missingMessage="请输入结算账户户行" />
                                </span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">结账账户户名:</label>
                                <span class="ui-base-data">${domainPo.accountName}</span>
                                <input type="hidden" name="accountName" value="${domainPo.accountName}"/>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
                                <label class="ui-base-label ui-channel-base-label">结账账户账号:</label>
                                <span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox ui-cover" type="text" name="accountNo" value="${domainPo.accountNo}" data-options="required:true,validType:['integer','maxlen[20]']" missingMessage="请输入结算账户账号" />
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
                <h3 class="ui-dlg-tit" id="titMessage" >分销商信息编辑成功！<h3>
            </div>
        <!--提示添加成功end-->
        <!--添提示添加失败-->  
  		<div id="dlgFailure" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
             <h3 class="ui-dlg-tit">分销商信息编辑失败！</h3>
    		<input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" value="确定"/>
        </div>   
	</div>
<script> 
$(function(){
	validExtend();
	var basepage = $("#serchEditor"),backbase = $("#backBaseForm"),
		baseform = $("#baseForm"),editorform = $("#editorForm");

		$('#startChannelDateTime').datetimebox('setValue', '${domainPo.effTime?string('yyyy-MM-dd HH:mm:ss')}');	
		$('#endChannelDateTime').datetimebox('setValue', '${domainPo.expTime?string('yyyy-MM-dd HH:mm:ss')}');	
		
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
         		url : '${base}/channelmanager/updateDomainInfos',
         		type :　'post',
         		data : $("#editorForm").serialize(),
         		dataType : "json",
         		success : function(data){
         		
         			//如果返回一个字符串则提示成功否则提示失败
         			if(data.success == "true"){
         				showAlert('dlg');
	            		setTimeout(function(){
	            			
	            			//返回到信息管理的页面
	            			location.href="${base}/channelmanager/channelinformanager";
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