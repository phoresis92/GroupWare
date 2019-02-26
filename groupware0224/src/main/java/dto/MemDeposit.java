package dto;

public class MemDeposit {
	
	private int depo_member_id;
	private int depo_bank_id;
	private String depo_number;
	
	
	@Override
	public String toString() {
		return "MemDeposit [depo_member_id=" + depo_member_id + ", depo_bank_id=" + depo_bank_id + ", depo_number="
				+ depo_number + "]";
	}
	public MemDeposit() {
		super();
	}
	public MemDeposit(int depo_member_id, int depo_bank_id, String depo_number) {
		super();
		this.depo_member_id = depo_member_id;
		this.depo_bank_id = depo_bank_id;
		this.depo_number = depo_number;
	}
	public int getDepo_member_id() {
		return depo_member_id;
	}
	public void setDepo_member_id(int depo_member_id) {
		this.depo_member_id = depo_member_id;
	}
	public int getDepo_bank_id() {
		return depo_bank_id;
	}
	public void setDepo_bank_id(int depo_bank_id) {
		this.depo_bank_id = depo_bank_id;
	}
	public String getDepo_number() {
		return depo_number;
	}
	public void setDepo_number(String depo_number) {
		this.depo_number = depo_number;
	}
	
	

}
