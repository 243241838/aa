<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>交易渠道开关</title>
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
			<!-- 列表 -->
			<div class="list-item list-noadd fn-clear">
				
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">

				</table>
			</div>
			<!--弹框start-->
			<div id="dlgOpen" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
				<h3 class="ui-dlg-tit">确定要开启支付渠道吗？</h3>
				<input type="button" class="ui-dlgOk-btn" value="确定" id="policyNameOpen"/>
				<input type="button" class="ui-dlgCancel-btn" value="取消" id="policyNameClose"/>
			</div>
			<!--弹框end-->
		</div>
	</div>
	
	<script>
	$(function(){
		validExtend();
		var alertTarget = null;
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
				{field:'paymentId',align:'center',width:"32%",title:'支付渠道ID',sortable:true},
				{field:'paymentName',align:'center',width:"32%",title:'支付渠道名称',
						formatter:function(value,rec){
							return '<a class="payment-name-all" href="${base}/businessmanager/chanelinformanager">'+value+'</a>';
						}},
				{field:'sts',align:'center',width:"34%",title:'操作',
					formatter:function(value,rec){
					    var chk1='',chk2='';
					    if(value==10){
					      chk1="checked";
					    }else{
					      chk2="checked";
					    }
						return '<span class="switch-style"><input type="radio" class="radio-openclose"  value="10" name="switch'+rec.paymentId+'"'+chk1+'/>开启</span>'
						      +'<span class="switch-style"><input type="radio" class="radio-openclose" value="-10" name="switch'+rec.paymentId+'" '+chk2+'/>关闭</span>';
					}
				}
			]],
			queryParams: eb.form2Json("search-ff"),
		    loadFilter:function(data){
	            return eb.loadFilter(data);    //自定义过滤方法
	      	},
	      	onLoadSuccess:function(data){
                pageCls();
                var stsVal=stsdomainId='';
	      		//判断点击的是启动true还是关闭false的按钮
	      		var isSelect = false;
     
	      		//开启关闭出现弹框
				$(".radio-openclose").click(function() {
				    stsVal=$(this).val(),
				    stsdomainId=$(this).attr('name').split('switch')[1];
				    
					showAlert("dlgOpen");
					alertTarget = $(this).parents(".datagrid-cell");
					if(stsVal==10){
					  $(".ui-dlg-tit").text("确定要开启支付渠道吗？");
					  isSelect=true;
					}else{
					  $(".ui-dlg-tit").text("确定要关闭支付渠道吗？");
					  isSelect=false;
					}
				});

				//点击确定的处理
				$("#policyNameOpen").click(function(event) {
				    
					$.ajax({
					    url:'${base}/businessmanager/updateDomainsInfo',
				  		type: 'post',
				  		dataType: 'json',
				  		data: {domainSts:stsVal,domainId:stsdomainId},
				  		success:function(data){
				  			if(data.succ){
				  				$("#dlgOpen").dialog("close");
				  				window.location.reload();
				  			}else{
				  				alert(data.error.message);
				  			}
				  		},
				  		error:function(){
				  			alert('系统错误，请重试');
				  		}
					});
					
					
				});

				//点击取消的处理
				$("#policyNameClose").click(function(e) {

					if(isSelect){
						alertTarget.find(".radio-openclose:eq(1)").prop("checked",true);
						alertTarget.find(".radio-openclose:eq(0)").prop("checked",false);
					}else{
						alertTarget.find(".radio-openclose:eq(0)").prop("checked",true);
						alertTarget.find(".radio-openclose:eq(1)").prop("checked",false);
					}
					
				
					
				});

				
	      	}
		});
		//分页
		pageAction();



		
   });
	
	</script>
</body>
</html>