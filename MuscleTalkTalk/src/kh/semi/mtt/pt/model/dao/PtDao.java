package kh.semi.mtt.pt.model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;
import kh.semi.mtt.pt.model.vo.PtVo;

public class PtDao {
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	public int insertPt(Connection conn, PtVo ptVo) {
		int result = 0;
//		String sql = "insert into TB_PT (PT_NO, TRAINER_NO, PT_NAME, PT_CATEGORY, PT_PRICE, PT_INTRODUCE,"
//				+ " PT_INFORMATION, PT_TARGET_STUDENT, PT_NOTICE, PT_TRAINER_INFO, PT_TIME_INFO) "
//				+ "values ((SELECT nvl(max(pt_no),0)+1 from tb_pt), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String sql = "insert all "
				+ "into tb_pt(pt_no, trainer_no, pt_name, pt_category, "
				+ "pt_price, pt_introduce, pt_information, pt_target_student, "
				+ "pt_notice, pt_trainer_info, pt_time_info) "
				+ "values ((SELECT nvl(max(pt_no),0)+1 from tb_pt), ?, ?, ?, "
				+ "?, ?, ?, ?, "
				+ "?, ?, ?) "
				+ "into tb_pt_file (pt_file_no, pt_no, pt_file) "
				+ "values ((SELECT nvl(max(pt_file_no),0)+1 from tb_pt_file), "
				+ "(SELECT nvl(max(pt_no),0)+1 from tb_pt), ?) "
				+ "into tb_pt_file (pt_file_no, pt_no, pt_file) "
				+ "values ((SELECT nvl(max(pt_file_no),0)+2 from tb_pt_file), "
				+ "(SELECT nvl(max(pt_no),0)+1 from tb_pt), ?) "
				+ "into tb_pt_file (pt_file_no, pt_no, pt_file) "
				+ "values ((SELECT nvl(max(pt_file_no),0)+3 from tb_pt_file), "
				+ "(SELECT nvl(max(pt_no),0)+1 from tb_pt), ?) "
				+ "select * from dual";
//		insert all
//	    into tb_pt(pt_no, trainer_no, pt_name, pt_category, 
//	        pt_price, pt_introduce, pt_information, pt_target_student, 
//	        pt_notice, pt_trainer_info, pt_time_info) 
//	    values ((SELECT nvl(max(pt_no),0)+1 from tb_pt), 1, 'pt제목', 1, 
//	        1234, 'pt간단 설명', 'pt 상세 설명', '수강 회원', 
//	        '유의사항', '트레이너정보', '수업시간정보')
//	    into tb_pt_file (pt_file_no, pt_no, pt_file) 
//	    values ((SELECT nvl(max(pt_file_no),0)+1 from tb_pt_file),
//	        (SELECT nvl(max(pt_no),0)+1 from tb_pt), '파일경로1')
//	    into tb_pt_file (pt_file_no, pt_no, pt_file) 
//	    values ((SELECT nvl(max(pt_file_no),0)+2 from tb_pt_file),
//	        (SELECT nvl(max(pt_no),0)+1 from tb_pt), '파일경로2')
//	    into tb_pt_file (pt_file_no, pt_no, pt_file) 
//	    values ((SELECT nvl(max(pt_file_no),0)+3 from tb_pt_file),
//	        (SELECT nvl(max(pt_no),0)+1 from tb_pt), '파일경로3')    
//	    select * from dual;
		
//		CREATE TABLE TB_PT (
//				PT_NO	NUMBER		NOT NULL,
//				TRAINER_NO	NUMBER		NOT NULL,
//				PT_NAME	VARCHAR2(100)		NOT NULL,
//				PT_CATEGORY	NUMBER		NOT NULL,
//				PT_PRICE	NUMBER		NOT NULL,
//				PT_INTRODUCE	VARCHAR2(3000)		NOT NULL,
//				PT_INFORMATION	VARCHAR2(3000)		NOT NULL,
//				PT_TARGET_STUDENT	VARCHAR2(600)		NOT NULL,
//				PT_NOTICE	VARCHAR2(600)		NOT NULL,
//			    PT_TRAINER_INFO	VARCHAR2(600)		NOT NULL,
//			    PT_TIME_INFO    VARCHAR2(100) NOT NULL
//			);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1); //TODO 트레이너 번호 입력칸
			pstmt.setString(2, ptVo.getPtName());
			pstmt.setInt(3, ptVo.getPtCategory());
			pstmt.setInt(4, ptVo.getPtPrice());
			pstmt.setString(5, ptVo.getPtIntroduce());
			pstmt.setString(6, ptVo.getPtInformation());
			pstmt.setString(7, ptVo.getPtTargetStudent());
			pstmt.setString(8, ptVo.getPtNotice());
			pstmt.setString(9, ptVo.getPtTrainerInfo());
			pstmt.setString(10, ptVo.getPtTimeInfo());
			pstmt.setString(11, ptVo.getPtFilePathList().get(0));
			pstmt.setString(12, ptVo.getPtFilePathList().get(1));
			pstmt.setString(13, ptVo.getPtFilePathList().get(2));
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<PtVo> readAllPt(Connection conn) {
		ArrayList<PtVo> ptVoList = null;
		ResultSet rs = null;
		String sql = "select tb_pt.pt_no, pt_name, pt_category ,pt_file,"
				+ " tb_member.member_nickname, pt_price, gym_location "
				+ "from tb_pt "
				+ "join (select * from tb_pt_file "
				+ "where pt_file_no in  "
				+ "(select min(pt_file_no) from tb_pt_file group by pt_no)) tbB "
				+ "on tb_pt.pt_no = tbB.pt_no "
				+ "join tb_trainer "
				+ "on tb_pt.trainer_no = tb_trainer.trainer_no "
				+ "join tb_member "
				+ "on tb_trainer.member_no = tb_member.member_no ";
//		select tb_pt.pt_no, pt_name, pt_category ,pt_file, tb_member.member_nickname, pt_price
//	    from tb_pt 
//	        join (select * from tb_pt_file 
//	            where pt_file_no in 
//	            (select min(pt_file_no) from tb_pt_file group by pt_no)) tbB
//	            on tb_pt.pt_no = tbB.pt_no
//	        join tb_trainer
//	            on tb_pt.trainer_no = tb_trainer.trainer_no
//	        join tb_member
//	            on tb_trainer.member_no = tb_member.member_no
	    
		try {
			pstmt = conn.prepareStatement(sql);

			
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ptVoList = new ArrayList<PtVo>();
				do {
					PtVo pVo = new PtVo();
					pVo.setPtNo(rs.getInt("PT_NO"));
					pVo.setPtName(rs.getString("PT_NAME"));
					pVo.setPtTrainerName(rs.getString("MEMBER_NICKNAME"));
					pVo.setPtCategory(rs.getInt("PT_CATEGORY"));
					pVo.setPtPrice(rs.getInt("PT_PRICE"));
					ArrayList<String> ptFilePath = new ArrayList<String>(); 
					ptFilePath.add(rs.getString("PT_FILE"));
					pVo.setPtFilePathList(ptFilePath);
					ptVoList.add(pVo);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return ptVoList;
	}
}
