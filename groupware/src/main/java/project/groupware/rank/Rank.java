package project.groupware.rank;

public class Rank {
	
	private int rank_id;
	private String rank_name;
	
	public Rank() {}
	
	public Rank(int rank_id, String rank_name) {
		this.rank_id = rank_id;
		this.rank_name = rank_name;
	}

	public int getRank_id() {
		return rank_id;
	}

	public void setRank_id(int rank_id) {
		this.rank_id = rank_id;
	}

	public String getRank_name() {
		return rank_name;
	}

	public void setRank_name(String rank_name) {
		this.rank_name = rank_name;
	}

	@Override
	public String toString() {
		return "Rank [rank_id=" + rank_id + ", rank_name=" + rank_name + "]";
	}
}
