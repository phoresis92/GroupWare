package project.groupware.email;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Email {
	
	private String member_id;
	private String email_account;
	private String email_pw;
	
	private int email_id;
	
	private String sender_id;
	private String sender;
	
	private String receiver_id;
	private String receiver;
	
	private String title;
	private String content;
	
	private String content_html;
	private String content_plain;
	
	private Date send_date;
	
	private String file;
	private String email_path;
	private byte email_status;
	
	private MultipartFile report;

	public Email() {}
	
	public Email(String member_id, String email_account, String email_pw) {
		super();
		this.member_id = member_id;
		this.email_account = email_account;
		this.email_pw = email_pw;
	}
	
	public Email(String member_id, String email_account, String email_pw, int email_id, String sender_id, String sender,
			String receiver_id, String receiver, String title, String content, String content_html,
			String content_plain, Date send_date, String file, String email_path, byte email_status) {
		super();
		this.member_id = member_id;
		this.email_account = email_account;
		this.email_pw = email_pw;
		this.email_id = email_id;
		this.sender_id = sender_id;
		this.sender = sender;
		this.receiver_id = receiver_id;
		this.receiver = receiver;
		this.title = title;
		this.content = content;
		this.content_html = content_html;
		this.content_plain = content_plain;
		this.send_date = send_date;
		this.file = file;
		this.email_path = email_path;
		this.email_status = email_status;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getEmail_id() {
		return email_id;
	}

	public void setEmail_id(int email_id) {
		this.email_id = email_id;
	}

	public String getSender_id() {
		return sender_id;
	}

	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}

	public String getEmail_account() {
		return email_account;
	}

	public void setEmail_account(String email_account) {
		this.email_account = email_account;
	}

	public String getEmail_pw() {
		return email_pw;
	}

	public void setEmail_pw(String email_pw) {
		this.email_pw = email_pw;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContent_html() {
		return content_html;
	}

	public void setContent_html(String content_html) {
		this.content_html = content_html;
	}

	public String getContent_plain() {
		return content_plain;
	}

	public void setContent_plain(String content_plain) {
		this.content_plain = content_plain;
	}

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getEmail_path() {
		return email_path;
	}

	public void setEmail_path(String email_path) {
		this.email_path = email_path;
	}

	public byte getEmail_status() {
		return email_status;
	}

	public void setEmail_status(byte email_status) {
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
		return "Email [member_id=" + member_id + ", email_account=" + email_account + ", email_pw=" + email_pw
				+ ", email_id=" + email_id + ", sender_id=" + sender_id + ", sender=" + sender + ", receiver_id="
				+ receiver_id + ", receiver=" + receiver + ", title=" + title + ", content=" + content
				+ ", content_html=" + content_html + ", content_plain=" + content_plain + ", send_date=" + send_date
				+ ", file=" + file + ", email_path=" + email_path + ", email_status=" + email_status + ", report="
				+ report + "]";
	}
}
