package project.groupware.message;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Message {
	
	private int email_id;
	private String email_title;
	private String email_content;
	private String email_file;
	private String email_path;
	
	private int send_member_id;
	private int receive_member_id;
	private Date send_time;
	private int email_status;
	
	private MultipartFile report;
	
	public Message() {}

	public Message(int email_id, String email_title, String email_content, String email_file, String email_path) {
		this.email_id = email_id;
		this.email_title = email_title;
		this.email_content = email_content;
		this.email_file = email_file;
		this.email_path = email_path;
	}

	public Message(int email_id, int receive_member_id, int send_member_id, Date send_time, int email_status) {
		this.email_id = email_id;
		this.send_member_id = send_member_id;
		this.receive_member_id = receive_member_id;
		this.send_time = send_time;
		this.email_status = email_status;
	}
	
	

	public int getEmail_id() {
		return email_id;
	}

	public void setEmail_id(int email_id) {
		this.email_id = email_id;
	}

	public String getEmail_title() {
		return email_title;
	}

	public void setEmail_title(String email_title) {
		this.email_title = email_title;
	}

	public String getEmail_content() {
		return email_content;
	}

	public void setEmail_content(String email_content) {
		this.email_content = email_content;
	}

	public String getEmail_file() {
		return email_file;
	}

	public void setEmail_file(String email_file) {
		this.email_file = email_file;
	}

	public String getEmail_path() {
		return email_path;
	}

	public void setEmail_path(String email_path) {
		this.email_path = email_path;
	}

	public int getSend_member_id() {
		return send_member_id;
	}

	public void setSend_member_id(int send_member_id) {
		this.send_member_id = send_member_id;
	}

	public int getReceive_member_id() {
		return receive_member_id;
	}

	public void setReceive_member_id(int receive_member_id) {
		this.receive_member_id = receive_member_id;
	}

	public Date getSend_time() {
		return send_time;
	}

	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}

	public int getEmail_status() {
		return email_status;
	}

	public void setEmail_status(int email_status) {
		this.email_status = email_status;
	}

	public MultipartFile getReport() {
		return report;
	}

	public void setReport(MultipartFile report) {
		this.report = report;
	}

	@Override
	public String toString() {
		return "Email [email_id=" + email_id + ", email_title=" + email_title + ", email_content=" + email_content
				+ ", email_file=" + email_file + ", email_path=" + email_path + ", send_member_id=" + send_member_id
				+ ", receive_member_id=" + receive_member_id + ", send_time=" + send_time + ", email_status="
				+ email_status + "]";
	}
	
	

}
