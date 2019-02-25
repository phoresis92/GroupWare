package dto;

public class Approval_Auth {

	private int apv_auth_id;
	private String apv_auth_name;
	
	
	@Override
	public String toString() {
		return "Approval_Auth [apv_auth_id=" + apv_auth_id + ", apv_auth_name=" + apv_auth_name + "]";
	}
	public Approval_Auth() {
		super();
	}
	public Approval_Auth(int apv_auth_id, String apv_auth_name) {
		super();
		this.apv_auth_id = apv_auth_id;
		this.apv_auth_name = apv_auth_name;
	}
	public int getApv_auth_id() {
		return apv_auth_id;
	}
	public void setApv_auth_id(int apv_auth_id) {
		this.apv_auth_id = apv_auth_id;
	}
	public String getApv_auth_name() {
		return apv_auth_name;
	}
	public void setApv_auth_name(String apv_auth_name) {
		this.apv_auth_name = apv_auth_name;
	}
	
	
	
}
