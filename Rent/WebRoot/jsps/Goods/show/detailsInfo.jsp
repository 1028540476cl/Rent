<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
  <title>查询—查看详细内容</title>
  <base href="<%=basePath%>">
  <link type="text/css" rel="stylesheet" href="<s2:url value='css/style.css'/>">
</head>
<body>
    <center>
        <table width="690" border="0" cellspacing="0" cellpadding="0" style="margin-top:5">
            <tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>■查看详细信息</b></font></td></tr>            
            <tr height="1"><td></td></tr>
            <tr bgcolor="#FAFCF5">
                <td style="border:1 solid">
                    <table border="0" width="100%" cellspacing="0" cellpadding="2">
                    	<c:choose>
                    		<c:when test="${goods==null }">
                    			<tr height="100"><td align="center" colspan="2" style="border:1 solid">★★★ 查看信息详细内容出错！★★★</td></tr>
                    		</c:when>
                    		<c:otherwise>
                    		<tr height="40">
                                <td width="20%" style="text-indent:20">物品类别：</td>
                                <td>${goods.typeName } </td>
                            </tr> 
                    		<tr height="100">
                                 <td  style="text-indent:20">物品图片：</td>
                                <td><img src="<c:url value='/goods_img/${goods.imagea }'/>" border="0" /></td>
                            </tr>
                            <tr height="40">
                                <td style="text-indent:20">物品标题：</td>
                                <td>${goods.title }</td>
                            </tr>
                            <tr height="40"><td colspan="2" style="text-indent:20">物品详细信息：</td></tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <table border="1" width="630" cellspacing="0" cellpadding="10" rules="none" frame="below" style="word-break:break-all" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
                                        <tr height="200" bgcolor="white"><td colspan="4" valign="top" style="border:1 solid">${goods.content }</td></tr>
                                        <tr height="20" align="center">
                                            <td>联系电话：${goods.phone }</td>
                                            <td>联系人：${goods.linkman }</td>
                                            <td>QQ：${goods.qq }</td>
                                            <td>发布时间：${goods.infoDate }</td>
                                        </tr>
                                    </table>                      
                                </td>
                            </tr>
                            <tr height="63"><td align="center" colspan="2"><a href="javascript:window.history.back(-1)">返回</a></td></tr>                              
                    		</c:otherwise>
                    	</c:choose>
                    </table>
                </td>
            </tr>
        </table>
        <br>
    </center>
</body>
</html>