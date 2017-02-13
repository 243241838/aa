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
    <form id="infoForm" method="post" action="" >

      <div class="ui-info-main">
        <h2 class="ui-info-tit">产品信息</h2>
         <ul class="ui-info-list">
           	<li class="ui-info-item">
           		<label class="ui-info-lbl redrule-item-label">红包规则名称:</label>
           		<input name="ruleName" type="text" class="easyui-validatebox ui-info-input"
              		data-options="required:true,validType:['ajaxBonusName']" missingMessage="请输入红包规则名称" maxlength="30"/>
           	</li>
            <li class="ui-info-item ui-info-item-grey">
           		<label class="ui-info-lbl redrule-item-label redrule-item-label">红包性质:</label>
           		<select class="ui-info-sel" id="redruleNature" name="ruleScopeStr">
	             	<option value="0">非订单类固定金额</option>
                 	<option value="1">订单类固定金额</option>
                 	<option value="2">订单类随机金额</option>
           		</select>
           	</li>
            <li class="ui-info-item fn-hide redrule-noorder-amount">
              <label class="ui-info-lbl redrule-item-label redrule-item-label"></label>
              <input type="button" value="选择发放红包产品" class="ui-btn-blue redrule-selepage"  id="relateProduce"/>
              <!--关联产品数据填充-->
               <div id="relateBox"></div>
            </li>
            <li class="ui-info-item ui-info-item-grey fn-hide redrule-orderfixed-amount">
              <label class="ui-info-lbl redrule-item-label redrule-item-label">采用模式:</label>
              <select class="ui-info-sel" id="adoptionModel" name="bonusType2">
                <option value="1" >固定数值</option>
                <option value="2">按订单比例</option>
              </select>
            </li>
            <li class="ui-info-item ui-info-item-grey fn-hide redrule-orderRadom-amount">
              <label class="ui-info-lbl redrule-item-label redrule-item-label">采用模式:</label>
              <select class="ui-info-sel" id="adoptionModelRadom" name="bonusType3">
                <option value="1" >订单比例模式</option>
                <option value="2">指定最大金额</option>
              </select>
            </li>
            <li class="ui-info-item  fn-hide adoptionmodel-scale">
              <label class="ui-info-lbl redrule-item-label">单个红包金额/订单总金额:</label>
              <input name="bonusAmountStr" type="text" class="easyui-validatebox ui-info-input decimal-pointtwo" 
              	data-options="required:true,validType:'integerParent'" missingMessage="请输入" onkeyup="clearNoNumPoint(this);" /> %
            </li>
            <li class="ui-info-item  fn-hide adopteradom-fixed">
              <label class="ui-info-lbl redrule-item-label">营销费用/订单金额:</label>
              <input name="bonusAmountStr" type="text" class="easyui-validatebox ui-info-input decimal-pointtwo"
              	data-options="required:true,validType:'integerParent'" missingMessage="请输入" onkeyup="clearNoNumPoint(this);" /> %
            </li>
            <li class="ui-info-item  fn-hide adopteradom-scale">
              <label class="ui-info-lbl redrule-item-label">营销费用最大金额:</label>
              <input name="maxValueStr" type="text" class="easyui-validatebox ui-info-input decimal-pointtwo" 
              data-options="required:true,validType:'integerMoney'"/>元
            </li>
            <li class="ui-info-item redrule-singleRed-amount">
              <label class="ui-info-lbl redrule-item-label">单个红包金额:</label>
              <input name="bonusAmountStr" type="text" class="easyui-validatebox ui-info-input decimal-pointtwo" 
              data-options="required:true,validType:'integerMoney'" />元
            </li>
            <li class="ui-info-item ui-info-item-grey fn-hide adoptionmodel-scale">
              <label class="ui-info-lbl redrule-item-label">红包最大金额限制:</label>
              <input name="maxValueStr" type="text" class="easyui-validatebox ui-info-input decimal-pointtwo" 
              data-options="required:true,validType:'integerMoney'"/>元
            </li>
            <li class="ui-info-item ui-info-item-grey ui-resureLimit-wrap fn-clear fn-hide redrule-orderRadom-amount" id="addreduceItem">
              <label class="ui-info-lbl redrule-item-label">单个红包金额：</label> 
                <div class="ui-resureLimit-inner ui-resureLimit-fir">
                  <input  name="configsMap[1].minAmountStr" type="text" value="" class="easyui-validatebox ui-info-sinput produce-item-toggle" 
                        data-options="required:true,validType:['money']" missingMessage="请输入"/> 元
                  <a href="javascript:void(0);" class="ui-info-to get-limit">至</a>
                  <input  name="configsMap[1].maxAmountStr" type="text" value="" class="easyui-validatebox ui-info-sinput fn-hide produce-item-toggle maxredrule-money" 
                         data-options="required:true,validType:['money']" missingMessage="请输入"/><em class="fn-hide"></em>
                  <label class="ui-info-lbl ui-info-lblw">发放比例：</label>
                  <input name="configsMap[1].sendPercent" type="text" value="" class="ui-info-sinput easyui-validatebox produce-item-toggle redrule-percentage" 
                         data-options="required:true,validType:['integer']" missingMessage="请输入" onkeyup="clearNoNum(this);"/> %
                  <a class="ui-guarant-addfir" href="javascript:;"></a>
                  <!--<a class="ui-guarant-reduce" href="javascript:;"></a>-->
              </div>
            </li>
            <li class="ui-info-item  fn-hide redrule-noorder-amount">
              <label class="ui-info-lbl redrule-item-label">红包触发金额:</label>
              <input name="triggerAmountStr" type="text" class="easyui-validatebox ui-info-input decimal-pointtwo" 
              data-options="required:true,validType:'integerMoney'" id="checkParents"/>元
              <input type="checkbox" name="triggerAmountStr" value="0" class="ui-unlimited" />无限制
            </li>
            <li class="ui-info-item ui-info-item-grey">
              <label class="ui-info-lbl redrule-item-label">红包总数量:</label>
              <input name="bonusLimit" type="text" class="easyui-validatebox ui-info-input" 
              data-options="required:true,validType:'integer'"/>个
               <input type="checkbox" name="bonusLimit" value="0" class="ui-unlimited" />无限制
            </li>
           	<li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label ui-info-small">红包发放时间：</label>
              <span data-qb="qb">
             
                <input type="text" name="effTimeStr" id="startTimeStr" class="easyui-datebox ui-info-sinput" data-options="editable: false,required:true" validType="mdMs['#endTimeStr']"/>
                 <em>至</em>
                <input type="text" name="expTimeStr" id="endTimeStr" class="easyui-datebox ui-info-sinput" data-options="editable: false,required:true" validType="mdMs['#startTimeStr']"/> &nbsp;
              </span>
            </li>
           	<li class="ui-info-item ui-info-item-grey">
              <label class="ui-info-lbl redrule-item-label">红包祝福语:</label>
              <input name="bonusWishing" type="text" class="easyui-validatebox ui-info-input" 
              data-options="required:true" />
            </li>
            <li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label">红包备注信息:</label>
              <input name="bonusRemark" type="text" class="easyui-validatebox ui-info-input" 
              data-options="required:true" />
            </li>
			       <li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl redrule-item-label">每人每天最多发放个数:</label>
                <input name="dayUserLimit" type="text" value="" class="easyui-validatebox ui-info-sinput" 
                  data-options="required:true,validType:'integer'" missingMessage="请输入" onkeyup="clearNoNum(this);" id="dailyCount"/>
                   <input type="checkbox" name="dayUserLimit" value="0" class="ui-unlimited" data-lime="1"/>无限制
            </li>
            <li class="ui-info-item">
                <label class="ui-info-lbl redrule-item-label">每天最多发放人数:</label>
                <input name="userLimit" type="text" value="" class="easyui-validatebox ui-info-sinput"
                  data-options="required:true,validType:'integer'" missingMessage="请输入" onkeyup="clearNoNum(this);" id="dayNum"/>
                   <input type="checkbox" name="userLimit" value="0" class="ui-unlimited" data-lime="1"/>无限制
            </li>
            <li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl redrule-item-label">每天最多发放个数:</label>
                <input name="dayLimit" type="text" value="" class="easyui-validatebox ui-info-sinput" 
                  data-options="required:true,validType:'integer'" missingMessage="请输入" onkeyup="clearNoNum(this);" id="dayTotal" readonly/>
                   <input type="checkbox" name="dayLimit" value="0" class="ui-unlimited"  />无限制
            </li>
            <li class="ui-info-item">
              <label class="ui-info-lbl"></label>
              <span style="color:#f00;padding:10px 0;">每天最多发放个数=每人每天最多发放个数*每天最多发放人数</span>
            </li>
          <li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl redrule-item-label">失败是否补发:</label>
                <select class="ui-info-sel" id="redruleReissue" name="autoResendStr" style="width:100px;"> 
                  <option value="1" >是</option>
                  <option value="-1">否</option>
                </select>
               <span> <input name="autoResend" type="text" value="" class="easyui-validatebox ui-info-sinput" 
                data-options="required:true,validType:'integer'" missingMessage="请输入" onkeyup="clearNoNum(this);"/>次  </span>
            </li>
            <li class="ui-info-item fn-hide redrule-orderRadom-amount">
                <label class="ui-info-lbl redrule-item-label">是否采用奖金池模式:</label>
                <select class="ui-info-sel" id="prizePoolModel" name="poolIdSts" style="width:100px;"> 
                  <option value="1">是</option>
                  <option value="0" >否</option>
                </select>
            </li>
            <li class="ui-info-item fn-hide redrule-orderRadom-amount prizepoolmodel-toggle">
                <label class="ui-info-lbl redrule-item-label">奖金池初始金额:</label>
                <input name="bonusPoolStr"  type="text" value="" class="easyui-validatebox ui-info-sinput decimal-pointtwo" 
                  data-options="required:true,validType:'integerMoney'" missingMessage="请输入"/>元 
            </li>
            <li class="ui-info-item ui-info-item-grey fn-hide redrule-orderRadom-amount prizepoolmodel-toggle">
                <label class="ui-info-lbl redrule-item-label">奖金池最低剩余金额/奖金池总金额:</label>
                <input name="maxTakeoutStr"  type="text" value="" class="easyui-validatebox ui-info-sinput decimal-pointtwo" 
                  data-options="required:true,validType:'integerParent'" missingMessage="请输入" onkeyup="clearNoNumPoint(this);" />%  
            </li>
          </ul>
    	</div>
      <div class="ui-btn-double">
        <input type="button" value="下一步" class="ui-btn-blue" onclick="forSubmit();"/>
        <input type="button" value="取消"  class="ui-btn-grey ui-back"/>
      </div>
      </form>
    </div>
    <!--选择弹出框start-->
     <div id="dlgList" class="easyui-dialog ui-dlg-alert ui-select-bigbox"  data-options="iconCls:'icon-save',modal:true,closed: true">
        <iframe src="" frameborder="0" width="100%" height='100%' id="newLoadPage"></iframe>
    </div>
   
</div>
 <div id="produce-result" style="display:none"></div>
<div id="dlgParent" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:430px;">
  <h3 class="ui-dlg-tit">单个红包发放比例总和必须等于100%，请重新分配！</h3>
  <input type="button" class="ui-dlgOk-btn ui-dlgok" value="确定"/>
</div>
<script>
var  selectid='';
$(function(){
	 validExtend();
  	//红包操作
	redruleOperate();
	redruleMoreLine($('.ui-resureLimit-wrap'),['minAmountStr', 'maxAmountStr','sendPercent'],true);
	<#-- 弹出联系人信息-->
    $("#relateProduce").click(function(event) {
        showAlert("dlgList",'','min');
        $("#newLoadPage").attr("src",'/operate/findDomainProduct');
    });
    //返回
     $("body").on('click', '#back', function() {
        $("#produce-add").show();
        $("#produce-result").hide().empty();
        $('body').off('click','#redruleSubmit');
    });
    //默认触发红包性质
     $("#redruleNature").find("option").eq(0).trigger("change");
    
     
        
})

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
	var parent = calculateParent(true);
	if(formbox.form('validate') && parent){
		
		  formbox.submit();
	}
      
}

	
</script>	

</body>
</html>