<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>渠道用户信息管理</title>
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
                        <h4 class="ui-info-tit">渠道用户基本信息</h4>
                        <div class="ui-base-produceinfor">
                 			<div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">账户:</label>
         						<span class="ui-base-data">${commonUserPo.username}</span>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">姓名:</label>
                                <span class="ui-base-data">${commonUserPo.realName}</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">手机号:</label>
                                <span class="ui-base-data channel-data">${commonUserPo.mobile}</span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">用户状态:</label>
                                <span class="ui-base-data channel-data" name="salesamanSts">
         							<#assign x = '${commonUserPo.status}'>
         								<#if x == '0'>
         									正常
         								<#elseif x == '-1'>
         								 	注销
         								 <#elseif x == '-2'>
         								 	冻结
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
             					<label class="ui-base-label ui-channel-base-label">账户:</label>
         						<span class="ui-base-data">${commonUserPo.username}</span>
         						<input type="hidden" name="username" value="${commonUserPo.username}"/>
         						<input type="hidden" name="userId" value="${commonUserPo.userId}"/>
                 			</div>
                 			<div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">姓名:</label>
             					<span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox ui-cover" type="text" name="realName" data-options="required:true" value="${commonUserPo.realName}" />
                                </span>  					
         						</span>
                 			</div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business ui-info-item-grey">
                                <label class="ui-base-label ui-channel-base-label">手机号:</label>
                                <span class="ui-base-data">
                                    <input class="clause-input ui-channel-inforspan easyui-validatebox ui-cover" type="text" name="mobile" data-options="required:true,validType:['phone','length[11]']" value="${commonUserPo.mobile}" />
                                </span>
                            </div>
                            <div class="ui-base-colsinfor ui-base-colwidth-business">
             					<label class="ui-base-label ui-channel-base-label">用户状态:</label>
         						<span  name="salesamanUser" class="ui-base-data channel-basicdata fn-hide" >${commonUserPo.status}</span>
         						<span class="ui-base-data channel-data" name="salesamanSts">
         							<select class="listsele" name="status">
         								<#assign x = '${commonUserPo.status}'>
			                            <option value="0" <#if x == '0'>selected</#if>>正常</option>
			                            <option value="-1"  <#if x == '-1'>selected</#if>>注销</option>
			                            <option value="-2" <#if x == '-2'>selected</#if>>冻结</option>
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
                <h3 class="ui-dlg-tit" id="titMessage" >渠道用户信息编辑成功！<h3>
            </div>
        <!--提示添加成功end-->
        <!--添提示添加失败-->  
  		<div id="dlgFailure" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
             <h3 class="ui-dlg-tit">渠道用户信息编辑失败！</h3>
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
         		url : '${base}/domain/updateDomainUserInfos',
         		type :　'post',
         		data : $("#editorForm").serialize(),
         		dataType : "json",
         		success : function(data){
         		
         			//如果返回一个字符串则提示成功否则提示失败
         			if(data.success == "true"){
         				showAlert('dlg');
	            		setTimeout(function(){
	            			
	            			//返回到信息管理的页面
	            			location.href="${base}/domain/userManager?domainId=${commonUserPo.channelCode}";
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