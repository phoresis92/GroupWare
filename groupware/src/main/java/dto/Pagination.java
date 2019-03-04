package dto;

import java.util.List;

public class Pagination {

	public PageInfo paging(int page, List<?> list) {
		//==========================================================		
		
		int countList = 10; //페이지당 게시물 수
		int countPage = 10; //페이지 수		
		
		int totalCount = list.size(); // 총 게시물 수
		int totalPage = ((totalCount - 1) / countList) + 1; // 총 페이지 수;
		
		if(totalPage < page) { page = totalPage; }
		
		int startPage = ((page-1)  / countPage ) * countPage + 1; 
		int endPage = startPage + countPage - 1;
		if (endPage > totalPage) { endPage = totalPage; }
		
		//==========================================================
		
		int startNum = (page-1) * countList;
		int endNum = page * countList;
		
		if (endNum > totalCount) {
			endNum = totalCount;
		}
		if (startNum < 0){
			startNum = 0;
		}
		if (endNum < 0){
			endNum = 0;
		}
		
		//ArrayList<BoardBean> boardList = boardListService.getboardlist(startNum , endNum);
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setTotalPage(totalPage);
		pageInfo.setCountList(countList);		
		pageInfo.setStartNum(startNum);
		pageInfo.setEndNum(endNum);
		pageInfo.setTotalCount(totalCount);
		
		return pageInfo;
	}
}
