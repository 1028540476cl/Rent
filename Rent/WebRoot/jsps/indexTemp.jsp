<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	String mainPage=(String)request.getAttribute("mainPage");
	if(mainPage==null || mainPage.equals("")){
		mainPage="default.jsp";
	}
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>校园物品交流网</title>
<base href="<%=basePath%>">
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body background="images/back.gif">
	<center>
        <table border="0" width="920" cellspacing="0" cellpadding="0" bgcolor="white">
            <tr><td colspan="2"><jsp:include page="top.jsp"/></td></tr>
            <tr>
                <td width="230" valign="top" align="center"><%@ include file="left.jsp" %></td>
                <td width="690" height="400" align="center" valign="top" bgcolor="#FFFFFF"><jsp:include page="<%=mainPage%>"/></td>
            </tr>
            <tr><td colspan="2"><%@ include file="end.jsp" %></td></tr>
        </table>        
    </center>
</body>
</html>