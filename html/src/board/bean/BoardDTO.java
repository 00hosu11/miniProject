package board.bean;


import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {

	private String id;
	private String name;
	private String email;
	private String subject;
	private String content;
	private Date logtime; //이것이 Date형이라서 BoardDAO에서 to_char()를 안해도 YYYY-MM-DD로 나온다!
	
	private int seq;
	private int ref;
	private int lev;
	private int step;
	private int pseq;
	private int reply;
	
	private int hit;
	

	
	
}
