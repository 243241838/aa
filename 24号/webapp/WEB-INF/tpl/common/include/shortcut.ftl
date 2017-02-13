<#--
   @name shortMemu 快捷菜单URL数组
   @element  二维数组，前面URL 和面是名称  
-->
<#assign shortMemu=[
    ["/userManage/userMessage/userMessage","用户信息查询"],<#-- 用户信息查询-->
    ["/userManage/userMessageAuth/userAuthFirst","用户信息认证（个人）"],<#-- 用户信息认证-->
    ["/accountManage/accountList","账户信息查询"],<#-- 账户信息查询-->
    ["/role/findListView","角色管理"],<#-- 角色管理-->
    ["/operator/findListView","操作员管理"],<#-- 操作员管理-->
    ["/operator/toPwdEdit","密码修改"]<#-- 密码修改-->
    ]>
<#--
   @name fShortcur 返回有权限的菜单
   @param (list 有权限的菜单树)、(shortMemu 快捷菜单URL数组) 、(isIndex 是否是首页引用 是TURE) 
-->  
<#function fShortcur list isIndex>
     <#assign html=""/>
     <#list shortMemu as arr>
          <#list list as securityResource> 
              <#if securityResource.url==arr[0] && securityResource.name==arr[1]>
                 <#if isIndex==true>
                     <#assign html=html+'<a href="/toHome?url=${securityResource?if_exists.url}&resourceId=${securityResource?if_exists.resourceId}"  onclick="control.setCur(\'${securityResource?if_exists.url}\')"  class="sm-ui-set-content-item">${securityResource?if_exists.name}</a>'>
                    <#else>
                     <#assign html=html+'<a href="${securityResource?if_exists.url}" onclick="control.subPage(\'${securityResource.resourceId}\')"  target="mainCont" class="sm-ui-set-content-item">${securityResource?if_exists.name}</a>'>
                  </#if>
                  <#break>
              </#if>
          </#list>
     </#list>
     <#return html>
</#function> 