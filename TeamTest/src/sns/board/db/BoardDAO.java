package sns.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	Connection con = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private Connection getCon() throws Exception{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/SnsProject");
		con = ds.getConnection();
	
		return con;
	}
	
	private void closeDB(){
		try{
			if(rs != null){ rs.close(); }
			if(pstmt != null){ pstmt.close(); }
			if(con != null){ con.close(); }
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int insertBoard (BoardDTO bdto) {
		int check = -1;
		
		try {
			con = getCon();
			
			sql = "insert into board (email, b_content, img, video) values (?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bdto.getEmail());
			pstmt.setString(2, bdto.getB_content());
			pstmt.setString(3, bdto.getImg());
			pstmt.setString(4, bdto.getVideo());
			
			pstmt.executeUpdate();
			
			check = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public List<BoardDTO> selectBoard(String email) {
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		BoardDTO bdto = null;
		
		try {
			con = getCon();
			
			sql = "select * from SnsProject.board where email=? order by b_date desc";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bdto = new BoardDTO();
				
				bdto.setB_num(rs.getInt("b_num"));
				bdto.setEmail(email);
				bdto.setB_content(rs.getString("b_content"));
				bdto.setImg(rs.getString("img"));
				bdto.setVideo(rs.getString("video"));
				bdto.setCommCount(rs.getInt("commCount"));
				bdto.setB_like(rs.getInt("b_like"));
				bdto.setB_date(rs.getString("b_date"));
				
				boardList.add(bdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return boardList;
	}
}
