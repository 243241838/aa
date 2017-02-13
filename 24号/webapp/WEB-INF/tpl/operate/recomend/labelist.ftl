<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>运营管理-运营参数管理-产品标签</title>
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
							<label class="name">产品ID</label>
							<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="productId" maxlength="9"  value=""/></span>
						</li>
						<li>
							<label class="name">保险名称</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="40"  name="productName" value=""/></span>
						</li>
						<li>
							<label class="name">产品标签</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="40"  name="tagName" value=""/></span>
						</li>
						</ul>
						<ul class="search-list fn-clear">
						<li>
							<label class="name">保费范围</label>
							<select class="ui-combobox" name="bettemoney" id="transaceAmount" >
								<option value="0">全部</option>
								<option value="1">0-1元</option>
								<option value="2">1-10元</option>
								<option value="3">10-50元</option>
								<option value="4">50-100元</option>
								<option value="5">100元及以上</option>
								<option value="6">自定义</option>
							</select>
							<span class="ui-hidden fn-hide" id="customToggle">
								<input name="minProducePrice" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo decimal-ptblur" maxlength="10"  data-options="validType:['customMoney']" id="moneyStart">
								<em class="ui-channel-titcolor">至</em>
								<input name="maxProducePrice" type="text" class="textbox-text moneyrange easyui-validatebox ui-cover decimal-pointtwo decimal-ptblur" maxlength="10" data-options="validType:['customMoney','moneycompare[\'#moneyStart\']']">
								<em class="ui-channel-titcolor">元</em>
							</span>
						</li>
							<li>
						<label class="name">承保公司</label>
						<select name="insurerId" class="ui-combobox" id="insurerId">
						<option value="">全部</option>
						  <#list iList as item>
                        <option value="${item.insurerId}">${item.insurerName}</option>
                        </#list>
                        </select>
						</li>
					</ul>
					<ul class="search-list fn-clear">
					
						<li>
							<label class="name">保险类别</label>
						<select name="classId" class="ui-combobox" id="classId">
						<option value="">全部</option>
						  <#list cList as item>
                        <option value="${item.classId}">${item.className}</option>
                        </#list>
                        </select>
						</li>
						
						<li>
							<label class="name ui-produce-labelname">是否设置产品标签</label>
							<select class="ui-combobox" name="sortCode" id="sortCode">
							<option value="" >全部</option>
								<option value="1" >是</option>
								<option value="2" >否</option>
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
				<a href="${base}/operate/lableList" class="search-btn policy-newcontent">常用标签管理</a>

				<table id="dg-list" class="easyui-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
		</div>
		<!--产品选择标签start-->
		 <div id="dlg" class="easyui-dialog ui-dlg-alert ui-pramalabel-dialog"  data-options="iconCls:'icon-save',modal:true,closed: true">
		   <h3 class="ui-channel-titcolor ui-paramtit-fw">请选择产品标签</h3>
		   <div>	
		   <#list tageList as item>
				<div class="ui-channel-titcolor ui-cbox-item">
					<input type="checkbox" class="ui-cbx-val" value="${item.tagId}">
					<label for="" class="ui-pamam-labelname">${item.tagName}</label>
					<input type="hidden" class="ui-cbx-val" id ="productidstr" />
				</div>
				</#list>
				<div class="ui-cbox-item">	
					<a href="#" id="preParamAdd">自定义</a>
					<span class="ui-preparam-add">
						<input type="text" id="tagsname"  maxlength="10" name="tagsname" class="ui-info-input ui-service-searchpt"/>
          				<a class="ui-toggle-add" href="javascript:;" id=""></a>
					</span>
					
				</div>
		   </div>
		   <input type="button" class="ui-dlgOk-btn" value="确定" id="contentDelete" onclick="savetags()"/>
		   <input type="button" class="ui-dlgCancel-btn" value="取消" id="contentCancel"/>
		 </div>
		 
		 <div id="downok" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">操作成功！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="downsussage()" value="确定"/>
  </div>   
   <div id="downno" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">操作失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="downno()" value="确定"/>
  </div>   
  <div id="downokse" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">请选择标签！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   onclick="downsussagese()" value="确定"/>
  </div>    
		 <!--产品选择标签end-->
	</div>

	<script>
	$(function(){
		validExtend()
		var whichid = 0;
		//列表
		$("#dg-list").datagrid({
			url:'${base}/operate/findlabelView',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'productId',align:'center',width:"6%",title:'产品ID'},
				{field:'productName',align:'center',width:"20%",title:'保险名称',
		          	 formatter:function(value,rec){
			          	 var   url=' ${base}/product/toProductDetailMsgs';
						return '<a class="operation-link" href="'+url+'?productId='+rec.productId+'">'+rec.productName+'</a>';
					  }
				},
				{field:'insurerName',align:'center',width:"10%",title:'承保公司'},
				{field:'minPremium',align:'center',width:"10%",title:'保费金额(元)',
					formatter: function(value,rec){
    	                if(rec.minPremium==rec.maxPremium){
					    return (rec.minPremium/100).toFixed(2);
					}
    	                return (rec.minPremium/100).toFixed(2)+"-"+(rec.maxPremium/100).toFixed(2);
               		}},
				{field:'className',align:'center',width:"10%",title:'保险类别',sortable:true},
				{field:'productSource',align:'center',width:"6%",title:'来源渠道',
				formatter:function(value,rec){
						var str = "其他";
						if(rec.productSource == 1){
							str = "自研";
							return str;
						}else if(rec.productSource == 2){
						str = "保险公司";
						   return str;
						} 
							 return str;
					}
				},
				{field:'tagName',align:'center',width:"35%",title:'产品标签',
					formatter:function(value,rec){
						var str = "<div class='ui-label-editor'><a data-text='1'>"+value+"</a>";
						var pid = "<input type='hidden' id='pidstr' value='"+rec.productId+"' ></input>";
						if(value == ''){
							str =' <div class="ui-label-editor"><a href="javascript:;" data-text="0"><i class="ui-guarant-addfir" href="javascript:;"></i></a>';
						}
						return str+pid+'</div>';
						
					}
				}
			]],
			queryParams: eb.form2Json("search-ff"),
	   loadFilter:function(data){
	            return eb.loadFilter(data);//自定义过滤方法

      },
      onLoadSuccess:function(){
      	 pageCls();
      	 
      	 //点击操作内容显示弹框
      	 $(".ui-label-editor").click(function(event) {
      	 	var arrval = $(this).text().split("/");
			var labels = $(".ui-pamam-labelname");
			var pid=  $(this).find("#pidstr").val();
			$("#productidstr").val(pid);
			showAlert("dlg");
			labels.prev().prop("checked",false);
			
			$.each(arrval,function(i,v){

				$.each(labels,function(j,t){
					if(v == $(t).text()){
						$(this).prev().prop("checked",true);
					}
				})
			})


      	 });
      }
		});
		//分页
		pageAction();

		$("#preParamAdd").click(function(event) {
			$(".ui-preparam-add").show();
		

		});




		
		
   });
	function savetags(){
	    var tagname=$("#tagsname").val();
	    tagname=tagname.replace(/(^\s*)|(\s*$)/g, "");
		var arr = $("#dlg").find(".ui-cbx-val:checked");
		var ids='';
		$.each(arr,function(i,v){
			ids +=v.value+",";
		})
		//if(ids.length==0&&tagname.length==0){
		// showAlert("downokse");
		// return false;
		//}
		var pid=$("#productidstr").val();
		
		  $.ajax({
		  
		        url: '${base}/operate/tagProductsave?ids='+ids+'&pid='+pid+'&tagname='+tagname,
		                 type: 'post',
		                 success: function (result) {
		                 if(result>0){
		                 
		                 showAlert("downok");
		                 }else{
		                   showAlert("downno");
		                 }
		                 }
		             });
	}
	
	      function downsussage(){
	      	$("#downok").dialog("close");
	     	 window.location.href="${base}/operate/labelView";
	      }
	      
	         function downsussagese(){
	      	$("#downokse").dialog("close");
	      }
	      function downno(){
      $("#downno").dialog("close");
	     	 window.location.href="${base}/operate/labelView";
      }
      
       function showText(obj){
   		if(obj.value == 6){
   			$("#t1").css('display','block');
   			$("#t2").css('display','block');
   		}else{
   			$("#t1").css('display','none');
   			$("#t2").css('display','none');
   		}
   }
	</script>
</body>
</html>