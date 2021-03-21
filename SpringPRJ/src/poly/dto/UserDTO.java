package poly.dto;

/**
 * @author 이재훈
 * @version 1.1 SpoilBroth
 */
public class UserDTO {

	private String user_seq; // 기본키, 순번
	private String user_id; // 아이디
	private String user_pwd; // 비밀번호
	private String user_email; // 이메일
	private String join_DT; // 가입일
	
	
	public String getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getJoin_DT() {
		return join_DT;
	}
	public void setJoin_DT(String join_DT) {
		this.join_DT = join_DT;
	}
	
	
}
