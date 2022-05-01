package kh.semi.mtt.common.function;

public class PagingVo {
	private int pageSize = 13; // 한페이지에 보여줄 행
	private int pageBlock = 3; // 페이징에 나타날 페이지수
	private int startPage = 0;
	private int endPage = 0;
	private int totalpageCnt = 0;
	private int startRnum = 0;
	private int endRnum = 0;
	private String filterintStr;
	private int filterint = 0;
	private String pageStr;
	private int currentPage = 1;
	private int totalCnt = 0; // 총 글수
	
	public PagingVo(int pageSize, int pageBlock, String filterintStr, String pageStr, int totalCnt) {
		// paging - start, end 등 정보를 알기 위한 세팅
		super();
		this.pageSize = pageSize;
		this.pageBlock = pageBlock;
		this.filterintStr = filterintStr;
		this.pageStr = pageStr;
		this.totalCnt = totalCnt;
	}
	public PagingVo(int startPage, int endPage, int startRnum, int endRnum, int filterint, int currentPage, int totalpageCnt) {
		// paging - start, end 등 정보를 싣어주는 생성
		super();
		this.startPage = startPage;
		this.endPage = endPage;
		this.startRnum = startRnum;
		this.endRnum = endRnum;
		this.filterint = filterint;
		this.currentPage = currentPage;
		this.totalpageCnt = totalpageCnt;
	}
	@Override
	public String toString() {
		return "PagingVo [pageSize=" + pageSize + ", pageBlock=" + pageBlock + ", startPage=" + startPage + ", endPage="
				+ endPage + ", startRnum=" + startRnum + ", endRnum=" + endRnum + ", filterintStr=" + filterintStr
				+ ", filterint=" + filterint + ", pageCtr=" + pageStr + ", currentPage=" + currentPage + ", totalCnt="
				+ totalCnt + "]";
	}
	
	
	public int getTotalpageCnt() {
		return totalpageCnt;
	}
	public void setTotalpageCnt(int totalpageCnt) {
		this.totalpageCnt = totalpageCnt;
	}
	public String getFilterintStr() {
		return filterintStr;
	}

	public void setFilterintStr(String filterintStr) {
		this.filterintStr = filterintStr;
	}

	public String getPageStr() {
		return pageStr;
	}

	public void setPageStr(String pageCtr) {
		this.pageStr = pageCtr;
	}

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
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
	public int getStartRnum() {
		return startRnum;
	}
	public void setStartRnum(int startRnum) {
		this.startRnum = startRnum;
	}
	public int getEndRnum() {
		return endRnum;
	}
	public void setEndRnum(int endRnum) {
		this.endRnum = endRnum;
	}
	public int getFilterint() {
		return filterint;
	}
	public void setFilterint(int filterint) {
		this.filterint = filterint;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	
}
