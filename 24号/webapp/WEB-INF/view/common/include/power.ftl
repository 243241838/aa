<#--
   @name fButton 页面按钮权限
   @param (list 按钮对象)、(type 按钮类型) 、(template 输出模版 替换参数：@NAME@ 按钮输出名称， @URL@ 请求地址， @ID@ ID标识) 
-->
<#function fButton list type template>
     <#list list as securityResource>
          <#if securityResource.menuImage4==type>
                 <#return template?replace("@NAME@",securityResource.name)?replace("@URL@",securityResource.url)?replace("@ID@",securityResource.resourceId)>
                 <#break>
          </#if>
     </#list>    
</#function>
<#--
   @name 面包屑 
   @param (list 权限对象)、(当权URL) 
-->
<#function fCrumbs list>
    <#assign html=""/>
    <#if list?has_content>
      <#list list as list>
          <#assign str=list.name?if_exists?index_of("-")+1 />
          <#if str==-1>
             <#assign str=0 />
          </#if>
        <#if list_has_next>
         <#assign html=html+'<a class="crumbs-link" data-id="${list.resourceId}" onclick="window.parent.control.subPage(\'${list.resourceId}\')" href="${list.url}">${(list.name)?if_exists?substring(str)}<span>></span></a>'>
        <#else>
          <#assign html=html+'<a data-id="${list.resourceId}" class="crumbs-tit" >${(list.name)?if_exists?substring(str)}</a>'>
        </#if>
      </#list>
    </#if>
    <#return html>
</#function>
<#--
     控制刷新、返回、前进菜单选择，和IFRAME页面跳转
-->
<script>
   $(function(){
   try 
   { 
     window.parent.control.setCur(window.parent.control.getUrlPAP());
     var levelOne=$("#crumbs").find("a").eq(0).data("id");
    var levelTwo=$("#crumbs").find("a").eq(1).data("id");
    var levelThree=$("#crumbs").find("a").eq(2).data("id");
    window.parent.control.backHistroy(levelOne,levelTwo,levelThree)
   } 
   catch (e) 
   { 
     console.log("不再主体页面内")
   } 
    
	 })
</script>
<#--
    返回面包屑
-->
${fCrumbs(menuPaht)} 
