<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>交易渠道信息管理</title>
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
							<label class="name">支付渠道</label>
							<span class="textbox"><input name="domainName" class="textbox-text textbox-prompt" type="text" maxlength="20"/></span>
						</li>
						<li>
							<label class="name">状态</label>
							<select class="ui-combobox" name="domainSts" id="transaceAmount">
								<option value="0" selected ="selected">全部</option>
								<option value="-10">禁用</option>
								<option value="10">正常</option>
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
				<a href="javascript:;" class="search-btn policy-newcontent" id="policyNewContent">新增</a>
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
			
		</div>
		<!--新增弹出框start-->

		<div id="dlgConfirm" class="easyui-dialog ui-dlg-confirm ui-newalert-box"  data-options="iconCls:'icon-save',modal:true,closed: true">
			<h3 class="ui-dlg-tit">新增支付渠道</h3>
			<form id="channelAddForm" action="${base}/businessmanager/addDomainsInfo" method="post">
				<ul class="ui-dlg-dtl">
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">支付渠道ID：</label>
						<span  class="ui-newcontent-item-span textbox">
							<input class="textbox-text easyui-validatebox ui-new-paychannel" type="text" name="domainId" value="" id="newIdContent" data-options="required:true,validType:['integer','maxlen[3]','ajaxPayId']"  missingMessage="请输入支付渠道ID" style="width:100%;"/>
						</span>
					</li>
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">支付渠道名称：</label>
						<span  class="ui-newcontent-item-span textbox">
							<input class="textbox-text easyui-validatebox ui-new-paychannel" type="text" name="domainName" value="" id="newNameContent" data-options="required:true,validType:['numLetChina','maxlen[20]','ajaxPayName']"  missingMessage="请输入支付渠道名称" style="width:100%;"/>
						</span>
					</li>
				  	<li class="ui-newcontent-item">
				  		<label class="ui-newcontent-item-label">合作时间：</label>
				  		<span  class="ui-newcontent-item-span">
				  			<input  class="easyui-datebox"  name="effTime"  validType="md['#endchanelTime']"  id="startchanelTime" data-options="editable:false">
				  			<em>至</em>
				  			<input class="easyui-datebox" name="expTime" validType="md['#startchanelTime']" id="endchanelTime" data-options="editable:false">
				  		</span>
				  	</li>
				  	<li>
					  	<span class="showMessage2">	</span>
					</li>
				</ul>
				<input type="button" class="ui-dlgOk-btn" value="下一步" id="newContentNext"/>
		    	<input type="button" class="ui-dlgCancel-btn" value="取消"/>
			</form>  
		</div>
		<!--新增弹出框end-->
		<!--新增弹出框下一步start-->
			<div id="dlgConfirmNext" class="easyui-dialog ui-dlg-confirm ui-newalert-box"  data-options="iconCls:'icon-save',modal:true,closed: true">
				<h3 class="ui-dlg-tit">新增支付渠道</h3>
				<ul class="ui-dlg-dtl">
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">支付渠道ID：</label>
						<span  class="ui-newcontent-item-span" id="ui-payment-id"></span>
					</li>
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">支付渠道名称：</label>
						<span  class="ui-newcontent-item-span" id="ui-payment-name"></span>
					</li>
				  	<li class="ui-newcontent-item">
				  		<label class="ui-newcontent-item-label">合作时间：</label>
				  		<span  class="ui-newcontent-item-span">
				  			<em id="ui-payment-starttime">2015-05-01</em> 至 <em id="ui-payment-endtime">2016-05-01</em>
				  		</span>
				  	</li>
				</ul>  	
			   <input type="button" class="ui-dlgOk-btn" value="完成并保存" id="newContentSave"/>
			  <input type="button" class="ui-dlgCancel-btn" value="返回修改" id="newContentBack"/>
			</div>
		<!--新增弹出框下一步end-->


		<!--支付渠道名称弹出框start-->
			<div id="dlgConfirmShow" class="easyui-dialog ui-dlg-confirm ui-newalert-box"  data-options="iconCls:'icon-save',modal:true,closed: true">
				<h3 class="ui-dlg-tit">查看支付渠道</h3>
				<ul class="ui-dlg-dtl">
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">支付渠道ID：</label>
						<span  class="ui-newcontent-item-span" id="payChannelId"></span>
					</li>
				  	<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">支付渠道名称：</label>
						<span  class="ui-newcontent-item-span" id="payChannelName"></span>
					</li>
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">合作时间：</label>
						<span  class="ui-newcontent-item-span" id="payChannelTime"></span>
					</li>
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">开关：</label>
						<span  class="ui-newcontent-item-span" id="payChannelState"></span>
					</li>
			   </ul>
			   <input type="button" class="ui-dlgCancel-btn " value="返回" id="paymentBack"/>
			  <input type="button" class=" ui-dlgOk-btn" value="编辑" id="paymentEditor"/>
			</div>
		<!--支付渠道名称弹出框end-->
		<!--支付渠道名称下一步弹出框start-->
			<div id="dlgConfirmNextShow" class="easyui-dialog ui-dlg-confirm ui-newalert-box"  data-options="iconCls:'icon-save',modal:true,closed: true">
				<h3 class="ui-dlg-tit">查看支付渠道</h3>
				<form id="dlgSaveShow" action="${base}/businessmanager/updateDomainsInfo" method="post">
				<input type="hidden" name="domainId"/>
				<ul class="ui-dlg-dtl">
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">支付渠道ID：</label>
						<span  class="ui-newcontent-item-span" id="editorId"></span>
					</li>
				  	<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">支付渠道名称：</label>
						<span  class="ui-newcontent-item-span textbox">
						<input class="textbox-text textbox-prompt easyui-validatebox ui-new-paychannel"  type="text" name="domainName" value="" id="editorName" data-options="required:true,validType:['chinese','maxlen[20]']" style="width:100%;"/>
						
					</span>
					</li>
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">合作时间：</label>
				  		<span  class="ui-newcontent-item-span">
				  			<input  class="easyui-datebox" name="effTime" validType="md['#editorTimeStart']" id="editorTimeStart" data-options="editable:false">
				  			<em>至</em>
				  			<input class="easyui-datebox" name="expTime" validType="md['#editorTimeEnd']" id="editorTimeEnd" data-options="editable:false">
				  		</span>
					</li>
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">开关：</label>
						<span  class="ui-newcontent-item-span" id="editorState">
						<em class="switch-style"><input type="radio" name="domainSts" value="10">开启</em>
						<em class="switch-style"><input type="radio" name="domainSts" value="-10">关闭</em></span>
					</li>
				</ul>
				</form>
			   <input type="button" class="ui-dlgOk-btn" value="下一步" id="editorNext"/>
			  <input type="button" class="ui-dlgCancel-btn" value="取消"/>
			</div>
		<!--支付渠道名称下一步弹出框end-->
		<!--支付渠道名称保存信息start-->
			<div id="dlgConfirmSaveShow" class="easyui-dialog ui-dlg-confirm ui-newalert-box"  data-options="iconCls:'icon-save',modal:true,closed: true">
				<h3 class="ui-dlg-tit">查看支付渠道保存</h3>
				
				<ul class="ui-dlg-dtl">
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">支付渠道ID：</label>
						<span  class="ui-newcontent-item-span" id="paySaveId"></span>
					</li>
				  	<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">支付渠道名称：</label>
						<span  class="ui-newcontent-item-span" id="paySaveName"></span>
					</li>
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">合作时间：</label>
						<span  class="ui-newcontent-item-span" id="paySaveTime"></span>
					</li>
					<li class="ui-newcontent-item">
						<label class="ui-newcontent-item-label">开关：</label>
						<span  class="ui-newcontent-item-span" id="paySaveState"></span>
					</li>
			    </ul>
			   <input type="button" class=" ui-dlgOk-btn" value="保存并返回" id="editorSave"/>
			  <input type="button" class=" ui-dlgCancel-btn" value="返回修改" id="editorBack"/>
			</div>
		<!--支付渠道名称保存信息end-->

	</div>
	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'${base}/businessmanager/findChanelInfoList',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			//idField:'userid',//id字段
			//sortName:'userid',//当数据表格初始化时以哪一列来排序
			//sortOrder:'desc',//'asc'/'desc'（正序/倒序）
			//remoteSort: false,//定义是否通过远程服务器对数据排序
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'paymentId',align:'center',width:"22%",title:'支付渠道ID',sortable:true},
				{field:'paymentName',align:'center',width:"20%",title:'支付渠道名称',
						formatter:function(value,rec){
						
							return '<a class="payment-name-all" href="javascript:void(0);" onclick="showAlertChanel(\''+rec.paymentId+'\',\''+rec.paymentName+'\',\''+formatDate(rec.effTime)+'\',\''+formatDate(rec.expTime)+'\',\''+rec.sts+'\');">'+value+'</a>';
						}
				},
				{field:'effTime',align:'center',width:"34%",title:'合作时间',
					formatter:function(value,rec){
						return formatDate(rec.effTime) +' 至 '+ formatDate(rec.expTime);
					}
				},
				{field:'sts',align:'center',width:"22%",title:'状态',
					formatter:function(value,rec){
						if(rec.sts == 10){
							return '正常';
						}else if(rec.sts == -10){
							return '禁用';
						}
					}
				}
			]],
			queryParams: eb.form2Json("search-ff"),
	    	loadFilter:function(data){
           	 	return eb.loadFilter(data);    //自定义过滤方法
	     	},
	      	onLoadSuccess:pageCls
		});
		//分页
		pageAction();

		
		//点击新增
		$("#policyNewContent").click(function(event) {

			//清空内容操作
			$("#newNameContent").val(""),
			$("#startchanelTime").datebox('setValue', "");
			$("#endchanelTime").datebox('setValue', "");
			$(".showMessge2").text("");
			showAlert("dlgConfirm");
		});
		//新增--点击下一步显示信息
		$("#newContentNext").click(function(event) {
			
			var chanelName = $("#newNameContent").val(),
				chanelId = $("#newIdContent").val(),
				concurTimeStart = $("#startchanelTime").datebox("getValue"),
				concurTimeEnd = $("#endchanelTime").datebox("getValue"),
				target = $("#dlgConfirm").find(".showMessage2"),
				str = '',f = $(this).parents('form'),isflag = true;
		
			if(concurTimeStart == "" || concurTimeEnd ==""){
				str = '请选择合作时间';
				isflag = false;
			}
			target.text(str);
			if(f.form('validate') && isflag){
				$("#ui-payment-id").text(chanelId);
				$("#ui-payment-name").text(chanelName);
				$("#ui-payment-starttime").text(concurTimeStart);
				$("#ui-payment-endtime").text(concurTimeEnd);
				showAlert("dlgConfirmNext");
				$("#dlgConfirm").dialog("close");
			}
			
		});

		//新增--完成并保存信息
		$("#newContentSave").click(function(event) {
		    $('#channelAddForm').submit();
			//$("#dlgConfirmNext").dialog("close");
		});

		//新增--返回编辑
		$("#newContentBack").click(function(event) {
			showAlert("dlgConfirm");
		});


		//1.编辑
		$("#paymentEditor").click(function(event) {
			var id = $("#payChannelId").text(),
				name = $("#payChannelName").text(),
				date = $("#payChannelTime").text(),
				state = $("#payChannelState").text(),
				radioState = 0;
			$("#editorId").text(id);
			$("#editorName").val(name);
		
			radioState = state == "开启" ? 0 : 1;
		
			var stardate=date.substring(0,10);
			var enddtate=date.substring(11);
			
			$("#editorTimeStart").datebox('setValue',stardate);
			$("#editorTimeEnd").datebox('setValue', enddtate);
			$("#editorState").find("input").eq(radioState).prop("checked",true);
			$('input[name="domainId"]').val(id);
			
			$("#dlgConfirmShow").dialog("close");
			showAlert("dlgConfirmNextShow");
		});


		//2.点击下一步显示修改界面
		$("#editorNext").click(function(event) {
			var id = $("#editorId").text(),
				name = $("#editorName").val(),
				state = $("#editorState").find("input[name=domainSts]:checked").val(),
				dateStart = $("#editorTimeStart").datebox('getValue'),
				dateEnd = $("#editorTimeEnd").datebox('getValue');
			
			$("#paySaveId").text(id);
			$("#paySaveName").text(name);
			$("#paySaveTime").text(dateStart+"至"+dateEnd);
			$("#paySaveState").text(state==10?'开启':'关闭');
			
			$('input[name="paySaveId"]').val(id);
			
			if($('#dlgSaveShow').form('validate')){
				$("#dlgConfirmNextShow").dialog("close");
				showAlert("dlgConfirmSaveShow");
			}
			
			
		});

		//3.保存信息
		$("#editorSave").click(function(event) {
		    $.ajax({
			    url:$('#dlgSaveShow').attr('action'),
		  		type: 'post',
		  		dataType: 'json',
		  		data: $('#dlgSaveShow').serialize(),
		  		success:function(data){
		  			if(data.succ){
		  				$("#dlgConfirmSaveShow").dialog("close");
		  				window.location.reload();
		  			}else{
		  				alert(data.error.message);
		  			}
		  		},
		  		error:function(){
		  			alert('系统错误，请重试');
		  		}
			});
			//$("#dlgConfirmSaveShow").dialog("close");
		});
		
		//4.返回编辑修改
		$("#editorBack").click(function(event) {
			showAlert("dlgConfirmNextShow");
		});
			
		
   });
	function showAlertChanel(val1,val2,val3,val4,val5){
		 var dlg=$('#dlgConfirmShow');
		 dlg.find('#payChannelId').text(val1);
		 dlg.find('#payChannelName').text(val2);
		 dlg.find('#payChannelTime').text(val3 +' 至 '+ val4);
		 dlg.find('#payChannelState').text(val5==10?'开启':'关闭');
		 showAlert('dlgConfirmShow');
	}
	
	</script>
</body>
</html>
