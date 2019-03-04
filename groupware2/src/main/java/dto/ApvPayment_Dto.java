package dto;

import java.util.Date;

public class ApvPayment_Dto {

	private int pay_id;
	private int approval_id;
	private Date pay_date;
	private int pay_title;
	private int pay_cash;
	private int pay_bank;
	private String pay_deposit;
	private String pay_dpowner;
	private String pay_comment;
	

	
	@Override
	public String toString() {
		return "ApvPayment_Dto [pay_id=" + pay_id + ", approval_id=" + approval_id + ", pay_date=" + pay_date
				+ ", pay_title=" + pay_title + ", pay_cash=" + pay_cash + ", pay_bank=" + pay_bank + ", pay_deposit="
				+ pay_deposit + ", pay_dpowner=" + pay_dpowner + ", pay_comment=" + pay_comment + "]";
	}
	public ApvPayment_Dto() {
		super();
	}
	public ApvPayment_Dto(int pay_id, int approval_id, Date pay_date, int pay_title, int pay_cash, int pay_bank,
			String pay_deposit, String pay_dpowner, String pay_comment) {
		super();
		this.pay_id = pay_id;
		this.approval_id = approval_id;
		this.pay_date = pay_date;
		this.pay_title = pay_title;
		this.pay_cash = pay_cash;
		this.pay_bank = pay_bank;
		this.pay_deposit = pay_deposit;
		this.pay_dpowner = pay_dpowner;
		this.pay_comment = pay_comment;
	}
	public int getPay_id() {
		return pay_id;
	}
	public void setPay_id(int pay_id) {
		this.pay_id = pay_id;
	}
	public int getApproval_id() {
		return approval_id;
	}
	public void setApproval_id(int approval_id) {
		this.approval_id = approval_id;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_title() {
		return pay_title;
	}
	public void setPay_title(int pay_title) {
		this.pay_title = pay_title;
	}
	public int getPay_cash() {
		return pay_cash;
	}
	public void setPay_cash(int pay_cash) {
		this.pay_cash = pay_cash;
	}
	public int getPay_bank() {
		return pay_bank;
	}
	public void setPay_bank(int pay_bank) {
		this.pay_bank = pay_bank;
	}
	public String getPay_deposit() {
		return pay_deposit;
	}
	public void setPay_deposit(String pay_deposit) {
		this.pay_deposit = pay_deposit;
	}
	public String getPay_dpowner() {
		return pay_dpowner;
	}
	public void setPay_dpowner(String pay_dpowner) {
		this.pay_dpowner = pay_dpowner;
	}
	public String getPay_comment() {
		return pay_comment;
	}
	public void setPay_comment(String pay_comment) {
		this.pay_comment = pay_comment;
	}
	
	
	
}
