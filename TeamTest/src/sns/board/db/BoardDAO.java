package sns.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sns.member.db.MemberDTO;

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
			
			sql = "insert into board (b_m_num, b_content, img, video) values (?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bdto.getB_m_num());
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
	
	// 메인 글 가져오기
	public Vector selectBoard(int b_m_num) {
		Vector v = new Vector();
		
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		try {
			con = getCon();
			
			sql = "select m.f_name, m.l_name, m.profile, b_num, b_m_num, b_content, img, video, commCount, b_like, b_date " +
				  "from board b join member m " +
				  "on b.b_m_num = m.m_num " +
				  "where b_m_num = ? " +
				  "or b_m_num in ( " +
				  					"select f.response_m_num " +
				  					"from snsproject.friend f join snsproject.member m " +
				  					"on f.response_m_num = m.m_num " +
				  					"where f.request_m_num = ? " +
				  					"and f.status = 'friend' " +
				  					"union " +
				  					"select f.request_m_num " +
				  					"from snsproject.friend f join snsproject.member m " +
				  					"on f.response_m_num = m.m_num " +
				  					"where f.response_m_num = ? " +
				  					"and f.status = 'friend'" +
				  				") " +
				  	"order by b_date desc";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, b_m_num);
			pstmt.setInt(2, b_m_num);
			pstmt.setInt(3, b_m_num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				MemberDTO mdto = new MemberDTO();
				
				bdto.setB_num(rs.getInt("b_num"));
				bdto.setB_m_num(rs.getInt("b_m_num"));
				bdto.setB_content(rs.getString("b_content"));
				bdto.setImg(rs.getString("img"));
				bdto.setVideo(rs.getString("video"));
				bdto.setCommCount(rs.getInt("commCount"));
				bdto.setB_like(rs.getInt("b_like"));
				bdto.setB_date(rs.getString("b_date"));
				
				mdto.setF_name(rs.getString("f_name"));
				mdto.setL_name(rs.getString("l_name"));
				mdto.setProfile(rs.getString("profile"));
				
				boardList.add(bdto);
				memberList.add(mdto);
			}
			
			v.add(boardList);
			v.add(memberList);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return v;
	}
	
	public void deleteBoard(int b_num) {
		
		try {
			con = getCon();
			
			sql = "delete from SnsProject.board where b_num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, b_num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
}
