<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.Map,java.util.TreeMap" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html>
<head><title>后台-侧栏</title></head>
<script type="text/javascript">
	function checkFrom(){
		var typeId=document.getElementById("typeid").value;
		if(typeId==null||typeId==""){
			alert("请选择查询物品的类别");
			return;
		}else{
			document.getElementById("searchForm").submit();
		}
		
	}
</script>
<body background="images/back.gif">
    <center>
        <table border="0" width="220" height="100%" cellspacing="0" cellpadding="0" style="margin-top:7">
            <!-- 显示方式 -->
            <tr height="30" bgcolor="#F0F0F0"><td style="text-indent:5;border:1 solid"><font color="#004790"><b>■显示方式</b></font></td></tr>
            <tr height="1"><td></td></tr>
            <form id="searchForm" action="rent/adminindex!searchGoods"  method="post">
            <tr>
                <td align="center" valign="top" style="border:1 solid">
                    <table border="0" width="220" height="150" rules="all" cellspacing="0">
                        <tr>
                            <td align="center" colspan="2">
                                <fieldset style="height:60;width:210">
                                  <legend>★交换状态</legend>
                                  <br>
                                  <input  type="radio" value="0" name="payfor" id="payfor1" />已交换
                                  <input  type="radio" value="1" name="payfor" id="payfor2" />未交换
                                  <input  type="radio" value="all" name="payfor" id="payfor3" checked="checked"/>全部
                                </fieldset>
                                <fieldset style="height:60;width:210">
                                  <legend>★审核状态</legend>
                                  <br>
                                   <input  type="radio" value="1" name="state" id="state1" />已审核
                                  <input  type="radio" value="0" name="state" id="state2" />未审核
                                  <input  type="radio" value="all" name="state" id="state3" checked="checked"/>全部
                                </fieldset>
                            </td>
                        </tr>
                        <tr align="center" height="30" bgcolor="lightgrey">
                            <td>
                               信息类别：
                               <select id="typeid" name="typeid">
                                    	<option value="">请选择...</option>
                                    	<c:forEach var="Goodtop" items="${toplist}">
                                    		<option value="${Goodtop.id }">${Goodtop.typeName}</option>
                                    	</c:forEach>
                                    	</select>
                                    	<input type="button" onclick="checkFrom()"  value="查询"/>
                    
                            </td>
                        </tr>
                        
                    </table>
                </td>
            </tr>
            </form>
            <tr height="5"><td></td></tr>
            <tr height="30" bgcolor="#F0F0F0"><td style="text-indent:5;border:1 solid"><font color="#004790"><b>■日历</b></font></td></tr>
            <tr height="1"><td></td></tr>
            <!-- 日历 -->            
            <tr height="130">
                <td valign="top" style="border:1 solid"><jsp:include page="/js/calendar.jsp"/></td>
            </tr>
        </table>        
    </center>
</body>
<script type="text/javascript">
	setrad("payfor",'${payfor}');
	setrad("state",'${state}');
	document.getElementById("typeid").value='${typeid}';

	
	function setrad(Name,Value){
		var inputType=document.getElementsByName(Name);
		for(var i=0;i<inputType.length;i++){
			if(inputType[i].value==Value){
				inputType[i].checked=true;
			}
		}
	}
	
	</script>
</html>