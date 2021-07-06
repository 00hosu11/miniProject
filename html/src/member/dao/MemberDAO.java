package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public class MemberDAO {
	private static MemberDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public static MemberDAO getInstance() {
		if(instance==null) {
			synchronized (MemberDAO.class) {
				instance = new MemberDAO();
			}
		}
		return instance;
	}
	
	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int write(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.insert("memberSQL.write", memberDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	
	public MemberDTO login(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login", map);
		sqlSession.close();
		return memberDTO;
	}
	
	public boolean isExistId(String id){
		boolean exist = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId", id);
		if(memberDTO != null) exist = true;
		sqlSession.close();
		return exist;
	}
	
	public List<ZipcodeDTO> getZipcodeList(String sido, String sigungu, String roadname){
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", sido);
		map.put("sigungu", sigungu);
		map.put("roadname", roadname);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ZipcodeDTO> list = sqlSession.selectList("memberSQL.getZipcodeList", map);
		sqlSession.close();
		return list;
	}
	
	public MemberDTO getMember(String id){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMember", id);
		sqlSession.close();
		return memberDTO;
	}
	
	public void modify(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("memberSQL.modify", memberDTO);
		sqlSession.commit();
		sqlSession.close();
	}

}
























