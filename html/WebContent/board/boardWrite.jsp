<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.dao.BoardDAO" %>

<%
//데이터
request.setCharacterEncoding("UTF-8"); /* get방식이면 필요없지만 post방식은 필요하다 */

String subject = request.getParameter("subject");
String content = request.getParameter("content");

String id = (String) session.getAttribute("memId"); 
String name = (String)session.getAttribute("memName");
String email = (String)session.getAttribute("memEmail");

System.out.println("id"+id);
System.out.println("name"+name);
System.out.println("email"+email);
System.out.println("subject"+subject);
System.out.println("content"+content);

Map<String, String> map = new HashMap<String, String>();
map.put("id" , id);
map.put("name" , name);
map.put("email" , email);
map.put("subject" , subject);
map.put("content" , content);

//DB
BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.boardWrite(map);
%>




<script type="text/javascript">
window.onload=function(){
	location.href="boardList.jsp?pg=1";
}
</script>
