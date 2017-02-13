<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>用户管理-商户管理-新增</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
	<script type="text/javascript" src="/js/jquery.form.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
</head>
<script>
  $(document).ready(function(){
		$("#addMerchType").validationEngine({
		maxErrorsPerField: 1
	});
		moneyThousands();
		choseLevelType('select[name="sellerLevel"]','/userManage/sellerManage/selectLimitLevelByLevelId');
	});
	
</script>
<body>
<div id="page-form">
   <div class="ui-main-container">
	<div class="crumbs" id="crumbs">
		<#include "/common/include/power.ftl">
	</div>
   <div class="ui-info-content">
      <form id ="addMerchType" method="post" action="/userManage/sellerManage/addSellerNext" >
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">商户基本信息</h3>
			<div class="ui-infobg">
				<table class="ui-center-tab">
		          <tbody>
		          <tr>
		            <td class="ui-oddtd">用户ID：</td>
		            <td>
		            	<input type="text" name="userId" dataType="reqUserID" class="validate[required] ui-dinput" readOnly>
		            	<a href="javascript:list_dialog('/userManage/sellerManage/addTpl','新增商户弹框',true);" class="ui-trans-btn" >选择</a>
		            </td>
		          </tr>
		          <tr>
		            <td class="ui-oddtd">账户名：</td>
		            <td>
		            	<input type="text" name="username" class="ui-dreadOnly" readOnly>
		            </td>
		          </tr>
		          <tr>
		            <td class="ui-oddtd">实名：</td>
		            <td>
		               <input type="text" name="sellerName" class="ui-dreadOnly" readOnly>
		            </td>
		          </tr>
		          <tr>
		            <td class="ui-oddtd">商户类型：</td>
		            <td>
		            	<select class="ui-dselect" name="sellerType" onchange="choseSellType(this);">
		            	<!--0是普通,1是平台-->
		            	  <#list sellType as list>
		            	  <option value="${list.key}" <#if list.key=='1'>class="pselltype" selected</#if>>${list.value}</option>
		            	  </#list>
		            	</select>
		            </td>
		          </tr>
		           <tr class="platform-part">
		            <td class="ui-oddtd">平台IP地址：</td>
		            <td>
		            	<input type="text" name="sellerIps" maxlength=15 dataType="reqIp" class="validate[required,custom[ipv4]]  ui-dinput">
		            </td>
		          </tr>
		           <tr  class="platform-part">
		            <td class="ui-oddtd">平台域名：</td>
		            <td>
		            	<input type="text" name="sellerDomain" maxlength=120  dataType="reqDomain" class="validate[required,custom[domin]] ui-dinput">
		            </td>
		          </tr>
		          <tr>
		            <td class="ui-oddtd">商户类别：</td>
		            <td>
		            	<select class="ui-dselect" name="sellerLevel" onchange="choseLevelType(this,/userManage/sellerManage/selectLimitLevelByLevelId);">
		            	  <#list userLevel as list>
		            	  <option data-id="${list.id}" value="${list.id}">${list.levelName}</option>
		            	  </#list>
		            	</select>
		            </td>
		          </tr>
				</tbody>
			   </table>
			</div>
		</div>
		
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">收银限额</h3>
			<div class="ui-infobg ui-infobg-line">
			  <table class="ui-info-tab" >
			    <tr>
			      <td class="ui-oddtd">日收银限额：</td>
	              <td>
	            	<input type="text" name="dayMoneyYuan" class="ui-dreadOnly" readOnly> 元
	              </td>
	               <td class="ui-oddtd">月收银限额：</td>
	              <td>
	            	<input type="text" name="monthMoneyYuan" class="ui-dreadOnly" readOnly> 元
	              </td>
	            </tr>
			  </table>
			</div>
		</div>
		
		<div class="ui-info-wrap ui-multi-wrap ui-info-two">
           	<h3 class="ui-info-tit">手续费</h3>
			<div class="ui-infobg">
				<table class="ui-info-tab" width="900" >
			      <tr>
			      	<td class="ui-firtd ui-oddtd" >收银手续费：
			      	  <input type="hidden"  name="feeSellerExtendMdl[0].operType" value="7" />
			      	</td>
			      	<td colspan='3'></td>
			      </tr>
			      <tr class="radio-wrap" data-operType='2'>
			      	<td class="ui-oddtd">手续费类型：</td>
			      	<td colspan='3' class="ui-eventd "> 
			      		<span class="ui-rdo">
			      			<input type="radio" name="feeSellerExtendMdl[0].calculationMethod"  value="0" checked/>
			      			<label for="rdo3">按金额比例</label>
			      		</span>
			      		<span  class="ui-rdo">
			      			<input type="radio" name="feeSellerExtendMdl[0].calculationMethod" value="1"/>
			      			<label for="rdo4">按每笔固定金额</label>
			      		</span>               
			      	</td>
			      </tr>
			      <tr class="ui-lastr">
			      	<td class="ui-oddtd">手续费值：</td>
			      	<td colspan='3' class="ui-eventd fn-fee">
			      		<input type="text" name="feeSellerExtendMdl[0].scale" dataType="reqFeePerc" class="validate[required,custom[integer],min[0],max[100]] ui-dinput ui-dinput-small"/> %
			      		<label class="ui-pos3">下限：</label>
			      		<input type="text" name="feeSellerExtendMdl[0].minimumYuan" dataType="reqFeeBott"   data-valid="minLimit" class="validate[required,custom[number],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      		<label  class="ui-pos3">上限：</label>
			      		<input type="text" name="feeSellerExtendMdl[0].maximumYuan" dataType="reqFeeTop"  data-valid="maxLimit" class="validate[required,custom[number],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      	</td>
			      	<td colspan='3' class="ui-eventd fn-fee fn-hide">
			      		<input type="text" name="feeSellerExtendMdl[0].fixedYuan" dataType="reqFee" class="validate[required,custom[number],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      	</td>
			      </tr>
				</table>
			</div>
			<div id="platform-part" class="ui-infobg2 platform-part">
				<table class="ui-info-tab" width="900"  >
			      <tr>
			      	<td class="ui-firtd ui-oddtd">银行代付手续费：
			      	  <input type="hidden"  name="feeSellerExtendMdl[1].operType" value="8" />
			      	</td>
			      	<td colspan='3'></td>
			      </tr>
			      <tr class="radio-wrap"  data-operType='0'>
			      	<td class="ui-oddtd">手续费类型：</td>
			      	<td colspan='3' class="ui-eventd"> 
			      		<span class="ui-rdo">
			      			<input type="radio" name="feeSellerExtendMdl[1].calculationMethod"  value="0" checked/>
			      			<label for="rdo5">按金额比例</label>
			      		</span>
			      		<span  class="ui-rdo">
			      			<input type="radio" name="feeSellerExtendMdl[1].calculationMethod" value="1"/>
			      			<label for="rdo6">按每笔固定金额</label>
			      		</span>               
			      	</td>
			      </tr>
			      <tr class="ui-lastr">
			      	<td class="ui-oddtd">手续费值：</td>
			      	<td colspan='3' class="ui-eventd fn-fee">
			      		<input type="text" name="feeSellerExtendMdl[1].scale" dataType="reqFeePerc" class="validate[required,custom[integer],min[0],max[100]] ui-dinput ui-dinput-small"/> %
			      		<label class="ui-pos3">下限：</label>
			      		<input type="text" name="feeSellerExtendMdl[1].minimumYuan"  dataType="reqFeeBott" data-valid="min2Limit" class="validate[required,custom[number],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      		<label  class="ui-pos3">上限：</label>
			      		<input type="text" name="feeSellerExtendMdl[1].maximumYuan"   dataType="reqFeeTop" data-valid="max2Limit" class="validate[required,custom[number],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      	</td>
			      	<td colspan='3' class="ui-eventd fn-fee fn-hide">
			      		<input type="text" name="feeSellerExtendMdl[1].fixedYuan"  dataType="reqFee" class="validate[required,custom[number],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      	</td>
			      </tr>
				</table>
			</div>
		</div>
		
		<div class="ui-submit-warp">
	      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
	      <!--<a href="javascript:addBfSubmit('addMerchType');" class="ui-red-btn ui-pos3">下一步</a>-->
	      <input type="submit" class="ui-red-btn ui-pos3" value="下一步"/>
	    </div>
	  </form>
	</div>
  </div>

  <iframe id="dlg-box" class="dlg-box fn-hide" scrolling="auto" frameborder="0"  style="width:950px;height:400px;"></iframe>
  </div>
  <div id="page-result"></div>
    <script type="text/javascript" src="/js/jquery.datagrid.js"></script>
	<script>
	$(function(){
	//处理俩表
	 $("body").delegate('#back', 'click', function(event) {
	        $('input[type="radio"]:checked').each(function(){
	          if($(this).val()==1){
	             $(this).parents('.radio-wrap').next('tr').find('.fn-fee:eq(1)').show();
	             $(this).parents('.radio-wrap').next('tr').find('.fn-fee:eq(0)').hide();
	          }
	        });
            $("#page-form").show();
            $("#page-result").empty();
      });
     $('#addMerchType').ajaxForm({
        beforeSubmit:checkForm,
        target: '#page-result',
        success: function() {
            $('#page-result').fadeIn('slow');
            $("#page-form").hide();
        }
     });
	});
	 function checkForm(){
     $('#addMerchType').find('input[name]').each(function(){
         $('#addMerchType').find('.ui-dinput').blur();
		 //if($('#addMerchType').validationEngine()==undefined || $('#addMerchType').validationEngine("validate")){
		 if($('.formErrorContent').length==0){
			 if($(this).val()==''){
					$(this).val(0);
				}
		    }  
	   });
    }
	</script>
</body>
</html>