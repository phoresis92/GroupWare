package dto;

public class Approval_Cate {

	private int apv_cate_id;
	private String apv_cate_name;
	
	public int getApv_cate_id() {
		return apv_cate_id;
	}
	public void setApv_cate_id(int apv_cate_id) {
		this.apv_cate_id = apv_cate_id;
	}
	public String getApv_cate_name() {
		return apv_cate_name;
	}
	public void setApv_cate_name(String apv_cate_name) {
		this.apv_cate_name = apv_cate_name;
	}
	public Approval_Cate(int apv_cate_id, String apv_cate_name) {
		super();
		this.apv_cate_id = apv_cate_id;
		this.apv_cate_name = apv_cate_name;
	}
	public Approval_Cate() {
		super();
	}
	@Override
	public String toString() {
		return "Approval_Cate [apv_cate_id=" + apv_cate_id + ", apv_cate_name=" + apv_cate_name + "]";
	}
	
	
}
