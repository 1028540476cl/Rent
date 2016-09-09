<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<style type="text/css">
*{ margin:0; padding:0;}
#mainBox{ width:670px; height:300px; border:1px #FAFCF5 solid; position:relative; overflow:hidden; margin:10px auto;}
#content{  height:alert($(document).height()); position:absolute; left:0; top:0;}
.scrollDiv{ width:18px;  position:absolute; top:0; background:#666; border-radius:10px;}
</style>
    <title>查询-查看信息列表</title>
</head>
<body>
    <center>
        <table border="0" width="670" cellspacing="0" cellpadding="0" style="margin-top:5"> 
            <tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>■查询物品结果</b></font></td></tr>
            <tr height="1"><td></td></tr>
            <tr>
                <td align="center" style="border:1 solid">
                <div id="mainBox">
 				<div id="content">
                    <table border="0" width="100%" rules="rows" cellspacing="0">
                  
                        <c:choose>
                        	<c:when test="${searchGoodsList==null || searchGoodsList.size()==0 }">
                        		<tr height="80"><td colspan="8" align="center">★★对不起，未找到此分类的物品！★★</td></tr>
                        	</c:when>
                        	<c:otherwise>
                        		<c:forEach var="searchgoods" items="${searchGoodsList }" varStatus="status">
                        			
                        				<c:if test="${(status.index+1)%3==1 }">
                        					<tr height="30" bgcolor="#F0F0F0">
                        				</c:if>
                        				<td width="50%">
							<li>
							★${searchgoods.typeName}&nbsp;&nbsp;&nbsp;★<span bgcolor="#00B48F">发布人：</span>${searchgoods.linkman }
								<p>
								<a href="rent/searchindex!detailsGoods?uid=${searchgoods.uid}"><img src="<c:url value='/goods_img/${searchgoods.imagea }'/>" border="0" /></a>
									</p>
									<p>
										<a href="rent/searchindex!detailsGoods?uid=${searchgoods.uid}">${searchgoods.title}</a>
									</p>
									<p>
									<span>qq：</span>${searchgoods.qq }
									</p>
								<p>
									<span>联系号码：</span>${searchgoods.phone }
									</p>
								
									</li>
									</td>
                      	   <c:if test="${(status.index+1) % 3== 0 }">
                       </tr height="23">
                       </c:if>
                        		</c:forEach>
                        	</c:otherwise>
                        </c:choose>
                        	
                    </table></div></div>
                </td>
            </tr>
        </table>
        
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
</script>
</body>
</html>