<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// <![CDATA[
var ranges=4; // number of mountain ranges
// all colours must be in format '#NNNNNN', not 'red' or 'rgb(7,8,9)'
var height=160; // height in pixels of heighest mountains - ones nearer the front will be smaller
var foreground='#9933ff'; // purple
var background='#999999'; // grey

/****************************
* Rolling Mountains Effect 2*
* (c)2014+ mf2fm web-design *
*  http://www.mf2fm.com/rv  *
* DON'T EDIT BELOW THIS BOX *
*****************************/
var swide=800;
var shigh=600;
var sleft=0;
var scwid=screen.width;
var dx=0;
var mranges=new Array();
var mposit=new Array();
var mlent=new Array();
var moff=new Array();

if (typeof('addRVLoadEvent')!='function') function addRVLoadEvent(funky) {
  var oldonload=window.onload;
  if (typeof(oldonload)!='function') window.onload=funky;
  else window.onload=function() {
    if (oldonload) oldonload();
    funky();
  }
}

addRVLoadEvent(climb_every_mountain);

function climb_every_mountain() {
  var c, i, j, k, l, t, x;
  set_width();
  for (i=0; i<ranges*2; i+=2) {
    still_is_the_night(i);
	still_is_the_night(i+1);
	j=0;
	k=Math.floor((0.4+Math.random()*0.6)*height*(ranges-i/2)/ranges);
	l=0;
	if (ranges>1) {
		c=Math.floor(ranges-i/2);
		c=colour_central((c-1)/(ranges-1));
	}
	else c=foreground;
	do { 
	  if (j<scwid) x=Math.floor((0.4+Math.random()*0.5)*height*(ranges-i/2)/ranges);
	  else x=k;
	  if (!j) l=x;
	  t=createTriangle(x, c);
	  t.style.left=j+"px";
	  mranges[i].appendChild(t);
	  t=createTriangle(x, c);
	  t.style.left=k-j-2*x+"px";
	  mranges[i+1].appendChild(t);
	  j+=x;
	}
	while (j<=scwid+height);
	mlent[i]=mlent[i+1]=j-l;
	mposit[i]=0;
	mposit[i+1]=-mlent[i+1]-x+l;
	moff[i]=-l;
	moff[i+1]=2*j-mlent[i+1]-2*l;
	mranges[i].style.left=mposit[i]+moff[i]+"px";
	mranges[i+1].style.left=mposit[i+1]+moff[i+1]+"px";
	document.body.appendChild(mranges[i]);
	document.body.appendChild(mranges[i+1]);
  }
  setInterval("move_every_mountain()", 50);
}

function colour_central(p) {
  var i, h1, h2, temp;   
  temp="#";
  for (i=1; i<6; i+=2) {
    h1=parseInt(foreground.substring(i,i+2),16);
    h2=parseInt(background.substring(i,i+2),16);
    temp+=dechex(Math.floor(h1+(h2-h1)*p));
  }
  return (temp);
}

function dechex(dec) { return ((dec<16)?"0":"")+dec.toString(16); }

function still_is_the_night(i) {
	mranges[i]=document.createElement('div');
	mranges[i].style.position='fixed';
	mranges[i].style.zIndex=i;
	mranges[i].style.left='0px';
	mranges[i].style.bottom='0px';
	mranges[i].style.width='100%';
	mranges[i].style.opacity=Math.floor(1+i/2)/ranges;
}

function move_every_mountain() {
  var i;
  for (i=0; i<ranges*2; i++) {
    mposit[i]+=dx*(Math.floor(i/2)+1);
	if (mposit[i]>scwid) mposit[i]-=2*mlent[i];
	if (mposit[i]<-mlent[i]) mposit[i]+=2*mlent[i];
	mranges[i].style.left=mposit[i]+moff[i]+"px";
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
  else if (typeof(self.innerWidth)=='number' && self.innerWidth) {
    if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
    if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
  }
  else if (document.body.clientWidth) {
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

function createTriangle(x, colour) {
  var div=document.createElement("div");
  div.style.position='absolute';
  div.style.left='0px';
  div.style.bottom='0px';
  div.style.height='0px';
  div.style.width='0px';
  div.style.borderStyle='solid';
  div.style.borderColor=colour+' transparent';
  div.style.borderWidth='0px '+x+'px '+x+'px '+x+'px';
  return (div);
}

window.onscroll=set_scroll;
function set_scroll() {
  if (typeof(self.pageYOffset)=='number') {
    sleft=self.pageXOffset;
  }
  else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
    sleft=document.body.scrollLeft;
  }
  else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
    sleft=document.documentElement.scrollLeft;
  }
  else {
    sleft=0;
  }
}

document.onmousemove=mouse;
function mouse(e) {
  var x;
  if (e) x=e.pageX;
  else {
	x=event.x;
    set_scroll();
    x+=sleft;
  }
  dx=Math.floor(-1.5+4*(x-sleft)/swide);
}
// ]]>
</script>




<style type="text/css">

#subjectH:link {color: black; text-decoration: none;}
#subjectH:visited {color: green; text-decoration: none;}
#subjectH:hover {color: magenta; text-decoration: underline;}
#subjectH:active {color :green; text-decoration: none;}


#currentPaging{
	font-size: 2em; color:red; text-decoration: underline

}
#paging{
	font-size: 2em; color:black; text-decoration: none
}


</style>

<script type="text/javascript">
function isLogin(memId, seq, pg) {
	if(memId == '')
		alert("먼저 로그인하세요");
	else
	location.href="boardList.jsp?pg=1";
}

</script>


</head>
<body>
  <form name="boardListForm" method="post" action="">
      <h1 align="center">게시판</h1>

      <table border="1" bordercolor="ff6080" width="800" height="30" id="listTable"
         align="center" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">

   
         <tr>
	         <th bgcolor="ffb8c6" align="center" width="80">글번호</th>
	         <th bgcolor="ffb8c6" align="center" width="300">제목</th>
	         <th bgcolor="ffb8c6" align="center" width="150">작성자</th>
	         <th bgcolor="ffb8c6" align="center" width="150">작성일</th>
	         <th bgcolor="ffb8c6" align="center" width="80">조회수</th>
         </tr>
  
		 
      </table>
      <br>

 		<div align="center">
	      <img src="../img/purin.png" alt="푸린" width="50" height="50"  
		  onclick = "location.href='../main/main.jsp'" style="cursor:pointer; ">
		</div>
		
	<%-- 	<div align="center">${boardPaging.pagingHTML }</div> --%>
	<%-- 	<div align="center"><%=boardPaging.getPagingHTML() %></div> --%>
   </form>
 	
   <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: 'boardList2.jsp',
		type: 'post',
		data: 'pg='+'1',
		dataType: 'json',
		success: function(data){
			
			$.each(data.list, function(index, items){ //제이쿼리식 for문
				
				var seq = items.seq;
				var subject = items.subject;
				var id = items.id;
				var logtime = items.logtime;
				var hit = items.hit;
				
				var tr = $('<tr>');
				var td1 = $('<td align="center" />').html(seq);
				var td2 = $('<td>').html(subject);
				var td3 = $('<td align="center">').html(id);
				var td4 = $('<td align="center">').html(logtime); 
				var td5 = $('<td align="center">').html(hit);
		
				tr.append(td1).append(td2).append(td3).append(td4).append(td5).appendTo($('#listTable'));
	
			});//each
			
		},
		error: function(err){
			console.log(err);
		}
	});
	return false;
});



</script>
</body>
</html>