<#include "../base.ftl"/>

<#macro titleContent>
    <title>在线支付</title>
    <meta name="keywords" content="${getText("label.system.siteKeywords")}"/>
    <meta name="description" content="${getText("label.system.siteDescription")}" />
    <script src="${contextPath}/themes/${themeName}/wap/js/Site.js"></script>
</#macro>

<#macro content>
  <div style="background: #ffffff;">
   <div class="Payone">
   		   您好：<#if loginUser.username ??><#if loginUser.username?length gt 20 >${loginUser.username?substring(0,20)!}...!<#else>${loginUser.username}! </#if></#if>  余额：<b><#if loginUser.chargefee ??>${loginUser.chargefee?c}<#else>0</#if></b>书币
   </div>
   <div class="one pay_title"><h3>充值金额</h3>1元=100书币</div>
        <div class="hd">
        <ul>
        		<#list feeList as fee>
        		<#list fee?keys as key>
            <li data-paynum="${key}" class="showmoney <#if (fee_index==1) >on</#if>" ><span>${key}元</span><span class="pay_size">${(key?number*100)?c}书币	<#if (fee.get(key)?number> 0) ><b>+${fee.get(key)}书币</b></span></a><em>送${fee.get(key)?number/100}元</em></#if></span></li>
            </#list>
            </#list>  

        </ul>
    </div>

<#--
<div class="one pay_title"><h3>充值方式</h3></div>
<br>
        <div class="hd02">
        <ul>
            <li data-type="alipay">支付宝</li>
						<li data-type="wxsm" class="on02">微信</li>
        </ul>
    </div>

  <div class="Other_pay">
  		其他金额：<input type="text" class="pay_text" id="othermoney">元
  </div>

  <div class="money">
  	 应付金额：<b class="money_read" id="showmoney">50</b>元
  </div>
-->
     <a href="javascript:;" onclick="submitpay()" class="Money_button">充值</a>
<br>
</div>
<script>
        $(function(){
            $(".hd li ").each(function(index){
                $(this).click(function(){
                    $(this).addClass("on")
                            .siblings().removeClass("on");
							onchange();
                   
                })
            })
        })
		        $(function(){
            $(".hd02 li ").each(function(index){
                $(this).click(function(){
                    $(this).addClass("on02")
                            .siblings().removeClass("on02");
                   
                })
            })
        })
function submitpay()
{
	var paynum="";
	if(paynum == "")
	{
		paynum=$(".on").attr('data-paynum');
	}
	//var paytype = 'alipay';
	paytype=$(".on02").attr('data-type');
	var url = "/user/publicpay/${articleno?c}/${chapterno?c}";

 	url+= "/j/"+paynum+".html";
	//alert(url);
	//return true;
	window.location.href=url;
}
function onchange()
{
	var paynum=$("#othermoney").val();
	if(paynum == "")
	{
		paynum=$(".on").attr('data-paynum');
	}
	$("#showmoney").html(paynum);
}
//$(".showmoney").bind('click', function(){onchange();});
$("#othermoney").bind('blur', function(){onchange();});
</script>
</#macro>