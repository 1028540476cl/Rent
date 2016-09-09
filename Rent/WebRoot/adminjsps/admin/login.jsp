<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>

<html>
<head>
    <title>管理员登录</title>
    <base href="<%=basePath%>">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript">
	    function resetValue(){
			document.getElementById("loginname").value="";
			document.getElementById("loginpass").value="";
		}
	    
	    function checkForm(){
    		var loginname=document.getElementById("loginname").value;
    		var loginpass=document.getElementById("loginpass").value;
    		if(loginname==null || loginname==""){
    			alert("请输入用户名！");
    			return;
    		}else if(loginpass==null || loginpass==""){
    			alert("请输入密码！");
    			return;
    		}else{
    			document.getElementById("loginForm").submit();
    		}
    	}
    </script>
</head>
<body bgcolor="#E7ECEF">
    <center>
    	<form id="loginForm" action="rent/userindex!login" method="post">
            <table border="0" cellspacing="0" cellpadding="0" style="margin-top:130">
                <tr><td><img src="images/logon_tp.jpg"></td></tr>                
                <tr height="180">
                    <td background="images/logon_middle.gif" align="center" valign="top">
                         <table border="0" width="90%" cellspacing="0" cellpadding="0">
                       
                         <tr height="50"><td colspan="2" align="center"><h2><font color="yellowgreen">后台功能仅限管理员登录</font></h2></td></tr>
                         
                         <tr height="50"><td colspan="2" align="center"><font color="red">${error }</font></td></tr>
                         
                             
                             <tr height="30">
                                 <td align="right" width="40%">用户名：&nbsp;&nbsp;</td>
                                 <td style="text-indent:5"><input type="text" name="user.loginname" id="loginname" value="${user.loginname }" size="30"/></td>
                             </tr>                
                             <tr height="30">
                                 <td align="right">密&nbsp;&nbsp;码：&nbsp;&nbsp;</td>
                                 <td style="text-indent:5"><input type="password" name="user.loginpass" id="loginpass" value="${user.loginpass }" size="30"/></td>
                             </tr>
                             <tr height="60">
                                 <td></td>
                                 <td>
                                 	<input type="button" value="登录" onclick="checkForm()"/>
                                 	<input type="button" value="重置" onclick="resetValue()"/>
                                 	<a href="index.jsp">[返回首页]</a>
                                 </td>
                             </tr>
                         </table>
                    </td>
                </tr>
                <tr><td><img src="images/logon_end.gif"></td></tr>
            </table>
        </form>  
    </center>
</body>
</html>