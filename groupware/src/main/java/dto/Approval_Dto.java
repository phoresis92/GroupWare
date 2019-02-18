package dto;

import java.io.File;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Approval_Dto {
	
	private int approval_id;	
	private int approval_cate;	
	private int approval_member_id;	
	private String approval_mem1;	
	private String approval_mem2;	
	private String approval_mem3;	
	private int approval_auth1;	
	private int approval_auth2;	
	private int approval_auth3;	
	private String approval_title;	
	private String approval_content;	
	private String approval_filepath;	
	private String approval_filename;	
	private String approval_return;	
	private Date approval_indate;	
	private Date approval_enddate;	
	private String approval_cc;
	private MultipartFile file;
	
	private String member_name1;
	private String member_name2;
	private String member_name3;

	private String department_name1;
	private String department_name2;
	private String department_name3;

	private String apv_auth_name1;
	private String apv_auth_name2;
	private String apv_auth_name3;
	
	private String apv_cate_name;
	
	
	
	
	@Override
	public String toString() {
		return "Approval_Dto [approval_id=" + approval_id + ", approval_cate=" + approval_cate + ", approval_member_id="
				+ approval_member_id + ", approval_mem1=" + approval_mem1 + ", approval_mem2=" + approval_mem2
				+ ", approval_mem3=" + approval_mem3 + ", approval_auth1=" + approval_auth1 + ", approval_auth2="
				+ approval_auth2 + ", approval_auth3=" + approval_auth3 + ", approval_title=" + approval_title
				+ ", approval_content=" + approval_content + ", approval_filepath=" + approval_filepath
				+ ", approval_filename=" + approval_filename + ", approval_return=" + approval_return
				+ ", approval_indate=" + approval_indate + ", approval_enddate=" + approval_enddate + ", approval_cc="
				+ approval_cc + ", apv_cate_name=" + apv_cate_name + ", file=" + file + "]";
	}
	public Approval_Dto() {
		super();
	}
	public Approval_Dto(int approval_id, int approval_cate, int approval_member_id, String approval_mem1,
			String approval_mem2, String approval_mem3, int approval_auth1, int approval_auth2, int approval_auth3,
			String approval_title, String approval_content, String approval_filepath, String approval_filename,
			String approval_return, Date approval_indate, Date approval_enddate, String approval_cc,
			String apv_cate_name, MultipartFile file) {
		super();
		this.approval_id = approval_id;
		this.approval_cate = approval_cate;
		this.approval_member_id = approval_member_id;
		this.approval_mem1 = approval_mem1;
		this.approval_mem2 = approval_mem2;
		this.approval_mem3 = approval_mem3;
		this.approval_auth1 = approval_auth1;
		this.approval_auth2 = approval_auth2;
		this.approval_auth3 = approval_auth3;
		this.approval_title = approval_title;
		this.approval_content = approval_content;
		this.approval_filepath = approval_filepath;
		this.approval_filename = approval_filename;
		this.approval_return = approval_return;
		this.approval_indate = approval_indate;
		this.approval_enddate = approval_enddate;
		this.approval_cc = approval_cc;
		this.apv_cate_name = apv_cate_name;
		this.file = file;
	}
	public String getApv_cate_name() {
		return apv_cate_name;
	}
	public void setApv_cate_name(String apv_cate_name) {
		this.apv_cate_name = apv_cate_name;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getApproval_id() {
		return approval_id;
	}
	public void setApproval_id(int approval_id) {
		this.approval_id = approval_id;
	}
	public int getApproval_cate() {
		return approval_cate;
	}
	public void setApproval_cate(int approval_cate) {
		this.approval_cate = approval_cate;
	}
	public int getApproval_member_id() {
		return approval_member_id;
	}
	public void setApproval_member_id(int approval_member_id) {
		this.approval_member_id = approval_member_id;
	}
	public String getApproval_mem1() {
		return approval_mem1;
	}
	public void setApproval_mem1(String approval_mem1) {
		this.approval_mem1 = approval_mem1;
	}
	public String getApproval_mem2() {
		return approval_mem2;
	}
	public void setApproval_mem2(String approval_mem2) {
		this.approval_mem2 = approval_mem2;
	}
	public String getApproval_mem3() {
		return approval_mem3;
	}
	public void setApproval_mem3(String approval_mem3) {
		this.approval_mem3 = approval_mem3;
	}
	public int getApproval_auth1() {
		return approval_auth1;
	}
	public void setApproval_auth1(int approval_auth1) {
		this.approval_auth1 = approval_auth1;
	}
	public int getApproval_auth2() {
		return approval_auth2;
	}
	public void setApproval_auth2(int approval_auth2) {
		this.approval_auth2 = approval_auth2;
	}
	public int getApproval_auth3() {
		return approval_auth3;
	}
	public void setApproval_auth3(int approval_auth3) {
		this.approval_auth3 = approval_auth3;
	}
	public String getApproval_title() {
		return approval_title;
	}
	public void setApproval_title(String approval_title) {
		this.approval_title = approval_title;
	}
	public String getApproval_content() {
		return approval_content;
	}
	public void setApproval_content(String approval_content) {
		this.approval_content = approval_content;
	}
	public String getApproval_filepath() {
		return approval_filepath;
	}
	public void setApproval_filepath(String approval_filepath) {
		this.approval_filepath = approval_filepath;
	}
	public String getApproval_filename() {
		return approval_filename;
	}
	public void setApproval_filename(String approval_filename) {
		this.approval_filename = approval_filename;
	}
	public String getApproval_return() {
		return approval_return;
	}
	public void setApproval_return(String approval_return) {
		this.approval_return = approval_return;
	}
	public Date getApproval_indate() {
		return approval_indate;
	}
	public void setApproval_indate(Date approval_indate) {
		this.approval_indate = approval_indate;
	}
	public Date getApproval_enddate() {
		return approval_enddate;
	}
	public void setApproval_enddate(Date approval_enddate) {
		this.approval_enddate = approval_enddate;
	}
	public String getApproval_cc() {
		return approval_cc;
	}
	public void setApproval_cc(String approval_cc) {
		this.approval_cc = approval_cc;
	}
	
	
	

}
