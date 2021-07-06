<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.bean.MemberDTO"%>
<%@ page import="member.dao.MemberDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//데이터
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

//DB
MemberDAO memberDAO = MemberDAO.getInstance();
MemberDTO memberDTO = memberDAO.login(id, pwd);

if(memberDTO != null) {
	session.setAttribute("memId", id);
	session.setAttribute("memName", memberDTO.getName());
	session.setAttribute("memEmail" , memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
%>
ok
<%}else{ %>
fail
<%} %>













