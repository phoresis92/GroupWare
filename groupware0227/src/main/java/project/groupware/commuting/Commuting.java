package project.groupware.commuting;

import java.util.Date;

public class Commuting {
	
	private int commuting_id;
	private String commuting_member_id;
	private Date commuting_arrive;
	private Date commuting_leave;
	
	public Commuting() {}
	
	public Commuting(int commuting_id, String commuting_member_id, Date commuting_arrive, Date commuting_leave) {
		this.commuting_id = commuting_id;
		this.commuting_member_id = commuting_member_id;
		this.commuting_arrive = commuting_arrive;
		this.commuting_leave = commuting_leave;
	}
	
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
	@Override
	public String toString() {
		return "Commuting [commuting_id=" + commuting_id + ", commuting_member_id=" + commuting_member_id
				+ ", commuting_arrive=" + commuting_arrive + ", commuting_leave=" + commuting_leave + "]";
	}
}
