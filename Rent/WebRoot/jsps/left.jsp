<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
  <title>侧栏</title>
</head>
<script type="text/javascript">
function checkForm(){
	 var keyword=document.getElementById("keyword").value;
	 var condition=document.getElementById("condition").value;
	 if(keyword==null|| keyword==""){
		 alert("请输入关键字");
		 return;
	 }else if (condition==null|| condition==""){
		 alert("请输入搜索条件");
		 return;
	 }else{
		 document.getElementById("searchForm").submit();
	 }
}
</script>
<body>
    <center>
        <table border="0" width="225" height="100%" cellspacing="0" cellpadding="0">
            <tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>■日历</b></font></td></tr>            
            <tr height="1"><td></td></tr>
            <tr height="215">
                <td valign="top" background="images/leftD.jpg"><jsp:include page="/js/calendar.jsp"/></td>
            </tr>
            <tr height="1"><td></td></tr>
            <tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>■信息快速搜索</b></font></td></tr>
            <tr height="1"><td></td></tr>
            <tr height="103">
                <td align="center" valign="top" background="images/leftS.jpg">
                    <form id="searchForm" action="rent/searchindex!searchGoods" method="Post">
                    <table border="0" width="99%" height="100%" cellspacing="0">
                        <tr height="10"><td colspan="3"></td></tr>
                        <tr>
                            <td align="right" width="70">关键字：</td>
                            <td colspan="2" width="200"><input id="keyword" name="keyword" type="text"/></td>
                        </tr>
                        <tr>
                            <td align="right">条&nbsp;&nbsp;件：</td>
                            <td>
                                <select id="condition" name="condition">
                                	<option value="">请选择...</option>
								    <option value="qq">QQ</option>
								    <option value="id">ID值</option>
								    <option value="content">物品详细信息</option>
								    <option value="title">物品标题</option>
								    <option value="linkman">联系人</option>
								    <option value="phone">联系电话</option>
                                </select>
                            </td>
                            <td align="center" width="28"><input type="button" value="搜索" onclick="checkForm()"/ ></td>
                        </tr>
                        <tr>
                            <td align="right">搜索类型：</td>
                            <td colspan="2">
                                <input  value="equal" id="equal" type="radio" name="searchType" />全字匹配    
                                <input value="like" id="like" type="radio" checked="checked" name="searchType"/>模糊搜索                           
                            </td>
                        </tr>
                        <tr height="10"><td colspan="3"></td></tr>
                    </table>
                     </form>  
                </td>
            </tr>
            <tr><td></td></tr>
        </table> 
                    
    </center>
    <script type="text/javascript">
	document.getElementById("keyword").value='${keyword}';
	document.getElementById("condition").value='${condition}';
	if('like'=='${searchType}'){
		document.getElementById("like").checked=true;
	}else{
		document.getElementById("equal").checked=true;
	}
</script>
</body>
</html>