$.getPage = function(page, list) {
	
	var countList = 10; //페이지당 게시물 수
	var countPage = 10; //페이지 수		
	
	var totalCount = list.length; // 총 게시물 수
	var totalPage = Math.floor((totalCount - 1) / countList) + 1; // 총 페이지 수;
	
	if(totalPage < page) { page = totalPage; }
	var startPage = Math.floor((page - 1)  / countPage ) * countPage + 1; 
	var endPage = startPage + countPage - 1;
	if (endPage > totalPage) { endPage = totalPage; }
	//==========================================================
	
	startNum = (page-1) * countList;
	endNum = page * countList;
	if (endNum > totalCount) {
		endNum = totalCount;
	}
	if (startNum < 0){
		startNum = 0;
	}
	if (endNum < 0){
		endNum = 0;
	}
	
	var str = '';
	if (endPage > 0) {
		if (page != 1) {
			str += '<li class="page-item"><a class="page-link" href="javascript:$.getList(1);"><i class="fas fa-angle-double-left"></i></a></li>';
		}	
		if (page >=11) {
			str += '<li class="page-item"><a class="page-link" href=""javascript:$.getList('+page-1+');"><i class="fas fa-angle-left"></i></a></li>';		
		}
		for (var pagenum = startPage; pagenum <= endPage; pagenum++){
			if (pagenum == page){
				str += '<li class="page-item active"><a class="page-link" href="#">'+pagenum+'&nbsp;</a></li>';			
			}
			if (pagenum != page){
				str += '<li class="page-item"><a class="page-link" href="javascript:$.getList('+pagenum+');">'+pagenum+'&nbsp;</a></li>';			
			}		
		}
		if (endPage != totalPage){
			str += '<li class="page-item"><a class="page-link" href="javascript:$.getList('+endPage+1+');"><i class="fas fa-angle-right"></i></a></li>';
			str += '<li class="page-item"><a class="page-link" href="javascript:$.getList('+totalPage+');"><i class="fas fa-angle-double-right"></i></a></li>';		
		}		
	} else {
		str += "<h3>등록된 글이 없습니다.</h3>"
	}
	return str;
}