<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="board.bean.BoardPaging"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>



<%SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY.MM.dd"); %>
<%	String memId = (String)session.getAttribute("memId");

	//데이터
	int pg=Integer.parseInt(request.getParameter("pg"));
	
	//1 페이지당 5개씩
	int endNum = pg*5;
	int startNum = endNum-4;
	
	//DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	List<BoardDTO> list = boardDAO.getBoardList(startNum, endNum);
	
	//페이징 처리
	int totalA = boardDAO.getTotalA(); //총글수

	BoardPaging boardPaging = new BoardPaging();
	boardPaging.setCurrentPage(pg); //현재페이지 pg라고 준다
	boardPaging.setPageBlock(3);
	boardPaging.setPageSize(5);
	boardPaging.setTotalA(totalA);
	boardPaging.makePagingHTML();
	
	JSONObject json = new JSONObject();
	if(list != null){
		JSONArray array = new JSONArray();
		for(int i=0; i<list.size(); i++){
			BoardDTO boardDTO = list.get(i);
			
			JSONObject temp = new JSONObject();
			temp.put("id" , boardDTO.getId());
			temp.put("name" , boardDTO.getName());
			temp.put("email" , boardDTO.getEmail());
			temp.put("subject" , boardDTO.getSubject());
			temp.put("content" , boardDTO.getContent());
			temp.put("logtime" , dateFormat.format(boardDTO.getLogtime()));
			temp.put("seq" , boardDTO.getSeq());
			temp.put("ref" , boardDTO.getRef());
			temp.put("step" , boardDTO.getStep());
			temp.put("pseq" , boardDTO.getPseq());
			temp.put("reply" , boardDTO.getReply());
			temp.put("hit" , boardDTO.getHit());
			temp.put("boardPaging" , boardPaging);
		
			System.out.println(dateFormat.format(boardDTO.getLogtime()));
			
			array.add(i, temp);
		;}//for
		
		json.put("list", array);
	}
		out.println(json);
	
	
	
	
%>  