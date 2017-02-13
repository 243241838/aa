/**
 * 
 * @authors sh (you@example.org)
 * @date 2015-5-14 14:03:23
 * @version $Id$
 */

	if ($.fn.datebox){
	 	
	 	$.fn.datebox.defaults.formatter = function(date){
	 		 var y = date.getFullYear();
			   var m = date.getMonth()+1;
			   var d = date.getDate();
			   function formatNumber(value){
			    return (value < 10 ? '0' : '') + value;
			   }
			   return y+'-'+formatNumber(m)+'-'+formatNumber(d);
	 	};
	 	$.fn.datetimebox.defaults.formatter = function(date){
	 		 var y = date.getFullYear();
			   var m = date.getMonth()+1;
			   var d = date.getDate();
			   var h = date.getHours();
			   var M = date.getMinutes();
			   var s = date.getSeconds();
			   function formatNumber(value){
			    return (value < 10 ? '0' : '') + value;
			   }
			   return y+'-'+formatNumber(m)+'-'+formatNumber(d)+' '+formatNumber(h)+':'+formatNumber(M)+':'+formatNumber(s);
	 	};
	 	$.fn.datebox.defaults.parser = function(s){
	 		if (!s) return new Date();
	 		var ss = s.split('-');
	 		var y = parseInt(ss[0],10);
	 		var m = parseInt(ss[1],10);
	 		var d = parseInt(ss[2],10);
	 		if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
	 			return new Date(y,m-1,d);
	 		} else {
	 			return new Date();
	 		}
	 	};
	 }
	 
 $(function(){
		
	$('body').delegate('.ui-dlgCancel-btn', 'click', function() {
					$(this).parents('.easyui-dialog').dialog('close');
				});
	$('body').delegate('.ui-dlgOkcancel-btn,.ui-dlgok', 'click', function() {
		$(this).parents('.easyui-dialog').dialog('close');
	});
	
	$('.ui-back').click(function(){
		history.back();
	});
	
	$("#reason").text("审核通过");
	/* 审核显示写理由的textarea */
	$('.ui-audit-rdo').find('input[type="radio"]').click(function(){
       var isstate = $("#reason");
       if($(this).val()=='1'){// 审核通过
         $('.ui-audit-rdo').siblings('.ui-audit-txta').hide();
         if(isstate){
        	 isstate.text("审核通过");
         }
       }else{
       	 $('.ui-audit-rdo').siblings('.ui-audit-txta').show();
       	if(isstate){
       		isstate.text("");
        }
       }
	});
	/*审核页面选择审核不通过后，在打开新连接后的返回*/
	 if($('.ui-audit-rdo').find('input[type="radio"]:checked').val()=='-1'){
	      $('.ui-audit-txta').removeClass('fn-hide');
	     $('.ui-audit-txta').find('textarea').text('');
	    }else{
	      $('.ui-audit-txta').addClass('fn-hide');
	    }
	
 

	
	$('body').delegate('.easyui-millesimal','blur',function(){
		$(this).val(fmoney($(this).val(),2));
	});
	
	$('.ui-td-article').hover(function(){
        $(this).children('.ui-hover-tip').text($(this).find('p').text()).show();
    },function(){
         $(this).children('.ui-hover-tip').hide();
    });
	
	// 自定义保费范围输入框
	var custombox = $("#customToggle");
	$("#transaceAmount").change(function(event) {
		var val = $(this).val();
		if(val == 10||val==6){// 保费6自定义，交易金额10自定义
				custombox.show();
		}else{
				custombox.hide();
		}
	});
	
	intOnly();
	
	/*
	限制小数点后两位,之后就不能输入
	*/
	$(".decimal-pointtwo").keyup(function(){
		 $(this).val(this.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'));
	})
	$(".decimal-ptblur").blur(function(){
		roundNumber(this,this.value,2);
	})
	
	    
});
 //自动保留小数点后两位
 function roundNumber(obj,number,decimals) {
		var newString;
		decimals = Number(decimals);
		if (decimals < 1) {
			newString = (Math.round(number)).toString();
		} else {
			var numString = number.toString();
			if (numString.lastIndexOf(".") == -1) {
				numString += ".";
			}
			var cutoff = numString.lastIndexOf(".") + decimals;
			var d1 = Number(numString.substring(cutoff,cutoff+1));
			var d2 = Number(numString.substring(cutoff+1,cutoff+2));
			if (d2 >= 5) {
				if (d1 == 9 && cutoff > 0) {
					while (cutoff > 0 && (d1 == 9 || isNaN(d1))) {
						if (d1 != ".") {
							cutoff -= 1;
							d1 = Number(numString.substring(cutoff,cutoff+1));
						} else {
							cutoff -= 1;
						}
					}
				}
				d1 += 1;
			} 
			if (d1 == 10) {
				numString = numString.substring(0, numString.lastIndexOf("."));
				var roundedNum = Number(numString) + 1;
				newString = roundedNum.toString() + '.';
			} else {
				newString = numString.substring(0,cutoff) + d1.toString();
			}
		}
		if (newString.lastIndexOf(".") == -1) {
			newString += ".";
		}
		var decs = (newString.substring(newString.lastIndexOf(".")+1)).length;
		for(var i=0;i<decimals-decs;i++) newString += "0";
		
		$(obj).val(newString); 
	}
/*
 * 箭头前后数据的变化 文本比较目标元素ui-price-infor 文本比较改变元素ui-price-inforcheck
 * 图片比较目标元素ui-pictures 图片比较改变元素ui-pictures-check 日期比较目标元素ui-date-source
 * 日期比较改变元素ui-date-check 父类元素ui-infocheck-item
 */
function checkInformate(){
	
		// 验证数据和日期类型是否相同
		var texts = $(".ui-price-infor"),
			textchecks = $(".ui-price-inforcheck"),
			dates = $(".ui-date-source"),
			dateschecks = $(".ui-date-check"),
			pictures = $(".ui-pictures"),
			picturechecks = $(".ui-pictures-check"),
			startstop = $(".ui-starttop"),
			starttopchecks = $(".ui-starttop-check"),
			sted = $("#produceSted");
		
		
	// 日期 比较是否相同
	$.each(dates,function(i,v){

		var ischange = new Date($(v).text()) - new Date($(dateschecks).eq(i).text()) != 0,
			
			target = $(dateschecks).eq(i).parents(".ui-infocheck-item");
		ischange ? target.show() : target.hide() ;

	})
	
	// 文字比较是否相同
	$.each(texts,function(i,m){
		var ischange = $(m).text().trim() != $(textchecks).eq(i).text().trim(),
			target = $(textchecks).eq(i).parents(".ui-infocheck-item");
		ischange ? target.show() : target.hide();
	})
	
	// 图片比较是否相同
	$.each(pictures,function(i,n){
	
		var ischange = ischange = $(n).attr("src") != $(picturechecks).eq(i).attr("src"),
			target = $(picturechecks).eq(i).parents(".ui-infocheck-item");
		ischange ? target.show() : target.hide();

	})
	

	// 日期起止时间比较
	if(sted){
		var date1 = new Date($(startstop).eq(0).text().trim()) - new Date($(starttopchecks).eq(0).text().trim()) != 0;
		var date2 = new Date($(startstop).eq(1).text().trim()) - new Date($(starttopchecks).eq(1).text().trim()) != 0;
		var sttarget = $(starttopchecks).eq(1).parents(".ui-infocheck-item");
		if(date1 && date2){
			sttarget.show();
		}else{
			sttarget.hide();
		}
	}
	
	
		
}	
 function checkDate(obj){
	   
		var  timestart = obj.find(".date-timestart"),
			 timeend = obj.find(".date-timeend"),
	      	 targets = obj.find(".showMessage"),
		     timestartval = '', timeendval = '',
		     strstart = '',strend ='',
		     istimes = true,istimee = true;
			
		$.each(timestart,function(i,v){
			
			 timestartval = timestart.eq(i).datebox('getValue');
			 target = timestart.eq(i).parents('.ui-month-base').find(".showMessage");
			 strstart ='';
			 if(timestartval == ''){
					strstart = "请输入开始时间";
					istimes = false;
					
			}
			 target.text(strstart);
		})
		
		$.each(timeend,function(i,v){
			
			 timestartval = timeend.eq(i).datebox('getValue');
			 target = timeend.eq(i).parents('.ui-month-base').find(".showMessage");
			 strstart ='';
			 if(timestartval == ''){
					strstart = "请输入结束时间";
					istimee = false;
					
			}
			 target.text(strstart);
		})
		
	      if(  istimes && istimee){
	       	    return true;
	      }
	      return false;
		  		    
}
function getString(obj){
		var str = '';	
		$.each(obj,function(i,v){
			
			var value = $(this).text(),
				name = $(this).attr("name");
  		
  		str += name+"="+value+"&";
  	
  	})
  	str = str.substring(0,str.length-1);
  	return str;
}
 // 时间格式化
// 时间格式 年月日时分秒
function formatTimestamp(timestamp) {
 	if (timestamp) {
 		var date = new Date(timestamp);
 		var y = date.getFullYear();
 		var m = date.getMonth() + 1;
 		var d = date.getDate();
 		var h = date.getHours();
 		var mi = date.getMinutes();
 		var s = date.getSeconds();
 		return y + '-' + (m < 10 ? ('0' + m) : m) + '-'
 				+ (d < 10 ? ('0' + d) : d) + ' ' + (h < 10 ? ('0' + h) : h)
 				+ ':' + (mi < 10 ? ('0' + mi) : mi) + ':'
 				+ (s < 10 ? ('0' + s) : s);
 	} 
 		return;
 };
 // 时间格式 年月日
 function formatDate(date) {
      var dateStr=date;
 	if (date) {
 		date = new Date(date);
 		var y = date.getFullYear();
 		var m = date.getMonth() + 1;
 		var d = date.getDate();
 		if(isNaN(y) || isNaN(m) || isNaN(d)){
 			return dateStr;
 		}
 		return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
 	} else
 		return;
 };
 var totalPage=0,totalNumber=0,moreDlelist=1;
 var totalPage1=0,totalNumber1=0;
 // 列表的公用方法
 var eb = {
		loadFilter : function(data) {
			var value = {
				total : data.succ ? data.total : 0,
				rows : [],
				footer : []
			};
			totalPage=data.pageCount;
			totalNumber = data.total;
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
				$('.datagrid-view').next('.no-data').remove();
				$('<div class="no-data"><p class="no-data-icon"></p><p>无搜索结果</p></div>').insertAfter('.datagrid-view');
				// $('.datagrid').html('<div class="no-data"><p
				// class="no-data-icon"></p><p>无搜索结果</p></div>');
				$('.datagrid-pager').css('visibility', 'hidden');
				
				if(moreDlelist){
					$("#dg-list2").parent('.datagrid-view').next('.no-data').remove();
					$("#dg-list2").parent('.datagrid-pager').css('visibility', 'visible');
				}
			} else {
				$('.datagrid-view').next('.no-data').remove();
				$('.datagrid-pager').css('visibility', 'visible');
			}
			//鼠标移动上去显示完整内容
			//$("#dg-list").datagrid('doCellTip',{'max-width':'300px','delay':500});
			return value;
		},
		loadTreeFilter : function(data) {
			totalPage1=data.pageCount;
			totalNumber1 = data.total;
			return data.records;
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
	    formatToThousands:function(num){
	    	  return (num.toFixed(2) + '').replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
	    },
	    fenToThousands : function(fen){
	    	if(!isNaN(fen)){
	    		return eb.formatToThousands(Number(fen)/100);
	    	}else{
	    		return "0.00";
	    	}
	    	
	    },
	    doCallSubmit:function(cofig){//一般提交后有操作的
	    	var odata={
	    		obj:'',
	    		dlgYes:'dlgYes',
	    		dlgNo:'dlgNo',
	    		callback:function(){}
	    	};
	    	odata=$.extend(odata,cofig);
	    	$(odata.obj).attr("disabled", true);
	    	var form=$(odata.obj).parents('form');
	    	if(form.form('enableValidation').form('validate')){
	    		$.ajax({
	    	  		url:form.attr('action') ,
	    	  		type: 'post',
	    	  		dataType: 'json',
	    	  		data: form.serialize(),
	    	  		success:function(data){
	    	  			var dlg='';
	    	  			if(data.succ){
	    	  				odata.callback();
	    	  			}else{
	    	  				showAlert(odata.dlgNo,data.error.message);
	    	  				dlg=$('#'+odata.dlgNo);
	    	  			}
	    	  			$(odata.obj).removeAttr('disabled');
	    	  		},
	    	  		error:function(){
	    	  			alert('系统错误，请重试');
	    	  			$(odata.obj).removeAttr('disabled');
	    	  		}
	    		});
	    	}else{
	    		$(odata.obj).removeAttr('disabled');
	    	}
	    }
};

// 搜索和表单验证
function validExtend() {
	var regx = {
		plusint : /^([1-9][\d]{0,7})$/,
		plusnum : /^([1-9][\d]{0,9}|0)(\.[\d]{1,})?$/,
		numletter : /^[0-9a-zA-Z]+$/,
		tele : /^((400)-(\d{3})-(\d{4}))|(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/,
		phone : /^1\d{10}$/,
		money : /^([1-9][\d]{0,}|0)(\.[\d]{1,2})?$/,
		discountmoney : /^([1-9][\d]{0,}|0)?$/,
		cutmoney :  /^([1-9][\d]{0,}|0)(\.[\d]{0,2})?$/,
		numletchi : /^[\u4e00-\u9fa5a-zA-Z0-9]*$/,
		numlet : /^[a-zA-Z0-9]*$/,
		chinese: /^[\u4e00-\u9fa5]*$/,
		letchi : /^[\u4e00-\u9fa5a-zA-Z]*$/,
		integer:/^\d{1,}$/,
		letter:/^[a-zA-Z]+$/,
		numlettMust:/^(\d+[a-zA-Z]\w*)|([a-zA-Z]+\d\w*)$/,
		verno:/^([0-9]{1,2}[.]){3}[0-9]{1,2}$/,
		app: /^.*[^a][^b][^c]\.(?:app)$/,
		downloadurl: /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i,
        apk:/^.*[^a][^b][^c]\.(?:apk)$/,
        numchina: /^[\u4e00-\u9fa50-9]*$/,
        code:/^(\d+[a-zA-Z]\w*)|([a-zA-Z]+\d\w*)$/,
        percentage : /^[1-9]{1}[0-9]?$/,
	};  

	$.extend($.fn.validatebox.defaults.rules,{
		 radio: {//radio必选
             validator: function (value, param) {
                 var frm = param[0], groupname = param[0], ok = false;
                 $('input[name="' + groupname + '"]', document[frm]).each(function () { //查找表单中所有此名称的radio
                     if (this.checked) { ok = true; return false; }
                 });
                 return ok
             },
             message: '请选择审核意见。'
         },
		length: {
				validator: function(_44e, _44f) {
					var len = $.trim(_44e).length;
					if(_44f.length==1){
						
						if(len != _44f[0]){
							$.fn.validatebox.defaults.rules.length.message="只能输入{0}位";
							return false;
						}else{
							return true;
						}
					}else{
						
						if(len < _44f[0] || len > _44f[1]){
							$.fn.validatebox.defaults.rules.length.message="只能输入{0}-{1}位"
							return false;
						}else{
							return true;
						}
					}
					
				},
				message: ""
			},
		limitNum: {
				validator: function(_44e, _44f) {
					var len = $.trim(_44e);
					if( parseInt(_44f)!=-1){
					if(parseInt(len) > parseInt(_44f)){
						return false;
					}else{
						return true;
					}}else{
						return true;
					}
					
				},
				message: "库存不足！"
		},
		interval : {
			validator: function(_44e, _44f) {
				var val = $.trim(_44e);
				var min = _44f[0];
				var max = _44f[1];
				var maxquer = _44f[2];
				if(parseInt(maxquer)==-1&&parseInt(val) > parseInt(min)){
					return true;
				}else{
				if(parseInt(val) < parseInt(min)){
					$.fn.validatebox.defaults.rules.interval.message="销售数量最低为{0}份"
						return false;
				}else if(parseInt(maxquer)!=-1&&parseInt(val) > parseInt(max)){
					$.fn.validatebox.defaults.rules.interval.message="库存不足"
						return false;
				}else{
					return true;
				}
			}
			},
			message: ""
		},
		maxlen: {
				validator: function(_44e, _44f) {
					var len = $.trim(_44e).length;
					return len <= _44f[0];
				},
				message: "最多输入{0}位"
			},
		moneycompare: {
			validator : function(value, param) {
				var time = $(param[0]).val();
				var d1 = parseFloat(time);
				var d2 = parseFloat(value);
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
				var d1 = parseFloat(time);
				var d2 = parseFloat(value);
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
		mdMs : {
			validator : function(value, param) {
			
				var time = $(param[0]).datetimebox('getValue');
				var d1 = time;
				var d2 = value;
				if (value.length > 0 && time.length > 0) {
					if (param == "#startDateTime" || param[0].indexOf("#start") != -1||param[0].indexOf("#begin") != -1) {
						
						if ($($(param)[0]).parents('span[data-qb="qb"]').length!=0&&d2 < d1) {
							$.fn.validatebox.defaults.rules.md.message = '最晚起保时间需大于最早起保时间';
						}
						return d2 > d1;
					} else {
						if ($($(param)[0]).parents('span[data-qb="qb"]').length!=0&&d2 > d1) {
							$.fn.validatebox.defaults.rules.md.message = '最晚起保时间需大于最早起保时间';
						}
						return d2 <= d1;
					}
				} else {
					return true;
				}
			},
			message : '结束日期必须大于或等于起始日期。'
		},
		mdMscheck : {
			validator : function(value, param) {
				alert(param)
				var time = $(param[0]).datebox('getValue');
				var d1 = time;
				var d2 = value;
				if (value.length > 0 && time.length > 0) {
					if (param == "#startDateTime" || param[0].indexOf("#start") != -1||param[0].indexOf("#begin") != -1) {
						
						if ($($(param)[0]).parents('span[data-qb="qb"]').length!=0&&d2 < d1) {
							$.fn.validatebox.defaults.rules.md.message = '最晚起保时间需大于最早起保时间';
						}
						return d2 > d1;
					} else {
						if ($($(param)[0]).parents('span[data-qb="qb"]').length!=0&&d2 > d1) {
							$.fn.validatebox.defaults.rules.md.message = '最晚起保时间需大于最早起保时间';
						}
						return d2 <= d1;
					}
				} else {
					return true;
				}
			},
			message : '结束日期必须大于或等于起始日期。'
		},
		md : {
			validator : function(value, param) {
				var time = $(param[0]).datetimebox('getValue');
				var d1 = $.fn.datebox.defaults.parser(time);
				var d2 = $.fn.datebox.defaults.parser(value);
				if (value.length > 0 && time.length > 0) {
					if (param == "#startDateTime" || param[0].indexOf("#start") != -1||param[0].indexOf("#begin") != -1) {
						
						if ($($(param)[0]).parents('span[data-qb="qb"]').length!=0&&d2 < d1) {
							$.fn.validatebox.defaults.rules.md.message = '最晚起保时间需大于最早起保时间';
						}
						return d2 >= d1;
					} else {
						if ($($(param)[0]).parents('span[data-qb="qb"]').length!=0&&d2 > d1) {
							$.fn.validatebox.defaults.rules.md.message = '最晚起保时间需大于最早起保时间';
						}
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
						if (param == "#startTime" || param[0].indexOf("#start") != -1||param[0].indexOf("#begin") != -1) {
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
		integerParent : {
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				var dj = regx.money.test(v)||regx.integer.test(v);
				if(dj && v<=100 && v>0){
					return true;
				}
				return false;
			},
			message : '请输入0-100的整数或小数 '
		},
		plusInt : {
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.plusint.test(v);
			},
			message : '请输入8位以内的正整数'
		},
		certNum : {// 证件号码
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.numletter.test(v);
			},
			message : '请输入数字或字母'
		},
		parcenty : {// 百分比
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.percentage.test(v);
			},
			message : '请输入1-99的整数'
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
		discount:{
			validator : function(_44e, _44f) {
				var v = $.trim(_44e).replace(',',''),dj = false;
				if(0 <=v && v<100){
					dj = regx.discountmoney.test(v);
				}
				return dj;
			},
			message : '输入正确的折扣比例'
		},
		numLet : {
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.numlet.test(v);
			},
			message : '请输入数字或字母'
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
		numChina:{
			validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.numchina.test(v);
			},
			message : '只能输入汉字或数字'
		},
		money:{
			validator : function(_44e, _44f) {
				var v = $.trim(_44e).replace(',','');
				return dj = regx.money.test(v)||regx.integer.test(v);
			},
			message : '只能输入数字'
		},
		noZeroMoney:{
			validator : function(_44e, _44f) {
				var v = $.trim(_44e).replace(',','');
				return dj = regx.money.test(v) && v>0;
			},
			message : '只能输入数字'
		},
		customMoney :{
			validator : function(_44e, _44f) {
				var v = $.trim(_44e).replace(',','');
				return dj = regx.cutmoney.test(v)||regx.integer.test(v);
			},
			message : '只能输入数字'
		}, 
		integerMoney :{
			validator : function(_44e, _44f) {
				var v = $.trim(_44e).replace(',','');
				return dj = regx.money.test(v)||regx.integer.test(v);
			},
			message : '只能输入数字和点'
		}, 
		selectRequired: {
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
	    },
		email: {
			validator: function(_44c) {
				return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(_44c);
			},
			message: "只能输入数字、字母或字符"
		},
		equals: { 
			validator: function (value, param) { 
				return $(param[0]).val() == value; 
		    },
		    message: '' 
		},
		code:{
	    	validator : function(_44e, _44f) {
				var v = $.trim(_44e);
				return dj = regx.code.test(v);
			},
			message : '密码错误，请重新输入'
        },
		ajaxUserPwd: {
			validator: function(_450, _451) {
				var data = {};
				var _452 = $.ajax({
					url:'/operator/checkPassword',
					dataType: "json",
					data: data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return _452 == "true";
			},
			message: "密码错误"
		},
		ajaxChannelName: {
			validator: function(_450, _451) {
				var data = _450;
				var _452 = $.ajax({
					url:'/channelmanager/addDomainsInfoParamsCheck',
					dataType: "json",
					data : "domainName="+data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return JSON.parse(_452).success == "true";
			},
			message: "该分销商已存在"
		}, 
		ajaxNumbere: {
			validator: function(_450, _451) {
				var data = _450;
				var _452 = $.ajax({
					url:'/channelmanager/addDomainsInfoParamsCheck',
					dataType: "json",
					data : "domainId="+data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return JSON.parse(_452).success == "true";

			},
			message: "分销商编号已存在"
		},
		ajaxTelcomName: {
			validator: function(_450, _451) {
				var data = _450;
				var _452 = $.ajax({
					url:'/telcom/addTelcomDomainsInfoParamsCheck',
					dataType: "json",
					data : "domainName="+data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return JSON.parse(_452).success == "true";
			},
			message: "该分销商已存在"
		}, 
		ajaxTelcomNumbere: {
			validator: function(_450, _451) {
				var data = _450;
				var _452 = $.ajax({
					url:'/telcom/addTelcomDomainsInfoParamsCheck',
					dataType: "json",
					data : "domainCode="+data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return JSON.parse(_452).success == "true";

			},
			message: "分销商编号已存在"
		},
		ajaxSalesmanID: {
			validator: function(_450, _451) {
				var data = _450;
				var _452 = $.ajax({
					url:'/agent/addSalesmanCheck',
					dataType: "json",
					data : "salesamanId="+data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return JSON.parse(_452).success == "true";
			},
			message: "该代理ID已存在"
		}, 
		ajaxSalesmanNumbere: {
			validator: function(_450, _451) {
				var data = _450;
				var _452 = $.ajax({
					url:'/agent/addSalesmanCheck',
					dataType: "json",
					data : "salesamanUser="+data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return JSON.parse(_452).success == "true";

			},
			message: "代理人账号已存在"
		},
		ajaxSalesmanName: {
			validator: function(_450, _451) {
				var data = _450;
				var _452 = $.ajax({
					url:'/agent/addSalesmanCheck',
					dataType: "json",
					data : "salesamanName="+data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return JSON.parse(_452).success == "true";
			},
			message: "该代理人名称已存在"
		}, 
		ajaxDomainUserName: {
			validator: function(_450, _451) {
				var data = _450;
				var _452 = $.ajax({
					url:'/domain/checkDomainUserName',
					dataType: "json",
					data : "username="+data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return JSON.parse(_452).success == "true";
			},
			message: "该账户已存在"
		}, 
		ajaxoper: {//操作员唯一性
			validator: function(_450, _451) {
				var data = {fieldValue:_450};
				var _452 = $.ajax({
					url:'/operator/isExistsNickname',
					dataType: "json",
					data: data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return $.parseJSON(_452).succ;
			},
			message: "该操作员账号已存在！"
		},
		ajaxPayId: {//支付渠道ID唯一性
			validator: function(_450, _451) {
				var data = {domainId:_450};
				var _452 = $.ajax({
					url:'/businessmanager/addDomainsInfoParamsCheck',
					dataType: "json",
					data: data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return $.parseJSON(_452).succ;
			},
			message: "该支付渠道ID已存在！"
		},
		ajaxPayName: {//支付渠道名称唯一性
			validator: function(_450, _451) {
				var data = {domainName:_450};
				var _452 = $.ajax({
					url:'/businessmanager/addDomainsInfoParamsCheck',
					dataType: "json",
					data: data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return $.parseJSON(_452).succ;
			},
			message: "该支付渠道名称已存在！"
		},
		ajaxInsure: {//保险名称唯一性
			validator: function(_450, _451) {
				var data = {productName:_450};
				var _452 = $.ajax({
					url:'/product/checkProName',
					dataType: "json",
					data: data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return $.parseJSON(_452).succ;
			},
			message: "该保险名称已存在！"
		},
		ajaxBonusName: {//红包规则名称唯一性
			validator: function(_450, _451) {
				var data = {ruleName:_450};
				var _452 = $.ajax({
					url:'/operate/checkBonusName',
					dataType: "json",
					data: data,
					async: false,
					cache: false,
					type: "post"
				}).responseText;
				return $.parseJSON(_452).succ;
			},
			message: "该红包规则名称已存在！"
		},
		maxbuyQuota:{//最大投保份数
			validator : function(_44e, _44f) {
			
				var v = $.trim(_44e);
				var num=$('input[name="maxQuantity"]').val();
				if(num!=''){
					return parseFloat(num)>=parseFloat(v);
				}else{
					return true;
				}
				
			},
			message : '投保份数不能大于产品总量'
		},
		selectNotEmpty:{
			validator:function(value, param){
				if(value==''){
					return false;
				}else{
					return true;
				}
			},
			message:'请选择！'
		}
		
	});
	//删除和恢复验证
	$.extend($.fn.validatebox.methods, {    
	    remove: function(jq, newposition){    
	        return jq.each(function(){    
	            $(this).removeClass("validatebox-text validatebox-invalid").unbind('focus').unbind('blur');  
	        });    
	    },  
	    reduce: function(jq, newposition){    
	        return jq.each(function(){    
	           var opt = $(this).data().validatebox.options;  
	           $(this).addClass("validatebox-text").validatebox(opt);  
	        });    
	    }     
	});  
}
//限制小数点后两位
function limeDecimal(obj){
  	 $(obj).val(obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'));
}
function clearNoNum(obj){
	//只能输入整数
    obj.value = obj.value.replace(/^[0][0-9]/g,"")
    obj.value = obj.value.replace(/[^\d]/g,""); //清除"数字"和"."以外的字符
    obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字而不是    
}
function clearNoNumPoint(obj){
	//只能输入整数
    obj.value = obj.value.replace(/^[0][0-9]/g,"")
    obj.value = obj.value.replace(/[^\d\.]/g,""); //清除"数字"和"."以外的字符
    obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字而不是    
}
// 分页
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

//分页     5行
function pageAction2(){
			var page=$("#dg-list").datagrid("getPager");
		  $(page).pagination({
		    total:5,
		    pageSize:5,
		    displayMsg:"",
		    layout:['list','sep','first','prev','links','next','last','manual', ],
		    beforePageText: '<span class="ui-page-text ui-page-fir">共20页</span>  <span class="ui-page-text">去第</span>',
		    afterPageText: '<span class="ui-page-text ui-page-last">页</span>',
		    showPageList:false
		  });  
		}
// 分页样式
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
    	 $('.ui-page-fir').text('共'+totalPage+'页,'+totalNumber+'条记录');
    
    }
// 排序要显示箭头的，以数组形式传
function sortCell(arr){
	for(var i=0;i<arr.length;i++){
		$('.datagrid-header td[field="'+arr[i]+'"]').find(".datagrid-cell").addClass('datagrid-sort-desc');
	}
}
// 搜索提交
function submitForm(form,table){
	if(!form){
		form=$('#search-ff');
	}
	if(!table){
		table=$("#dg-list");
	}
	if(form.form('validate')){
		    // eb.backToFstPage("#datagrid");
			table.datagrid({queryParams : eb.form2Json(form.attr('id'))});
			 pageAction();
		}
	}

	// 搜索提交
function submitForm2(form,table){
	if(!form){
		form=$('#search-ff');
	}
	if(!table){
		table=$("#dg-list");
	}
	if(form.form('validate')){
		    // eb.backToFstPage("#datagrid");
			table.datagrid({queryParams : eb.form2Json(form.attr('id'))});
			 pageAction2();
		}
	}
/*===========================以下为树形表格方法==============================================*/
// 分页
function pageAction1(){
			var page=$("#dg-list").treegrid("getPager");
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
	/*	// 分页
function pageAction2(){
			var page=$("#dg-list1").treegrid("getPager");
		  $(page).pagination({
		    total:10,
		    pageSize:10,
		    displayMsg:"",
		    layout:['list','sep','first','prev','links','next','last','manual', ],
		    beforePageText: '<span class="ui-page-text ui-page-fir">共20页</span>  <span class="ui-page-text">去第</span>',
		    afterPageText: '<span class="ui-page-text ui-page-last">页</span>',
		    showPageList:false
		  });  
		}*/
// 分页样式
function pageCls1(){
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
    	 $('.ui-page-fir').text('共'+totalPage1+'页,'+totalNumber1+'条记录');
    
    }
// 搜索提交
function submitForm1(form,table){
	if(!form){
		form=$('#search-ff');
	}
	if(!table){
		table=$("#dg-list");
	}
	if(form.form('validate')){
		    // eb.backToFstPage("#datagrid");
			table.treegrid({queryParams : eb.form2Json(form.attr('id'))});
			 pageAction();
		}
	}



/*========================上边为树形表格方法=============================================*/
// 搜索重置
function clearForm(form){
	if(!form){
		form=$('#search-ff');
	}
	form.form('clear');
	form.form('reset');
	// form.form('clear');
}
function submitOtherForm(obj){
	$(obj).parents('form').submit();
}
// 新增编辑表单提交
function doSubmit(obj){
	var f=$(obj).parents('form');
      if(!f.form('enableValidation').form('validate')){
        // 表单信息未填全
    	  f.find(".validatebox-text[readonly=readonly]").trigger("mouseenter");
    	  return;
      }else{
      	f.submit();
      }
   /*
	 * f.form('submit',{ onSubmit:function(){ return
	 * f.form('enableValidation').form('validate'); }, success:function(){ } });
	 */
 
}
// 弹框
function showAlert(dlgid,text,type){
	 var dlg=$('#'+dlgid),
	    top=document.body.scrollTop||document.documentElement.scrollTop||window.pageYOffset,
	    h=parseInt(dlg[0].offsetHeight);
		 if(text){
			 dlg.find('.ui-dlg-tit').text(text);
		 }
		 if(type=="min"){

			 dlg.dialog({top:30});
		 }else if(type=="middle"){
			 
			 dlg.dialog({top:400});
		 }else{
			 dlg.dialog({top:parseInt(window.screen.availHeight-h)/2+top-200});
		 }
	     dlg.dialog('open');
}
// 表单的取消
function formCancel(id){
  var dlg=$('#'+id);
  showAlert(id);
  dlg.find('.ui-dlgOk-btn').click(function(){
    history.back();
  });
}
// 列表的删除
function delRecord(id){
  var dlg=$('#'+id);
  showAlert(id);
  dlg.find('.ui-dlgOk-btn').click(function(){
    alert('删除');
  });
}
// 新增版本
/*
 * function IOSadd(id){ var dlg=$('#'+id); showAlert(id);
 * dlg.find('.ui-dlgOk-btn').click(function(){ //新增操作 }); /*有俩个弹框
 * 把大弹框的取消改成ui-dlgCancel-twobtn
 * dlg.find('.ui-dlgCancel-twobtn').click(function(){ showAlert('dlg');//弹出小提示框
 * $('#dlg').find('.ui-dlgOk-btn').click(function(){ $('#dlg').dialog('close');
 * dlg.dialog('close'); }); }); }
 */

// 保险类别 弹框-添加二级分类
function showAddDlg(obj,dlgId,bid){
   var one_text=$(obj).parents('.ui-guarant-tit').find('.ui-gone').find('strong').text();

  $('#ins-oneType').text(one_text);
  $('#parentId').val(bid);
 showAlert(dlgId);
 /*
	 * var dlg= $('#'+dlgId); var dialogParent =dlg.parent(); var dialogOwn =
	 * dlg.clone(); dialogOwn.hide();
	 * 
	 * dlg.dialog({ onClose:function(){ dialogOwn.appendTo(dialogParent);
	 * $(this).dialog("destroy").remove(); } }); dlg.dialog('open');
	 */
 
}
// 保险类别 弹框-添加一行二级保险分类
function changeInsLine(){
	var index = 1,otherindex = 1;
	var arr = [{prefix:"nameMap",suffix :"benefitName"},{prefix:"classVoMap",suffix :"className"},{prefix:"articlesVoMap",suffix :"articleTitle"}];
	$("#dlgList").delegate(".insurance-add","click",function(){	
	var pre = $(this).data("changename"),
		p=$(this).parents('li'),
	    thisObj=$(this).parents('li').clone(),
	    redbtn='<a class="ui-guarant-reduce insurance-reduce" href="javascript:;" data-changename="'+pre+'"></a>',
	    addbtn='<a class="ui-guarant-addfir insurance-add" href="javascript:;" data-changename="'+pre+'"></a>'; 
	    
    thisObj.insertAfter(p);
    thisObj.find('input').val('');
    index++;
    thisObj.find('#benName').attr("name",arr[pre].prefix+"["+index+"]."+arr[pre].suffix);
    console.log(index);
    $.parser.parse(thisObj);
   if(p.find('.ui-guarant-reduce').length==0){// 本体无-
	 	p.append(redbtn);
   }
   p.hasClass('ui-info-item-grey')?thisObj.removeClass('ui-info-item-grey'):thisObj.addClass('ui-info-item-grey');
   
	 $(this).remove();
	 if(thisObj.find('.ui-guarant-reduce').length==0){
	 	$(redbtn).insertAfter(thisObj.find('.ui-guarant-addfir'));
	 }

		
	})
	

	$("#dlgList2").delegate(".insurance-add","click",function(){
		
		var p=$(this).parents('li'), 
		    thisObj=$(this).parents('li').clone(),
		    pre = $(this).data("changename"),
		    redbtn='<a class="ui-guarant-reduce insurance-reduce" href="javascript:;" data-changename="'+pre+'"></a>',
		    addbtn='<a class="ui-guarant-addfir insurance-add" href="javascript:;" data-changename="'+pre+'"></a>';
		    // nameNum =
			// parseInt(thisObj.find("input[name*='nameMap']").attr("name").substring(8,9));
		
		
	    thisObj.insertAfter(p);
	    thisObj.find('input').val('');
	    otherindex++;
	    thisObj.find("#benName").attr("name",arr[pre].prefix+"["+otherindex+"]."+arr[pre].suffix);
	    $.parser.parse(thisObj);
	   if(p.find('.ui-guarant-reduce').length==0){// 本体无-
		 	p.append(redbtn);
	   }
	   p.hasClass('ui-info-item-grey')?thisObj.removeClass('ui-info-item-grey'):thisObj.addClass('ui-info-item-grey');
	   
		 $(this).remove();
		 if(thisObj.find('.ui-guarant-reduce').length==0){
		 	$(redbtn).insertAfter(thisObj.find('.ui-guarant-addfir'));
		 }

	})
	// 保险类别 弹框-删除一行二级保险分类
	$("body").delegate(".insurance-reduce","click",function(){
		var p=$(this).parents('.ui-dlg-ins-item'),
			linemode = null,
		    pre = $(this).data("changename"),
		    redbtn='<a class="ui-guarant-reduce insurance-reduce" href="javascript:;" data-changename="'+pre+'"></a>',
		    addbtn='<a class="ui-guarant-addfir insurance-add" href="javascript:;" data-changename="'+pre+'"></a>',
		    idx=p.prevAll('.ui-dlg-ins-item').length,
		    total=$(this).parents('.ui-dlg-ins-list').find('.ui-dlg-ins-item').length,
		    formId = $(this).closest("form").attr("id"),
		    isonemenu = formId == "dlgList" ? true : false;

		    

	    if(isonemenu){
	    	index--;
	    	linemode = $("#dlgList").find(".ui-dlg-ins-item");
	    	
	    	
	    }else{
	    	otherindex--;
	    	linemode = $("#dlgList2").find(".ui-inforitem-li");
	    	console.log(otherindex);
	    }

		   
		   // alert($(obj).parents('.ui-dlg-ins-list').index(p));
	    if(p.parents('.easyui-dialog').find('#ins-oneType').length==0){// 只新增一级的
	        idx++;
	        total++;
	    }
	   if($(this).prev('.ui-guarant-addfir').length!=0){
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
	   $.each(linemode,function(i,v){
		   if(i > (idx-1)){
			   var changebox = $(this).find(".ui-info-input");
			   $(changebox).attr("name",arr[pre].prefix+"["+i+"]."+arr[pre].suffix);
		   }
	   
	   });
	  
	});
}

// 保险类别 二级类别编辑 isOne=1一级编辑，2二级编辑
function showEditDlg(obj,dlgId,isOne,id){
	var ont2=tw='',twtext = '';
	if(isOne=='1'){
    ont2=$(obj).parents('.ui-guarant-tit').find('.ui-gone strong').text();
	}else{
    ont2=$(obj).parents('.ui-guarant-tab').siblings('.ui-guarant-tit').find('.ui-gone strong').text(),
    tw=$(obj).parents('tr').find('td:eq(0)').text();
    twtext = $(obj).parents('tr').find('td:eq(1)').find("p").text();
	}
	if(dlgId =="dlgEditOne"){
		$('#ins-oneType2').val(ont2);
		$('#ins-oneId').val(id);
	}else{
		$('#ins-oneTypeUpd').text(ont2);
		$('.ui-threemenu').val(tw);
		$('#ins-oneId2').val(id);
		$(".guarantee-descripte").val(twtext);
	}
  showAlert(dlgId);
}
// 产品保障搜索
function submitAlertForm(obj){
	var form=$(obj).parents('form');
	$.ajax({
  		url:form.attr('action') ,
  		type: 'post',
  		dataType: 'json',
  		data: form.serialize(),
  		success:function(data){
  			if(data.succ){
  				alert("ok");
  			}else{
  				alert(data.error.message);
  			}
  		},
  		error:function(){
  			alert('系统错误，请重试');
  		}
	});
}
// 自定义保险类别保存
function subFrm(obj){
	var frm = obj.parents('from');
	frm.submit();
}
//客户端-启动页面
function getDpi(){
    var iosArr=['1242*1785','750*1078','640*920','640*775'],
        andArr=['1080*1552','720*1035','480*690','480*663','320*387'],
        iosRealArr = ['1242*2208', '750*1334', '640*1136', '640*960'],
    	andRealArr = ['1080*1920', '720*1280', '540*960', '480*800', '320*480'];
    var liwrap=$('.ui-start-img-wrap').find('li');
    $('select[name="resourceLabel"]').change(function(){
       if($(this).val()==1){//ios
          liwrap.eq(4).addClass('fn-hide');
          for(var i=0;i<liwrap.length-1;i++){
             liwrap.eq(i).find('p:eq(0)').text(iosArr[i]);
             liwrap.eq(i).find('input[name^=resourcesMap]').eq(1).val(iosRealArr[i].split('*')[0]);
             liwrap.eq(i).find('input[name^=resourcesMap]').eq(2).val(iosRealArr[i].split('*')[1]);
          }
       }else{//android
          liwrap.eq(4).removeClass('fn-hide');
          for(var i=0;i<liwrap.length;i++){
             liwrap.eq(i).find('p:eq(0)').text(andArr[i]);
             liwrap.eq(i).find('input[name^=resourcesMap]').eq(1).val(andRealArr[i].split('*')[0]);
             liwrap.eq(i).find('input[name^=resourcesMap]').eq(2).val(andRealArr[i].split('*')[1]);
          }
       }
    });

  }

//保障利益的是否有前置条件的多条添加
function moreLine(wrapObj,option){
		var index = 20;
    	wrapObj.delegate('.ui-guarant-addfir','click',function(){
        var p=$(this).parents('.ui-resureLimit-inner');
        var id = $(p).find('.config-rowsid').val();
        var copy=p.clone();
        var changeitem = copy.find(".produce-item-toggle");
        var addswitch = parseInt(p.data("index"))+1;
        var totalbox = [];
        copy.insertAfter(p);
         $.parser.parse(copy);
         
        // 数组下标增加
        index++;
        $.each(changeitem,function(i,v){
        	$(this).attr("name","pricesMap["+(index)+"]."+option[i]);
    	
        })
        if(p.find('.ui-guarant-reduce').length==0){// 第一行
        	p.append('<a class="ui-guarant-reduce" href="javascript:;"></a>');
        }
        p.find('.ui-guarant-addfir').remove();


        var thisObj=p.next('.ui-resureLimit-inner');// 复制第一个有+无-
        if(thisObj.find('.ui-guarant-reduce').length==0){
        	thisObj.append('<a class="ui-guarant-reduce" href="javascript:;"></a>');
        }
        if(thisObj.find('.numberbox').length>1){
        	thisObj.find('.numberbox:gt(0)').remove();
        }
       
        thisObj.removeClass('ui-resureLimit-fir').addClass('ui-resureLimit-other2');
        
        thisObj.attr('data-index',addswitch);
        
        thisObj.find('.easyui-validatebox').val('');
        thisObj.find('.config-rowsid').val(id);
        if(wrapObj.hasClass('ui-resureLimit-wrap')){// 产品的
        	var opt1=thisObj.find('.ui-info-ssel').children('option:eq(0)');
        	thisObj.find('.easyui-numberbox:eq(0)').numberbox('clear');
        	opt1.attr('selected');
	        thisObj.find('.get-limit').siblings('em').text(opt1.text());
	        thisObj.find('input[type="text"]:eq(1)').val('').hide().siblings('em').hide();
        }
        totalbox = p.closest("li");
        $.each(totalbox,function(i,v){
        	$(this).attr('data-index',i);
         	
       })
        

      });

    wrapObj.delegate('.ui-guarant-reduce','click',function(){
    	index--;
      var rp=$(this).parents('.ui-resureLimit-inner');
      var idx=rp.attr('data-index'),
          total=$(this).closest("li").find('.ui-resureLimit-inner').length,
          addDoc=$('<a class="ui-guarant-addfir" href="javascript:;"></a>'),
          totalbox = rp.siblings(".ui-resureLimit-inner");
      if(rp.hasClass('ui-resureLimit-fir')){
        rp.next('.ui-resureLimit-inner').addClass('ui-resureLimit-fir').removeClass('ui-resureLimit-other2');
      }
      if(idx==total-1){// 删除最后一行数据
      	addDoc.insertBefore(rp.prev('.ui-resureLimit-inner').find('.ui-guarant-reduce'));
      	if(idx==1){
          rp.prev('.ui-resureLimit-inner').find('.ui-guarant-reduce').remove();
      	}
      }
      if(idx==0&&total==2){// 删除第一行数据
          rp.next('.ui-resureLimit-inner').find('.ui-guarant-reduce').remove();
      }
      rp.remove();
      // 改变name数字下标变化
//      $.each(totalbox,function(i,v){
//    	  if(i > idx){
//    		  var lessmode = totalbox.eq(i).find(".produce-item-toggle");
//    		  var arrindex = i--;
//    		  $.each(lessmode,function(j,e){
//    			  $(this).attr("name","pricesMap["+arrindex+"]."+option[j]);
//    		  })
//    		  console.log(arrindex);
//    	  }
//      })

      //第几个遍历修改
      $.each(totalbox,function(i,v){
       	  $(this).attr('data-index',i);
     })
      
    });
}
//保障利益是否前置条件
function moreLine2(wrapObj,option){
		var index = 20;
    	wrapObj.delegate('.ui-guarant-addfir','click',function(){
        var p=$(this).closest('li');
        var copy=p.clone();
        var changeitem = copy.find(".produce-item-toggle");
        copy.insertAfter(p);
         $.parser.parse(copy);
         
        //前一行的减号
        if(p.find('.ui-guarant-reduce').length==0){// 第一行
        	p.append('<a class="ui-guarant-reduce ui-contentmargin" href="javascript:;"></a>');
        }
        p.find('.ui-guarant-addfir').remove();


        var thisObj=p.next();// 复制第一个有+无-
        if(thisObj.find('.ui-guarant-reduce').length==0){
        	thisObj.append('<a class="ui-guarant-reduce ui-contentmargin" href="javascript:;"></a>');
        }
        if(thisObj.find('.numberbox').length>1){
        	thisObj.find('.numberbox:gt(0)').remove();
        }
        
        thisObj.find('.easyui-validatebox').val('');
        if(wrapObj.hasClass('ui-resureLimit-wrap')){// 产品的
        	var opt1=thisObj.find('.ui-info-ssel').children('option:eq(0)');
        	thisObj.find('.easyui-numberbox:eq(0)').numberbox('clear');
        	opt1.attr('selected');
	        thisObj.find('.get-limit').siblings('em').text(opt1.text());
	        thisObj.find('input[type="text"]:eq(1)').val('').hide().siblings('em').hide();
        }
       
      });

    wrapObj.delegate('.ui-guarant-reduce','click',function(){

      var rp=$(this).closest('li');
      var idx=rp.index(),
          total=$(this).closest('ul').find('li').length,
          addDoc=$('<a class="ui-guarant-addfir ui-contentmargin" href="javascript:;"></a>'),
          totalbox = wrapObj.find('.ui-resureLimit-inner');
      if(rp.hasClass('ui-resureLimit-fir')){
        rp.next('.ui-resureLimit-inner').addClass('ui-resureLimit-fir').removeClass('ui-resureLimit-other');
      }
      if(idx==total-2){// 删除最后一行数据
      	addDoc.insertBefore(rp.prev('li').find('.ui-guarant-reduce'));
      	if(idx==1){
          rp.prev('li').find('.ui-guarant-reduce').remove();
      	}
      }
      if(idx==0&&total==3){// 删除第一行数据
          rp.next('li').find('.ui-guarant-reduce').remove();
      }
      rp.remove();
      
    });
}
//红包管理新增
function redruleMoreLine(wrapObj,option,param){
		var index = 20;
		
		
		 // 保障期限的区间
		$('.ui-resureLimit-wrap').delegate('.get-limit','click',function(){
		     var secInput=$(this).next('.ui-info-sinput'); 
		     secInput.next('em').show().text('元');
		     secInput.show();
		     //validatebox('reduce')
		     $(secInput).validatebox({required:true,validType:'money'});  
		     

		});
		 
    	wrapObj.delegate('.ui-guarant-addfir','click',function(){
        var p=$(this).parents('.ui-resureLimit-inner');
        var copy=p.clone();
        var changeitem = copy.find(".produce-item-toggle");
        
        //validatebox('remove')
        copy.find("em").prev().hide();
        copy.find("em").hide();
       
        copy.insertAfter(p);
         $.parser.parse(copy);
         
        // 数组下标增加
        index++;
        $.each(changeitem,function(i,v){
        	$(this).attr("name","configsMap["+(index)+"]."+option[i]);
    	
        })
        if(p.find('.ui-guarant-reduce').length==0){// 第一行
        	p.append('<a class="ui-guarant-reduce" href="javascript:;"></a>');
        }
        p.find('.ui-guarant-addfir').remove();


        var thisObj=p.next('.ui-resureLimit-inner');// 复制第一个有+无-
        if(thisObj.find('.ui-guarant-reduce').length==0){
        	thisObj.append('<a class="ui-guarant-reduce" href="javascript:;"></a>');
        }
        if(thisObj.find('.numberbox').length>1){
        	thisObj.find('.numberbox:gt(0)').remove();
        }
       if(param){
    	   thisObj.removeClass('ui-resureLimit-fir').addClass('ui-resureLimit-other');
       }else{
    	   thisObj.removeClass('ui-resureLimit-fir');
       }
        //thisObj.removeClass('ui-resureLimit-fir').addClass('ui-resureLimit-other');
        
        thisObj.find('.easyui-validatebox').val('');
        $('.maxredrule-money').validatebox('disableValidation');

      });

    wrapObj.delegate('.ui-guarant-reduce','click',function(){
    	//index--;
      var rp=$(this).parents('.ui-resureLimit-inner');
      var idx=rp.index('.ui-resureLimit-inner'),
          total=wrapObj.find('.ui-resureLimit-inner').length,
          addDoc=$('<a class="ui-guarant-addfir" href="javascript:;"></a>'),
          totalbox = wrapObj.find('.ui-resureLimit-inner');
      if(rp.hasClass('ui-resureLimit-fir')){
        rp.next('.ui-resureLimit-inner').addClass('ui-resureLimit-fir').removeClass('ui-resureLimit-other');
      }
      if(idx==total-1){// 删除最后一行数据
      	addDoc.insertBefore(rp.prev('.ui-resureLimit-inner').find('.ui-guarant-reduce'));
      	if(idx==1){
          rp.prev('.ui-resureLimit-inner').find('.ui-guarant-reduce').remove();
      	}
      }
      if(idx==0&&total==2){// 删除第一行数据
          rp.next('.ui-resureLimit-inner').find('.ui-guarant-reduce').remove();
      }
      rp.remove();
    });
}
// 一般的图片上传
function uploadImg(id,url,filePath,levetype){
	var obj=$('#'+id);
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
    	if(type!='png' && type!='jpg' && type!= 'gif'&& type!= 'bmp'&& type!= 'jpeg' ){
      	  alert('格式不正确，请重新上传。');
      	  return;
    	}else if(fileSize / 1024>5000){   
  	  		alert('不能大于5M。');
        	return;
	  	}
    	var str = url+"?filePath="+filePath;
    	 $.ajaxFileUpload({
			url : str,
			secureuri : false,
			fileElementId : id, 
			dataType : 'json',
			success : function(data) {
				if(data){
					var picturePath = data.entity.substr(data.entity.lastIndexOf("_")+1);
						alert("上传成功!");
						//产品新增上传图片
						//$("#productLogo").val(picturePath);
						if(levetype == 'moreimg'){
							var pics = $("#producePicshow"),
								len = pics.find('img').length;
							pics.closest(".ui-info-item").show();
							var str ='<div class="produce-piclist"><img src="'+picturePath+'" class="ui-page-fir ui-addimg" width="120" height="120"/><br/><span class="ui-base-policy ui-relative"><input type="button" class="ui-file-link" value="重新上传"><input type="file" name="insuranceTerms" class="file-wrap" id="prodimg-file-productAdvantage'+len+'"  onchange="uploadImg(this.id,\'/product/fileUpload\',\'product\',\'eachimg\');" style="left:0;top:0;width:60px;"></span><input type="button" class="ui-file-link query-result-span produce-advantdel" value="删除"></div>';
							$(pics).append(str);
							$("#productAdvantage").val('yes');
						}else if(levetype == 'eachimg'){
							var oneimg = $("#"+id).closest('.produce-piclist').find('.ui-addimg');
							oneimg.attr("src",picturePath);
						}else{
							$("#produceMap").attr("src",picturePath);
							var addimg=$("#"+id).parents('.ui-info-item').find('.addimg');
							var leve = $(addimg).data("leve");
							leve = leve ? leve : "yes";
							if(leve == 'no'){
								if(addimg.length!=0){
									addimg.attr("src",picturePath).show();
									
								}
							}else if(leve == 'produce'){
								if(addimg.length!=0){
									addimg.attr("src",picturePath).show();
									$("#"+id).css({'left':'366px','top':'46px'});
								}
							}else{
								if(addimg.length!=0){
									addimg.attr("src",picturePath).show();
									$("#"+id).css({'left':'293px','top':'45px'});
								}
							}
							
							
							$("#systemLogo").val(picturePath);
							$("#specialLogo3").val(picturePath);
							$("#promotionLogo").val(picturePath);
							$("#posLogo").val(picturePath);
							//启动页图片
							$("#"+id).next().val(picturePath);
							$("#"+id).parents(".file-mode").prev().attr("src",picturePath);
						}
						
						
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
// 文件上传
var filesub = 0;
function uploadFile(obj,url,showpath,filePath){
		
		showpath = showpath != 'showPath'? "": showpath;
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
        if(type!= 'apk' && type!= 'app' && type!= 'pdf'){
	      	  alert('格式不正确，请重新上传。');
	      	  return;
        }else if(fileSize / 1024>5000){   
      	  	alert('不能大于5M。');
	        return;
		  }
        var str = url+"?filePath="+filePath;
        $.ajaxFileUpload({
			url : str,
			secureuri : false,
			fileElementId : 'file-wrap', 
			dataType : 'json',
			success : function(data) {
				if(data){
					alert('成功上传！');
					filesub++;
					
					$('#validval').val(data.entity);
					if(showpath == "showPath"){
						var target = $("#filePath"),
							filebox = $('<div class="upfile-item"></div>'),
							copymode = $('<input type="hidden" id="insuranceTerms2" name="productsMap[1].insuranceTerms2" class="easyui-validatebox ui-info-input ui-channel-phonemargin" readOnly="readOnly" value=""/>');

						copymode.attr("name","productsMap["+filesub+"].insuranceTerms2");
						var fileType = data.entity.substr(data.entity.lastIndexOf(".")+1);
						if(fileType == "pdf"){
							copymode.val(data.entity);
						} else {
							copymode.val(data.entity.substr(data.entity.lastIndexOf("__")+1));
						}
						var name = data.entity.substr(0,data.entity.lastIndexOf("__"));
						if(target.find('.edit-orgfile').length!=0){// 编辑的时候先清空原来的文件
							target.html('');
						}
						filebox.append(copymode);
						filebox.append("<span class='ui-channel-phonemargin'>"+name+"</span><span class='upfile-item-dele files-dele'>删除</span>");
						target.append(filebox)
					}else{
						$('input[name="productsMap[1].insuranceTerms2"]').val(data.entity);
						$('input[name="specialLogo3"]').val(data.entity.fileFullPath);
						$('input[name="promotionLogo"]').val(data.entity.fileFullPath);
						$('input[name="posLogo"]').val(data.entity.fileFullPath);
					}
				
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

// 文件下载
/*
 * function download(){ }
 */

// 详情保障利益的下拉框 insurance==yes保险类别样式
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
// 操作员编辑
function operShowEdit(){
	var p=$('.ui-info-list').find('.ui-info-item');
	p.find('span:eq(0)').hide();
	p.eq(0).find('span:eq(0)').show();
	p.find('.ui-info-input:eq(0)').attr('type','text');
	p.find('.ui-info-sel:eq(0)').removeClass('fn-hide');
	$('.ui-edit').addClass('fn-hide').prev('.ui-submit').removeClass('fn-hide');
	$('.noedit').addClass('fn-hide');
	
}

//秘钥编辑提交
function doUpdateKey(obj,url){
	eb.doCallSubmit({
		obj:obj,
		callback:function(){
			showAlert('dlgYes');
			setTimeout(function(){
				control.setCur(url);
				location.href=url;
			},1000);
		}
	});
}

//密钥新增提交
function doDomKeyAdd(obj,url){
	eb.doCallSubmit({
		obj:obj,
		callback:function(){
			showAlert('dlgYes');
			setTimeout(function(){
				control.setCur(url);
				location.href=url;
			},1000);
		}
	});
}
//操作员,角色-编辑提交
function doOperEdit(obj,url){
	eb.doCallSubmit({
		obj:obj,
		callback:function(){
			control.setCur(url);
			location.href=url;
		}
	});
}
//操作员,角色-新增提交
function doOperAdd(obj,url){
	eb.doCallSubmit({
		obj:obj,
		callback:function(){
			showAlert('dlgYes');
			setTimeout(function(){
				control.setCur(url);
				location.href=url;
			},1000);
		}
	});
}
//角色授权
function authRole(obj,url){
	if($(obj).parents('form').find('input[type="checkbox"]:checked').length==0){
		alert('请勾选授权资源');
		return;
	}
	eb.doCallSubmit({
		obj:obj,
		callback:function(){
			showAlert('dlg');
			setTimeout(function(){
				control.setCur(url);
				location.href=url;
			},1000);
		}
	});
}
// 操作员禁用启用
function showForibd(id,dlg,flag,username){
	var text='';
	var method = 0;
	if(flag==1){
		text='确定要禁用该用户吗？';
		method = 0;
	}else if(flag==2){
		text='确定将该用户设为正常吗？';
		method = 1;
	}else{
		text='确定要为该操作员（账号：'+username+'）重置密码吗？';
	}
	$('#'+dlg).find('.ui-dlg-tit').text(text);
	showAlert(dlg);
	if(flag == 1 || flag == 2){
		$('#'+dlg).find('.ui-dlgOk-btn').click(function(){
			$.ajax({
				url:'/operator/doUserSet',
				type: 'post',
				dataType: 'json',
				data: {"userId":id, "flag":method},
				success:function(data){
					if(data.succ){
						window.location.reload();
					} else {
						alert("操作失败");
					}
				}
			});
		});
	} else {
		$('#'+dlg).find('.ui-dlgOk-btn').click(function(){
			$.ajax({
				url:'/operator/doResetPassword',
				type: 'post',
				dataType: 'json',
				data: {"userId":id},
				success:function(data){
					$("#dlg").dialog('close');
					if(data.succ){
						//showAlert('resetOK', '操作员（账号：'+username+'）密码已被重置为' + data.entity + "，请提醒该操作员尽快修改密码！");
						$('#resetOK').dialog({
							onClose: function () {
				               window.location.reload();
				            }
						});
						$('#resetOK').dialog('open');
						$('#resetOK').find('.ui-dlg-tit').text('操作员（账号：'+username+'）密码已被重置为' + data.entity + '，请提醒该操作员尽快修改密码！');
					} else {
						showAlert('resetOK', '操作失败');
					}
				}
			});
		});
	}
}
var reseteb = {
		init :function(){
			this.id = 0;
			this.username = '';
		},
		resetDlg : function(id,dlg,username){
			var text='确定要为该渠道用户（账号：'+username+'）重置密码吗？';
			showAlert(dlg,text);
			this.id = id;
			this.username = username;
			
		},
		resetPassword : function(dlg){
			var username = this.username;
				$.ajax({
					url:'/domain/doResetPassword',
					type: 'post',
					dataType: 'json',
					data: {"userId":this.id},
					success:function(data){
						$("#resetdlg").dialog('close');
						if(data.succ){
							//showAlert('resetOK', '渠道用户（账号：'+username+'）密码已被重置为' + data.entity );
							$('#resetOK').dialog({
								onClose: function () {
					               window.location.reload();
					            }
							});
							$('#resetOK').dialog('open');
							$('#resetOK').find('.ui-dlg-tit').text('渠道用户（账号：'+username+'）密码已被重置为' + data.entity );
						} else {
							showAlert('resetOK', '操作失败');
						}
					}
				});
			
		}
}

//重置渠道用户密码
function resetPassword(id,dlg,username){
	
		$('#'+dlg).find('.ui-dlgOk-btn').click(function(){
			$.ajax({
				url:'/domain/doResetPassword',
				type: 'post',
				dataType: 'json',
				data: {"userId":id},
				success:function(data){
					$("#dlg").dialog('close');
					if(data.succ){
						//showAlert('resetOK', '渠道用户（账号：'+username+'）密码已被重置为' + data.entity );
						$('#resetOK').dialog({
							onClose: function () {
				               window.location.reload();
				            }
						});
						$('#resetOK').dialog('open');
						$('#resetOK').find('.ui-dlg-tit').text('渠道用户（账号：'+username+'）密码已被重置为' + data.entity );
					} else {
						showAlert('resetOK', '操作失败');
					}
				}
			});
		});
	}
//密码修改成功的跳转
function modPwd(obj,url){
	eb.doCallSubmit({
		obj:obj,
		callback:function(){
			showAlert('dlgYes');
			setTimeout(function(){
				parent.location.href=url;
			},1000);
		}
	});
}

/*
 * @ doAjaxSubmit 一般的ajax提交表单
 * @ param  obj:提交按钮的this,dlgYes:成功弹框的id,dlgNo:失败弹框的id;
 * 
 */
function doAjaxSubmit(obj,dlgYes,dlgNo){
	$(obj).attr('disabled','disabled');
	var form=$(obj).parents('form');
	if(form.form('enableValidation').form('validate')){
		$.ajax({
	  		url:form.attr('action') ,
	  		type: 'post',
	  		dataType: 'json',
	  		data: form.serialize(),
	  		success:function(data){
	  			$(obj).removeAttr('disabled');
	  			var dlg='';
	  			if(data.succ){
	  				showAlert(dlgYes);
	  				dlg=$('#'+dlgYes);
	  			}else{
	  				showAlert(dlgNo,data.error.message);
	  				dlg=$('#'+dlgNo);
	  			}
	  			dlg.find('.ui-dlgOk-btn').click(function(){
	  				dlg.dialog('close');
	  			});
	  		},
	  		error:function(){
	  			$(obj).removeAttr('disabled');
	  			alert('系统错误，请重试');
	  		}
		});
	}
}

// 富文本框
var editor;
function richEdit(){
	if(typeof(KindEditor)!='undefined'){
	KindEditor.options.filterMode = false;
	KindEditor.ready(function(K) {
		var arryObj=['.richEditor'];
		for(var i=0;i<arryObj.length;i++){
		editor = K.create(arryObj[i], {
			cssPath : '/resource/js/kindeditor/plugins/code/prettify.css',
			uploadJson : '/upload/picture',
			fileManagerJson : '/fileManager/filemanagerJSON',
			allowFileManager : true,
			width:870,
			// allowImageUpload : false,不允许本地上传
	/*
	 * items : [ 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor',
	 * 'bold', 'italic', 'underline', 'removeformat', '|', 'justifyleft',
	 * 'justifycenter', 'justifyright', 'insertorderedlist',
	 * 'insertunorderedlist', '|', 'emoticons', 'image', 'link'],
	 */
				items:['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
'justifyfull',  'subscript',
'superscript', '|', 'selectall', '-',
'title', 'fontname', 'fontsize','forecolor', '|', 'textcolor', 'bgcolor', 'bold',
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
// 弹框 iframe
function list_dialog(url,tit,top){
	top = top?top:'100';
	$("#dlg-box").attr("src",url).dialog({
	      title: tit,
	      modal: true,
	      loadingMessage: '正在加载...'
	    }).show().css({"height":"500px","width":"100%","overflow-x":'hidden'}).parents(".window").css("top",top);
	 
}
// 关闭iframe
function closeIframe(p){
	 p.find('#dlg-box').parents('.panel').hide();
	 p.find('.window-mask').hide();
	 p.find(".window-shadow").remove();
}
//关闭保障期限iframe
function closeIframe2(p){
	 p.find('#dlg-deadline').parents('.panel').hide();
	 p.find('.window-mask').hide();
	 p.find(".window-shadow").remove();
}
// 产品详情里面的编辑按钮
function pEdit(obj){
	$(obj).parents('.info-box').hide().next('.edit-box').show();
}
//产品新增-保障期限年月日
function changeVal(obj){
	var val = obj.value;
	if(val == 4){
		$(obj).next().attr("value","年");
	}else if(val == 3){
		$(obj).next().attr("value","月");
	}else{
		$(obj).next().attr("value","天");
	}
}
// 弹框页面保障利益分类
function sonProfit(parent){
	var dlg=$('#dlgProfit'),dlgAdd=$('#dlgList');
	var p=$(parent.body);
	 
	 dlg.delegate('.ui-dlgtab-left input[type="checkbox"]','click',function(){
	 	if($(this)[0].checked==true){
	 		var obj=$(this);
	 		/* ajax请求的数据拼接 */
	 		$.ajax({
	 	        url: '/product/findBeneFit?parentId='+$(this)[0].value,
	 	        type: 'get',
	 	        datatype: 'text',
	 	        success: function(result) {
	 				/* //根据id查找对象 删除所有节点 */
	 	        	var html='<ul>';
			    	$(this).parent('.ui-dlgtab-left').next('td').html('');
	 				for(var i=0;i<result.length;i++){
	 					 html+= '<li>' 
							+ '<input type="checkbox" value="'+result[i].benefitId+'" name="benefitId"/><label>'+result[i].benefitName+'</label></li>';
	 				}
	 				html+='</ul>';
	 				obj.parent('.ui-dlgtab-left').next('td').html(html);
	 	        }
	 		});
	 	}else{
	     $(this).parent('.ui-dlgtab-left').next('td').html('');
	 	}
	   
	 });
     
	 $('#defineAdd').click(function(){
		    showAlert('dlgList','','min');
		    var dbh=parseInt(document.body.scrollHeight),ddh=parseInt(document.documentElement.scrollHeight);
		    var l=Math.max.apply(null,[dbh,ddh]);
		    $('.window-mask').css('height',l+'px');
		    
		 });  
	 dlg.delegate('.ui-dlgOk-btn','click',function(){
	    dodlgSave(p);
	 });  
	 dlg.delegate('.ui-dlgCancel-btn','click',function(){
		closeIframe(p);
	 }); 
	 dlgAdd.delegate('.ui-dlgOk-btn','click',function(){
	 	// dlgAdd.dialog('close');

	  
	 });  
}
// 保障利益操作
function prodProfit2(){
	 var dlg=$('#dlgProfit'),dlgAdd=$('#dlgList');
	 $('#guarantList').delegate('.ui-profit-chose','click',function(){
		 list_dialog( $(this)[0].dataset.url,'保障利益');
	 });
	
	 // 保障期限的区间
	 $('.ui-resureLimit-wrap').delegate('.get-limit','click',function(){
	     var secInput=$(this).next('.ui-info-sinput'),
	         unit=$(this).siblings('.ui-info-ssel').children('option:selected').text();
	        
	     secInput.next('em').show().text(' '+unit);
	     secInput.show();
	 });
	 $('.ui-resureLimit-wrap').delegate('select','change',function(){
	     var unit=$(this).children('option:selected').text();
	     $(this).parents('.ui-resureLimit-inner').find('em').text(' '+unit);
	 });
	
	 moreLine($('.produce-newconfig'),["minGuarantee","guaranteeType","guaranteeType2","maxGuarantee","productPremium1","productCode"]);
}

// 产品新增 保障利益的对话框
function dodlgSave(p){
	var dlg=$('#dlgProfit'),dlgAdd=$('#dlgList'),flag=true;
	var pt=[],htmlFirst='',htmlSec='',easureindex = 0,menuindex = 0;
	
	if($('.sortCks').find('td input[type="checkbox"]:checked').length==0){
		alert('请选择一级分类');
		return;
	}
	
	$('.sortCks').find('td:eq(0) input[type="checkbox"]:checked').each(function(){
		var ckboxs=$(this).parents('td').next('td').find('input[type="checkbox"]'),
		    ckd=$(this).parents('td').next('td').find('input[type="checkbox"]:checked'),
		    sonarry = [],parentarry = [];
		if(ckboxs.length!=0&&ckd.length==0){
			alert('请选择已勾选的一级分类对应的二级分类');
			flag=false;
			return false;
		}else if(ckboxs.length==0){
			alert('请选择有二级分类的一级分类');
			flag=false;
			return false;
		}else if(ckboxs.length!=0){

			parentarry.push({"id":$(this).val(),"value":$(this).next().text()});
			for(var i=0;i<ckd.length;i++){
				
				sonarry.push({"id":$(ckd[i]).val(),"value":$(ckd[i]).next().text()})
			}
			
			pt.push({"onmenu":parentarry,"child":sonarry});
			
		}
	});

	if(!flag){
		return;
	}// 验证
	
  p.find('.ui-guarant-wrap').show();
  p.find('.ui-profit-chose').val('重新选择');
  for(var m=0;m<pt.length;m++){// 一级
	  var buyseleval = '';
	  
	  menuindex++;
	  htmlFirst+='<li><div class="ui-guarant-tit">'
			    	+'<a href="javascript:;" onclick="toggleSub(this);" class="ui-gone">'
			    	+'<strong>'+pt[m].onmenu[0].value+'<input type="hidden" name="benefitsMap['+menuindex+'].benefitName" value="'+pt[m].onmenu[0].value+'" />'
			    	+'</strong><i class="ui-icon-arrow"></i></a>'
			    	+'<span class="ui-gtwo"></span>'
			    	+'<span class="ui-gthree"></span>'
		        +'</div>';
	 
	   htmlSec='<table class="ui-guarant-tab" width="100%">';
	   for(var i=0;i<pt[m].child.length;i++){// 二级
		  var classN=i==pt[m].child.length-1?'ui-tab-last':'';
		  easureindex++;
		  var buysele = buySeleValue(pt,pt[m].child[i].id);
          htmlSec+='<tr class='+ classN+'>'
			       		+'<td width="30%" class="ui-td-fir"><span class="interest-nameitem" data-id="'+pt[m].child[i].id+'">'+pt[m].child[i].value
			       		+'</span><input type="hidden" name="benefitsMap['+easureindex+'].benName" value="'+pt[m].child[i].value+'" />'
          				+'<input type="hidden" name="benefitsMap['+easureindex+'].benefitId" value="'+pt[m].child[i].id +'" /></td>'
			       		+'<td width="35%">'
	                     +'<select class="ui-info-sel ui-info-ssel" name="benefitsMap['+easureindex+'].isRequired" >'
	                        +'<option value="1">是</option>'
	                        +'<option value="0" selected>否</option>'
	                      +' </select>'
	                   +'</td>'
			       	   +'<td width="30%">'
	                     +'<select class="ui-info-sel ui-info-ssel insterest-fontcondite" name="benefitsMap['+easureindex+'].condition">'
	                       +'<option value="1">是</option>'
	                       +'<option value="0" selected>否</option>'
	                      +'</select>'
			       		+'</td>'
			       	+'</tr>'
			       	+'<tr class="fn-hide ui-resureLimit-inner" >'
			       	+'<td colspan="3" style="padding:10px 0;">'
			       	+'<ul class="preadd-conditelist"><li>'
					       	+'<label for="" style="margin:0 22px;">购买</label>'
					       	+'<select class="ui-info-sel ui-info-ssel produce-item-toggle produce-insterest-select" name="benefitsMap['+easureindex+'].preCondition" style="width:200px;">'
					       	+buysele
					       	+'</select>'
					       	+'<input name="benefitsMap['+easureindex+'].minConditionStr" type="text" value="" class="easyui-validatebox ui-info-sinput produce-item-toggle buycondite-ipt" data-options="required:true,validType:[\'integer\']" missingmessage="请输入前置条件购买份数" title="">份'
					       	+'<a class="ui-guarant-addfir ui-contentmargin" href="javascript:;"></a>'
				       	+'</li>'
				       	+'<li>'
				    	+'<label for="" style="margin:0 22px;">可购买</label>'
				       	+'<input name="benefitsMap['+easureindex+'].conditionQuota" type="text" value="" class="easyui-validatebox ui-info-sinput produce-item-toggle countcopies-ipt" data-options="required:true,validType:[\'integer\']" missingmessage="请输入可购买份数" title="">份'
				       +'</li></ul>'
				    	+'</td>'
			       	+'</tr>';
	   }
	  htmlSec+='</table>';
	  htmlFirst+=htmlSec+'</li>';
  }
  
  p.find('#configBoxList').find('li:gt(0)').remove();
  p.find('#configBoxList').append(htmlFirst);
  p.find("#produceConfigBox").html("");
   
   closeIframe(p);
   // dlgAdd.dialog('close');
}
function buySeleValue(datas,comparyval){
	var obj = datas;
		arrs = [];
		var str = '<option value="0">任意保障项目</option>';
	$.each(datas,function(i,v){
		var temp = v.child;
		$.each(temp,function(j,m){
			if(m.id != comparyval){
				str += '<option value="'+m.id+'">'+m.value+'</option>';
				
			}
		})
		
	})
	
	return str;
}
//保障利益操作
function prodProfit(){
	 var dlg=$('#dlgProfit'),dlgAdd=$('#dlgList'),
	     conditetemp = $("#insterestCondite");
	 $('#guarantList').delegate('.ui-profit-chose','click',function(){
		 list_dialog( $(this)[0].dataset.url,'保障利益');
	 });
	 
	 $('#profitDealine').on('click',function(){
		 list_dialog( $(this)[0].dataset.url,'保障利益');
	 });
	
	 // 保障期限的区间
	 $('.ui-resureLimit-wrap').delegate('.get-limit','click',function(){
	     var secInput=$(this).next('.ui-info-sinput'),
	         unit=$(this).siblings('.ui-info-ssel').children('option:selected').text();
	        
	     secInput.next('em').show().text(' '+unit);
	     secInput.show();
	 });
	 $('.ui-resureLimit-wrap').delegate('select','change',function(){
	     var unit=$(this).children('option:selected').text();
	     $(this).parents('.ui-resureLimit-inner').find('em').text(' '+unit);
	 });
	 //是否前置条件
	 $("#guarantInfor").on("change",'.insterest-fontcondite',function(){
		 var val = $(this).find('option:selected').text(),
		 	 $tr = $(this).parents("tr").next('tr');

		 if(val == '是'){
			 $tr.show();
		 }else{
			 $tr.hide();
		 }
	 })
	 //统计可购买多少分
	 $('#guarantList').on('keyup','.countcopies-ipt2',function(){
		 var ul =  $(this).closest('ul'),
		 	inputs = ul.find('.buycondite-ipt'),
		 	countcopie = ul.find('li:last').find('input'),
		 	selfval = $(this).val(),allcopie =0;
		 
		 $.each(inputs,function(i,v){
			 var v1 = $(v).val(),v2 = v1==''?0:parseInt(v1);
			 allcopie +=v2;
		 })
		 if(selfval > allcopie){
			 $(this).val("");
		 }
		 
		 
	 })
	 //保障利益不能重复选择
	 $("#configBoxList").on('change','.produce-insterest-select',function(){
		 var insteritem = $(this).parents('.preadd-conditelist').find(".produce-insterest-select"),
		 	 currval = $(this).val(),This = this,
		 	 currindex = $(this).parents('li').index();
		
		 $.each(insteritem,function(i,v){
			 if($(v).val() == currval && i !=currindex && $(v).val() != 0){
				 showAlert('alt','不可选择重复的！');
				 $(This).find('option').eq(0).prop('selected','selected');
				 return false;
			 }
		 }) 
	 })
	 moreLine2($('#guarantList'),["preCondition","minConditionStr"]);
//	 moreLine($('#produceConfigBox'),["insuredAmountStr","insuredType","insuredUnit","insuredUnit","productPremiumStr","productPremiumStr"]);
//	 moreLine($('#produceConfigBox'),["priceBenefitId","insuredAmountStr","insuredType","insuredUnit","insuredUnit","productPremiumStr","productPremiumStr"]);
}

// js讲数字改成千分符显示
function fmoney(s, n) {
	if(s==''){
		return '';
	}
	if(s.indexOf(',')!=-1){
		s=s.replace(/,/g, '');
	}
	if (s == null) {
		return "0.00";
	} else if(isNaN(s)){
		return s;
	}else {
		n = n > 0 && n <= 20 ? n : 2;
		s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
		var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
		t = "";
		for ( var i = 0; i < l.length; i++) {
			t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
		}
		return t.split("").reverse().join("") + "." + r;
	}
}
// 只能输入数字
function intOnly(){
	$('.intOnly').each(function(){
		$(this).bind("keyup blur",function(){
			var b=$(this).val();
			if(isNaN(b)){
				$(this).val(b.replace(/[^\d]+/g,""));
			}else if(b.indexOf('.')!=-1){
				$(this).val($(this).val().substring(0,b.indexOf('.')));
			}
		});
	});
}
function deleteList(){
	var param = "",leve=0;
  $(".ui-levedelete").click(function() {

	var articleid = $(this).parents(".ui-rowcontent").find(".ui-labelid");
	leve = $(this).data("leve");
	param = "";	
	$.each(articleid,function(i,v){
		param +=  v.value+",";
	});
	
	
	//得到ID的字符串
	param = param.substring(0,param.length-1);
     //判断是否要删除
     if(leve == 3 || leve ==2){
     	param = param.split(",")[0];
     }
    
	showAlert("dlgLeve");
   });


    $("#leveConfirm").click(function(){
     	$("#dlgLeve").dialog("close");
     	$.ajax( {
			url : "/content/delArticles",
			dataType : "json",
			type : "post",
			data: {"articleId":param, "type":"1"},
			success : function(data) {
				$("#artTit").text(data.entity);
				showAlert("art");
				window.setInterval( function () {
			        window.location.reload();
				}, 1000 );
			}
		});
     });
     	 
        
   //显示删除成功关闭弹框
  $("#operaOver").click(function(event) {
    	if(leve == 3){
    		$("#dlgDelete").dialog("close");
    		window.location.reload();
    	}else{
    		$("#dlgDelete").dialog("close");
    	}	
  });
   

  //       if(value == 1){
//     	 //showAlert("dlgDeleteOpera");
//         $.ajax( {
//			url : "${base}/content/delArticles",
//			dataType : "json",
//			type : "post",
//			data: {"articleId":id, "type":"1"},
//			// 成功后调用
//			success : function(data) {
//			    if(data.succ){
//			    	alert(data.entity);
//			    	window.location.reload();
//			    } else {
//			    	alert(data.entity);
//			    	return false;
//			    }
//			}
//		});
//     }else if(value == 3 || value ==2){
//     	//showAlert("dlgDeleteOpera");
//     	var artId = id.split(",")[0];
//     	$.ajax( {
//			url : "${base}/content/delArticles",
//			dataType : "json",
//			type : "post",
//			data: {"articleId":artId, "type":"1"},
//			// 成功后调用
//			success : function(data) {
//			    if(data.succ){
//			    	alert(data.entity);
//			    	window.location.reload();
//			    } else {
//			    	alert(data.entity);
//			    	return false;
//			    }
//			}
//		});
//     } 
// }); 
     
  
}
 (function($) {
	$.fn.extend({
			iScroll:function(options) {
				var defaults = {
					oWrap: "#scroll-list", // form表单
					nTime: 2000 // 时间
				};
				var opts = $.extend(defaults, options);

				var _wrap = $(opts.oWrap); // 定义滚动区域
				var _interval = opts.nTime; // 定义滚动间隙时间
				var _moving; // 需要清除的动画
				_wrap.hover(function() {
					clearInterval(_moving); // 当鼠标在滚动区域中时,停止滚动
				}, function() {
					_moving = setInterval(function() {
							var _field = _wrap.find('li:first'); // 此变量不可放置于函数起始处,li:first取值是变化的
							var _h = _field.height(); // 取得每次滚动高度(多行滚动情况下,此变量不可置于开始处,否则会有间隔时长延时)
							_field.animate({
								marginTop: -_h + 'px'
							}, 600, function() { // 通过取负margin值,隐藏第一行
								_field.css('marginTop', 0).appendTo(_wrap); // 隐藏后,将该行的margin值置零,并插入到最后,实现无缝滚动
							})
						}, _interval) // 滚动间隔时间取决于_interval
				}).trigger('mouseleave'); // 函数载入时,模拟执行mouseleave,即自动滚动
			}
		});
	
})(jQuery);
function showBigPic(){

	//显示大图片
	$('.client-imgpreview').click(function(){
		var src = $(this).attr('src');
		$("#client-bigimg").attr('src',src);
		$("#imgbox-toggle").show();
	})
	//关闭大图片
	$("#imgbox-toggle").click(function(){
		$(this).hide();
	})
}

function claimsMaterialCheck(record){

	  var listlen = $("#claimsMaterial").find(".verify-item").length;
    //点击不通过
    $(".audit-nopass").click(function(){

        var sele = $(this).parents(".verifygroup").next();
        $(this).parents(".verifygroup").find('.state').val('1');
        $(sele).show();
        $("#allPass").hide();
        $("#allnoPass").show();
        if(record != ''){
        	$("#discountBox").hide();
        }
       
       
    })
    //选择不通过原因
    $(".claims-reason").on("change",function(){
        var otherinfor = $(this).find("option:selected").text();
        if(otherinfor == '其他，请说明'){
            $(this).next().show();
        }else{
            $(this).next().hide();
        }
      
    })
    
    //点击通过
    var passcount = 0;
    $(".audit-pass").click(function(){
        var allpass = $(".audit-pass"),passcount= 0;
        $.each(allpass,function(){
            if(this.checked){
                passcount++;
            }
        })
        if( passcount == listlen){
            $("#allPass").show();
            $("#allnoPass").hide();
            if(record != ''){
            	$("#discountBox").show();
            }
        }
        $(this).parents(".verify-item").find(".claims-reason").hide();
        $(this).parents(".verify-item").find(".claims-explain").hide();
        $(this).parents(".verifygroup").find('.state').val('0');
    })
   
  
}
/*红包管理*/
function seleNatureToggle(obj1,obj2){
	//$("#infoForm").form('clear');
	//$("#infoForm").form('reset');
	$.each(obj1,function(i,v){
		var hasipt = v.find('input[type=text]');
		v.show();
		if(hasipt.length){
			//hasipt.validatebox('reduce');	
			hasipt.validatebox('enableValidation');
		}
		
		
	})
	$.each(obj2,function(i,v){
		var hasipt = v.find('input[type=text]');
		v.hide();
		if(hasipt.length){
			//hasipt.validatebox('remove');
			hasipt.validatebox('disableValidation');
		}
	   
	})
}

function redruleOperate(){
	 
	var redruleLimet = 1;
	 //红包补发
	$("#redruleReissue").change(function(){
	  var index = parseInt($(this).val());
	 
	  index ==1?seleNatureToggle([$(this).next()]):seleNatureToggle([],[$(this).next()]);
	  
	})
	//无限制
	$("#infoForm").on('click','.ui-unlimited',function(){
	    var isflag = $(this).is(":checked"),
	        target = $(this).prev(),
	        limet = $(this).data('lime') ||0;
	 	target.val(""); 
	    if(limet && isflag){
	    	redruleLimet++;
	    	$redtotal.val('');
	    }else if(limet && !isflag){
	    	redruleLimet--;
	    }  
	    if(redruleLimet == 1){
	    	$redtotal.attr('readonly','readonly');
		}else{
			$redtotal.removeAttr('readonly')
		}
	    if(isflag){
	    	$(target).attr('disabled','disabled').validatebox('disableValidation')
	    }else{
	    	$(target).removeAttr('disabled').validatebox('enableValidation');
	    	
	    }
	   	
	})
	var fixedamount = $(".redrule-orderfixed-amount"),
		radomamount = $(".redrule-orderRadom-amount"),
		noorderamount = $(".redrule-noorder-amount"),
		noorderradom = $(".redrule-noOrderRadom-amount"),
		singlered = $(".redrule-singleRed-amount"),
		radomfixed =$(".adopteradom-fixed"),
		radomscale = $(".adopteradom-scale"),
		modelfixed = $(".adoptionmodel-fixed"),
		modelscale = $(".adoptionmodel-scale"),
		prizebox = $(".prizepoolmodel-toggle"),
		maxmoney= $(".maxredrule-money");
		
	//红包性质
	$("#redruleNature").change(function(){
	  var index = $(this).val();
	  if(index ==0){
	    seleNatureToggle([noorderradom,singlered],[fixedamount,radomamount,noorderamount,radomfixed,radomscale,modelfixed,modelscale]);
	  }else if(index ==1){
	    seleNatureToggle([fixedamount,noorderamount,singlered,noorderradom,modelfixed],[radomamount,modelscale,radomfixed,radomscale]);
	  }else{
			seleNatureToggle([radomamount,noorderamount,radomfixed],[noorderradom,fixedamount,radomscale,modelfixed,modelscale,singlered,maxmoney]);
			maxmoney.validatebox('disableValidation');
	  }
	
	})
	
	//2采用模式
	$("#adoptionModel").change(function(){
	  var index = $(this).val();
	  if(index ==1){
	   
	    seleNatureToggle([modelfixed,singlered],[modelscale]);
	  }else if(index ==2){

	    seleNatureToggle([modelscale],[modelfixed,singlered]);
	  }
	  
	
	})
	//3采用模式
	$("#adoptionModelRadom").change(function(){
	  var index = $(this).val();
	  if(index ==1){ 
	    seleNatureToggle([radomfixed],[radomscale]);
	  }else if(index ==2){
	    seleNatureToggle([radomscale],[radomfixed]);
	  }
	  
	
	})
	
	
	//是否采用奖金池模式
	$("#prizePoolModel").change(function(){
	  var index = parseInt($(this).val());
	  index ==1?seleNatureToggle([prizebox],[]):seleNatureToggle([],[prizebox]);
	})
	
	
	var $redtotal = $("#dayTotal"),
		$reddailynum = $("#dailyCount"),
		$reddaynum = $("#dayNum");
	
	
	$reddailynum.on('keyup',function(){
		dailyRedruleCount(this,true,$reddaynum,$redtotal);
	})
	$reddaynum.on('keyup',function(){
		dailyRedruleCount(this,true,$reddailynum,$redtotal);
	})
	
	  

}
function dailyRedruleCount(obj,isflag,twobj,target){
	
	 if(isflag){
    	 var v1 = parseInt(twobj.val()),
    	     v2 = parseInt(obj.value);
    	 v1 = v1?v1:1;
    	 target.val(v1*v2);

    }
	 
}
function calculateParent(param){
	
		var allipt = $(".redrule-percentage"),parent=0,moneybox = $("#addreduceItem");
		if(moneybox.is(":visible")){
			$.each(allipt,function(i,v){
				var v1 = parseInt(v.value)?parseInt(v.value):0;
				parent +=v1;
			})
			if(parent!=100){
				if(param){
					showAlert('dlgParent','','middle');
				}else{
					showAlert('dlgParent');
				}
				
				return false;
			}
		}
		return true; 	
}
$.extend($.fn.datagrid.methods, {
    /**
     * 开打提示功能
     * @param {} jq
     * @param {} params 提示消息框的样式
     * @return {}
     */
    doCellTip: function(jq, params){
        function showTip(data, td, e){
            if ($(td).text() == "") 
                return;
            data.tooltip.text($(td).text()).css({
                top: (e.pageY + 10) + 'px',
                left: (e.pageX + 20) + 'px',
                'z-index': $.fn.window.defaults.zIndex,
                display: 'block'
            });
        };
        return jq.each(function(){
            var grid = $(this);
            var options = $(this).data('datagrid');
            if (!options.tooltip) {
                var panel = grid.datagrid('getPanel').panel('panel');
                var defaultCls = {
                    'border': '1px solid #ddd',
                    'padding': '2px',
                    'color': '#333',
                    'background': '#f7f5d1',
                    'position': 'absolute',
                    'max-width': '200px',
					'border-radius' : '4px',
					'-moz-border-radius' : '4px',
					'-webkit-border-radius' : '4px',
                    'display': 'none',
                    'word-break': 'break-all'
                }
                var tooltip = $("<div id='celltip'></div>").appendTo('body');
                tooltip.css($.extend({}, defaultCls, params.cls));
                options.tooltip = tooltip;
                panel.find('.datagrid-body').each(function(){
                    var delegateEle = $(this).find('> div.datagrid-body-inner').length ? $(this).find('> div.datagrid-body-inner')[0] : this;
                    $(delegateEle).undelegate('td', 'mouseover').undelegate('td', 'mouseout').undelegate('td', 'mousemove').delegate('td', {
                        'mouseover': function(e){
                            if (params.delay) {
                                if (options.tipDelayTime) 
                                    clearTimeout(options.tipDelayTime);
                                var that = this;
                                options.tipDelayTime = setTimeout(function(){
                                    showTip(options, that, e);
                                }, params.delay);
                            }
                            else {
                                showTip(options, this, e);
                            }
                            
                        },
                        'mouseout': function(e){
                            if (options.tipDelayTime) 
                                clearTimeout(options.tipDelayTime);
                            options.tooltip.css({
                                'display': 'none'
                            });
                        },
                        'mousemove': function(e){
							var that = this;
                            if (options.tipDelayTime) 
                                clearTimeout(options.tipDelayTime);
                            //showTip(options, this, e);
							options.tipDelayTime = setTimeout(function(){
                                    showTip(options, that, e);
                                }, params.delay);
                        }
                    });
                });
                
            }
            
        });
    },
    /**
     * 关闭消息提示功能
     *
     * @param {}
     *            jq
     * @return {}
     */
    cancelCellTip: function(jq){
        return jq.each(function(){
            var data = $(this).data('datagrid');
            if (data.tooltip) {
                data.tooltip.remove();
                data.tooltip = null;
                var panel = $(this).datagrid('getPanel').panel('panel');
                panel.find('.datagrid-body').undelegate('td', 'mouseover').undelegate('td', 'mouseout').undelegate('td', 'mousemove')
            }
            if (data.tipDelayTime) {
                clearTimeout(data.tipDelayTime);
                data.tipDelayTime = null;
            }
        });
    }
});
var inputs = {
	//保存小数点后两位	
	saveFloatTwo: function(obj) {
		$(obj).val(obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,
		        '$1$2.$3'));
	}	
}
var selfProduce = {
		insureInfor : function(hasinit){
			$(".produce-selebox").change(function() {
	            var txt = $(this).find('option:selected').text(),
	                $targetbox = $(this).parent().next().find(".produce-selebox"),
	                $chkboxs = $(this).parent().next().next().find("div");
	            $(this).find('option:selected').attr('selected','selected').siblings().removeAttr('selected');
	            if (txt == '是') {
	                $targetbox.show();
	                $chkboxs.show();
	            } else {
	                $targetbox.hide();
	                $chkboxs.hide();
	            }
	        })
	        //全选
		    $("#prudeceSeleList").on('click','.onerow-checked',function() {
		        var flag = $(this).is(':checked');
		        var $siblinsitem = $(this).parent('span').siblings("span").find('.proinsure-item-chb');
		        $siblinsitem.prop('checked', flag)
		    })
		    
		    
		    $("#prudeceSeleList").on('click','.proinsure-item-chb',function(){
		    	var mode = $(this).parents(".produce-chks").find(".proinsure-item-chb"),
		    		len = 0,flag=false,
		    		allcheck = $(this).parents(".produce-chks").find('.onerow-checked');
		    	$.each(mode,function(i,v){
		    		if(v.checked){
		    			len +=1;
		    		}
		    	})
		    	if(len == mode.length){
		    		flag = true;
		    	}
		    	allcheck.prop('checked', flag);
		    })
		    if(hasinit){
		    	var checkitem = $(".produce-chks");
		    		
			    $.each(checkitem,function(i,v){
			    	var sonitem = $(v).find('.proinsure-item-chb');
			    	var flag = false,checklen = 0;
			    	
			    	$.each(sonitem,function(j,m){
			    		
			    		if(sonitem && m.checked ){
			    			checklen+=1;
			    			
			    		}
			    	})
			    	if(checklen == sonitem.length){
			    		flag= true;
			    	}
			    	$(v).find('.onerow-checked').prop('checked', flag);
			    })
		    	
		    	
		    }
		    

		},
		startConfig : function(){
			
			var $produceconfig = $("#startConfigProd"),
            $producecongigshow = $("#produceConfigBox"),
            $addItemdate = $("#addItemDates"),
            source = $("#produceConfig").html(),
            $guarantinfor = $("#guarantInfor");
            
            
			  //单击开始配置
	          $produceconfig.on('click',function(){
	            
				var v1 = $addItemdate.find(".ui-menuoptmargin").length,
					v2 = $guarantinfor.is(":visible"),wd = 0;
					
					if(v1!= 0 && v2){
		              var producenewdates = $("#addItemDates").find('span'),
		              arrs = [],arrs2 = [],tempdatas = {},template,
		              monthanmes = [],
		              interestname = $(".interest-nameitem");
		              $.each(producenewdates,function(i,v){
		                  arrs[i] = {'name' : v.innerHTML};
		                  monthanmes[i] = 'productPremiumStr';
		              })
		              $.each(interestname,function(i,v){
		              		var id= $(this).data('id');
		                  arrs2[i] = {'name' : v.innerHTML,'premiums' : arrs,'id':id};
		              })
		              tempdatas = {'title' : arrs2,'date' : arrs}
		              var handleHelper = Handlebars.registerHelper("addOne",function(index){
					    	this._index = index;
					   		return this._index;
					  });
		              template = Handlebars.compile(source);
		              $producecongigshow.html(template(tempdatas));
		              monthanmes = ["priceBenefitId","insuredAmountStr","insuredType","insuredUnit","insuredUnit"].concat(monthanmes);
		               moreLine($('#produceConfigBox'),monthanmes);
		              
		              if(v1>4){
		                wd = (1+0.1*(v1-4))*100;
		              	$("#configBox").css('width',wd+'%');
		              }
					}else{
						alert("请选择保障期限和保障利益!");
					}
				
	      
	        })
        
		}
}

//产品的多张图片拼接值
function produceMoreImg(){
	var arrsimg = $("#producePicshow").find('.ui-addimg');
	var str = '';
	$.each(arrsimg,function(i,v){
		str += "/upload" + v.src.split("/upload")[1] + ";";
	})
	$("#productAdvantage").val(str.substring(0,str.length - 1));
}
function produceBtntextChange(){
	
	//产品配图有图片显示重新上传
	var prodarrs = ['produceImg','productTagUrlsImg'],
		produsrc = null;
	$.each(prodarrs,function(i,item){
		produsrc = $("#"+prodarrs[i]);
		if(produsrc.attr('src')){
			produsrc.next().val('重新上传');
		}
	})
	//产品优势删除功能
	$("#producePicshow").on('click','.produce-advantdel',function(){
		var len =$("#producePicshow").find('.produce-piclist').length;
		if(len == 1){
			$("#producePicshow").closest('li').hide();
		}
		$(this).closest('.produce-piclist').remove();
	})
}




 //四层树形过滤
    function filterInsure(arr) {
        var a = [],b=[],c=[],d=[];
        arr.forEach(function (items,index,is) {
            if (items.children) {
                a.push(items);
                items.children.forEach(function (item,index,is) {
                    if (item.children) {
                        b.push(item);
                        item.children.forEach(function (bat,index,is) {
                            if (bat.children) {
                                c.push(bat);
                                item.children.forEach(function (bat,index,is) {
                                    if (bat.children) {
                                        d.push(bat);
                                        //底层
                                    }
                                    if(index==is.length-1){
                                        if(d.length==0){
                                            item.children = null;
                                        }
                                    }
                                });
                            }
                            if(index==is.length-1){
                                if(c.length==0){
                                    item.children = null;
                                }
                            }
                        });
                    }
                    if(index==is.length-1){
                        if(b.length==0){
                            items.children = null;
                        }
                    }
                })
}
if(index==is.length-1){
    if(a.length==0){
        arr.children = null;
    }
}
});
return arr;
}
// 完