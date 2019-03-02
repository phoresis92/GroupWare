package project.groupware.commuting;

import java.util.Date;

public class Commuting {
	
	private int commuting_id;
	private String commuting_member_id;
	private Date commuting_arrive;
	private Date commuting_leave;
	private String commuting_comment;
	private String commuting_status;
	private Date commuting_status_date;
	
	public Commuting() {}


	public int getCommuting_id() {
		return commuting_id;
	}

	public void setCommuting_id(int commuting_id) {
		this.commuting_id = commuting_id;
	}

	public String getCommuting_member_id() {
		return commuting_member_id;
	}

	public void setCommuting_member_id(String commuting_member_id) {
		this.commuting_member_id = commuting_member_id;
	}

	public Date getCommuting_arrive() {
		return commuting_arrive;
	}

	public void setCommuting_arrive(Date commuting_arrive) {
		this.commuting_arrive = commuting_arrive;
	}

	public Date getCommuting_leave() {
		return commuting_leave;
	}

	public void setCommuting_leave(Date commuting_leave) {
		this.commuting_leave = commuting_leave;
	}

	public String getCommuting_comment() {
		return commuting_comment;
	}

	public void setCommuting_comment(String commuting_comment) {
		this.commuting_comment = commuting_comment;
	}


	public String getCommuting_status() {
		return commuting_status;
	}


	public void setCommuting_status(String commuting_status) {
		this.commuting_status = commuting_status;
	}


	public Date getCommuting_status_date() {
		return commuting_status_date;
	}


	public void setCommuting_status_date(Date commuting_status_date) {
		this.commuting_status_date = commuting_status_date;
	}


	public Commuting(int commuting_id, String commuting_member_id, Date commuting_arrive, Date commuting_leave,
			String commuting_comment, String commuting_status, Date commuting_status_date) {
		super();
		this.commuting_id = commuting_id;
		this.commuting_member_id = commuting_member_id;
		this.commuting_arrive = commuting_arrive;
		this.commuting_leave = commuting_leave;
		this.commuting_comment = commuting_comment;
		this.commuting_status = commuting_status;
		this.commuting_status_date = commuting_status_date;
	}


	@Override
	public String toString() {
		return "Commuting [commuting_id=" + commuting_id + ", commuting_member_id=" + commuting_member_id
				+ ", commuting_arrive=" + commuting_arrive + ", commuting_leave=" + commuting_leave
				+ ", commuting_comment=" + commuting_comment + ", commuting_status=" + commuting_status
				+ ", commuting_status_date=" + commuting_status_date + "]";
	}
	

	
	
	
	
	
	
}
