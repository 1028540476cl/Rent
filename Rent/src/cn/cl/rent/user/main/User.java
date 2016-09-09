package cn.cl.rent.user.main;

public class User {
	private int uid;
	private String loginname;
	private String loginpass;
	private String qq;
	private boolean states;
	
	
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getLoginpass() {
		return loginpass;
	}
	public void setLoginpass(String loginpass) {
		this.loginpass = loginpass;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public boolean isStates() {
		return states;
	}
	public void setStates(boolean states) {
		this.states = states;
	}
	
	
	@Override
	public String toString() {
		return "User [uid=" + uid + ", loginname=" + loginname + ", loginpass="
				+ loginpass + ", qq=" + qq + ", states=" + states + "]";
	}
	
	

}
