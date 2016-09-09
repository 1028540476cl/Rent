<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>发布信息</title>
    <script type="text/javascript">
    	function resetValue(){
    		document.getElementById("typeid").value="";
    		document.getElementById("imagea").value="";
    		document.getElementById("title").value="";
    		document.getElementById("content").value="";
    		document.getElementById("phone").value="";
    		document.getElementById("linkman").value="";
    		document.getElementById("qq").value="";
    		
    	}
    	
    	function checkForm(){
    		var typeid=document.getElementById("typeid").value;
    		var imagea=document.getElementById("imagea").value;
    		var title=document.getElementById("title").value;
    		var content=document.getElementById("content").value;
    		var phone=document.getElementById("phone").value;
    		var linkman=document.getElementById("linkman").value;
    		var email=document.getElementById("qq").value;
    		if(typeid==null || typeid==""){
    			alert("请选择信息类别！");
    			return;
    		}else if(imagea==null || imagea==""){
    			alert("请上传物品照片！");
    			return;
    		}else if(title==null || title==""){
    			alert("请输入标题！");
    			return;
    		}else if(content==null || content==""){
    			alert("请输入内容！");
    			return;
    		}else if(phone==null || phone==""){
    			alert("请输入联系电话！");
    			return;
    		}else if(linkman==null || linkman==""){
    			alert("请输入联系人！");
    			return;
    		}else if(qq==null || qq==""){
    			alert("请输入qq！");
    			return;
    		}else{
    			document.getElementById("addInfoForm").submit();
    		}
    	}
    </script>
</head>
<body>
    <center>
    <table border="0" cellpadding="0" cellspacing="0" width="688" height="100%">
        <tr height="20"><td><img src="images/default_t.jpg"></td></tr>
        <tr>
            <td background="images/default_m.jpg" valign="top" align="center">
            	<form id="addInfoForm" action="rent/searchindex!addInfo" method="post">
                <input type="hidden" name="addType" value="add"/>
                <table border="0" width="650" height="300" rules="all" cellspacing="0">
                    <tr height="30"><td style="text-indent:10"><font color="#004790"><b>■发布信息</b></font></td></tr>
                    <tr>
                        <td align="center">
                            <table border="0" width="650" rules="all" cellspacing="8">                    
                                <tr>
                                    <td width="20%" style="text-indent:10">信息类别：</td>
                                    <td>
                                    	<select id="typeid" name="info.typeid">
                                    	<option value="">请选择...</option>
                                    	<c:forEach var="top" items="${toplist }">
                                    		<option value="${top.id }">${top.typeName}</option>
                                    	</c:forEach>
                                    	</select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-indent:10">上传图片：</td>
                                    <td><li><input type="file" id="imagea" name="info.imagea" value="${Goods.imagea }" /></li></td>                      
                                </tr>
                                <tr>
                                    <td style="text-indent:10">信息标题：</td>
                                    <td><input type="text" id="title" name="info.title" value="${Goods.title }" size="80" maxlength="40"/></td>                        
                                </tr>
                                <tr>
                                    <td style="text-indent:10" valign="top">信息内容：</td> 
                                    <td align="center"><textarea id="content" name="info.content" rows="12" cols="60">${Goods.content }</textarea></td>
                                </tr>
                                <tr>
                                    <td style="text-indent:10">联系电话：</td>
                                    <td ><input type="text" id="phone" name="info.phone" value="${Goods.phone }" size="55"/></td>
                                </tr>
                                <tr>
                                    <td style="text-indent:10">联 系 人：</td>
                                    <td><input type="text" id="linkman" name="info.linkman" value="${Goods.linkman }" size="55"/></td>
                                </tr>
                                <tr>
                                    <td style="text-indent:10">QQ：</td>
                                    <td ><input type="text" id="qq" name="info.qq" value="${Goods.qq}" size="55"></td>                    
                                </tr>
                            </table>                
                        </td>
                    </tr>
                    <tr align="center" height="50">
                        <td>
                        	<input type="button" onclick="checkForm()" value="发布"/>
                        	<input type="button" onclick="resetValue()" value="重填"/>
                        </td>
                    </tr>
                </table>
                </form>         
            </td>
        </tr>
        <tr height="26"><td><img src="images/default_e.jpg"/></td></tr>        
    </table>
    </center>
    ${error }
</body>
</html>