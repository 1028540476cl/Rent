<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
*{ margin:0; padding:0;}
#mainBox{ width:670px; height:300px; border:1px #FAFCF5 solid; position:relative; overflow:hidden; margin:10px auto;}
#content{  height:alert($(document.body).height()); position:absolute; left:0; top:0;}
.scrollDiv{ width:18px;  position:absolute; top:0; background:#666; border-radius:10px;}
#mainBox1{ width:670px; height:260px; border:1px #FAFCF5 solid; position:relative; overflow:hidden; margin:10px auto;}
#content1{  height:alert($(document.body).height());position:absolute; left:0; top:0;}
.scrollDiv1{ width:18px;  position:absolute; top:0; background:#666; border-radius:10px;}
</style>

<title></title>
</head>
<body>
	<center>
		<!-- 缴费专区 -->
		<table border="0" width="670" cellspacing="0" cellpadding="5">
			<tr height="35">
				<td style="text-indent:5" valign="bottom"><font color="#004790"><b>■可交换物品</b>『交换专区』</font>
				</td>
			<tr bgcolor="#FAFCF5">
				<td style="border:1 solid">
				<div id="mainBox1">
 				<div id="content1">
					<table border="0" width="100%" cellspacing="0" cellpadding="0">
					<c:choose>
                       <c:when test="${GoodList==null||GoodList.size()==0 }">
                       <tr height="30"><td align="center" style="border:1 solid">★★★在这里显示还可交换的物品！★★★</td></tr> 
                       </c:when>
                       <c:otherwise>
						<c:forEach var="Goods" items="${GoodList}" varStatus="status">
						<c:if test="${(status.index+1) % 3 == 1}">
                       <tr height="23"> 
                       </c:if>
                       <td width="50%">
							<li>
							<a href="rent/searchindex!getGoodsByTypet?typeid=${Goods.id}"title='${Goods.typeName}'>★${Goods.typeName}</a>&nbsp;&nbsp;&nbsp;★<span bgcolor="#00B48F">发布人：</span>${Goods.linkman }
								
									<p>
								<a href="rent/searchindex!detailsGoods?uid=${Goods .uid}"><img src="<c:url value='/goods_img/${Goods.imagea }'/>" border="0" /></a>
									</p>
									<p>
										<a href="rent/searchindex!detailsGoods?uid=${Goods .uid} " title='${Goods.title}'>${Goods.title}</a>
									</p>
									<p>
									<span>qq：</span>${Goods.qq }
									</p>
								<p>
									<span>联系号码：</span>${Goods.phone }
									</p>
								
									</li>
									</td>
								 <c:if test="${(status.index+1) % 3== 0 }">
                       </tr height="23">
                       </c:if>
						</c:forEach>
						</c:otherwise>
						</c:choose>

					</table></div></div></td>
			</tr>
		</table>
		<!-- 小宣传 -->
		<table border="0" width="670" cellspacing="0" cellpadding="0"
			style="margin-top:1">
			<tr>
				<td align="center"><img src="images/pcard2.jpg">
				</td>
			</tr>
		</table>
		<!-- 免费专区 -->
		<table border="0" width="670" cellspacing="0" cellpadding="5">
			<tr height="35">
				<td style="text-indent:5" valign="bottom"><font color="#004790"><b>■已经交换物品</b>『已换专区』</font>
				</td>
			<tr bgcolor="#FAFCF5">
				<td style="border:1 solid">
		<div id="mainBox">
 				<div id="content">
		<table border="0" width="670" cellspacing="2" cellpadding="0">
			<c:choose>
				<c:when test="${rentGoodList==null||rentGoodList.size()==0 }">
					<tr height="30">
						<td align="center" style="border:1 solid">★★★在这里显示已经交换了的物品！★★★</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="rentGoods" items="${rentGoodList}" varStatus="status">
						<c:if test="${(status.index)%2==0 }">
							<tr>
						</c:if>
						<td align="center">
							<table border="1" cellspacing="0" cellpadding="0" width="280"
								height="500" rules="none" bordercolor="lightgrey"
								bordercolorlight="lightgrey" bordercolordark="white">
								<c:forEach var="rent" items="${rentGoods}" varStatus="onestatus">
									<tr bgcolor="#00B48F" height="30">
										<c:if test="${onestatus.index==0 }">
											<td style="text-indent:10"><b><font color="white"> <a href="rent/searchindex!getGoodsByTypes?typeid=${rent.id}" title='${rent.typeName}'>▲${rent.typeName}</a></font>
											</b>
											</td>
										</c:if>
											<tr bgcolor="#FAFCF5"><td style="text-indent:3">★ <a href="rent/searchindex!detailsGoods?uid=${rent .uid}" title='${rent.title}'>${rent.title}</a>
											<a href="rent/searchindex!detailsGoods?uid=${rent .uid}"><img src="<c:url value='/goods_img/${rent.imagea}'/>" border="0" /></a></td></tr>
											<c:if test="${onestatus.last }">
                							<tr height="20" bgcolor="#FAFCF5"><td align="right"><a href=rent/searchindex!getGoodsByTypes?typeid=${rent.id}>更多...</a>&nbsp;&nbsp;</td></tr>
              								</c:if>
              							</tr>
      							 </c:forEach>
      						 </table>
							</td> 
                       	</c:forEach>
                       	</c:otherwise>
                       	</c:choose>  
        </table></div></div></table>
        <br>
    </center>
<script type="text/javascript">
var doc=document;
var _wheelData=-1;
var mainBox=doc.getElementById('mainBox');
function bind(obj,type,handler){
 var node=typeof obj=="string"?$(obj):obj;
 if(node.addEventListener){
  node.addEventListener(type,handler,false);
 }else if(node.attachEvent){
  node.attachEvent('on'+type,handler);
 }else{
  node['on'+type]=handler;
 }
}
function mouseWheel(obj,handler){
 var node=typeof obj=="string"?$(obj):obj;
  bind(node,'mousewheel',function(event){
   var data=-getWheelData(event);
   handler(data);
   if(document.all){
    window.event.returnValue=false;
   }else{
    event.preventDefault();
   }
   
  });
  //火狐
  bind(node,'DOMMouseScroll',function(event){
   var data=getWheelData(event);
   handler(data);
   event.preventDefault();
  });
  function getWheelData(event){
   var e=event||window.event;
   return e.wheelDelta?e.wheelDelta:e.detail*40;
  }
}
function addScroll(){
 this.init.apply(this,arguments);
}
addScroll.prototype={
 init:function(mainBox,contentBox,className){
  var mainBox=doc.getElementById(mainBox);
  var contentBox=doc.getElementById(contentBox);
  var scrollDiv=this._createScroll(mainBox,className);
  this._resizeScorll(scrollDiv,mainBox,contentBox);
  this._tragScroll(scrollDiv,mainBox,contentBox);
  this._wheelChange(scrollDiv,mainBox,contentBox);
  this._clickScroll(scrollDiv,mainBox,contentBox);
 },
 //创建滚动条
 _createScroll:function(mainBox,className){
  var _scrollBox=doc.createElement('div')
  var _scroll=doc.createElement('div');
  var span=doc.createElement('span');
  _scrollBox.appendChild(_scroll);
  _scroll.appendChild(span);
  _scroll.className=className;
  mainBox.appendChild(_scrollBox);
  return _scroll;
 },
 //调整滚动条
 _resizeScorll:function(element,mainBox,contentBox){
  var p=element.parentNode;
  var conHeight=contentBox.offsetHeight;
  var _width=mainBox.clientWidth;
  var _height=mainBox.clientHeight;
  var _scrollWidth=element.offsetWidth;
  var _left=_width-_scrollWidth;
  p.style.width=_scrollWidth+"px";
  p.style.height=_height+"px";
  p.style.left=_left+"px";
  p.style.position="absolute";
  p.style.background="#ccc";
  contentBox.style.width=(mainBox.offsetWidth-_scrollWidth)+"px";
  var _scrollHeight=parseInt(_height*(_height/conHeight));
  if(_scrollHeight>=mainBox.clientHeight){
   element.parentNode.style.display="none";
  }
  element.style.height=_scrollHeight+"px";
 },
 //拖动滚动条
 _tragScroll:function(element,mainBox,contentBox){
  var mainHeight=mainBox.clientHeight;
  element.onmousedown=function(event){
   var _this=this;
   var _scrollTop=element.offsetTop;
   var e=event||window.event;
   var top=e.clientY;
   //this.onmousemove=scrollGo;
   document.onmousemove=scrollGo;
   document.onmouseup=function(event){
    this.onmousemove=null;
   }
   function scrollGo(event){
    var e=event||window.event;
    var _top=e.clientY;
    var _t=_top-top+_scrollTop;
    if(_t>(mainHeight-element.offsetHeight)){
     _t=mainHeight-element.offsetHeight;
    }
    if(_t<=0){
     _t=0;
    }
    element.style.top=_t+"px";
    contentBox.style.top=-_t*(contentBox.offsetHeight/mainBox.offsetHeight)+"px";
    _wheelData=_t;
   }
  }
  element.onmouseover=function(){
   this.style.background="#444"; 
  }
  element.onmouseout=function(){
   this.style.background="#666"; 
  }
 },
 //鼠标滚轮滚动，滚动条滚动
 _wheelChange:function(element,mainBox,contentBox){
  var node=typeof mainBox=="string"?$(mainBox):mainBox;
  var flag=0,rate=0,wheelFlag=0;
  if(node){
   mouseWheel(node,function(data){
    wheelFlag+=data;
    if(_wheelData>=0){
     flag=_wheelData;
     element.style.top=flag+"px";
     wheelFlag=_wheelData*12;
     _wheelData=-1;
    }else{
     flag=wheelFlag/12;
    }
    if(flag<=0){
     flag=0;
     wheelFlag=0;
    }
    if(flag>=(mainBox.offsetHeight-element.offsetHeight)){
     flag=(mainBox.clientHeight-element.offsetHeight);
     wheelFlag=(mainBox.clientHeight-element.offsetHeight)*12;
     
    }
    element.style.top=flag+"px";
    contentBox.style.top=-flag*(contentBox.offsetHeight/mainBox.offsetHeight)+"px";
   });
  }
 },
 _clickScroll:function(element,mainBox,contentBox){
  var p=element.parentNode;
  p.onclick=function(event){
   var e=event||window.event;
   var t=e.target||e.srcElement;
   var sTop=document.documentElement.scrollTop>0?document.documentElement.scrollTop:document.body.scrollTop;
   var top=mainBox.offsetTop;
   var _top=e.clientY+sTop-top-element.offsetHeight/2;
   if(_top<=0){
    _top=0;
   }
   if(_top>=(mainBox.clientHeight-element.offsetHeight)){
    _top=mainBox.clientHeight-element.offsetHeight;
   }
   if(t!=element){
    element.style.top=_top+"px";
    contentBox.style.top=-_top*(contentBox.offsetHeight/mainBox.offsetHeight)+"px";
    _wheelData=_top;
   }
  }
 }
}
new addScroll('mainBox','content','scrollDiv');
new addScroll('mainBox1','content1','scrollDiv1');
</script>
</body>
</html>