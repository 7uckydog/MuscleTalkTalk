package kh.semi.mtt.pt.model.dao;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import static kh.semi.mtt.common.jdbc.JdbcTemplate.close;
import kh.semi.mtt.pt.model.vo.PtVo;

public class PtDao {
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private CallableStatement cstmt = null;
	
	public int insertPt(Connection conn, PtVo ptVo) {
		int result = 0;
//		String sql = "insert all "
//				+ "into tb_pt(pt_no, trainer_no, pt_name, pt_category, "
//				+ "pt_price, pt_introduce, pt_information, pt_target_student, "
//				+ "pt_notice, pt_trainer_info, pt_time_info) "
//				+ "values ((SELECT nvl(max(pt_no),0)+1 from tb_pt), ?, ?, ?, "
//				+ "?, ?, ?, ?, "
//				+ "?, ?, ?) "
//				+ "into tb_pt_file (pt_file_no, pt_no, pt_file) "
//				+ "values ((SELECT nvl(max(pt_file_no),0)+1 from tb_pt_file), "
//				+ "(SELECT nvl(max(pt_no),0)+1 from tb_pt), ?) "
//				+ "into tb_pt_file (pt_file_no, pt_no, pt_file) "
//				+ "values ((SELECT nvl(max(pt_file_no),0)+2 from tb_pt_file), "
//				+ "(SELECT nvl(max(pt_no),0)+1 from tb_pt), ?) "
//				+ "into tb_pt_file (pt_file_no, pt_no, pt_file) "
//				+ "values ((SELECT nvl(max(pt_file_no),0)+3 from tb_pt_file), "
//				+ "(SELECT nvl(max(pt_no),0)+1 from tb_pt), ?) "
//				+ "select * from dual";
		String sql = "{call PROC_INPUT_PT (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, ptVo.getTrainerNo()); 
			cstmt.setString(2, ptVo.getPtName());
			cstmt.setInt(3, ptVo.getPtCategory());
			cstmt.setInt(4, ptVo.getPtPrice());
			cstmt.setString(5, ptVo.getPtIntroduce());
			cstmt.setString(6, ptVo.getPtInformation());
			cstmt.setString(7, ptVo.getPtTargetStudent());
			cstmt.setString(8, ptVo.getPtNotice());
			cstmt.setString(9, ptVo.getPtTrainerInfo());
			cstmt.setString(10, ptVo.getPtTimeInfo());
			cstmt.setString(11, ptVo.getPtStartDate());
			cstmt.setString(12, ptVo.getPtEndDate());
			cstmt.setString(13, ptVo.getPtFilePathList().get(0));
			cstmt.setString(14, ptVo.getPtFilePathList().get(1));
			cstmt.setString(15, ptVo.getPtFilePathList().get(2));
			cstmt.registerOutParameter(16, Types.INTEGER);
			
			
			
			cstmt.execute();
			result = cstmt.getInt(16);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(cstmt);
		}
		
		return result;
	}
	
	public int updatePt(Connection conn, PtVo ptVo) {
		int result = 0;
		ArrayList<Integer> ptFileNoArray = new ArrayList<Integer>();
		String sql = "{call PROC_UPDATE_PT (?,?,?,?,?)}";
		String sql2 = "update tb_pt "
				+ "	set "
				+ " pt_name = ? ,"
				+ " pt_category = ? ,"
				+ "	pt_introduce = ? ,"
				+ " pt_information = ? ,"
				+ " pt_target_student = ?, "
				+ " pt_notice = ? ,"
				+ " pt_trainer_info = ? "
				+ "	where pt_no = ?";
		String sql3 = "select pt_file_no from tb_pt_file where pt_no = ?";
		String sql4 = "update tb_pt_file "
				+ " set "
				+ " pt_file = ?"
				+ " where pt_file_no = ?";
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, ptVo.getPtNo());
			cstmt.setString(2, ptVo.getPtTimeInfo());
			cstmt.setString(3, ptVo.getPtStartDate());
			cstmt.setString(4, ptVo.getPtEndDate());
			cstmt.registerOutParameter(5, Types.INTEGER);

			cstmt.execute();
			result += cstmt.getInt(5);
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, ptVo.getPtName());
			pstmt.setInt(2, ptVo.getPtCategory());
			pstmt.setString(3, ptVo.getPtIntroduce());
			pstmt.setString(4, ptVo.getPtInformation());
			pstmt.setString(5, ptVo.getPtTargetStudent());
			pstmt.setString(6, ptVo.getPtNotice());
			pstmt.setString(7, ptVo.getPtTrainerInfo());
			pstmt.setInt(8, ptVo.getPtNo());
			
			result += pstmt.executeUpdate(); 
			close(pstmt);
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, ptVo.getPtNo());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ptFileNoArray.add(rs.getInt(1));
			}
			close(rs);
			close(pstmt);
			ArrayList<String> ptFilePathList = ptVo.getPtFilePathList();
			for(int i = 0; i < 3; i++) {
				if(ptFilePathList.get(i) != null) {
					pstmt = conn.prepareStatement(sql4);
					pstmt.setString(1, ptFilePathList.get(i));
					pstmt.setInt(2, ptFileNoArray.get(i));
					result += pstmt.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(cstmt);
		}
		
		return result;
	}
	
	public int deletePt(Connection conn, int ptNo) {
		int result = 0;
		String sql = "update tb_pt"
				+ "	set "
				+ "	pt_delete = 'T'"
				+ "	where pt_no = ?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ptNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public PtVo readPt(Connection conn, int ptNo) {
		PtVo pVo = null;
		ResultSet rs = null;
		String sql = "select pt_no, pt_name, pt_category, pt_price, pt_introduce, pt_information, "
				+ "pt_target_student, pt_notice, pt_trainer_info, "
				+ "pt_time_info, gym_name, gym_location, member_nickname, pt_delete "
				+ "from tb_pt "
				+ "join tb_trainer  "
				+ "on tb_pt.trainer_no = tb_trainer.trainer_no "
				+ "join tb_member "
				+ "on tb_trainer.member_no = tb_member.member_no "
				+ "where pt_no = ? ";

//		select pt_no, pt_name, pt_category, pt_price, pt_introduce, pt_information, 
//	    pt_target_student, pt_notice, pt_trainer_info, 
//	    pt_time_info, gym_name, gym_location, member_nickname
//	    from tb_pt
//	        join tb_trainer
//	        on tb_pt.trainer_no = tb_trainer.trainer_no
//	        join tb_member
//	        on tb_trainer.member_no = tb_member.member_no
//	    where pt_no = 1;
	    
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ptNo);
			
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pVo = new PtVo();
				pVo.setPtNo(rs.getInt("PT_NO"));
				pVo.setPtName(rs.getString("PT_NAME"));
				pVo.setPtCategory(rs.getInt("PT_CATEGORY"));
				switch (pVo.getPtCategory()) {
				case 1:
					pVo.setPtCategoryStr("웨이트");
					break;
				case 2:
					pVo.setPtCategoryStr("다이어트");
					break;
				case 3:
					pVo.setPtCategoryStr("재활");
					break;
				default:
					break;
				}
				pVo.setPtPrice(rs.getInt("PT_PRICE"));
				pVo.setPtIntroduce(rs.getString("PT_INTRODUCE").replace("\r\n","<br>"));
				pVo.setPtInformation(rs.getString("PT_INFORMATION").replace("\r\n","<br>"));
				pVo.setPtTargetStudent(rs.getString("PT_TARGET_STUDENT").replace("\r\n","<br>"));
				pVo.setPtNotice(rs.getString("PT_NOTICE").replace("\r\n","<br>"));
				pVo.setPtTrainerInfo(rs.getString("PT_TRAINER_INFO").replace("\r\n","<br>"));
				pVo.setPtTimeInfo(rs.getString("PT_TIME_INFO").replace("\r\n","<br>"));
				pVo.setPtGymName(rs.getString("GYM_NAME"));
				pVo.setPtLocation(rs.getString("GYM_LOCATION"));
				pVo.setPtTrainerName(rs.getString("MEMBER_NICKNAME"));
				pVo.setPtDelete(rs.getString("pt_delete"));
				
				close(pstmt);
				close(rs);
				sql = "select pt_file from tb_pt_file where pt_no = ?";
//				select pt_file
//			    from tb_pt_file
//			    where pt_no = 1;
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ptNo);
				rs = pstmt.executeQuery();
				ArrayList<String> ptFilePath = new ArrayList<String>(); 
				while(rs.next()) {
					ptFilePath.add(rs.getString("PT_FILE"));
				}
				pVo.setPtFilePathList(ptFilePath);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return pVo;
	}
	
	public ArrayList<PtVo> readAllFavoritePt(Connection conn, int startRnum, int endRnum, int memberNo) {
		ArrayList<PtVo> ptVoList = null;
		ResultSet rs = null;
		String sql = "select * "
				+ "	    from (select rownum r, t1.* "
				+ "	    from (select tb_pt.pt_no, pt_name, pt_category ,pt_file, "
				+ "			tb_member.member_nickname, pt_price, gym_location, favorite_cnt "
				+ "			from (select * from tb_pt where pt_delete = 'F' ) tb_pt "
				+ "			join (select * from tb_pt_file "
				+ "			where pt_file_no in  "
				+ "			(select min(pt_file_no) from tb_pt_file group by pt_no)) tbB "
				+ "			on tb_pt.pt_no = tbB.pt_no "
				+ "			join tb_trainer "
				+ "			on tb_pt.trainer_no = tb_trainer.trainer_no "
				+ "			join tb_member "
				+ "			on tb_trainer.member_no = tb_member.member_no "
				+ "			left outer join (select count(favorite_no) favorite_cnt, pt_no from tb_pt_favorite group by pt_no) tFcnt "
				+ "			on tb_pt.pt_no = tFcnt.pt_no "
				+ "                   where tb_pt.pt_no in (select tp.pt_no "
				+ "                       from tb_pt tp "
				+ "                       join tb_pt_favorite tpf "
				+ "                       on tp.pt_no = tpf.pt_no "
				+ "                       where tpf.member_no = ?) "
				+ "			order by tb_pt.pt_regist_date desc) t1) "
				+ "	           where r between ? and ?";


		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, startRnum);
			pstmt.setInt(3, endRnum);
			
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ptVoList = new ArrayList<PtVo>();
				do {
					PtVo pVo = new PtVo();
					pVo.setPtNo(rs.getInt("PT_NO"));
					pVo.setPtName(rs.getString("PT_NAME"));
					pVo.setPtTrainerName(rs.getString("MEMBER_NICKNAME"));
					pVo.setPtCategory(rs.getInt("PT_CATEGORY"));
					switch (pVo.getPtCategory()) {
					case 1:
						pVo.setPtCategoryStr("웨이트");
						break;
					case 2:
						pVo.setPtCategoryStr("다이어트");
						break;
					case 3:
						pVo.setPtCategoryStr("재활");
						break;
					default:
						break;
					}
					pVo.setPtPrice(rs.getInt("PT_PRICE"));
					ArrayList<String> ptFilePath = new ArrayList<String>(); 
					ptFilePath.add(rs.getString("PT_FILE"));
					pVo.setPtFilePathList(ptFilePath);
					pVo.setPtLocation(rs.getString("GYM_LOCATION"));
					pVo.setFavoriteCnt(rs.getInt("favorite_cnt"));
					ptVoList.add(pVo);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return ptVoList;
	}
	
	public ArrayList<PtVo> readAllPt(Connection conn,int categoryInt, int timeInt, int startRnum, int endRnum) {
		ArrayList<PtVo> ptVoList = null;
		ResultSet rs = null;
		String timeStr = "";
		switch (timeInt) {
			case 1 :
				timeStr = "월요일";
				break;
			case 2 :
				timeStr = "화요일";
				break;
			case 3 :
				timeStr = "수요일";
				break;
			case 4 :
				timeStr = "목요일";
				break;
			case 5 :
				timeStr = "금요일";
				break;
			case 6 :
				timeStr = "토요일";
				break;
			case 7 :
				timeStr = "일요일";
				break;

			default :
				break;
		}
		
		String sql = "";
		
		
		if(categoryInt == 0 && timeInt == 0) {			
			sql = "select *"
					+ "    from (select rownum r, t1.*"
					+ "    from (select tb_pt.pt_no, pt_name, pt_category ,pt_file,"
					+ "				 tb_member.member_nickname, pt_price, gym_location, favorite_cnt "
					+ "				from tb_pt "
					+ "				join (select * from tb_pt_file "
					+ "				where pt_file_no in  "
					+ "				(select min(pt_file_no) from tb_pt_file group by pt_no)) tbB "
					+ "				on tb_pt.pt_no = tbB.pt_no "
					+ "				join tb_trainer "
					+ "				on tb_pt.trainer_no = tb_trainer.trainer_no "
					+ "				join tb_member "
					+ "				on tb_trainer.member_no = tb_member.member_no "
					+ "				left outer join (select count(favorite_no) favorite_cnt, pt_no from tb_pt_favorite group by pt_no) tFcnt "
					+ "				on tb_pt.pt_no = tFcnt.pt_no "
					+ "				where pt_delete = 'F' "
					+ "				order by tb_pt.pt_regist_date desc) t1) "
					+ "                where r between ? and ?";
		} else if(categoryInt == 0) {
			
			sql = "select *"
					+ "    from (select rownum r, t1.*"
					+ "    from (select tb_pt.pt_no, pt_name, pt_category ,pt_file,"
					+ "				 tb_member.member_nickname, pt_price, gym_location, favorite_cnt "
					+ "				from tb_pt "
					+ "				join (select * from tb_pt_file "
					+ "				where pt_file_no in  "
					+ "				(select min(pt_file_no) from tb_pt_file group by pt_no)) tbB "
					+ "				on tb_pt.pt_no = tbB.pt_no "
					+ "				join tb_trainer "
					+ "				on tb_pt.trainer_no = tb_trainer.trainer_no "
					+ "				join tb_member "
					+ "				on tb_trainer.member_no = tb_member.member_no "
					+ "				left outer join (select count(favorite_no) favorite_cnt, pt_no from tb_pt_favorite group by pt_no) tFcnt "
					+ "				on tb_pt.pt_no = tFcnt.pt_no "
					+ "				where pt_delete = 'F' and "
					+ "             pt_time_info like '%"+timeStr+"%'"
					+ "				order by tb_pt.pt_regist_date desc) t1) "
					+ "                where r between ? and ?";
			
		} else if(timeInt == 0) {
			
			sql = "select *"
					+ "    from (select rownum r, t1.*"
					+ "    from (select tb_pt.pt_no, pt_name, pt_category ,pt_file,"
					+ "				 tb_member.member_nickname, pt_price, gym_location, favorite_cnt "
					+ "				from tb_pt "
					+ "				join (select * from tb_pt_file "
					+ "				where pt_file_no in  "
					+ "				(select min(pt_file_no) from tb_pt_file group by pt_no)) tbB "
					+ "				on tb_pt.pt_no = tbB.pt_no "
					+ "				join tb_trainer "
					+ "				on tb_pt.trainer_no = tb_trainer.trainer_no "
					+ "				join tb_member "
					+ "				on tb_trainer.member_no = tb_member.member_no "
					+ "				left outer join (select count(favorite_no) favorite_cnt, pt_no from tb_pt_favorite group by pt_no) tFcnt "
					+ "				on tb_pt.pt_no = tFcnt.pt_no "
					+ "				where pt_delete = 'F' and "
					+ "             pt_category = " + categoryInt + " "
					+ "				order by tb_pt.pt_regist_date desc) t1) "
					+ "                where r between ? and ?";
			
		} else {
			
			sql = "select *"
					+ "    from (select rownum r, t1.*"
					+ "    from (select tb_pt.pt_no, pt_name, pt_category ,pt_file,"
					+ "				 tb_member.member_nickname, pt_price, gym_location, favorite_cnt "
					+ "				from tb_pt "
					+ "				join (select * from tb_pt_file "
					+ "				where pt_file_no in  "
					+ "				(select min(pt_file_no) from tb_pt_file group by pt_no)) tbB "
					+ "				on tb_pt.pt_no = tbB.pt_no "
					+ "				join tb_trainer "
					+ "				on tb_pt.trainer_no = tb_trainer.trainer_no "
					+ "				join tb_member "
					+ "				on tb_trainer.member_no = tb_member.member_no "
					+ "				left outer join (select count(favorite_no) favorite_cnt, pt_no from tb_pt_favorite group by pt_no) tFcnt "
					+ "				on tb_pt.pt_no = tFcnt.pt_no "
					+ "				where pt_delete = 'F' and "
					+ "             pt_category = " + categoryInt + " and "
					+ "             pt_time_info like '%"+timeStr+"%'"
					+ "				order by tb_pt.pt_regist_date desc) t1) "
					+ "                where r between ? and ?";
			
		}
		

	    
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
			
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ptVoList = new ArrayList<PtVo>();
				do {
					PtVo pVo = new PtVo();
					pVo.setPtNo(rs.getInt("PT_NO"));
					pVo.setPtName(rs.getString("PT_NAME"));
					pVo.setPtTrainerName(rs.getString("MEMBER_NICKNAME"));
					pVo.setPtCategory(rs.getInt("PT_CATEGORY"));
					switch (pVo.getPtCategory()) {
					case 1:
						pVo.setPtCategoryStr("웨이트");
						break;
					case 2:
						pVo.setPtCategoryStr("다이어트");
						break;
					case 3:
						pVo.setPtCategoryStr("재활");
						break;
					default:
						break;
					}
					pVo.setPtPrice(rs.getInt("PT_PRICE"));
					ArrayList<String> ptFilePath = new ArrayList<String>(); 
					ptFilePath.add(rs.getString("PT_FILE"));
					pVo.setPtFilePathList(ptFilePath);
					pVo.setPtLocation(rs.getString("GYM_LOCATION"));
					pVo.setFavoriteCnt(rs.getInt("favorite_cnt"));
					ptVoList.add(pVo);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return ptVoList;
	}
	
	public ArrayList<PtVo> readMyPt(Connection conn, int trainerNo, int startRnum, int endRnum) {
		ArrayList<PtVo> ptVoList = null;
		ResultSet rs = null;
		String sql = "select * "
				+ "    from( "
				+ "    select rownum r , t1.* "
				+ "    from (select tb_pt.pt_no, tb_pt.pt_name, tb_pt.pt_category, tb_pt.pt_regist_date,  tfcnt.favorite_cnt "
				+ "    from tb_pt "
				+ "    left outer join (select count(favorite_no) favorite_cnt, pt_no from tb_pt_favorite group by pt_no) tFcnt "
				+ "	   on tb_pt.pt_no = tFcnt.pt_no "
				+ "    where trainer_no = ? "
				+ "	   and pt_delete= 'F' "
				+ "    order by pt_regist_date desc) t1) "
				+ "    where r between ? and ?";

	    
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainerNo);
			pstmt.setInt(2, startRnum);
			pstmt.setInt(3, endRnum);
			
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ptVoList = new ArrayList<PtVo>();
				do {
					PtVo pVo = new PtVo();
					pVo.setPtNo(rs.getInt("PT_NO"));
					pVo.setPtName(rs.getString("PT_NAME"));
					pVo.setPtCategory(rs.getInt("PT_CATEGORY"));
					switch (pVo.getPtCategory()) {
					case 1:
						pVo.setPtCategoryStr("웨이트");
						break;
					case 2:
						pVo.setPtCategoryStr("다이어트");
						break;
					case 3:
						pVo.setPtCategoryStr("재활");
						break;
					default:
						break;
					}
					pVo.setPtRegistDate(rs.getDate("PT_REGIST_DATE"));
					pVo.setFavoriteCnt(rs.getInt("FAVORITE_CNT"));
					ptVoList.add(pVo);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return ptVoList;
	}
	
	public int countPt(Connection conn, int categoryInt, int timeInt) {
		int result = 0;
		String timeStr = "";
		switch (timeInt) {
			case 1 :
				timeStr = "월요일";
				break;
			case 2 :
				timeStr = "화요일";
				break;
			case 3 :
				timeStr = "수요일";
				break;
			case 4 :
				timeStr = "목요일";
				break;
			case 5 :
				timeStr = "금요일";
				break;
			case 6 :
				timeStr = "토요일";
				break;
			case 7 :
				timeStr = "일요일";
				break;

			default :
				break;
		}
		String sql = "";
		if(categoryInt == 0 && timeInt == 0) {			
			sql = "select count(pt_no) from tb_pt where pt_delete = 'F'";
		} else if(categoryInt == 0) {
			sql = "select count(pt_no) from tb_pt where pt_time_info like '%"+timeStr+"%' and pt_delete = 'F'";
		} else if(timeInt == 0) {
			sql = "select count(pt_no) from tb_pt where pt_category = " + categoryInt;
		} else {
			sql = "select count(pt_no) from tb_pt  "
					+ "where pt_time_info like '%"+timeStr+"%' "
					+ "and pt_category = " + categoryInt + " "
					+ "and pt_delete = 'F'";
		}

	    
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	
	public int myPt(Connection conn, int trainerNo, int ptNo) {
		int result = 0;
		String sql = "select count(pt_no) from tb_pt where trainer_no = ? and pt_no = ?";

	    
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainerNo);
			pstmt.setInt(2, ptNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	
	public int countPtFavorite(Connection conn, int memberNo) {
		int result = 0;
		String sql = "select count(tp.pt_no) "
				+ "from tb_pt tp "
				+ "join tb_pt_favorite tpf "
				+ "on tp.pt_no = tpf.pt_no "
				+ "where member_no = ?  ";

	    
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	
	public int countPt(Connection conn, int trainerNo) {
		int result = 0;
		String sql = "select count(pt_no) from tb_pt where trainer_no = ?";

	    
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trainerNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	
	public Timestamp readPtStartTime(Connection conn, int ptNo) {
		Timestamp result = null;
		
		
		String sql = "select pt_calendar_start_time "
				+ "from tb_pt_calendar "
				+ "where pt_no = ? "
				+ "order by pt_calendar_start_time desc";

	    
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ptNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getTimestamp("pt_calendar_start_time");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<PtVo> mainPt(Connection conn) {
		ArrayList<PtVo> ptVoList = null;
		ResultSet rs = null;
		String sql = "select * "
				+ "    from (select rownum r, t1.* "
				+ "    from (select tp.pt_no, pt_name, favorite_cnt "
				+ "    from tb_pt tp "
				+ "    left join (select count(favorite_no) favorite_cnt, pt_no from tb_pt_favorite group by pt_no )tpf "
				+ "    on tp.pt_no = tpf.pt_no "
				+ "    where pt_delete = 'F'"
				+ "    order by favorite_cnt desc nulls last) t1) "
				+ "    where r between 1 and 10";

	    
		try {
			pstmt = conn.prepareStatement(sql);

			
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ptVoList = new ArrayList<PtVo>();
				do {
					PtVo pVo = new PtVo();
					pVo.setPtNo(rs.getInt("PT_NO"));
					pVo.setPtName(rs.getString("PT_NAME"));
					pVo.setFavoriteCnt(rs.getInt("FAVORITE_CNT"));
					ptVoList.add(pVo);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return ptVoList;
	}
	
}
