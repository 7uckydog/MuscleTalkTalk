package kh.semi.mtt.common.function;

public class PagingController {
	public PagingVo setPagingValue(PagingVo setVo) {
		int filterint = 0;
		String filterStr = setVo.getFilterintStr();
		if (filterStr == null) {
			filterStr = "0";
		}
		try {
			filterint = Integer.parseInt(filterStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		int currentPage = 1;
		String currentPageStr = setVo.getPageStr();
		try {
			if (currentPageStr != null && !currentPageStr.equals(""))
				currentPage = Integer.parseInt(currentPageStr);
		} catch (NumberFormatException e) {
			//e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		int pageSize = setVo.getPageSize(); // 한페이지에 보여줄 행
		int pageBlock = setVo.getPageBlock(); // 페이징에 나타날 페이지수
		int startPage = 0;
		int endPage = 0;
		int startRnum = 0;
		int endRnum = 0;

		int totalCnt = 0; // 총 글수

		totalCnt = setVo.getTotalCnt();
		System.out.println("총" + totalCnt);

		// Paging 처리
		int totalpageCnt = (totalCnt / pageSize) + (totalCnt % pageSize == 0 ? 0 : 1);
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > totalpageCnt) {
			endPage = totalpageCnt;
		}
		System.out.println("page:" + startPage + "~" + endPage);

		// rownum 처리
		//startRnum = (currentPage - 1) * pageSize + 1; // currentPage = 1 -> startRnum  = 1
		//endRnum = startRnum + pageSize - 1; // endRnum = 10
		endRnum = totalCnt - pageSize * (currentPage - 1);
		startRnum = endRnum - pageSize + 1;
		if (endRnum > totalCnt) {
			endRnum = totalCnt;
		}

		PagingVo result = new PagingVo(startPage, endPage, startRnum, endRnum, filterint, currentPage, totalpageCnt);
		return result;		
	}
}
