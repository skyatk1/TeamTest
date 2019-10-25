package sns.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
		return con;
	}
	
	public String insertMember(MemberDTO mdto) {
		String result = "0";
		int m_num = 1;
		
		try {
			con = getCon();
			
			sql = "select max(m_num) from snsproject.member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m_num = rs.getInt(1) + 1;
			}
			
			
			sql = "insert into SnsProject.member(email, m_num, email_auth, password, f_name, l_name, gender, ip, profile) values (?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mdto.getEmail());
			pstmt.setInt(2, m_num);
			pstmt.setInt(3, 0);
			pstmt.setString(4, mdto.getPassword());
			pstmt.setString(5, mdto.getF_name());
			pstmt.setString(6, mdto.getL_name());
			pstmt.setString(7, mdto.getGender());
			pstmt.setString(8, mdto.getIp());
			pstmt.setString(9, mdto.getProfile());
		
			pstmt.executeUpdate();
			
			result = "1";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	
	
	
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
	
	
	public int recoveryPass(String email, String password) {
		int result = 0;
		
		try {
			con = getCon();
			
			sql = "select password from SnsProject.member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql = "update SnsProject.member set password = ? where email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, password);
				pstmt.setString(2, email);
				pstmt.executeUpdate();
				
				result = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
		return result;
	}
	
	public MemberDTO selectMember(String email) {
		MemberDTO mdto = null;
		
		try {
			con = getCon();
			
			sql = "select * from SnsProject.member where email = ?";
			
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
				mdto.setM_num(rs.getInt("m_num"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return mdto;
	}
	
	public int getMyM_num(String email) {
		
		try {
			con = getCon();
			
			sql = "select m_num from SnsProject.member where email = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return 0;
	}
	
	
	public List<MemberDTO> getSearchMemberInfo(String searchText) {
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		try {
			con = getCon();
			
			sql = "select * from SnsProject.member where concat(f_name, l_name) like ? order by f_name, l_name limit 10";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + searchText + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO mdto = new MemberDTO();
				mdto.setEmail(rs.getString("email"));
				mdto.setEmail_auth(rs.getInt("email_auth"));
				mdto.setF_name(rs.getString("f_name"));
				mdto.setGender(rs.getString("gender"));
				mdto.setL_name(rs.getString("l_name"));
				mdto.setM_num(rs.getInt("m_num"));
				mdto.setProfile(rs.getString("profile"));
				
				memberList.add(mdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return memberList;
	}
	
	
	public int getSearchCount(String searchText) {
		int count = 0;
		
		try {
			con = getCon();
			
			sql = "select count(*) from SnsProject.member where concat(f_name, l_name) like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + searchText + "%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
		return count;
	}
	
	
	public int editMemberInfo(MemberDTO mdto) {
		int result = 0;
		
		try {
			con = getCon();
			
			sql = "update SnsProject.member set f_name = ?, l_name = ? where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getF_name());
			pstmt.setString(2, mdto.getL_name());
			pstmt.setString(3, mdto.getEmail());
			pstmt.executeUpdate();
			
			result = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	
	
	public int changePass(String email, String pass, String newpass) {
		int result = 0;
		
		try {
			con = getCon();
			
			sql = "select password from SnsProject.member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("password").equals(pass)) {
					sql = "update SnsProject.member set password = ? where email = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, newpass);
					pstmt.setString(2, email);
					pstmt.executeUpdate();
					
					result = 1;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
		return result;
	}
	
	
	//카카오 이메일 체크
	public int checkKakaoEmail() {
		
		return 0;
	}
	
	
	//카카오 회원가입
	public int joinKakao() {
		
		return 0;
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
