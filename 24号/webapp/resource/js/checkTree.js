/**
 *权限
 * @authors zhujb
 * @date    2014-11-26 19:57 Y_Y 
 * @version $Id$
 */
var tree={
	init:function(){
		$(".aut-box-fir-item:odd").css("background","#f6f6f6");
		var allInputs=$("input:checkbox");
		allInputs.each(function(){
			 var $this=$(this),
			 	inputs=$this.parents(".authorize-list-item").find(".aut-box-fir").find("input:checkbox");//操作子元素
			 if($this.is(":checked")){
				 var tag=tree.checkShowImg(inputs,$this);
				 tag==2?$this.siblings(".aut-check-show").addClass("check-part"):$this.siblings(".aut-check-show").addClass("check-all");
			 }
		});
		$(".aut-check-show").click(function(){
			tree.checkFunc($(this));
		});
	},
	checkFunc:function(obj){
		var o=obj.siblings(".aut-check");
		var idThis=o.attr("id");
		var checked=o.is(":checked")?false:true;
		var inputs=o.parents(".authorize-list-item").find(".aut-box-fir").find("input:checkbox");//第一级菜单外的所有元素
		checked ? o.prop("checked", true):o.prop("checked", false);
		checked ? obj.addClass("check-all"):obj.removeClass("check-all").removeClass("check-part");//checked选中
		
		if(o.attr("data-type")!="NOMENU"){//非权限级别
			//操作所有子元素
			inputs.each(function(){
				var objChild=$(this);
				var objId=objChild.attr("id");
				if(objId.indexOf(idThis)==0&&objId!=idThis&&objChild.is(":checked")!=checked){
					checked ? objChild.prop("checked", true):objChild.prop("checked", false);
					checked?objChild.siblings(".aut-check-show").addClass("check-all"):objChild.siblings(".aut-check-show").removeClass("check-all").removeClass("check-part");
				}
			});
		}	
		
		var parIds=tree.checkPar(idThis).split(",");//父辈元素
		//操作父元素
		for(var i=0;i<parIds.length-1;i++){
			var $parI=$("#"+parIds[i]);
			var flag=tree.checkShowImg(inputs,$parI);
			if(o.attr("data-type")!="NOMENU"){//非权限级别
				if(flag==0){
					$parI.siblings(".aut-check-show").removeClass("check-part");
					$parI.prop("checked", false);
				}else if(flag==1){
					$parI.siblings(".aut-check-show").removeClass("check-part").addClass("check-all");
					$parI.prop("checked", true);
				}else{
					$parI.siblings(".aut-check-show").removeClass("check-all").addClass("check-part");
					$parI.prop("checked", true);
				}
			}else{
				//权限级别，选中则也选中相应页面：取消选中不取消页面的选中
				if(checked){
					if(flag==1){
						$parI.siblings(".aut-check-show").removeClass("check-part").addClass("check-all");
						$parI.prop("checked", true);
					}else if(flag==2){
						$parI.siblings(".aut-check-show").removeClass("check-all").addClass("check-part");
						$parI.prop("checked", true);
					}
				}
				var same_val=o.val();
				//勾选同个入口的权限按钮 但这个按钮前面的页面不变化
				$(".aut-fourth-check").each(function(){
					var $same_this=$(this);
					var $same_obj=$same_this.siblings(".aut-check-show");
					if(this.value==same_val){
						checked ? $same_this.prop("checked", true):$same_this.prop("checked", false);
						checked ? $same_obj.addClass("check-all"):$same_obj.removeClass("check-all").removeClass("check-part");//checked选中
					}
				});
			}
		}
		
	},
	//显示o下有无选中其它子元素，选中时是全选还是部分选中(所有子元素、操作的checkbox)
	//return 0,无子元素选中；1,全选中；2,部分选中
	checkShowImg:function(all,o){
		var id=o.attr("id"),
			flag=false,//无子元素选中
			tip=true;//全部子元素选中
		all.each(function(){
			var $this=$(this);
			var idThis=$this.attr("id");
			if(idThis.indexOf(id)==0&&idThis!=id){
				if($this.is(":checked")){
					flag=true;//有选中的子元素
				}else{
					tip=false;//有未选中的子元素
				}
			}
		});
		if(!flag){
			return 0;
		}else{
			if(tip){
				return 1;
			}else{
				return 2;
			}
		}
	},
	checkPar:function(o){//遍历出所有祖先元素 
		 if(o.length>2){
			 var oStr=o.split("_");
			 var parId="";//上级id
			 for(var i=0;i<oStr.length-2;i++){
				 parId+=oStr[i]+"_";
			 }
			 return parId+","+tree.checkPar(parId);
		 }else{
			 return "";
		 }
	 }
}