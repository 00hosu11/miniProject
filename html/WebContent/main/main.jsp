<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>미니프로젝트</title>
    <script type="text/javascript">
// <![CDATA[
var colour="random"; // in addition to "random" can be set to any valid colour eg "#f0f" or "red"
var sparkles=50;

/****************************
*  Tinkerbell Magic Sparkle *
*(c)2005-13 mf2fm web-design*
*  http://www.mf2fm.com/rv  *
* DON'T EDIT BELOW THIS BOX *
****************************/
var x=ox=400;
var y=oy=300;
var swide=800;
var shigh=600;
var sleft=sdown=0;
var tiny=new Array();
var star=new Array();
var starv=new Array();
var starx=new Array();
var stary=new Array();
var tinyx=new Array();
var tinyy=new Array();
var tinyv=new Array();

window.onload=function() { if (document.getElementById) {
  var i, rats, rlef, rdow;
  for (var i=0; i<sparkles; i++) {
    var rats=createDiv(3, 3);
    rats.style.visibility="hidden";
    rats.style.zIndex="999";
    document.body.appendChild(tiny[i]=rats);
    starv[i]=0;
    tinyv[i]=0;
    var rats=createDiv(5, 5);
    rats.style.backgroundColor="transparent";
    rats.style.visibility="hidden";
    rats.style.zIndex="999";
    var rlef=createDiv(1, 5);
    var rdow=createDiv(5, 1);
    rats.appendChild(rlef);
    rats.appendChild(rdow);
    rlef.style.top="2px";
    rlef.style.left="0px";
    rdow.style.top="0px";
    rdow.style.left="2px";
    document.body.appendChild(star[i]=rats);
  }
  set_width();
  sparkle();
}}

function sparkle() {
  var c;
  if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
    ox=x;
    oy=y;
    for (c=0; c<sparkles; c++) if (!starv[c]) {
      star[c].style.left=(starx[c]=x)+"px";
      star[c].style.top=(stary[c]=y+1)+"px";
      star[c].style.clip="rect(0px, 5px, 5px, 0px)";
      star[c].childNodes[0].style.backgroundColor=star[c].childNodes[1].style.backgroundColor=(colour=="random")?newColour():colour;
      star[c].style.visibility="visible";
      starv[c]=50;
      break;
    }
  }
  for (c=0; c<sparkles; c++) {
    if (starv[c]) update_star(c);
    if (tinyv[c]) update_tiny(c);
  }
  setTimeout("sparkle()", 40);
}

function update_star(i) {
  if (--starv[i]==25) star[i].style.clip="rect(1px, 4px, 4px, 1px)";
  if (starv[i]) {
    stary[i]+=1+Math.random()*3;
    starx[i]+=(i%5-2)/5;
    if (stary[i]<shigh+sdown) {
      star[i].style.top=stary[i]+"px";
      star[i].style.left=starx[i]+"px";
    }
    else {
      star[i].style.visibility="hidden";
      starv[i]=0;
      return;
    }
  }
  else {
    tinyv[i]=50;
    tiny[i].style.top=(tinyy[i]=stary[i])+"px";
    tiny[i].style.left=(tinyx[i]=starx[i])+"px";
    tiny[i].style.width="2px";
    tiny[i].style.height="2px";
    tiny[i].style.backgroundColor=star[i].childNodes[0].style.backgroundColor;
    star[i].style.visibility="hidden";
    tiny[i].style.visibility="visible"
  }
}

function update_tiny(i) {
  if (--tinyv[i]==25) {
    tiny[i].style.width="1px";
    tiny[i].style.height="1px";
  }
  if (tinyv[i]) {
    tinyy[i]+=1+Math.random()*3;
    tinyx[i]+=(i%5-2)/5;
    if (tinyy[i]<shigh+sdown) {
      tiny[i].style.top=tinyy[i]+"px";
      tiny[i].style.left=tinyx[i]+"px";
    }
    else {
      tiny[i].style.visibility="hidden";
      tinyv[i]=0;
      return;
    }
  }
  else tiny[i].style.visibility="hidden";
}

document.onmousemove=mouse;
function mouse(e) {
  if (e) {
    y=e.pageY;
    x=e.pageX;
  }
  else {
    set_scroll();
    y=event.y+sdown;
    x=event.x+sleft;
  }
}

window.onscroll=set_scroll;
function set_scroll() {
  if (typeof(self.pageYOffset)=='number') {
    sdown=self.pageYOffset;
    sleft=self.pageXOffset;
  }
  else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
    sdown=document.body.scrollTop;
    sleft=document.body.scrollLeft;
  }
  else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
    sleft=document.documentElement.scrollLeft;
    sdown=document.documentElement.scrollTop;
  }
  else {
    sdown=0;
    sleft=0;
  }
}

window.onresize=set_width;
function set_width() {
  var sw_min=999999;
  var sh_min=999999;
  if (document.documentElement && document.documentElement.clientWidth) {
    if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
    if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
  }
  if (typeof(self.innerWidth)=='number' && self.innerWidth) {
    if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
    if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
  }
  if (document.body.clientWidth) {
    if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
    if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
  }
  if (sw_min==999999 || sh_min==999999) {
    sw_min=800;
    sh_min=600;
  }
  swide=sw_min;
  shigh=sh_min;
}

function createDiv(height, width) {
  var div=document.createElement("div");
  div.style.position="absolute";
  div.style.height=height+"px";
  div.style.width=width+"px";
  div.style.overflow="hidden";
  return (div);
}

function newColour() {
  var c=new Array();
  c[0]=255;
  c[1]=Math.floor(Math.random()*256);
  c[2]=Math.floor(Math.random()*(256-c[1]/2));
  c.sort(function(){return (0.5 - Math.random());});
  return ("rgb("+c[0]+", "+c[1]+", "+c[2]+")");
}
// ]]>
</script>
    
    
    
    
    <style type="text/css">

	body{
	margin:0;
	font-family:verdana,돋움;
	}
	
	ul{
	padding:0;
	}
	
	ul li{
	display:inline;
	padding:0 10px;
	}
	
	li a{
	color:#ed89dd;
	text-decoration:none;
	font-weight:bold;
	}
	
	li a:hover{
	color:#000;
	}

	.purin{
	margin-top:30px;
	}
	
	p{
	border:1px solid #000;
	display:inline-block;
	padding:10px 20px;
	font-size:15px;
	margin:40px 0;
	}
	
	.title{
	text-dacoration:underline;
	margin:20px 0;
	}
	
	.info{
	border:none;
	margin:0 0 30px; 
	padding:0;
	}
	
	.tel{
	font-size:20px;
	border:none;
	margin-bottom:0;
	}
	
	.tel a{
	text-decoration:none;
	color:#d075c3;
	font-style:italic;
	font-weight:bold;
	}
	
	address{
	font-style:normal;
	font-size:13px;
	}
	
	.copy{
	background:#000;
	color:#fff;
	font-size:11px;
	padding:50px;
	margin:20px;
	display:block;
	}
	
	address{
	font-style:normal;
	}
	
    </style>
</head>

  <body>
  <center>
  <h1 style="color:#ef708a;">Purin Fan cafe</h1>
   <h1>
     <a href="#">
     <img src="../img/purin.png" alt="푸린">
     </a>
   </h1>

  <ul>
  <c:if test="${memId == null }">
   <li><a href="../member/writeForm.jsp">회원가입</a></li> 
   <li><a href="../member/loginForm.jsp">로그인</a></li>
   	</c:if>
   	<c:if test="${memId != null }">
   	 <li> <a href="../member/logout.jsp">로그아웃</a></li>
      <li><a href="../board/boardWriteForm.jsp">글작성</a></li>
   	</c:if>
   <li><a href="../board/boardList.jsp?pg=1">게시판</a></li>
  </ul>
  <hr size="1px" noshade></hr>

 <h2>Pokemon Purin
     <ul class="purin">
       <li><a href="#"><img src="../img/purin2.jpg" alt="푸린2" style= width:300px; height:300px;></a></li>
     </ul>
 </h2>

<p>P&nbsp;&nbsp;&nbsp;U&nbsp;&nbsp;&nbsp;R&nbsp;&nbsp;&nbsp;I&nbsp;&nbsp;&nbsp;N&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;W&nbsp;&nbsp;&nbsp;O&nbsp;&nbsp;&nbsp;R&nbsp;&nbsp;&nbsp;L&nbsp;&nbsp;&nbsp;D</p>

  <hr size="1px" color="#d075c3" noshade></hr>
  
    <h2 class="title">Info</h2> <br>
    <p class="info">푸린<br>노래 하기 좋아해<br>모두가 잠 들...ㅇ..</p>

    <hr size="1px" color="#CCC"></hr>

   <p class="tel"><a href="tel:01000000000">010.0000.0000</a></p>
   <address> 주소: BitCamp 다이아 201층 201호 </address>
   <p class="copy">Copyright(c)2021 HeoJi All Rights Reserved.</p>

	</center>
  </body>

</html>