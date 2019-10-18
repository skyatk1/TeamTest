package sns.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	Connection con = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private Connection getCon() throws Exception{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/SnsProject");
		con = ds.getConnection();
		System.out.println("디비연결");
	
		return con;
	}
	
	// 회원가입
	public String insertMember(MemberDTO mdto) {
		String result = "-1";
		System.out.println("inser");
		
		try {
			con = getCon();
			
			sql = "insert into SnsProject.member (email, email_auth, password, f_name, l_name, gender, ip) "
					+ "values (?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mdto.getEmail());
			pstmt.setInt(2, 0);
			pstmt.setString(3, mdto.getPassword());
			pstmt.setString(4, mdto.getF_name());
			pstmt.setString(5, mdto.getL_name());
			pstmt.setString(6, mdto.getGender());
			pstmt.setString(7, mdto.getIp());
		
			pstmt.executeUpdate();
			
			result = "1";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	
	
	// 중복 이메일 체크
	public String emailCheck(String email) {
		String check = "0";
		try {
			con=getCon();
			sql = "select * from SnsProject.member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
	
	// 이메일 인증
	public int emailCodeCheck(String email) {
		int result = 0;
		
		try {
			con = getCon();
			
			//인증이 완료되었으면 email_auth = 1, else 0
			sql = "update SnsProject.member set email_auth = 1 where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			
			result = 1;
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 로그인
	public int login(String email, String pass) {
		int check=2;
		
		try {
			con=getCon();
			sql="select password from SnsProject.member where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("password").equals(pass)) {
					check=1;
				}else {
					check=0;
				}
			}else {
				check=-1;
			}
					
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	// 회원 정보 가져오기
	public MemberDTO selectMember(String email) {
		MemberDTO mdto = null;
		
		try {
			con = getCon();
			
			sql = "select * from member where email=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mdto = new MemberDTO();
				
				mdto.setEmail(email);
				mdto.setF_name(rs.getString("f_name"));
				mdto.setL_name(rs.getString("l_name"));
				mdto.setGender(rs.getString("gender"));
				mdto.setProfile(rs.getString("profile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return mdto;
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
	

}
