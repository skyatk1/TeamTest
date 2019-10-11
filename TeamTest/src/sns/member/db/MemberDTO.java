package sns.member.db;

public class MemberDTO {
	
	private String email; //pk
	private int email_auth; // ?��증했?��?�� 1 ?��?��?��?�� 0
	private String password;
	private int m_num; //pk(친구 목록 불러?�� ?�� ?��?��?�� ?���?)
	private String f_name;
	private String l_name;
	private String gender;
	private String ip;
	private String profile; // 프로필 사진

	
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getEmail_auth() {
		return email_auth;
	}
	public void setEmail_auth(int email_auth) {
		this.email_auth = email_auth;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
	
	
}
