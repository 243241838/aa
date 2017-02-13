<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>用户管理-用户类别管理-新增</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
	<script>
	  $(document).ready(function(){
			$("#addUserType").validationEngine({
					maxErrorsPerField: 1
				});
		moneyThousands();
		});
</script>
</head>

<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
		<#include "/common/include/power.ftl">
	</div>
   <div class="ui-info-content">
       <form id ="addUserType" method="post" action="/userManage/userTypeManage/addUserTypeNext" >
		<div class="ui-info-wrap ui-multi-wrap ui-info-two">
           	<h3 class="ui-info-tit">用户类别信息</h3>
			<div class="ui-infobg" style="padding-bottom:5px;">
		      <table class="ui-info-tab ">
			      <tr>
			      	<td class="ui-oddtd">用户类别：</td>
			      	<td><input type="text" id="typeName" name ="levelName"  maxlength=40 dataType="reqUserType" class="validate[required,custom[name],custom[typeName],ajax[ajaxUserType]] ui-dinput ui-dinput-small "/></td>
			      	<td></td><td></td>
			      </tr>
		      </table>
		      </div>
			<div class="ui-infobg2 no-bottbor">
			<table class="ui-info-tab ">
		      <tr>
		      	<td class="ui-oddtd">充值手续费：<input type="hidden"  name="feeLevelExtendMdl[0].operType" value="0" /></td><td></td><td></td><td></td>
		      </tr>
		      <tr class="radio-wrap"  data-operType='3'>
		      	<td class="ui-oddtd">手续费类型：</td>
		      	<td colspan='3' class="ui-eventd"> 
		      		<span class="ui-rdo">
		      			<input type="radio" name="feeLevelExtendMdl[0].calculationMethod" value="0" checked/>
		      			<label for="rdo1">按金额比例</label>
		      		</span>
		      		<span  class="ui-rdo">
		      			<input type="radio" name="feeLevelExtendMdl[0].calculationMethod" value="1"/>
		      			<label for="rdo2">按每笔固定金额</label>
		      		</span>               
		      	</td>
		      </tr>
		      <tr class="ui-lastr">
		      	<td class="ui-oddtd">手续费值：</td>
		      	<td colspan='3' class="ui-eventd fn-fee">
		      		<input type="text" name="feeLevelExtendMdl[0].scale" dataType="reqFeePerc" class="validate[required,custom[integer],min[0],max[100]] ui-dinput ui-dinput-small"/> %
		      		<label class="ui-pos3">下限：</label>
		      		<input type="text" name="feeLevelExtendMdl[0].minimumYuan" dataType="reqFeeBott"  data-valid="minLimit" class="validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
		      		<label  class="ui-pos3">上限：</label>
		      		<input type="text" name="feeLevelExtendMdl[0].maximumYuan" dataType="reqFeeTop" data-valid="maxLimit" class="validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
		      	</td>
		      	<td colspan='3' class="ui-eventd fn-fee fn-hide">
		      		<input type="text" name="feeLevelExtendMdl[0].fixedYuan" dataType="reqFee" class="validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
		      	</td>
		      </tr>
			 </table>
			</div>
			<div class="ui-infobg ">
				<table class="ui-info-tab" >
			      <tr>
			      	<td class="ui-firtd ui-oddtd" >提现手续费：<input type="hidden"  name="feeLevelExtendMdl[1].operType" value="1" /></td>
			      	<td colspan='3'></td>
			      </tr>
			      <tr class="radio-wrap" data-operType='2'>
			      	<td class="ui-oddtd">手续费类型：</td>
			      	<td colspan='3' class="ui-eventd "> 
			      		<span class="ui-rdo">
			      			<input type="radio" name="feeLevelExtendMdl[1].calculationMethod"  value="0" checked/>
			      			<label for="rdo3">按金额比例</label>
			      		</span>
			      		<span  class="ui-rdo">
			      			<input type="radio" name="feeLevelExtendMdl[1].calculationMethod" value="1"/>
			      			<label for="rdo4">按每笔固定金额</label>
			      		</span>               
			      	</td>
			      </tr>
			      <tr class="ui-lastr">
			      	<td class="ui-oddtd">手续费值：</td>
			      	<td colspan='3' class="ui-eventd fn-fee">
			      		<input type="text" name="feeLevelExtendMdl[1].scale"  dataType="reqFeePerc" class="validate[required,custom[integer],min[0],max[100]] ui-dinput ui-dinput-small"/> %
			      		<label class="ui-pos3">下限：</label>
			      		<input type="text" name="feeLevelExtendMdl[1].minimumYuan"  dataType="reqFeeBott" data-valid="minLimit2" class="validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      		<label  class="ui-pos3">上限：</label>
			      		<input type="text" name="feeLevelExtendMdl[1].maximumYuan"  dataType="reqFeeTop" data-valid="maxLimit2" class="validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      	</td>
			      	<td colspan='3' class="ui-eventd fn-fee fn-hide">
			      		<input type="text" name="feeLevelExtendMdl[1].fixedYuan" dataType="reqFee" class="validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      	</td>
			      </tr>
				</table>
			</div>
			<div class="ui-infobg2 no-bottbor">
				<table class="ui-info-tab" >
			      <tr>
			      	<td class="ui-firtd ui-oddtd">转账手续费：<input type="hidden"  name="feeLevelExtendMdl[2].operType" value="2" /></td>
			      	<td colspan='3'></td>
			      </tr>
			      <tr class="radio-wrap"  data-operType='0'>
			      	<td class="ui-oddtd">手续费类型：</td>
			      	<td colspan='3' class="ui-eventd"> 
			      		<span class="ui-rdo">
			      			<input type="radio" name="feeLevelExtendMdl[2].calculationMethod"  value="0" checked/>
			      			<label for="rdo5">按金额比例</label>
			      		</span>
			      		<span  class="ui-rdo">
			      			<input type="radio" name="feeLevelExtendMdl[2].calculationMethod" value="1"/>
			      			<label for="rdo6">按每笔固定金额</label>
			      		</span>               
			      	</td>
			      </tr>
			      <tr class="ui-lastr">
			      	<td class="ui-oddtd">手续费值：</td>
			      	<td colspan='3' class="ui-eventd fn-fee">
			      		<input type="text" name="feeLevelExtendMdl[2].scale" dataType="reqFeePerc" class="validate[required,custom[integer],min[0],max[100]] ui-dinput ui-dinput-small"/> %
			      		<label class="ui-pos3">下限：</label>
			      		<input type="text" name="feeLevelExtendMdl[2].minimumYuan" dataType="reqFeeBott" data-valid="minLimit3" class="validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      		<label  class="ui-pos3">上限：</label>
			      		<input type="text" name="feeLevelExtendMdl[2].maximumYuan" dataType="reqFeeTop" data-valid="maxLimit3" class="validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      	</td>
			      	<td colspan='3' class="ui-eventd fn-fee fn-hide">
			      		<input type="text" name="feeLevelExtendMdl[2].fixedYuan" dataType="reqFee" class="validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      	</td>
			      </tr>
				</table>
			</div>
			<div class="ui-infobg ">
				<table class="ui-info-tab" >
			      <tr>
			      	<td class="ui-firtd ui-oddtd" >	收款手续费：<input type="hidden"  name="feeLevelExtendMdl[3].operType" value="3" /></td>
			      	<td colspan='3'></td>
			      </tr>
			      <tr class="radio-wrap" data-operType='3'>
			      	<td class="ui-oddtd">手续费类型：</td>
			      	<td colspan='3' class="ui-eventd "> 
			      		<span class="ui-rdo">
			      			<input type="radio" name="feeLevelExtendMdl[3].calculationMethod"  value="0" checked/>
			      			<label for="rdo3">按金额比例</label>
			      		</span>
			      		<span  class="ui-rdo">
			      			<input type="radio" name="feeLevelExtendMdl[3].calculationMethod" value="1"/>
			      			<label for="rdo4">按每笔固定金额</label>
			      		</span>               
			      	</td>
			       </tr>
			       <tr class="ui-lastr">
			      	<td class="ui-oddtd">手续费值：</td>
			      	<td colspan='3' class="ui-eventd fn-fee">
			      		<input type="text" name="feeLevelExtendMdl[3].scale" dataType="reqFeePerc" class="validate[required,custom[integer],min[0],max[100]] ui-dinput ui-dinput-small"/> %
			      		<label class="ui-pos3">下限：</label>
			      		<input type="text" name="feeLevelExtendMdl[3].minimumYuan" dataType="reqFeeBott" data-valid="minLimit4" class="validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      		<label  class="ui-pos3">上限：</label>
			      		<input type="text" name="feeLevelExtendMdl[3].maximumYuan" dataType="reqFeeTop" data-valid="maxLimit4" class="validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      	</td>
			      	<td colspan='3' class="ui-eventd fn-fee fn-hide">
			      		<input type="text" name="feeLevelExtendMdl[3].fixedYuan" dataType="reqFee" class="validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"/> 元
			      	</td>
			       </tr>
				</table>
			</div>
		</div>
			<div class="ui-submit-warp">
		      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
		      <a href="javascript:typeBfSubmit('addUserType');" class="ui-red-btn ui-pos3">提 交</a>
		    </div>
		</form>
	</div>
  </div>

</body>
</html>