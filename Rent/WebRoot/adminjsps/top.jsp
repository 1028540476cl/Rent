<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib prefix="s2" uri="/struts-tags" %>

<html>
<head><title>后台-页眉</title></head>
<body>
    <center>
        <table border="0" width="100%" height="130" cellspacing="0" cellpadding="0" background="images/admin.jpg">
            <tr>
                <td width="100%" height="100%" align="right" valign="bottom">
                <h2 >欢迎你：<font color="red">${userlogin.loginname }管理员</font></h2><font ></font>
                  <s2:a href="index.jsp"><img src="images/admin_index.gif" border="0"></s2:a><s2:a href="rent/userindex!loginOut"><img src="images/admin_exit.gif" border="0"></s2:a>
                </td>
            </tr>            
        </table>
    </center>
</body>
</html>