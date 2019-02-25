package dto;

public class Calendar_Cate {

	private int cal_cate_id;
	private String cal_cate_name;
	private String cal_cate_color;
	public int getCal_cate_id() {
		return cal_cate_id;
	}
	public void setCal_cate_id(int cal_cate_id) {
		this.cal_cate_id = cal_cate_id;
	}
	public String getCal_cate_name() {
		return cal_cate_name;
	}
	public void setCal_cate_name(String cal_cate_name) {
		this.cal_cate_name = cal_cate_name;
	}
	public String getCal_cate_color() {
		return cal_cate_color;
	}
	public void setCal_cate_color(String cal_cate_color) {
		this.cal_cate_color = cal_cate_color;
	}
	public Calendar_Cate(int cal_cate_id, String cal_cate_name, String cal_cate_color) {
		super();
		this.cal_cate_id = cal_cate_id;
		this.cal_cate_name = cal_cate_name;
		this.cal_cate_color = cal_cate_color;
	}
	public Calendar_Cate() {
		super();
	}
	@Override
	public String toString() {
		return "Calendar_Cate [cal_cate_id=" + cal_cate_id + ", cal_cate_name=" + cal_cate_name + ", cal_cate_color="
				+ cal_cate_color + "]";
	}
	
	
	
}
