<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
  <title>后台-审核信息</title>
  <base href="<%=basePath%>">

</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
    	function deleteGoods(deleteid){
    		if(confirm("确认要删除这条信息吗?")){
    			$.post("rent/adminindex!deleteGoods",{dlid:deleteid},	
    				function(delFlag){
    					var flag=eval(delFlag);
    					if(flag){
    						alert("删除成功！");
    						window.location.href="rent/adminindex!jiemian";
    					}else{
    						alert("删除失败！");
    					}
    				}
    			);
    		}
    	}
    	
    </script>
<body>
    <center>
        <br>
        <table border="0" width="645" cellpadding="10" cellspacing="0" style="word-break:break-all">
        	            
            <tr height="30">
                <td style="text-indent:5"><b>待操作物品详细 [ID值：${goods.uid }]</b>&nbsp;&nbsp;&nbsp;
              <b>操作：</b><a href="rent/adminindex!detailsCheckGoods?uid=${goods.uid }"><font color="blue">√审核</font></a>
							<a href="rent/adminindex!payGoods?uid=${goods.uid }"><font color="violet">√交换</font></a>
							<a href="javascript:deleteGoods('${goods.uid }')"><font color="red">×删除</font></a>
							<img src="<c:url value='/goods_img/${goods.imagea }'/>" border="0" /></a></td>
                <td colspan="2" align="right">
                </td>
            </tr>
            <tr height="30" bgcolor="#F9F9F9"><td colspan="3" align="center" style="text-indent:5">信息详细内容</td></tr>
            <tr height="30">
                <td width="25%" style="text-indent:10">物品类别：</td>
                <td>【${goods.typeName }】</td>
                <td>交换状态：&nbsp;&nbsp;
                <c:choose>
                	<c:when test="${goods.payfor==0 }">
                		● 已交换
                	</c:when>
                	<c:otherwise>
                		★ 未交换
                	</c:otherwise>
                </c:choose></td>
            </tr>
            <tr height="30">
                <td style="text-indent:10">发布时间：</td>
                <td>${goods.infoDate }</td>
                <td>审核状态：&nbsp;&nbsp;
                <c:choose>
                	<c:when test="${goods.state==1 }">
                		★ 已审核
                	</c:when>
                	<c:otherwise>
                		● 未审核
                	</c:otherwise>
                </c:choose></td>
            </tr>
            <tr height="30">
                <td style="text-indent:10">物品信息标题：</td>
                <td colspan="2">${goods.title }</td>
            </tr>
            <tr height="40" bgcolor="#F9F9F9">
                <td style="text-indent:10">信息内容：</td>
                <td align="center"> 
                </td>
                <td align="center"></td>                
            </tr>
            <tr height="5"><td></td></tr>
            <tr>
                <td colspan="3" style="border:1 solid">
                    <table border="0" width="630" cellspacing="0" cellpadding="10" style="word-break:break-all">
                        <tr height="130"><td colspan="3" valign="top">${goods.content }</td></tr>
                        <tr height="30" align="center">
                            <td>联系电话：${goods.phone }</td>
                            <td>联系人：${goods.linkman }</td>
                            <td>QQ：${goods.qq }</td>
                        </tr>
                   </table>  
                </td>
            </tr>
            <tr><td align="center" colspan="3"><a href="javascript:window.history.back(-1)">返回</a></td></tr>
         </table>
    </center>
</body>
</html>