package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;


public class BoardDAO {
	
	private static BoardDAO instance;
	private SqlSessionFactory sqlSessionFactory;

	public static BoardDAO getInstance() {
		if(instance==null) { //synchronized는 락을걸어서 한사람만 통과하게 해준다
			synchronized (BoardDAO.class) {//통과하는 스레드는 딱 한개뿐이다
				instance = new BoardDAO();
			}
		}
		return instance;
	}
	
	
	public BoardDAO() {
		
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public void boardWrite(Map<String, String> map) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		sqlSession.insert("boardSQL.boardWrite" , map); //여기는 무조건 갯수 1개만 보내진다. 그래서 콜렉션으로 묶어서 보내줘야한다.
		sqlSession.commit();
		sqlSession.close();//마무리
		
	}//boardWrite(Map<String, String> map)
	
	
	
	public List<BoardDTO> getBoardList( int startNum , int endNum) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum" , startNum);
		map.put("endNum" , endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		List<BoardDTO> list = sqlSession.selectList("boardSQL.getBoardList" , map);
		sqlSession.close();//마무리
		
	     return list;
	   }//List<BoardDTO> getBoardList(int startNum, int endNum)
	
	
	
	public BoardDTO getBoardWrite(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoardWrite" , seq);
		sqlSession.close();//마무리
		
		return boardDTO;
		
	}
	
	public int getTotalA() {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();//마무리
		
		return totalA;
		
	}//int getTotalA()
	
	
	public void boardModify(int seq, String subject, String content) {
		 Map<String, String> map = new HashMap<String, String>();
		 map.put("seq", Integer.toString(seq));
		 map.put("subject", subject);
		 map.put("content", content);
		
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		
		sqlSession.update("boardSQL.boardModify" , map);
		sqlSession.commit();
		sqlSession.close();//마무리
		
	}
	
	public void hitUpdate(int seq) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		
		sqlSession.update("boardSQL.hitUpdate" , seq);
		sqlSession.commit();
		sqlSession.close();//마무리	
		
		
	}
	
	public List<BoardDTO> boardSearch(Map<String , String> map){
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardSearch" , map);
		sqlSession.close();//마무리	

		return list;
	}
	
	
	
	public int getSearchTotalA(Map<String , String> map) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		
		int selectTotalA = sqlSession.selectOne("boardSQL.getSearchTotalA" , map);
		sqlSession.close();//마무리
		
		return selectTotalA;
		
	}//int getTotalA()


	public void boardReply(Map<String, String> map) {
		//원글(13개항목)
		BoardDTO pDTO = this.getBoardWrite(Integer.parseInt(map.get("pseq")));
		
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		
		//step update
		//update board set step=step+1 whrer ref=원글ref and step>원글step
		sqlSession.update("boardSQL.boardReply1" , pDTO);
		
		//insert
		map.put("ref", pDTO.getRef()+"");//답글ref = 원글 ref
		map.put("lev", pDTO.getLev()+1+"");//답글ref = 원글 ref
		map.put("step", pDTO.getStep()+1+"");//답글step = 원글 step
		sqlSession.insert("boardSQL.boardReply2" , map);
		
		//reply update
		//update board set reply=reply+1 where seq=원글번호
		sqlSession.update("boardSQL.boardReply3" , Integer.parseInt(map.get("pseq")));
		
		sqlSession.commit();
		sqlSession.close();//마무리
		
	}


	public void boardDelete(int seq) {	
		
	
	SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
	sqlSession.delete("boardSQL.boardDelete" , seq);
	sqlSession.commit();
	sqlSession.close();//마무리
	
	}
	

	
	
	
}



