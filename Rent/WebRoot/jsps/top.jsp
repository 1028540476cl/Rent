<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>页眉</title>
</head>
<body>
    <center>
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <!-- 顶部菜单 -->
            <tr height="20">
                <td style="text-indent:10" valign="bottom">
                    <a href="rent/searchindex!addGoods" style="color:gray">[发布信息]</a>
                    <a href="rent/userindex!isLogin" style="color:gray">[进入后台]</a>
                </td>
                <td align="right" valign="bottom">
                  
                    &nbsp;
                </td>
            </tr>
            <!-- 导航菜单 -->
            <tr height="56">
                <td align="center" width="220" background="images/logo.gif"></td>
                <td align="right" background="images/menu.gif">
                <c:choose>
                <c:when test="${toplist==null|| toplist.size()==0}">
               	 没有信息类别可以显示
                </c:when>
                <c:otherwise>
                        <table border="0" width="600">
                            <tr align="center">
                               	    <td width="100"><font><a href="http://localhost:8080/Rent" style="color:white">首&nbsp;&nbsp;&nbsp;&nbsp;页</a></font></td>
                               	    <c:forEach var="top" items="${toplist}" varStatus="status" >
                               	    	<td width="100"><a href="rent/searchindex!getGoodsByType?typeid=${top.id }" style="color:white">${top.typeName}</a></td>
                               	       <c:if test="${status.index==3}">
                               	        </tr>
                               	    
                            <tr align="center">
                            </c:if>
                               </c:forEach>
                               	    </table>
                        </c:otherwise>
                </c:choose>
                </td>
            </tr>
        </table>
        <table border="0" width="100%" height="90" cellspacing="0" cellpadding="0" style="margin-top:1">
            <tr><td align="center"><a href="" target="_blank"><img src="images/logo3.gif"></a></td></tr>
        </table>
    </center>
</body>
</html>