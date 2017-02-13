/**
 *
 * @authors sh (you@example.org)
 * @date    2015-5-14 14:03:23
 * @version $Id$
 */

 $(function(){
	$('body').delegate('.ui-dlgCancel-btn', 'click', function() {
					$(this).parents('.easyui-dialog').dialog('close');
				});
	$('.ui-back').click(function(){
		history.back();
	});
	
	/*审核显示写理由的textarea*/
	$('.ui-audit-rdo').find('input[type="radio"]').click(function(){
       
       if($(this).val()=='1'){//审核通过
         $('.ui-audit-rdo').siblings('.ui-audit-txta').hide();
       }else{
       	 $('.ui-audit-rdo').siblings('.ui-audit-txta').show();
       }
	});
});

 //列表的公用方法
 var eb = {
		loadFilter : function(data) {
			var value = {
				total : data.succ ? data.total : 0,
				rows : [],
				footer : []
			};
			if (data.succ) {
				if (data.records && data.records.length) {
					for (var i = 0; i < data.records.length; i++) {
						var o = {};
						eb._loadArray(data.records[i], o, "");
						value.rows.push(o);
					}
				}
				if (data.count && data.count.length) {
					for (var i = 0; i < data.count.length; i++) {
						var o = {};
						eb._loadArray(data.count[i], o, "");
						value.footer.push(o);
					}
				}
			}
			if (data.records.length == 0) {
				//$('.ui-nodata').removeClass('fn-hide');
				$('.datagrid-pager').css('visibility', 'hidden');
			} else {
				//$('.ui-nodata').addClass('fn-hide');
				$('.datagrid-pager').css('visibility', 'visible');
			}
			return value;
		},
		_loadArray : function(data, o, pre) {
			if (pre)
				pre = pre + ".";
			for ( var att in data) {
				var row = data[att];
				if (typeof (row) == "object") {
					eb._loadArray(row, o, pre + att);
				} else {
					o[pre + att] = row;
				}

			}
		},
		form2Json : function(id) {
			var arr = $("#" + id).serializeArray()
			var jsonStr = "";
			jsonStr += '{';
			$.each(arr, function(i, field) {
				if (field.value) {
					jsonStr += '"' + field.name + '":"' + field.value + '",'
				}
			});
			jsonStr = jsonStr.length > 1 ? jsonStr.substring(0,
					(jsonStr.length - 1)) : jsonStr;
			jsonStr += '}';
			var json = $.parseJSON(jsonStr);
			return json
		},
		doExcel : function(url, id) {
			var strP = $("#" + id).serialize();
			location.href = url + '?' + strP;
		},
		form2J : function(id) {
			var o = {};
			var a = $("#" + id).serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		},
		form2obj : function(id) {
			var a = $("#" + id).serialize();
			return a;
		},
		formatToYuan : function(sum) {
			var sum = sum;
			var len = sum.length;
			while (len < 3) {
				sum = "0" + sum;
				len++;
			}
			var length = sum.length;
			var yuan = "";
			if (!isNaN(sum)) {
				yuan = sum.substring(0, length - 2) + "."
						+ sum.substring(length - 2);
				return yuan
			} else {
				return "Is not a number";
			}

		},
		ebdialog: function(options) {
					var defaults = {
						btnId:'dlg',
						id:'#btn-finish',
						eventType: "click", //激活事件
						marginTop: "-55px", //调整居中
						Execution: false, //是否直接弹出
						msg: '请勾选需要返奖的记录', //内容
						title: null, //标题
						type: "confirm", //alert,confirm
						operHtml:function(){},
						callback: function() {} //回调事件
					};
					var opts = $.extend(defaults, options);
					var dlghtml='';
					if(opts.type=='alert'){
						dlghtml='<h3 class="ui-dlg-tit">'+opts.msg+'</h3>'
										+'<input type="button" class="ui-dlgOk-btn" value="确定"/>'
									  ;
					}else if(opts.type=='confirm'){
	           dlghtml='<h3 class="ui-dlg-tit">'+opts.title+'</h3>'
										+opts.msg
									  +'<input type="button" class="ui-dlgOk-btn" value="确定"/>'
										+'<input type="button" class="ui-dlgCancel-btn" value="取消"/>';
					}
					opts.operHtml();
					var algObj=$('#'+opts.btnId);
					if(opts.Execution){
						showDlg(algObj,dlghtml);
					}
					

					$('body').delegate('.ui-dlgOk-btn', 'click', function() {
						algObj.dialog('close');
						opts.callback();
					});
					$('body').delegate(opts.id,  opts.eventType, function() {
							showDlg(algObj,dlghtml);
				  });

				  function showDlg(algObj,dlghtml){
				  	algObj.html(dlghtml);
				  	  
						  algObj.dialog({
								iconCls:'icon-save',
								modal: true
							});
							algObj.dialog('open');
				  }
					
		}
};

//搜索和表单验证
function validExtend() {
	var regx = {
		plusint : /^([1-9][\d]{0,7})$/,
		plusint2 : /^([1-9][\d]+)$/,
		plusint3 : /^([1-9][\d]{1,2})$/,
		plusnum : /^([1-9][\d]{0,9}|0)(\.[\d]{1,})?$/,
		numletter : /^[0-9a-zA-Z]+$/,
		tele : /^((400)-(\d{3})-(\d{4}))|(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/,
		tele2 : /[0-9_]+/,
		phone : /^1\d{10}$/,
		money : /^([1-9][\d]{0,}|0)(\.[\d]{1,2})?$/,
		numletchi : /^[\u4e00-\u9fa5a-zA-Z0-9]*$/,
		chinese: /^[\u4e00-\u9fa5]*$/,
		letchi : /^[\u4e00-\u9fa5a-zA-Z]*$/,
		integer:/^\d{1,}$/,
		letter:/^[a-zA-Z]+$/,
		numlettMust:/^(\d+[a-zA-Z]\w*)|([a-zA-Z]+\d\w*)$/,
		verno:/^([0-9]{1,2}[.]){3}[0-9]{1,2}$/,
		app: /^.*[^a][^b][^c]\.(?:app)$/,
		downloadurl: /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i,
    apk:/^.*[^a][^b][^c]\.(?:apk)$/          
	};  

	$.extend($.fn.validatebox.defaults.rules,{
		length: {
				validator: function(_44e, _44f) {
					var len = $.trim(_44e).length;
					return len >= _44f[0] && len <= _44f[1];
				},
				message: "输入长度在{0}与{1}之间"
			},
		maxlen: {
				validator: function(_44e, _44f) {
					var len = $.trim(_44e).length;
					return len >= _44f[0];
				},
				message: "最多输入{0}位"
			},
		moneycompare: {
			validator : function(value, param) {
				var time = $(param[0]).val();
				var d1 = parseInt(time);
				var d2 = parseInt(value);
				if (d1 >= d2) {
					
					return false;
				
				} else {
					return true;
				}
			},
			message : '右区间数字需大于左区间。'
		},
		numCompare: {
			validator : function(value, param) {
				var time = $(param[0]).text();
				var d1 = parseInt(time);
				var d2 = parseInt(value);
				if (d1 >= d2) {
					
					return false;
				
				} else {
					return true;
				}
			},
			message : '销售数量不能大于产品剩余数量。'
		},
		mdNotnull : {
			validator : function(value) {
				var time = $(value).datetimebox('getValue');
		
				if (time == '') {
					return false
				} else {
					return true;
				}
			},
			message : '请选择成立时间。'
		},
		md : {
			validator : function(value, param) {
				var time = $(param[0]).datetimebox('getValue');
				var d1 = $.fn.datebox.defaults.parser(time);
				var d2 = $.fn.datebox.defaults.parser(value);
				if (value.length > 0 && time.length > 0) {
					if (param == "#startDateTime"
							|| param[0].indexOf("#start") != -1||param[0].indexOf("#begin") != -1) {
						return d2 >= d1;
					} else {
						return d2 <= d1;
					}
				} else {
					return true;
				}
			},
			message : '结束日期必须大于或等于起始日期。'
		},
		mdM : {
			validator : function(value, param) {
				var time = $(param[0]).datetimebox('getValue');
				var d1 = $.fn.datebox.defaults.parser(time);
				var d2 = $.fn.datebox.defaults.parser(value);
				if (value.length > 0 && time.length > 0) {
					if ((d2-d1)/(1000*60*60*24)>31) {// 不在一个月内
						$.fn.validatebox.defaults.rules.mdM.message = '不允许超过31天';
						return false;
					} else {
						if (param == "#startTime"
								|| param[0].indexOf("#start") != -1||param[0].indexOf("#begin") != -1) {
							if (d2 < d1) {
								$.fn.validatebox.defaults.rules.mdM.message = '结束日期必须大于或等于起始日期。'
							}
							;
							return d2 >= d1;
						} else {
							if (d2 > d1) {
								$.fn.validatebox.defaults.rules.mdM.message = '结束日期必须大于或等于起始日期。'
							}
							;
							return d2 <= d1;
						}
					}
				} else {
					return true;
				}
			},
			message : ""
		},
		mdMonth : {
			validator : function(value, param) {
				var time = $(param[0]).datetimebox('getValue');
				var d1 = $.fn.datebox.defaults.parser(time);
				var d2 = $.fn.datebox.defaults.parser(value);
				if (value.length > 0 && time.length > 0) {
					if (d2.getYear()!=d1.getYear()||d2.getMonth()!=d1.getMonth()) {// 不在一个月内
						$.fn.validatebox.defaults.rules.mdMonth.message = '不允许跨月选择';
						return false;
					} else {
						if (param == "#startTime"
								|| param[0].indexOf("#start") != -1||param[0].indexOf("#begin") != -1) {
							if (d2 < d1) {
								$.fn.validatebox.defaults.rules.mdMonth.message = '结束日期必须大于或等于起始日期。'
							}
							;
							return d2 >= d1;
						} else {
							if (d2 > d1) {
								$.fn.validatebox.defaults.rules.mdMonth.message = '结束日期必须大于或等于起始日期。'
							}
							;
							return d2 <= d1;
						}
					}
				} else {
					return true;
				}
			},
			message : ""
		},
		monthDay : {
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = /^[0-9]*$/.test(v) && 0 < v
						&& v < 32;
			},
			message : '请输入1到31的整数'
		},
		plusNum : {
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.plusnum.test(v);
			},
			message : '请输入10位以内的正数'
		},
		integer : {
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.integer.test(v);
			},
			message : '只能输入数字整数'
		},
		plusInt : {
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.plusint.test(v);
			},
			message : '请输入8位以内的正整数'
		},
		plusIntOther : {// 证件号码
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.plusint2.test(v);
			},
			message : '只能输入正整数'
		},
		plusIntTwo : {// 证件号码
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.plusint3.test(v);
			},
			message : '只能输入1-99的正整数'
		},
		certNum : {// 证件号码
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.numletter.test(v);
			},
			message : '请输入数字或字母'
		},
		unlineNum : {// 证件号码
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.tele2.test(v);
			},
			message : '请输入数字或_'
		},
		tele : {
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.tele.test(v);
			},
			message : '请输入正确的电话号码'
		},
		phone : {

			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.phone.test(v);
			},
			message : '请输入正确的手机号码'
		},
		numLetChina : {
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.numletchi.test(v);
			},
			message : '请输入汉字，数字或字母'
		},
		chinese:{
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.chinese.test(v);
			},
			message : '请输入汉字'
		},
		letchi:{
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.letchi.test(v);
			},
			message : '请输入汉字或字母'
		},
		money:{
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.money.test(v)||regx.integer.test(v);
			},
			message : '只能输入数字,保留2位小数'
		},
		selectValueRequired: {
         validator: function (value, param) {
             if (value == "" || value.indexOf('选择') >= 0 || value.indexOf('全部') >= 0) { return false; }
             else { return true; }
         },
         message: '必选'
    },
    letter:{
    	validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.letter.test(v);
			},
			message : '只能输入字母'
    },
    numlettMust:{
    	validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.numlettMust.test(v);
			},
			message : '密码错误，请重新输入'
    },
    verNo:{
       validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.verno.test(v);
			},
			message : '输入格式错误'
    },
    downloadurl:{
        validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.downloadurl.test(v);
			},
			message : '请上传正确格式的下载地址'
    }
		
	});
}
//分页
function pageAction(){
			var page=$("#dg-list").datagrid("getPager");
		  $(page).pagination({
		    total:10,
		    pageSize:10,
		    displayMsg:"",
		    layout:['list','sep','first','prev','links','next','last','manual', ],
		    beforePageText: '<span class="ui-page-text ui-page-fir">共20页</span>  <span class="ui-page-text">去第</span>',
		    afterPageText: '<span class="ui-page-text ui-page-last">页</span>',
		    showPageList:false
		  }); 
		}
//分页样式
function pageCls(){
    	 $('.pagination-first').text('首页');
    	 $('.pagination-prev').text('上一页');
    	 $('.pagination-next').text('下一页');
    	 $('.pagination-last').text('末页');
    	 $('.datagrid-pager').find('td').each(function(index){
    	 	if(index==0||index==4){
    	 		 $(this).find('.l-btn').css({'margin-left':'10px','border-right':0});
    	 	}
    	 	if(index==3){
    	 		 $(this).find('.l-btn').css('border-right',0);
    	 	}
    	 });
    }
//搜索提交
function submitForm(form,table){
	if(!form){
		form=$('#search-ff');
	}
	if(!table){
		table=$("#dg-list");
	}
	if(form.form('validate')){
		    //eb.backToFstPage("#datagrid");
			table.datagrid({queryParams : eb.form2Json(form.attr('id'))});
			 pageAction();
		}
	}
//搜索重置
function clearForm(form){
	if(!form){
		form=$('#search-ff');
	}
	form.form('clear');
}
//新增编辑表单提交
function doSubmit(obj){
	var f=$(obj).parents('form');
      if(!f.form('enableValidation').form('validate')){
        //表单信息未填全
        
      }else{
      	f.submit();
      }
   /* f.form('submit',{
				onSubmit:function(){
					return f.form('enableValidation').form('validate');
				},
				success:function(){
				}
			});*/
 
}
//弹框
function showAlert(dlgid){
	 var dlg=$('#'+dlgid);
	     dlg.dialog('open');
}
//表单的取消
function formCancel(id){
  var dlg=$('#'+id);
  showAlert(id);
  dlg.find('.ui-dlgOk-btn').click(function(){
    history.back();
  });
}
//列表的删除
function delRecord(id){
	var dlg=$('#'+id);
  showAlert(id);
  dlg.find('.ui-dlgOk-btn').click(function(){
    alert('删除');
  });
}
//新增版本
/*function IOSadd(id){
   var dlg=$('#'+id);
  showAlert(id);
  dlg.find('.ui-dlgOk-btn').click(function(){
   //新增操作
  });
   /*有俩个弹框 把大弹框的取消改成ui-dlgCancel-twobtn
    dlg.find('.ui-dlgCancel-twobtn').click(function(){
     showAlert('dlg');//弹出小提示框
     $('#dlg').find('.ui-dlgOk-btn').click(function(){
          $('#dlg').dialog('close');
          dlg.dialog('close');
     });
  });
}*/

//保险类别 弹框-添加二级分类
function showAddDlg(obj,dlgId){
   var one_text=$(obj).parents('.ui-guarant-tit').find('.ui-gone').find('strong').text();

  $('#ins-oneType').text(one_text);

 showAlert(dlgId);
 /* var dlg= $('#'+dlgId);
  var dialogParent =dlg.parent();  
  var dialogOwn = dlg.clone();  
  dialogOwn.hide();

  dlg.dialog({
  	onClose:function(){
  		dialogOwn.appendTo(dialogParent);  
      $(this).dialog("destroy").remove();  
  	}
   });
  dlg.dialog('open');*/
 
}
//保险类别 弹框-添加一行二级保险分类
function addInsLine(obj){
	var p=$(obj).parents('li'),
	    thisObj=$(obj).parents('li').clone();
	    redbtn='<a class="ui-guarant-reduce" href="javascript:;" onclick="reduceInsLine(this);"></a>',
	    addbtn='<a class="ui-guarant-addfir" href="javascript:;" onclick="addInsLine(this);"></a>';

    thisObj.insertAfter(p);
    thisObj.find('input').val('');
    $.parser.parse(thisObj);
   if(p.find('.ui-guarant-reduce').length==0){//本体无-
	 	p.append(redbtn);
	 }
   p.hasClass('ui-info-item-grey')?thisObj.removeClass('ui-info-item-grey'):thisObj.addClass('ui-info-item-grey');
   
	 $(obj).remove();
	 if(thisObj.find('.ui-guarant-reduce').length==0){
	 	$(redbtn).insertAfter(thisObj.find('.ui-guarant-addfir'));
	 }

}
//保险类别 弹框-删除一行二级保险分类
function reduceInsLine(obj){
	var p=$(obj).parents('.ui-dlg-ins-item'),
	    redbtn='<a class="ui-guarant-reduce" href="javascript:;" onclick="reduceInsLine(this);"></a>',
	    addbtn='<a class="ui-guarant-addfir" href="javascript:;" onclick="addInsLine(this);"></a>',
	    idx=p.prevAll('.ui-dlg-ins-item').length,
	    total=$(obj).parents('.ui-dlg-ins-list').find('.ui-dlg-ins-item').length;
	   
	   // alert($(obj).parents('.ui-dlg-ins-list').index(p));
    if(p.parents('.easyui-dialog').find('#ins-oneType').length==0){//只新增一级的
        idx++;
        total++;
    }
   if($(obj).prev('.ui-guarant-addfir').length!=0){
	    $(addbtn).insertBefore(p.prev('.ui-dlg-ins-item').find('.ui-guarant-reduce'));
	    if(idx==2&&total==idx+1){
	       p.prev('.ui-dlg-ins-item').find('.ui-guarant-reduce').remove();
	    }
   }else{
      if(idx==1&&total==3){
   		   p.next('.ui-dlg-ins-item').find('.ui-guarant-reduce').remove();
   	  }
   	 
   }
   p.remove();
}
//保险类别 二级类别编辑 isOne=1一级编辑，2二级编辑
function showEditDlg(obj,dlgId,isOne){
	var ont2=tw='';
	if(isOne=='1'){
    ont2=$(obj).parents('.ui-guarant-tit').find('.ui-gone strong').text();
	}else{
    ont2=$(obj).parents('.ui-guarant-tab').siblings('.ui-guarant-tit').find('.ui-gone strong').text(),
    tw=$(obj).parents('tr').find('td:eq(0)').text();
	 
	}
  $('#ins-oneType2').text(ont2);
	  $('.ui-info-input').val(tw);
  showAlert(dlgId);
}


//新增减少一行 产品信息管理新增 客户端发布渠道新增
function moreLine(wrapObj){
    	wrapObj.delegate('.ui-guarant-addfir','click',function(){
        var p=$(this).parents('.ui-resureLimit-inner');
        var copy=p.clone();
        copy.insertAfter(p);
         $.parser.parse(copy);
        if(p.find('.ui-guarant-reduce').length==0){//第一行
        	p.append('<a class="ui-guarant-reduce" href="javascript:;"></a>');
        }
        p.find('.ui-guarant-addfir').remove();


        var thisObj=p.next('.ui-resureLimit-inner');//复制第一个有+无-
        if(thisObj.find('.ui-guarant-reduce').length==0){
        	thisObj.append('<a class="ui-guarant-reduce" href="javascript:;"></a>');
        }
        if(thisObj.find('.numberbox').length>1){
        	thisObj.find('.numberbox:gt(0)').remove();
        }
       
        thisObj.removeClass('ui-resureLimit-fir').addClass('ui-resureLimit-other');
        
        thisObj.find('.easyui-validatebox').val('');
        if(wrapObj.hasClass('ui-resureLimit-wrap')){//产品的
        	thisObj.find('.easyui-numberbox:eq(0)').numberbox('clear');
	        thisObj.find('.ui-info-ssel').children('option:eq(0)').attr('selected');
	        thisObj.find('.get-limit').siblings('em').text('');
	        thisObj.find('.fn-hide').hide();
        }
        

      });

    wrapObj.delegate('.ui-guarant-reduce','click',function(){
      var rp=$(this).parents('.ui-resureLimit-inner');
      var idx=rp.index('.ui-resureLimit-inner'),
          total=wrapObj.find('.ui-resureLimit-inner').length,
          addDoc=$('<a class="ui-guarant-addfir" href="javascript:;"></a>');
      if(rp.hasClass('ui-resureLimit-fir')){
        rp.next('.ui-resureLimit-inner').addClass('ui-resureLimit-fir').removeClass('ui-resureLimit-other');
      }
      if(idx==total-1){//删除最后一行数据
      	addDoc.insertBefore(rp.prev('.ui-resureLimit-inner').find('.ui-guarant-reduce'));
      	if(idx==1){
          rp.prev('.ui-resureLimit-inner').find('.ui-guarant-reduce').remove();
      	}
      }
      if(idx==0&&total==2){//删除第一行数据
          rp.next('.ui-resureLimit-inner').find('.ui-guarant-reduce').remove();
      }
      rp.remove();
    });
}
//文件上传
function uploadFile(obj,url){
	 
		if($(obj).val()!=''){  
		    	var name=$(obj).val(),fileSize = 0;
	      	var type=name.substr(name.lastIndexOf(".")+1).toLocaleLowerCase();
	      	
      	if(!obj.files) {  
      		  if(obj.files!=undefined){
      			  var fileSystem = new ActiveXObject("Scripting.FileSystemObject");         
			        var file = fileSystem.GetFile (obj.value);      
			        fileSize = file.Size;     
      		  }
		    }else { 
		      fileSize = obj.files[0].size;      
		    }    

        if(type!='png'&&type!='jpg'&&type!='bmp'&&type!='apk'&&type!='app'){
      	  alert('格式不正确，请重新上传。');
      	  return;
        }else if(fileSize / 1024>5000){   
      	  alert('不能大于5M。');
	        return;
			  }else{
	        	  $.ajaxFileUpload({
										url : url,
										secureuri : false,
										fileElementId : 'file-wrap', 
										dataType : 'json',
										success : function(data) {
											if(data.succ){
												alert('成功上传！');  
				            		  
				            	}else{
				            		 alert(data.error.message);  
				            	}
										},
										error : function(data) {
											 alert('系统出错，请重试');  
										}
							});
	          }
	      }
}

//详情保障利益的下拉框  insurance==yes保险类别样式
function toggleSub(obj,insurance){
	var tit=$(obj).parents('.ui-guarant-tit');
	
	if(tit.next('.ui-guarant-tab').is(':visible')){
		if(insurance!='yes'){
			tit.css('border-bottom',0);
		}
	}else{
		if(insurance!='yes'){
		   tit.css('border-bottom','1px solid #e7e7e2');
		}
	}
	$(obj).find('.ui-icon-arrow').toggleClass('ui-icon-arrow-up');
	tit.next('.ui-guarant-tab').toggleClass('fn-hide');
}

//富文本框
var editor;
function richEdit(){
	if(typeof(KindEditor)!='undefined'){
	KindEditor.options.filterMode = false;
	KindEditor.ready(function(K) {
		var arryObj=['.richEditor'];
		for(var i=0;i<arryObj.length;i++){
		editor = K.create(arryObj[i], {
			cssPath : '/js/kindeditor/plugins/code/prettify.css',
			uploadJson : '/upload/picture',
			fileManagerJson : '/fileManager/filemanagerJSON',
			allowFileManager : true,
			width:870,
			//allowImageUpload : false,不允许本地上传
	/*		items : [
				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link'],*/
				items:['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
'justifyfull',  'subscript',
'superscript', '|', 'selectall', '-',
'title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold',
'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
'flash', 'media', 'advtable', 'hr', 'emoticons', 'link', 'unlink'],
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}, 
				afterBlur:function(){ 
					this.sync(); 
				} 
		 });
		}
	 });
	}
}
/*-------------------------------改*/
/*产品新增======================start*/
	 //保障利益操作（未完善）
	 function prodProfit(){
   		var dlg=$('#dlgProfit'),dlgAdd=$('#dlgList');
      $('#guarantList').delegate('.ui-profit-chose','click',function(){
          dlg.dialog({modal:true});
          dlg.dialog('open');
      });

      dlg.delegate('.ui-dlgtab-left input[type="checkbox"]','click',function(){
      	if($(this)[0].checked==true){
      		/*ajax请求的数据拼接*/
      		var html=$(' <ul><li><input type="checkbox"/><label>意外身故、伤残</label></li>'
                   +'<li><input type="checkbox"/><label>意外身故、伤残</label></li>'
                   +'</ul>')
      		$(this).parent('.ui-dlgtab-left').next('td').html(html);
      	}else{
          $(this).parent('.ui-dlgtab-left').next('td').html('');
      	}
        
      });  
      dlg.delegate('.ui-dlgOk-btn','click',function(){
      	dlg.dialog('close');
      	dlgAdd.dialog('close');
         dodlgSave();
      });  
      dlgAdd.delegate('.ui-dlgOk-btn','click',function(){
      	dlgAdd.dialog('close');

       
      });  


   		//保障期限的区间
      $('.ui-resureLimit-wrap').delegate('.get-limit','click',function(){
          var secInput=$(this).next('.ui-info-sinput'),
              unit=$(this).prev('.ui-info-ssel').children('option:selected').text();
             
          secInput.next('em').text(' '+unit);
          secInput.show();
      });
      $('.ui-resureLimit-wrap').delegate('select','change',function(){
          var unit=$(this).children('option:selected').text();
          $(this).parents('.ui-resureLimit-inner').find('em').text(' '+unit);
      });

      moreLine($('.ui-resureLimit-wrap'));
    }
	/*产品新增======================end*/

//产品新增 保障利益的对话框
 function dodlgSave(){
 	  $('.ui-guarant-wrap').show();
 	  $('.ui-profit-chose').hide();
 	  var htmlSec='<table class="ui-guarant-tab" width="100%">';
    var htmlFirst='<div class="ui-guarant-tit">'
    	              	+'<a href="javascript:;" onclick="toggleSub(this);" class="ui-gone">'
    	              		+'<strong>医疗保障</strong><i class="ui-icon-arrow"></i></a>'
    	              	+'<span class="ui-gtwo"></span>'
    	              	+'<span class="ui-gthree"></span>'
    	             +'</div>';
    	  var data=['紧急救援','医疗住院'];
    	  for(var i=0;i<data.length;i++){
             htmlSec+='<tr>'
    		       					+'<td width="30%" class="ui-td-fir">'+data[i]+'</td>'
    		       					+'<td width="35%">'
                          +'<input type="text" class="ui-info-sinput"/>'
                            +'<select class="ui-info-sel ui-info-ssel">'
                             +' <option>元</option>'
                             +' <option>千元</option>'
                             +' <option>万元</option>'
                           +' </select>'
                        +'</td>'
    		       					+'<td width="30%">'
                          +' <input type="text" class="ui-info-sinput"/>'
                           +' <select class="ui-info-sel ui-info-ssel">'
                            +'  <option>次</option>'
                            +'  <option>天</option>'
                           +' </select>'
    		       					+'</td>'
    		       				+'</tr>';
    	   }

            htmlSec+='</table>';
            var noProfitItem=$('.ui-guarant-list').find('#noProfitItem');
            if(noProfitItem.length!=0){
              noProfitItem.remove();
            }
            $('.ui-guarant-list').append(htmlFirst+htmlSec);
 }

 (function($) {
	$.fn.extend({
			iScroll:function(options) {
				var defaults = {
					oWrap: "#scroll-list", //form表单
					nTime: 2000 //时间
				};
				var opts = $.extend(defaults, options);

				var _wrap = $(opts.oWrap); //定义滚动区域
				var _interval = opts.nTime; //定义滚动间隙时间
				var _moving; //需要清除的动画
				_wrap.hover(function() {
					clearInterval(_moving); //当鼠标在滚动区域中时,停止滚动
				}, function() {
					_moving = setInterval(function() {
							var _field = _wrap.find('li:first'); //此变量不可放置于函数起始处,li:first取值是变化的
							var _h = _field.height(); //取得每次滚动高度(多行滚动情况下,此变量不可置于开始处,否则会有间隔时长延时)
							_field.animate({
								marginTop: -_h + 'px'
							}, 600, function() { //通过取负margin值,隐藏第一行
								_field.css('marginTop', 0).appendTo(_wrap); //隐藏后,将该行的margin值置零,并插入到最后,实现无缝滚动
							})
						}, _interval) //滚动间隔时间取决于_interval
				}).trigger('mouseleave'); //函数载入时,模拟执行mouseleave,即自动滚动
			}
		});
})(jQuery);
