<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.Map,java.util.TreeMap" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html>
<head><title>��̨-����</title></head>
<script type="text/javascript">
	function checkFrom(){
		var typeId=document.getElementById("typeid").value;
		if(typeId==null||typeId==""){
			alert("��ѡ���ѯ��Ʒ�����");
			return;
		}else{
			document.getElementById("searchForm").submit();
		}
		
	}
</script>
<body background="images/back.gif">
    <center>
        <table border="0" width="220" height="100%" cellspacing="0" cellpadding="0" style="margin-top:7">
            <!-- ��ʾ��ʽ -->
            <tr height="30" bgcolor="#F0F0F0"><td style="text-indent:5;border:1 solid"><font color="#004790"><b>����ʾ��ʽ</b></font></td></tr>
            <tr height="1"><td></td></tr>
            <form id="searchForm" action="rent/adminindex!searchGoods"  method="post">
            <tr>
                <td align="center" valign="top" style="border:1 solid">
                    <table border="0" width="220" height="150" rules="all" cellspacing="0">
                        <tr>
                            <td align="center" colspan="2">
                                <fieldset style="height:60;width:210">
                                  <legend>�ｻ��״̬</legend>
                                  <br>
                                  <input  type="radio" value="0" name="payfor" id="payfor1" />�ѽ���
                                  <input  type="radio" value="1" name="payfor" id="payfor2" />δ����
                                  <input  type="radio" value="all" name="payfor" id="payfor3" checked="checked"/>ȫ��
                                </fieldset>
                                <fieldset style="height:60;width:210">
                                  <legend>�����״̬</legend>
                                  <br>
                                   <input  type="radio" value="1" name="state" id="state1" />�����
                                  <input  type="radio" value="0" name="state" id="state2" />δ���
                                  <input  type="radio" value="all" name="state" id="state3" checked="checked"/>ȫ��
                                </fieldset>
                            </td>
                        </tr>
                        <tr align="center" height="30" bgcolor="lightgrey">
                            <td>
                               ��Ϣ���
                               <select id="typeid" name="typeid">
                                    	<option value="">��ѡ��...</option>
                                    	<c:forEach var="Goodtop" items="${toplist}">
                                    		<option value="${Goodtop.id }">${Goodtop.typeName}</option>
                                    	</c:forEach>
                                    	</select>
                                    	<input type="button" onclick="checkFrom()"  value="��ѯ"/>
                    
                            </td>
                        </tr>
                        
                    </table>
                </td>
            </tr>
            </form>
            <tr height="5"><td></td></tr>
            <tr height="30" bgcolor="#F0F0F0"><td style="text-indent:5;border:1 solid"><font color="#004790"><b>������</b></font></td></tr>
            <tr height="1"><td></td></tr>
            <!-- ���� -->            
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