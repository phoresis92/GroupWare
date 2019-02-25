package dto;

public class PageInfo {

	private int page;
	private int totalPage;
	private int startPage;
	private int endPage;
	private int countList;
	private int startNum;
	private int endNum;
	private int totalCount;
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getCountList() {
		return countList;
	}
	public void setCountList(int countList) {
		this.countList = countList;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public PageInfo(int page, int totalPage, int startPage, int endPage, int countList, int startNum, int endNum) {
		super();
		this.page = page;
		this.totalPage = totalPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.countList = countList;
		this.startNum = startNum;
		this.endNum = endNum;
	}
	public PageInfo() {
		super();
	}
	@Override
	public String toString() {
		return "PageInfo [page=" + page + ", totalPage=" + totalPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", countList=" + countList + ", startNum=" + startNum + ", endNum=" + endNum + "]";
	}
	
	
	
}
