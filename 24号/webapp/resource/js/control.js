/**
 *
 * @authors Your Name (you@example.org)
 * @date    2015-01-21 09:54:05
 * @version $Id$
 */
var control = {
	/*
	 * @ setCur 设置最后一次访问的IFRAME的URL
	 * @ param  url 当前URL
	 * 
	 */
	setCur: function(url) {
		$.cookie('curUrl', url);
	},
	/*
	 * @ getCur 获取最后一次访问的IFRAME的URL
	 * @ param  空
	 * 
	 */
	getCur: function() {
		return $.cookie('curUrl');
	},
	/*
	 * @ subPage 当前菜单选中
	 * @ param  ID为菜单ID
	 * 
	 */
	subPage: function(ID) {
		$("#" + ID).click();
	},
	
	powerPage: function(obj) {
		var crbs=$(obj).parents('#crumbs'),crid=$(obj).data('id');
		if(crbs.length!=0){//点击的是面包屑
			if(crid==crbs.find('a:eq(0)').data('id')){//第一个
				$('#'+crid).click();
			}else{//第二个
				$('#'+crid).siblings('.sm-ui-leftmenu-submain').find('.sm-ui-leftmenu-subitem-name:eq(0)').click();
			}
		}
	},
	/*
	 * @ setIsleftin 是否左边菜单进来的
	 * @ param  空
	 * 
	 */
	setIsleftin: function(flag) {
		$.cookie('flag', flag);
	},
	getIsleftin: function() {
		return $.cookie('flag');
	},
	//获取当前菜单id
	setCurrentId: function(flag) {
		$.cookie('currentId', flag);
	},
	getCurrentId: function() {
		return $.cookie('currentId');
	},
	/*
	 * @ backHistroy 当前菜单选中
	 * @ param  levelOne一级菜单ID，levelTwo二级菜单ID，levelThree三级菜单ID
	 * 
	 */
	backHistroy: function(levelOne,levelTwo,levelThree) {
		/**/
		if(control.getIsleftin()=='false'){
			if (levelThree) {
				control.setCurrentId(levelThree);
			} else {
				control.setCurrentId(levelTwo);
			}
			$("#" + levelOne).click();
		}
		control.setCurrentId(false);
		
	},

	/*
	 * @ objectLeftMenu 三级菜单显示
	 * @ param id二级菜单ID，childId三级选中ID
	 * 
	 */
	objectLeftMenu: function(id, childId) {
		var baseUrl=$('#baseUrl').val();
		$.ajax({
	  		url: baseUrl+'/getChildResourceList',
	  		type: 'post',
	  		dataType: 'json',
	  		data: {"parentResourceId": id,"level":1},
	  		success:function(result){
	  			$("#leftMenu").empty();
	  			if(result.TRADETAILS){
	                sHtml='<ul>';
	                for (var i=0; i< result.TRADETAILS.length; i++) {
		                  var className="";
		                  if( result.TRADETAILS[i].childList.length!=0){//有三级的二级
		                	  if(childId=='false'&&i==0){
			                      className="sm-ui-leftmenu-item-multi-open";
			                  }
		                	  if(result.TRADETAILS[i].resourceId==childId||childId.indexOf(result.TRADETAILS[i].resourceId)!=-1){
			                      className="sm-ui-leftmenu-item-multi-open";
			                  }
		                	  
		                	  sHtml+='<li class="sm-ui-leftmenu-item-multi '+className+'">'+
								   '<a class="sm-ui-leftmenu-item-multi-name" target="mainCont" href="javascript:;" id="' +result.TRADETAILS[i].resourceId + '">' +
								    '<i class="sm-ui-icon-arrow "></i>'+
								    result.TRADETAILS[i].name+'</a>'+
								    '<ul class="sm-ui-leftmenu-submain">'
													      
		                  	   for(var j=0;j<result.TRADETAILS[i].childList.length;j++){//三级
		                      		var classSubName='';
		                      		var child=result.TRADETAILS[i].childList[j];
		                  		    if(childId=='false'&&i==0&&j==0){
		                  		    	classSubName="sm-ui-leftmenu-subitem-current";
		                  		    }
		                  		    if(child.resourceId==childId){
		                  		    	classSubName="sm-ui-leftmenu-subitem-current";
				                    }
			                		
			                		sHtml+='<li class="sm-ui-leftmenu-subitem '+classSubName+'">'+
									       '<a class="sm-ui-leftmenu-subitem-name" target="mainCont" href="'+baseUrl+child.url+'" id="' +child.resourceId + '">' +
									        child.name+'</a></li>'										
		                  	   }
			                  	sHtml+='</ul></li>';
		                  	
		                  }else{//无三级的二级
		                	    if(childId=='false'&&i==0){
			                        className="sm-ui-leftmenu-item-current";
			                    }
		                	    if(result.TRADETAILS[i].resourceId==childId){
				                   className="sm-ui-leftmenu-item-current";
				                 }
						        sHtml+='<li class="sm-ui-leftmenu-item  '+className+'" id="' +result.TRADETAILS[i].resourceId + '">' +
									   '<a class="sm-ui-leftmenu-item-name" target="mainCont" href="'+baseUrl+result.TRADETAILS[i].url+'">'+result.TRADETAILS[i].name+'</a>'+
								       '</li>'
		                  }
		               }
		               
		             sHtml+='</ul>';
	                 $("#leftMenu").append(sHtml);

	  			}else{
	  				$('#page').layout('collapse','west');
	  			}
	  		}
	  	})
	},
	/*
	 * @ getUrlPAP 获取子页面的URL
	 * @ param 空
	 * 
	 */
	getUrlPAP:function()
	{
	   var url = window.mainCont.location.href.toString();
	   var arrUrl = url.split("//");
	   var start = arrUrl[1].indexOf("/");
	   var relUrl = arrUrl[1].substring(start);//stop省略，截取从start开始到结尾的所有字符
       return relUrl;
	}

}